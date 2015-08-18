(function($) {
	$.newjzlov = function(t, p, index, value) {
		var p = $.extend({
			url : "/hrd/lov/lov.html?init=y&lovCode=" + p.code,
			width : 600,
			height : 500,
			type : '1',//
			way : 'name',
			fields : [ 'depart' ],
			onload : false
		}, p);
		
		var k = $("<input/>");
		$(k).attr("type", "hidden");
		if(p.key){
			if(p.key.id){
				$(k).attr("id", (index == undefined ? p.key.id : p.key.id + index));
			}
			if (p.key.name) {
				$(k).attr("name",(index == undefined ? p.key.name : p.key.name + index));
			}
			if (p.key.value) {
				$(k).attr("value", p.key.value);
			}
			if (value) {
				$(k).attr("value", value);
			}
			if (p.key.className) {
				$(k).attr("class", p.key.className);
			}
		}
		
		$(t).before(k);
		$(t).dblclick(function() {
			lovDialog(t, p, false);
		});
	};

	reData = function(id, t, p) {
		var g = $('#' + id + ' #lov_list', window.parent.document);
		if (g) {
			var rowdatas = [];
			switch (p.type) {
			case '1':
				var sel = $(g).jqGrid('getGridParam', 'selrow');
				if (sel) {
					var rowdata = $(g).jqGrid("getRowData", sel);
					rowdatas.push(rowdata);
					var colModel = $(g).jqGrid('getGridParam', 'colModel');
					$.each(p.fields, function(i) {
						var col = colModel[i];
						if (col) {
							$('[' + p.way + '="' + p.fields[i] + '"]').val(
									rowdata[col.name]);
							$('[' + p.way + '="' + p.fields[i] + '"]').focus();
							$('[' + p.way + '="' + p.fields[i] + '"]').blur();
						}
					});
				}
				break;
			case '2':
				var sels = $(g).jqGrid('getGridParam', 'selarrrow');
				if (sels) {
					var len = sels.length;
					var ids = "", name = "";

					var colModel = $(g).jqGrid('getGridParam', 'colModel');
					if (colModel) {
						for ( var i = 0; i < len; i++) {
							var rowdata = $(g).jqGrid("getRowData", sels[i]);
							ids += "," + rowdata[colModel[1].name];
							name += "," + rowdata[colModel[3].name];
							rowdatas.push(rowdata);
						}
						$("#" + p.key.id).val(
								ids.length > 0 ? ids.substring(1) : "");
						$(t).val(name.length > 0 ? name.substring(1) : "");
					}
				}
				break;
			case '3':
				var sel = $(g).jqGrid('getGridParam', 'selrow');
				if (sel) {
					var colModel = $(g).jqGrid('getGridParam', 'colModel');
					if (colModel) {
						var rowdata = $(g).jqGrid("getRowData", sel);
						ids =  rowdata[colModel[0].name];
						name =  rowdata[colModel[2].name];
						rowdatas.push(rowdata);
						$(t).prev().val(ids);
						$(t).val(name);
					}
				}
				break;
			}
			if (p.onload)
				p.onload(rowdatas);
		}
	};

	lovDialog = function(t, p, callback) {
		return openDialog({
			id : 'g3_lov',
			width : p.width,
			height : p.height,
			modal : true,
			type : 'url',
			title : 'LOV',
			body : p.url + '&lovType=' + p.type,
			init : callback,
			buttons : {
				"確定" : function() {
					reData(this.id, t, p);
					closeDialog(this.id);
				},
				"取消" : function() {
					closeDialog(this.id);
				}
			}
		});
	};

	$.fn.jzlov = function(p, index, value) {
		var t = this;
		$(document).ready(function() {
			$.newjzlov(t, p, index, value);
		});
	};
})(jQuery);