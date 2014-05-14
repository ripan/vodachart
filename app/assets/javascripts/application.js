// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap

//= require_tree .

$(function() {

	$("#notification .alert").fadeOut(5000);

  $('form#frm_order_search').bind("ajax:beforeSend", function(evt, xhr, settings) {
    anyOnePresent = !$("#alien").val() && !$("#product").val();
    if (anyOnePresent) {
      $("#notification").html("<center><div class='alert alert-danger'><strong>Please select Alien or Product</strong></div></center>")
      return false;
    } else {
      $("#notification").html("")
    }
  })

	$("#planet").chained("#galaxy");
	$("#alien").chained("#planet");
	$("#product").chained("#product_family");





}); //end function
