//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(".sticky-content").stick_in_parent({
  parent: "body", // note: we must now manually provide the parent
});