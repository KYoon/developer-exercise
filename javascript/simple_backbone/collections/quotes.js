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