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
//= require jquery
//= require jquery.raty
//= require ratyrate
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .
//= require cocoon


$(document).ready(function(){
	$('#tab-contents .tab[id != "tab1"]').hide();
	$('#tab-menu a').on('click', function() {
  	$("#tab-contents .tab").hide();
  	$("#tab-menu .active").removeClass("active");
  	$(this).addClass("active");
    $($(this).attr("href")).show();
  return false;
	});


});

