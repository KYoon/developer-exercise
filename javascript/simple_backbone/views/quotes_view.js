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