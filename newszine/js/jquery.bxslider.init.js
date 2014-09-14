jQuery(document).ready(function($) {

	$('.bxslider').bxSlider({
	  minSlides: 1,
	  maxSlides: 4,
	  pager: false,
	  adaptiveHeight: true,
  	  slideWidth: 172,
  	  slideMargin: 27,
  	  nextText: '',
  	  prevText: ''
	});
	$('.gallery').bxSlider({
	  minSlides: 1,
	  maxSlides: 6,
	  pager: false,
	  adaptiveHeight: true,
  	  slideWidth: 172,
  	  slideMargin: 27,
  	  nextText: '',
  	  prevText: ''
	});
	

	$('.featured-products ul.products').bxSlider({
	  minSlides: 1,
	  maxSlides: 8,
	  pager: false,
	  adaptiveHeight: true,
	  responsive:true,
  	  slideWidth: 270,
  	  slideMargin: 30,
  	  nextText: '',
  	  prevText: ''
	});
	
	
	$('.top-products ul.products').bxSlider({
	  minSlides: 1,
	  maxSlides: 8,
	  pager: false,
	  adaptiveHeight: true,
	  responsive:true,
  	  slideWidth: 270,
  	  slideMargin: 30,
  	  nextText: '',
  	  prevText: ''
	});	
	
	$('.related ul.products').bxSlider({
	  minSlides: 1,
	  maxSlides: 8,
	  pager: false,
	  adaptiveHeight: true,
	  responsive:true,
  	  slideWidth: 270,
  	  slideMargin: 30,
  	  nextText: '',
  	  prevText: ''
	});		
	
	
});