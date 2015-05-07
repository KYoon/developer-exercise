var QuotesView = Backbone.View.extend({
  template: JST['templates/quotes.jst'],

  initialize: function(){
    this.listenTo(this.collection, "change", this.render)
  },

  events: {
    "click a": "addNewQuotes"
  },

  render: function(){
    console.log(this.collection);
    this.$el.html(this.template(this.collection));
    return this;
  },

  addNewQuotes: function(){
    this.collection.getNextPage();
    this.render();
  }
})