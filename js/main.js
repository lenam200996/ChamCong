(function($) {
	"use strict";
	$(document).ready(function() {
		$( '.current-language' ).on('click', function(event) {
		 	event.preventDefault();
			$( this ).parent().find( '.submenu-language').toggle();
		});
		//slide
		$( '.main-slider .owl-carousel' ).owlCarousel({
			items: 1,
			dots: true	
		});
		//list-slide
		$( '.blog-slide .owl-carousel' ).owlCarousel({
			items: 3,
			loop:true,
			nav:true,
			navText: ['<i class="fa fa-long-arrow-left"></i>','<i class="fa fa-long-arrow-right"></i>'],
			margin: 30,
			responsive:{
		        0:{
		            items:1
		        },
		        475:{
		            items:2
		        },
		        767:{
		            items:3
		        }
		    }
		});

		//report-slide
		$( '.list-report-slide .owl-carousel' ).owlCarousel({
			items: 4,
			loop:true,
			nav:true,
			navText: ['<i class="fa fa-long-arrow-left"></i>','<i class="fa fa-long-arrow-right"></i>'],
			margin: 30,
			responsive:{
		        0:{
		            items:1
		        },
		        475:{
		            items:2
		        },
		        767:{
		            items:3
		        },
		        992:{
		            items:4
		        }
		    }
		});
		//terminial-slide
		$( '.termonial-slide .owl-carousel' ).owlCarousel({
			items: 1,
			dots: true,
			loop:true
		});
	});

})(jQuery);