(function($) {
	$.addLOV = function(t, p) {
		var d = {
			url : "/hrd/lov/list.html?init=y&lovCode=" + p.code,
			code : '',
			width : 600,
			height : 500,
			type : '2',
			way : 'name',
			key : 'departId',
			value : '',
			fields : 'depart',
			onload : false
		};
		d = $.extend(d, p);
		var keyid = d.key;
		if (p.keyId)
			keyid = d.keyId;
		$(t).after("<input type=\"hidden\" id=\"" + keyid + "\" name=\"" + d.key + "\" value=\"" + d.value + "\"/>");
		var delhtml = $("<span class=\"delRow\"></span>").click(function() {
			
			$("input", $(this).parent()).each(function() {
				$(this).val("");
			});
		});
		$(t).after(delhtml);
		$(t).dblclick(function() {
			g3_lov(d, false);
		});
	};

	returnData = function(id, p) {
		var grid = $('#rtnData', window.parent.document);
		var key = '';
		if (p.type == 1) {
			var data = new Array();
			$('.td', grid).each(function(i) {
				data[i] = $(this).text();
			});
			if (data.length > p.fields.length) {
				if (p.way == 'id')
					$('input[' + p.way + '="' + p.keyId + '"]').val(data[0]);
				if (p.way == 'name')
					$('input[' + p.way + '="' + p.key + '"]').val(data[0]);

				key = data[0];
				$.each(p.fields, function(i) {
					$('input[' + p.way + '="' + p.fields[i] + '"]').val(data[i + 1]);
					$('input[' + p.way + '="' + p.fields[i] + '"]').focus();
					$('input[' + p.way + '="' + p.fields[i] + '"]').blur();
					$('textarea[' + p.way + '="' + p.fields[i] + '"]').val(data[i + 1]);
					$('textarea[' + p.way + '="' + p.fields[i] + '"]').focus();
					$('textarea[' + p.way + '="' + p.fields[i] + '"]').blur();
				});
			}
		}
		if (p.type == 2) {
			$('td', grid).each(function(i) {
				if (i == 0) {
					if (p.way == 'id')
						$('input[' + p.way + '="' + p.keyId + '"]').val($(this).text());
					if (p.way == 'name')
						$('input[' + p.way + '="' + p.key + '"]').val($(this).text());
					key = $(this).text();
				}
				if (i == 2) {
					$('input[' + p.way + '="' + p.fields + '"]').val($(this).text());
					$('input[' + p.way + '="' + p.fields + '"]').focus();
					$('input[' + p.way + '="' + p.fields + '"]').blur();
					$('textarea[' + p.way + '="' + p.fields + '"]').val($(this).text());
					$('textarea[' + p.way + '="' + p.fields + '"]').focus();
					$('textarea[' + p.way + '="' + p.fields + '"]').blur();
				}
			});

		}
		if (p.type == 3) {
			var tmp = [];
			$('tr', grid).each(function(i) {
				$('td', $(this)).each(function(j) {
					var val = $(this).text();
					if (val) {
						tmp[j] += ',' + val;
					} else {
						tmp[j] += '';
					}
				});
			});
			if (tmp[0]) {
				$('input[' + p.way + '="' + p.key + '"]').val(tmp[0].substring(10));
				key = tmp[0].substring(10);
			} else {
				$('input[' + p.way + '="' + p.key + '"]').val('');
			}
			$.each(p.fields, function(i) {
				if (tmp[i + 1]) {
					if ($('input[' + p.way + '="' + p.fields[i] + '"]')) {
						$('input[' + p.way + '="' + p.fields[i] + '"]').val(tmp[i + 1].length > 10 ? tmp[i + 1].substring(10) : '');
						$('input[' + p.way + '="' + p.fields[i] + '"]').focus();
						$('input[' + p.way + '="' + p.fields[i] + '"]').blur();
					}
					if ($('textarea[' + p.way + '="' + p.fields[i] + '"]')) {
						$('textarea[' + p.way + '="' + p.fields[i] + '"]').val(tmp[i + 1].length > 10 ? tmp[i + 1].substring(10) : '');
						$('textarea[' + p.way + '="' + p.fields[i] + '"]').focus();
						$('textarea[' + p.way + '="' + p.fields[i] + '"]').blur();
					}
				} else {
					if ($('input[' + p.way + '="' + p.fields[i] + '"]')) {
						$('input[' + p.way + '="' + p.fields[i] + '"]').val('');
						$('input[' + p.way + '="' + p.fields[i] + '"]').focus();
						$('input[' + p.way + '="' + p.fields[i] + '"]').blur();
					}
					if ($('textarea[' + p.way + '="' + p.fields[i] + '"]')) {
						$('textarea[' + p.way + '="' + p.fields[i] + '"]').val('');
						$('textarea[' + p.way + '="' + p.fields[i] + '"]').focus();
						$('textarea[' + p.way + '="' + p.fields[i] + '"]').blur();
					}
				}
			});

		}
		if (p.onload)
			p.onload(key);
	};

	g3_lov = function(p, callback) {
		return openDialog({
			id : 'g3_lov',
			width : p.width,
			height : p.height,
			modal : true,
			type : 'url',
			show : "",
			hide : "",
			title : 'LOV',
			body : p.url + '&lovType=' + p.type,
			init : callback,
			buttons : {
				"確定" : function() {
					returnData(this.id, p);
					closeDialog(this.id);
				},
				"取消" : function() {
					closeDialog(this.id);
				}
			}
		});
	};

	$.fn.newLOV = function(p) {
		var t = this;
		$(document).ready(function() {
			$.addLOV(t, p);
		});
	};
})(jQuery);