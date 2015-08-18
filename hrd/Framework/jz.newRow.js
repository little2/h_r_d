(function($) {
	$.newRow = function(t, p) {
		var p = $.extend({
			rowCase : 'case',
			rowId : 'newrow',
			rowName : 'newrow',
			type : 'text',
			rowClass : 'contxt',
			rowStyle : 'width:400px;',
			initRC : 3,
			options : {}
		}, p);

		var style = p.rowStyle ? ' style="' + p.rowStyle + '" ' : ' ';
		var className = p.rowClass ? ' class="' + p.rowClass + '" ' : ' ';
		var caseNew = p.rowCase ? p.rowCase : '';
		var index = 0;

		if (p.initData) {
			for ( var i = 0; i < p.initData.length; i++) {
				var value, key;
				if (p.rowClass == 'lov') {
					key = p.initData[i].key;
					value = p.initData[i].value;
				} else {
					value = p.initData[i];
				}

				var id = ' id="' + caseNew + '[' + index + '].' + p.rowId + '" ';
				var name = ' name="' + caseNew + '[' + index + '].' + p.rowName + '" ';
				var html = $('<div><input type="text" ' + id + name + style + className + '" value="' + value + '" /><div class="delRow"></div><div class="separate"></div></div>');
				$(t).append(html);
				$(html).find(".delRow").bind('click', function() {
					$(this).parent().remove();
				});
				if (p.rowClass == 'lov') {
					$(html).find("input").jzlov($.extend({}, p.options), index, key);
				}
				++index;
			}
		}

		if (p.initRC) {
			var RC = p.initRC;
			if (p.initData) {
				if (p.initRC > p.initData.length) {
					RC = p.initRC - p.initData.length;
				} else {
					RC = 0;
				}
			}
			for ( var i = 0; i < RC; i++) {
				var id = ' id="' + caseNew + '[' + index + '].' + p.rowId + '" ';
				var name = ' name="' + caseNew + '[' + index + '].' + p.rowName + '" ';
				var html = $('<div><input type="text" ' + id + name + style + className + '"  value=""/><div class="delRow"></div><div class="separate"></div></div>');
				$(t).append(html);
				$(html).find(".delRow").bind('click', function() {
					$(this).parent().remove();
				});
				if (p.rowClass == 'lov') {
					$(html).find("input").jzlov($.extend({}, p.options), index);
				}
				++index;
			}
		}

		var id = ' id="' + caseNew + '[' + index + '].' + p.rowId + '" ';
		var name = ' name="' + caseNew + '[' + index + '].' + p.rowName + '" ';
		var head = $('<div><input type="text" ' + id + name + style + className + '"  value=""/><div class="addRow"></div><div class="separate"></div></div>');
		$(t).append(head);

		if (p.rowClass == 'lov') {
			$(head).find("input").jzlov($.extend({}, p.options), index);
		}

		$(t).find(".addRow").bind('click', function() {
			var id = ' id="' + caseNew + '[' + index + '].' + p.rowId + '" ';
			var name = ' name="' + caseNew + '[' + index + '].' + p.rowName + '" ';
			var html = $('<div><input  type="text" ' + id + name + style + className + '"  value=""/><div class="delRow"></div><div class="separate"></div></div>');
			$(this).parent().prepend(html);
			$(html).find(".delRow").bind('click', function() {
				$(this).parent().remove();
			});
			if (p.rowClass == 'lov') {
				$(html).find("input").jzlov($.extend({}, p.options), index);
			}

		});

	};

	$.fn.newRow = function(p) {
		var t = this;
		$(document).ready(function() {
			$.newRow(t, p);
		});
	};
})(jQuery);