/* dCodes Framework: (c) TemplateAccess */



/* notification bar */

var o;
function showNotificationBlock(color11,time,message,background_color,position,removebutton){

				/* o.color=color11;
				 o.time=time;
				 o.message=message;
					 o.background_color=background_color;
					 o.position=position;
					 o.removebutton=removebutton;*/



				 if(!$('.jbar').length){
					 timeout = setTimeout('$.fn.bar.removebar()',time);
					 var _message_span = $(document.createElement('span')).addClass('jbar-content').html(message);
					 _message_span.css({"color" : color11});
					 var _wrap_bar;
					 (position == 'bottom') ?
					 _wrap_bar	  = $(document.createElement('div')).addClass('jbar jbar-bottom'):
					 _wrap_bar	  = $(document.createElement('div')).addClass('jbar jbar-top') ;

					 _wrap_bar.css({"background-color" 	: background_color});
					 if(removebutton){
						 var _remove_cross = $(document.createElement('a')).addClass('jbar-cross');
						 _remove_cross.click(function(e){$.fn.bar.removebar();})
					 }
					 else{
						 _wrap_bar.css({"cursor"	: "pointer"});
						 _wrap_bar.click(function(e){$.fn.bar.removebar();})
					 }
					 _wrap_bar.append(_message_span).append(_remove_cross).hide().insertBefore($('.dc_notificationbar_container')).fadeIn('fast');
				 }

			 }

(function($) {
	
	$.fn.bar = function(options) {
		var opts = $.extend({}, $.fn.bar.defaults, options);
		return this.each(function() {
			$this = $(this);
			var o = $.meta ? $.extend({}, opts, $this.data()) : opts;
			
			$this.click(function(e){
				if(!$('.jbar').length){
					timeout = setTimeout('$.fn.bar.removebar()',o.time);
					var _message_span = $(document.createElement('span')).addClass('jbar-content').html(o.message);
					_message_span.css({"color" : o.color});
					var _wrap_bar;
					(o.position == 'bottom') ? 
					_wrap_bar	  = $(document.createElement('div')).addClass('jbar jbar-bottom'):
					_wrap_bar	  = $(document.createElement('div')).addClass('jbar jbar-top') ;
					
					_wrap_bar.css({"background-color" 	: o.background_color});
					if(o.removebutton){
						var _remove_cross = $(document.createElement('a')).addClass('jbar-cross');
						_remove_cross.click(function(e){$.fn.bar.removebar();})
					}
					else{				
						_wrap_bar.css({"cursor"	: "pointer"});
						_wrap_bar.click(function(e){$.fn.bar.removebar();})
					}	
					_wrap_bar.append(_message_span).append(_remove_cross).hide().insertBefore($('.dc_notificationbar_container')).fadeIn('fast');
				}
			})
			
			
		});
	};
	var timeout;
	$.fn.bar.removebar 	= function(txt) {
		if($('.jbar').length){
			clearTimeout(timeout);
			$('.jbar').fadeOut('fast',function(){
				$(this).remove();
			});
		}	
	};
	$.fn.bar.defaults = {
		background_color 	: '#f3f3f3',
		color 				: '#000',
		position		 	: 'top',
		removebutton     	: true,
		time			 	: 120000	
	};
	
})(jQuery);

/* notification bar */



$(function () {
	$('a.button-close, #dc_popup-overlay, #dc_popup-box').click(function () {
		$('#dc_popup-overlay, #dc_popup-box').fadeOut();
		return false;
	});
	$(window).resize(function () {
		if (!$('#dc_popup-box').is(':hidden')) popup();
	});
});
function popup(message) {
	$('#dc_popup-message').html(message);
	var maskHeight = $(window).height();
	var maskWidth = $(window).width();
	var dialogTop = (maskHeight - $('#dc_popup-box').height()) / 2;
	var dialogLeft = (maskWidth / 2) - ($('#dialog-box').width() / 2);
	$('#dc_popup-overlay').css({
		height: maskHeight,
		width: maskWidth
	}).show();
	$('#dc_popup-box').css({
		top: dialogTop,
		left: dialogLeft
	}).show();
}
$(document).ready(function () {
	$('.button').click(function () {
		type = $(this).attr('data-type');
		$('.overlay-container').fadeIn(function () {
			window.setTimeout(function () {
				$('.window-container.' + type).addClass('window-container-visible');
			}, 100);
		});
	});
	$('.dc_closedialog').click(function () {
		$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
	});
});