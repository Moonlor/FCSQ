// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap
//= require_tree .

(function($){
  $(function(){
    
    $("a").addClass("waves-effect");

    $('.button-collapse').sideNav();
    $('.parallax').parallax();
    $('select').material_select();
    $('.datepicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 15 // Creates a dropdown of 15 years to control year
    });
    $('#schedule_via_city_number').change(function(){
      var val = this.value;
      $(".ajax_form_for_city_names").remove();
      $.ajax({
      	url: "/loadcity",
      	data: {
      	  amount: val
      	},
      	dataType:"script"
      })
    });

  }); // end of document ready
})(jQuery); // end of jQuery name space

