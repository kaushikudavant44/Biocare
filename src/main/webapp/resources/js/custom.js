/*//new WOW().init();
var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value;

slider.oninput = function() {
	
  
  output.innerHTML = this.value;
   
}

var slider1 = document.getElementById("myRange1");
var  output1 = document.getElementById("demo1");
output1.innerHTML = slider1.value;

slider1.oninput = function() {
  output1.innerHTML = this.value;
}*/

            jQuery(document).ready(function() {
              var owl = jQuery('.owl-carousel');
              owl.owlCarousel({
                items: 1,
                loop: true,
                margin: 10,
                autoplay: false,
                autoplayTimeout: 2000,
                autoplayHoverPause: false,
               mouseDrag: false,
			    touchDrag: false
              });
              jQuery('.play').on('click', function() {
                owl.trigger('play.owl.autoplay', [2000])
              })
              jQuery('.stop').on('click', function() {
                owl.trigger('stop.owl.autoplay')
              })
			  
            })
   
    
  jQuery('ul.nav li.dropdown').hover(function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
	}, function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
	});
            
          //06-04-2018	
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            	$('.tooltip-inner').css('min-width', '400px');
                $('.tooltip-inner').css('background', 'red');   
            });
   