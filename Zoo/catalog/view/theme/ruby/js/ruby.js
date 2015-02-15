/*!
 * jQuery Cookie Plugin v1.1
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2011, Klaus Hartl
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
(function($, document) {

	var pluses = /\+/g;
	function raw(s) {
		return s;
	}
	function decoded(s) {
		return decodeURIComponent(s.replace(pluses, ' '));
	}

	$.cookie = function(key, value, options) {

		// key and at least value given, set cookie...
		if (arguments.length > 1 && (!/Object/.test(Object.prototype.toString.call(value)) || value == null)) {
			options = $.extend({}, $.cookie.defaults, options);

			if (value == null) {
				options.expires = -1;
			}

			if (typeof options.expires === 'number') {
				var days = options.expires, t = options.expires = new Date();
				t.setDate(t.getDate() + days);
			}

			value = String(value);

			return (document.cookie = [
				encodeURIComponent(key), '=', options.raw ? value : encodeURIComponent(value),
				options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
				options.path    ? '; path=' + options.path : '',
				options.domain  ? '; domain=' + options.domain : '',
				options.secure  ? '; secure' : ''
			].join(''));
		}

		// key and possibly options given, get cookie...
		options = value || $.cookie.defaults || {};
		var decode = options.raw ? raw : decoded;
		var cookies = document.cookie.split('; ');
		for (var i = 0, parts; (parts = cookies[i] && cookies[i].split('=')); i++) {
			if (decode(parts.shift()) === key) {
				return decode(parts.join('='));
			}
		}
		return null;
	};

	$.cookie.defaults = {};

})(jQuery, document);


window.mobilecheck = function() 
{
var check = false;
(function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
return check; 
}

function page_load()
{
		$('#language .drop').dropkick({
			width:30, 
			change: function (value, label) 
			{
				jQuery("#language input[name=language_code]").val(value);
				jQuery("#language form").submit();
			}
		});
		
		$('#currency .drop').dropkick({width:10, change: function (value, label) 
			{
				jQuery("#currency input[name=currency_code]").val(value);
				jQuery("#currency form").submit();
			}
		});
		
		$('#limit_select').dropkick({width:50, change: function (value, label) 
			{
				location = value;
			}
		});
		
		$('#sort_select').dropkick({width:120, change: function (value, label) 
			{
				location = value;
			}
		});	
		
		jQuery("#column-right").remove();
		$(document).unbind("mousewheel");
		
		//category products animation
		/*$("div[data-liffect] > div").each(function (i) {
			$(this).attr("style", "-webkit-animation-delay:" + i * 300 + "ms;"
					+ "-moz-animation-delay:" + i * 300 + "ms;"
					+ "-o-animation-delay:" + i * 300 + "ms;"
					+ "animation-delay:" + i * 300 + "ms;");
		if (i == $("div[data-liffect] > div").size() -1) {
			$("div[data-liffect]").addClass("play")
		}});*/
		
	  var allPanels = $('.box-category > ul > li ul');
		
	  $('.box-category > ul > li a.parent span').click(function() {
		  
		  $this = $(this.parentNode);
		  $target =  jQuery("> ul", $this.parent());
		  
		  if($target.hasClass('active'))
		  {
			  $target.removeClass('active').slideUp();
			  jQuery("span", this).html("+");
		  } else
		  {
			  allPanels.removeClass('active').slideUp();
			  jQuery(".box-category > ul > li a span").html("+");

			  if(!$target.hasClass('active'))
			  {
				 $target.addClass('active').slideDown();
				 jQuery("span", $this).html("-");
			  } else
			  {
				  
			  }
		  }
		return false;
	  });		
}


jQuery(window).load(function() 
{
			var header = jQuery("#header");
			header.css('min-height',($('#content').outerHeight(true) + 85) + "px");
});

jQuery(document).ready(function() 
{
		page_load();

		var header = jQuery("#header");
		if (header.css("text-align") != "center")
		{
			jQuery(window).resize(function() {if (header.css("text-align") != "center") header.css('min-height',($('#content').outerHeight() + 85) + "px"); else header.height("auto")});	
			setTimeout(function () {header.css('min-height',($('#content').outerHeight(true) + 85) + "px");}, 100);
		}
		
		$(window).scroll(function() {
			if($(this).scrollTop() > 200) {
				$('#scroll_top').fadeIn();	
			} else {
				$('#scroll_top').fadeOut();
			}
		});
	 
		$('#scroll_top').click(function(e) {
			$('body,html').animate({scrollTop:0},500);
			e.preventDefault();
			return false;
		});

		var _first_load = true;
		$("#first_visit_message a").on("click", function (e) 
		{
			$.cookie('first_visit_message', 'true', { expires: 365 });
			e.preventDefault();
			$("#first_visit_message").animate({opacity:0}, 1000, function () { jQuery(this).hide();});
			return false;
		});
	
		if ($.cookie('first_visit_message') != "true") $("#first_visit_message").show();

		$("#loading").ajaxStart(function(){
		   $(this).show();
		 });
		 
		 $("#header-top #search input").autocomplete($('base').attr('href')  + "index.php?route=product/search&filter_name=");
		

		var extension =/\.[0-9a-z]{1,5}$/i
		var is_http =/^http:/i
		var domain = location.href.replace("http://","").replace("https://","").split("/")[0];
		
//		if (!window.mobilecheck)
		{
			jQuery("a.quickview").click(function (event) 
			{
				//var t = /.jpg$/.exec(this.href)==null?:
				$.colorbox({iframe:false,width:800,height:600,href:(/.jpg$/.exec(this.href)==null?this.href + "&ajax=true":this.href)});
				event.stopPropagation();
				event.stopImmediatePropagation();
				event.preventDefault();
				return false;
			});
		}
		
		jQuery("div.image").click(function (event) 
		{
			if (!event.isImmediatePropagationStopped())
			{
				window.location.href = jQuery("a", this).attr("href");
			}
		});
		

		/* Search */
		$('.button-search').bind('click', function() {
			url = $('base').attr('href') + 'index.php?route=product/search';
					 
			var search = $('input[name=\'search_text\']').attr('value');

			if (search) {
				url += '&search=' + encodeURIComponent(search);
			} else
			{
				var filter_name = $('input[name=\'filter_name\']').attr('value');
			
				if (filter_name) {
					url += '&filter_name=' + encodeURIComponent(filter_name);
				}
			}
			
			window.location = url;
		});

		$('input[name=\'search_text\']').bind('keydown', function(e) {
			if (e.keyCode == 13) {
				url = $('base').attr('href') + 'index.php?route=product/search';
				 
				var search = $('input[name=\'search_text\']').attr('value');
				
				if (search) 
				{
					url += '&search=' + encodeURIComponent(search);
				}
				
				window.location = url;
			}
		}).click(function (e) 
		{
			this.value = '';
		});

		
		$('input[name=\'filter_name\']').bind('keydown', function(e) {
			this.style.color = '#000000';
			if (e.keyCode == 13) {
				url = $('base').attr('href') + 'index.php?route=product/search';
				 
				var filter_name = $('input[name=\'filter_name\']').attr('value');
				
				if (filter_name) {
					url += '&filter_name=' + encodeURIComponent(filter_name);
				}
				
				window.location = url;
			}
		}).click(function (e) 
		{
			this.value = '';
		});

		$( '#dl-menu' ).dlmenu();		

/*		jQuery("a").click(function (e) 
		{
			if (this.href.indexOf("#") != -1 || this.href.match(extension) || 
			(this.href.match(is_http) && url.replace("http://",'').replace("https://").split("/")[0] !== domain)) return; 
			
			if (this.href.indexOf("?") == -1) url +=  "?ajax=true"; else url += "&ajax=true";
			$.ajax(
			{
			  url: url,
			  beforeSend:function() 
				{
					$("#content").animate({opacity:0}, 2000);
				}
			}).done(function( html ) 
		    {
				html = html.replace('<div id="content"', '<div id="content" style="opacity:0"');
				$("#content").replaceWith(html);
				$("#content").stop().animate({opacity:1}, 1000);
				page_load();
				jQuery(".success, .warning, .attention, .information").hide();
			}).error(function(html)
			{
				$("#content").stop().animate({opacity:1}, 1500);
			});
			
			e.preventDefault();
			return false;
		});*/
});
