$(document).ready(function(){
  var quotesCollection = new QuotesCollection();
  
  $.getJSON(quotesCollection.url, function(data){
    quotesCollection.addAllQuotes(data);
    var quotesView = new QuotesView({collection: quotesCollection});
    var view = quotesView.render();
    $("body").append(view.el);
  });

  $("a").on("click", function(){
    quotesCollection.getNextPage();
    console.log(quotesCollection.state.totalPages);
    var quotesView = new QuotesView({collection: quotesCollection});
    var view = quotesView.render();
    $("ul").html("");
    $("body").prepend(view.el);
  });
});