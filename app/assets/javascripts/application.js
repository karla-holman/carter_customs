// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var rotation = 0, 
    scrollLoc = $(window).scrollTop();

$(window).scroll(function(){
	if($(window).scrollTop() > 50) {
		$('.navbar').css('margin-top', "0px");
		$('.navbar').addClass('navbar-inverse');
		$('.navbar').removeClass('navbar-default');
	} else {
		$('.navbar').removeClass('navbar-inverse');
		$('.navbar').addClass('navbar-default');
		$('.navbar').css('margin-top', "50px");
	}

	// handle wheel scroll
	var newLoc = $(document).scrollTop();
	var diff = scrollLoc - newLoc;
	rotation += diff, scrollLoc = newLoc;
	var rotationStr = "rotate(" + rotation + "deg)";
	$(".blue-circle img").css({
		"-webkit-transform": rotationStr,
		"-moz-transform": rotationStr,
		"transform": rotationStr
	});

});
