var QuotesView = Backbone.View.extend({
  template: JST['templates/quotes.jst'],

  render: function(){
    console.log(this.collection);
    this.$el.html(this.template(this.collection));
    return this;
  },

  stringify: function(){
    var quotesString = "";
    this.collection.forEach(function(quote){
      quotesString += ("<li>Context: " + quote.attributes.context + "</li>");
    });
    return quotesString;
  }
})