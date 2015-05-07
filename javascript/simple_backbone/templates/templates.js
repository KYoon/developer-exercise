this["JST"] = this["JST"] || {};

this["JST"]["templates/quotes.jst"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {
__p += '<ul>\n';
 this.collection.forEach(function(quote){ ;
__p += '\n  ' +
((__t = ( "<li>" + quote.attributes.quote + "</li>" )) == null ? '' : __t) +
'\n';
 }); ;
__p += '\n</ul>\n\n';
 if ((this.collection.state.totalPages - 1) !== this.collection.state.currentPage){ ;
__p += '\n  ' +
((__t = ( this.collection.state.totalPages )) == null ? '' : __t) +
'\n  ' +
((__t = ( '<a href="#">Next Page</a>' )) == null ? '' : __t) +
'\n';
 } ;


}
return __p
};