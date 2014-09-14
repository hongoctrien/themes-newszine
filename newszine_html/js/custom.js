/**
 *
 * Dependencies: jQuery
 *
 */
 
jQuery.noConflict();
(function($) {
	$(function() {
		$("#scroller").simplyScroll();
	});
})(jQuery);

jQuery(document).ready(function($) {
		$('.brnews').css({'opacity':'1'});
		/*
		* Fix dropdown menu bootstrap error 
		* ------------------------------------------------- */

		$('.nav').find('li:has(ul)').addClass('dropdown');
		$('.dropdown > a').addClass('dropdown-toggle disabled');
		$('li.dropdown').children('ul.sub-menu').addClass('dropdown-menu');
		
		/*
		* Fix dropdown menu bootstrap error ends
		* --------------------------------------------------------- */	

    $('.dropdown .sub-menu').addClass('dropdown-menu');	
});

jQuery(document).ready(function($) {
    $('.dropdown > a').append('<b class="caret"></b>').dropdown();
    $('.dropdown .sub-menu').addClass('dropdown-menu');
});


jQuery(document).ready(function($) {
	//$("#tabnav").idTabs(); 	
	$("#tabnav").idTabs(function(id,list,set){ 
        $("a",set).removeClass("selected").filter("a[href='"+id+"']").addClass("selected"); 
        for(i in list)$(list[i]).hide();
        $(id).fadeIn(); 
        return false; 
    }); 
	
 
});

jQuery(document).ready(function($){
    /* initiate the plugin *//*		
    $("div.holder").jPages({
      containerID  : "itemContainer",
      perPage      : 3,
      startPage    : 1,
      startRange   : 1,
	  links		   : "blank"
    });	*/	
});
  
jQuery(document).ready(function($){
    /* initiate the plugin */
    $("div.holder2").jPages({
		containerID  : "itemContainer2",
		perPage      : 3,
		startPage    : 1,
		startRange   : 1,
		links		   : "blank"
    });
});
  
  

  
/* Product Slider */
  
jQuery(document).ready(function($){
	if($('.featured-products ul li').hasClass('first')){
		$(this).css({
			'border': '3px solid #ff0000'
		});
	}	
});  
  
  
  
// Single product

jQuery(document).ready(function($){
	$('.related li').removeClass('first');
	$('.related li').removeClass('last');
});

// Ajax Contact Form handler
jQuery(document).ready(function($){
	var options = {
		beforeSubmit : before,
		success : after,
	};
	$('#contact-form').ajaxForm(options);
	/*
	$('#contact-form').ajaxForm(function(){
		$('#contact-message').show( "slow" );
	});
	*/
	
	function before(){
		$('#contact-form #submit').val('Sending...');
	}
	
	function after(){
		$('#contact-message').fadeIn();
		$('#contact-form #submit').val('Submit');
		$('.form-wrapper').find('form')[0].reset();
		$('#contact-message').delay(5000).fadeOut();
	}
});

jQuery(document).ready(function($){
	// PrettyPhoto Init
	$("a[rel^='prettyPhoto']").prettyPhoto({
		theme: 'dark_rounded',
	});
});
