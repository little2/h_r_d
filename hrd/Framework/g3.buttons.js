(function($) {
	$.addButtons = function(t, p) {
		var gDiv = document.createElement('div'); // create global container
		gDiv.className="buttons";
		$(t).append(gDiv);
		var tDiv = document.createElement('div');
		tDiv.className = 'tDiv';
		var tDiv2 = document.createElement('div');
		tDiv2.className = 'tDiv2';
		for ( var i = 0; i < p.length; i++) {
			var btn = p[i];

			if (!btn.separator) {
				var btnDiv = document.createElement('div');
				btnDiv.className = 'fbutton';
				btnDiv.innerHTML = "<div><span>" + btn.name + "</span></div>";
				if (btn.bclass)
					$('span', btnDiv).addClass(btn.bclass).css({
						paddingLeft : 20
					});
				btnDiv.onpress = btn.onpress;
				btnDiv.name = btn.bclass;
				if (btn.onpress) {
					$(btnDiv).click(function() {
						this.onpress();
					});
				}
				$(tDiv2).append(btnDiv);
				if ($.browser.msie && $.browser.version < 7.0) {
					$(btnDiv).hover(function() {
						$(this).addClass('fbOver');
					}, function() {
						$(this).removeClass('fbOver');
					});
				}

			} else {
				$(tDiv2).append("<div class='btnseparator'></div>");
			}
		}
		$(tDiv).append(tDiv2);
		$(tDiv).append("<div style='clear:both'></div>");
		$(gDiv).prepend(tDiv);
	};
	
	$.fn.newButtons = function(p) {
		var t = this;
		$(document).ready(function() {
			$.addButtons(t, p);
		});
	};
})(jQuery);