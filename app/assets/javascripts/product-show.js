$( document ).ready(function() {

  $(".sticky-content").stick_in_parent({
    parent: "body", // note: we must now manually provide the parent
  });


  /* Basic Gallery */
  $( '.swipebox' ).swipebox();

});