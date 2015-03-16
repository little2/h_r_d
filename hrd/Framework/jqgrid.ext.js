jQuery.extend($.fn.fmatter, {
	lovFmatter : function(cellvalue, options, rowdata) {
		var id = options.rowId + '_' + options.colModel.name;
		var name = options.colModel.name;
		var rowId = options.rowId;
		var gid = options.gid;
		var op = JSON.stringify(options.colModel.formatoptions).replace(/\"/g, "'");
		var value = cellvalue ? cellvalue : '';
		var style = '';
		if (options.colModel.formatoptions.style) {
			style = "style='" + options.colModel.formatoptions.style + "'";
		}
		return "<input id=\"" + id + "\" name=\"" + name + "\" value=\"" + value + "\" " + style + " type=\"text\" disabled=\"disabled\" class=\"rolov\" ondblclick=\"jzsoft.grid.showLov(this,'" + gid
				+ "','" + rowId + "'," + op + ")\"/>";
	}
});

jQuery.extend($.fn.fmatter.lovFmatter, {
	unformat : function(cellvalue, options) {
		return cellvalue;
	}
});

jQuery.extend($.fn.fmatter, {
	testFmatter : function(cellvalue, options, rowdata) {
		var id = options.rowId + '_' + options.colModel.name;
		var name = options.colModel.name;
		var value = cellvalue ? cellvalue : '';
		var style = '';
		if (options.colModel.formatoptions.style) {
			style = "style='" + options.colModel.formatoptions.style + "'";
		}
		return "<input id=\"" + id + "\" name=\"" + name + "\" value=\"" + value + "\" " + style
				+ " type=\"text\" disabled=\"disabled\" class=\"rodate\" ondblclick=\"$(this).datepicker({ dateFormat: \"yy-mm-dd\" });\"/>";
	}
});

jQuery.extend($.fn.fmatter.testFmatter, {
	unformat : function(cellvalue, options) {
		return cellvalue;
	}
});
