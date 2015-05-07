$(document).ready(function(){
  var quotesCollection = new QuotesCollection();
  
  $.getJSON(quotesCollection.url, function(data){
    quotesCollection.addAllQuotes(data);
    var quotesView = new QuotesView({collection: quotesCollection});
    var view = quotesView.render();
    $("body").append(view.el);
  });

});