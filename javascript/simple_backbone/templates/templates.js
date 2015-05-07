this["JST"] = this["JST"] || {};

this["JST"]["templates/quotes.jst"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {
__p += '<table>\n  <th>Source</th>\n  <th>Context</th>\n  <th>Quote</th>\n  <th>Theme</th>\n';
 this.collection.forEach(function(quote){ ;
__p += '\n  <tr>\n  ' +
((__t = ( "<td>" + quote.attributes.source + "</td>" )) == null ? '' : __t) +
'\n  ' +
((__t = ( "<td>" + quote.attributes.context + "</td>" )) == null ? '' : __t) +
'\n  ' +
((__t = ( "<td>" + quote.attributes.quote + "</td>" )) == null ? '' : __t) +
'\n  ' +
((__t = ( "<td>" + quote.attributes.theme + "</td>" )) == null ? '' : __t) +
'\n  </tr>\n';
 }); ;
__p += '\n</table>\n\n<!-- Needs Refactoring -->\n\n';
 if (this.collection.state.firstPage !== this.collection.state.currentPage){ ;
__p += '\n  ' +
((__t = ( '<a href="#" class="first">First</a> <a href="#" class="previous">Previous</a> <a href="#" class="first">1</a>' )) == null ? '' : __t) +
'\n';
 } else { ;
__p += '\n  ' +
((__t = ( 'First Previous 1' )) == null ? '' : __t) +
'\n';
 } ;
__p += '\n\n';
 if ((this.collection.state.currentPage) !== 1){ ;
__p += '\n  ' +
((__t = ( '<a href="#" class="2">2</a>' )) == null ? '' : __t) +
'\n';
 } else { ;
__p += '\n  ' +
((__t = ( '2' )) == null ? '' : __t) +
'\n';
 } ;
__p += '\n\n\n';
 if ((this.collection.state.lastPage) !== this.collection.state.currentPage){ ;
__p += '\n  ' +
((__t = ( '<a href="#" class="last">3</a> <a href="#" class="next">Next</a> <a href="#" class="last">Last</a>' )) == null ? '' : __t) +
'\n';
 } else { ;
__p += '\n  ' +
((__t = ( '3 Next Last' )) == null ? '' : __t) +
'\n';
 } ;


}
return __p
};