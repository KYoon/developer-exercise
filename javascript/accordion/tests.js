$(document).ready(function(){
  module("Accordion tests");

  test("all hidden at start test", function(assert) {
    var hiddenElementsCount = $(".accordion-header div:hidden").length;
    assert.equal(hiddenElementsCount, 5, "We expect all 5 subject div elements to be hidden");
  });

});
