$(document).ready(function(){
  module("Accordion tests");

  test("all hidden at start test", function(assert) {
    var hiddenElementsCount = $(".accordion-header div:hidden").length;
    assert.equal(hiddenElementsCount, 5, "We expect all 5 subject div elements to be hidden");
  });

  test("accordion test", function(assert) {
    var mathAnchor = $("a:contains('Math')");
    mathAnchor.click();
    ok(mathAnchor.siblings().is(":visible"), "We expect the Math div to be shown when clicked on");
  });

  test("accordion test 2", function(assert) {
    var mathAnchor = $("a:contains('Math')");
    var englishAnchor = $("a:contains('English')");
    mathAnchor.click();
    englishAnchor.click();
    notOk(mathAnchor.siblings().is(":hidden"), "We expect the Math div to be hidde when English is clicked");
    ok(englishAnchor.siblings().is(":visible"), "We expect the English div to be shown when clicked on");
  });

});
