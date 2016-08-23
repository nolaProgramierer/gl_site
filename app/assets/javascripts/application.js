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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//= require ckeditor/init




$(document).ready(function(){

	// parallax function
  $window = $(window);
  $('section[data-type="background"]').each(function(){
     var $scroll = $(this);
      $(window).scroll(function() {
        var yPos = -($window.scrollTop() / $scroll.data('speed'));
        var coords = '50% '+ yPos + 'px';
        $scroll.css({ backgroundPosition: coords });
      }); // end  scroll
   });  // end section

   // hover effect for images
   $('.hover-img').hover(
		function(){
			$(this).find('.caption-global').slideDown(333);
		},
		function(){
			$(this).find('.caption-global').fadeOut(500);
		}
	);	// end hover

	 $(window).scroll(function() {
		 $('.scroll-quote').each(function(index, value) {
			 var quote_bottom = $(this).offset().top + $(this).outerHeight();
			 var win_bottom = $(window).scrollTop() + $(window).height();
			 if (win_bottom > quote_bottom) {
				 if (($(this).is("#recital-text0")) || ($(this).is("#chandelier-text1"))) {
					 $(this).animate({'opacity' : '1', 'padding-left' : '150'}, 1250);
				 }
				 else {
					$(this).animate({'opacity' : '1', 'padding-right' : '200'}, 1250);
				 }
			 }
	 	}); // end each
	 }); //end scroll

   // enlarge text on hover for parallax elements
	 $('blockquote').hover(function() {
		 $(this).stop().animate({
			 fontSize: '2.75rem'
		 }, 500)
	 },
	 function() {
		 $(this).stop().animate({
			 fontSize: '1.75rem'
		 }, 500)
	 }
	);//end hover

  // // caption hover effect for blog links
  $('.blog-box').hover(
    function(){
      $(this).find('.blog-caption').stop().animate({height: "75%", opacity: "0.9"}, 400)
    },
    function(){
      $(this).find('.blog-caption').stop().animate({height: "20%", opacity: "0.6"}, 1000)
    }
  ); // end hover

  // $('#blog-nav-hamburger').click(function() {
  //   var blogSliderWidth = $('.sidenav').width() == 200 ? "0px" : "200px";
  //   $('.sidenav').animate({
  //     width: blogSliderWidth
  //   }); // end animate
  // }); // end click


}); // end ready


// js for side nav in blog show view
function openNav() {
    document.getElementById("blog-sidenav").style.width = "200px";
}
/* Set the width of the side navigation to 0 */
function closeNav() {
    document.getElementById("blog-sidenav").style.width = "0";
}
