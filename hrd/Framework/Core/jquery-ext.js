(function($) {
	var oldHTML = $.fn.html;
	$.fn.formhtml = function(arguments) {
		if (arguments)
			return oldHTML.apply(this, arguments);
		$("input,textarea,button", this).each(function() {
			this.setAttribute('value', this.value);
		});
		$(":radio,:checkbox", this).each(function() {
			if (this.checked)
				this.setAttribute('checked', 'checked');
			else
				this.removeAttribute('checked');
		});
		$("option", this).each(function() {
			if (this.selected)
				this.setAttribute('selected', 'selected');
			else
				this.removeAttribute('selected');
		});
		return oldHTML.apply(this);
	};
	$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
	$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
	$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
	$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());
})(jQuery);