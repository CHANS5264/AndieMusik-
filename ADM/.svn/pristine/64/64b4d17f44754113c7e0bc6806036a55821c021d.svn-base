/*------------------------------------------------------------------
Project:        Modus - HTML onepage theme by GraphBerry.com
Version:        1.0
Last change:    12/06/2017
Author:         GraphBerry
URL:            http://graphberry.com
License:        http://graphberry.com/pages/license
-------------------------------------------------------------------*/
$(function(){
	'use strict';


	/*--------------------------------------------------
    Scrollspy Bootstrap 
    ---------------------------------------------------*/

    $('body').scrollspy({
    	target: '#header',
    	offset: 90
    });


	/*--------------------------------------------------
    Smooth Scroll 
    ---------------------------------------------------*/

	smoothScroll.init({
		selector: '.smoothScroll',
		speed: 1000,
		offset: 90,
		before: function(anchor, toggle){
			// Check if mobile navigation is active
			var query = Modernizr.mq('(max-width: 767px)');
			// Check if element is navigation eelement
			var navItem = $(toggle).parents("#main-navbar").length;
			// If mobile nav & nav item then close nav
			if (query && navItem !== 0) {
				$("button.navbar-toggle").click();
			}
		}
	});


	/*--------------------------------------------------
    Slick Slider
    ---------------------------------------------------*/

    // Count the number of slides to load in advance
	var count = $('.slider-container > .project').length;

	$('.slider-container').slick({
		arrows: false,
		autoplay: true,
		slidesToShow: count-1,
		slidesToScroll: 3,
		variableWidth: true,
		responsive: [
			{
				breakpoint: 960,
				settings: {
					slidesToScroll: 2,
				}
			},
			{
				breakpoint: 640,
				settings: {
					slidesToScroll: 1,
				}
			},
		]
	});


	/*--------------------------------------------------
    Porfolio cursor
    ---------------------------------------------------*/

	$('.project').on('mousedown', function() {
	    $(this).removeClass('grabbable');
	    $(this).addClass('grabbing');
	});

	$('.project').on('mouseleave mouseup', function() {
	    $(this).removeClass('grabbing');
	    $(this).addClass('grabbable');
	});


	/*--------------------------------------------------
    Current Year
    ---------------------------------------------------*/

    // Automatically update copyright year in the footer
	var currentTime = new Date();
	var year = currentTime.getFullYear();
	$("#year").text(year);

$('.btn').click(function(e){
	e.preventDefault();
	$('.nav').slideToggle()
});


/*--------------------------------------------------
nav - fast, slow, 숫자		"background-color", "rgba( 255, 255, 255, 0.1 )" - 반투명 : 맨뒤에 0.5기준으로 조정
---------------------------------------------------*/	

$(function() {
	$("#menubar-menus li").mouseenter(function(event) {
		$(this).find("div").parent().css("background", "#04a3ce");
		$(this).find("div").parent().css("background-color", "#fff");	//수정 금지
		$(this).find("div").parent().children("a").css("color", "#00c7fc");	//글씨색상
		$(this).find("div").slideDown("fast");
	}).mouseleave(function() {
		$(this).find("div:visible").slideUp(50, function() {
			// #menubar-menus li:hover 처리를 하지 않을 경우 아래 라인 활성,
			$(this).parent().css("background", "#04a3ce");
			$(this).parent().children("a").css("color", "#FFF");
		});
	});
});





});