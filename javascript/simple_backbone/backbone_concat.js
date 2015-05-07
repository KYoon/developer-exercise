
var QuotesCollection = Backbone.PageableCollection.extend ({
  url: 'https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json',
  model: Quote,
  mode: "client",

  state: {
    firstPage: 0,
    pageSize: 15
  },

  addAllQuotes: function(quotes){
    for (var i=0; i<quotes.length; i++){
      this.add(new Quote(quotes[i]));
    }
    return this;
  }

});

var Quote = Backbone.Model.extend({
  defaults: {
    source: '',
    context: '',
    quote: '',
    theme: ''
  }
});

var QuotesView = Backbone.View.extend({
  template: JST['templates/quotes.jst'],

  initialize: function(){
    this.listenTo(this.collection, "change", this.render)
  },

  events: {
    // All this should probably be refactored
    "click .next": "addNextPageQuotes",
    "click .previous": "addPreviousPageQuotes",
    "click .first": "addFirstPageQuotes",
    "click .last": "addLastPageQuotes",
    "click .2": "addSecondPageQuotes"
  },

  render: function(){
    this.$el.html(this.template(this.collection));
    return this;
  },

  addNextPageQuotes: function(){
    this.collection.getNextPage();
    this.render();
  },

  addPreviousPageQuotes: function(){
    this.collection.getPreviousPage();
    this.render();
  },

  addFirstPageQuotes: function(){
    this.collection.getFirstPage();
    this.render();
  },

  addLastPageQuotes: function(){
    this.collection.getLastPage();
    this.render();
  },

  addSecondPageQuotes: function(){
    this.collection.getPage(1);
    this.render();
  }
})