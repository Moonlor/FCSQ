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


    if ($('#query_for_schedule_status_flag').length > 0){
      var ajax_query = setInterval(function(){

        if ($('.finished_flag').length == $('#query_for_schedule_status_flag').length){
          clearInterval(ajax_query);
          return
        };

        $('.0').each(function(){ 
          $.ajax({
            url: "/schedules/" + $(this).val(),
            data: {
              id: $(this).val()
            },
            type: 'PATCH',
            dataType:"script"
          })
        });
      }, 4000);
    };
  }); // end of document ready
  
  // schedule_feed
  $("#roll_back").click(function() {
    var items = $("li[id^=schedule_item_]");
    var pos = document.documentElement.scrollTop;
    var near_item = items[0];
  
    for (let i = 0; i < items.length; i++){
      if (items[i].offsetTop < pos + 50){
        near_item = items[i];
      }
    }

    $("html, body").animate({
        scrollTop: near_item.offsetTop - 50
      }, 
      {
        duration: 300,easing: "swing"
      });
      return false;
  });
})(jQuery); // end of jQuery name space

