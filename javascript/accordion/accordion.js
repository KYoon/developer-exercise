$(document).ready(function(){
  var previousAccordion = null;
  var previousAccordionTitle = null;
  $(".accordion-header").find("div").hide();
  $(".accordion-header").find("a").on("click", function(){
    if (previousAccordion && previousAccordionTitle !== $(this).html()) {
      previousAccordion.slideUp(300);
    }
    $(this).siblings().slideDown(300);
    previousAccordion = $(this).siblings();
    previousAccordionTitle = $(this).html();
  });
}); 