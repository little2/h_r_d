var BASEPATH = '/hrd';
var GRIDHEIGHT = document.documentElement.clientHeight - 102;
var GRIDWIDTH = document.documentElement.clientWidth - 20;
var DIALOGHEIGHT = document.documentElement.clientHeight;
var DIALOGWIDTH = document.documentElement.clientWidth;
/*
 * 扩展方法
 */
String.prototype.Trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.LTrim = function() {
	return this.replace(/(^\s*)/g, "");
};
String.prototype.RTrim = function() {
	return this.replace(/(\s*$)/g, "");
};

function objConvertStr(o) {
	if (o == undefined) {
		return "";
	}
	var r = [];
	if (typeof o == "string")
		return "\"" + o.replace(/([\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	if (typeof o == "object") {
		if (!o.sort) {
			for ( var i in o)
				r.push("\"" + i + "\":" + objConvertStr(o[i]));
			if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
				r.push("toString:" + o.toString.toString());
			}
			r = "{" + r.join() + "}"
		} else {
			for ( var i = 0; i < o.length; i++)
				r.push(objConvertStr(o[i]))
			r = "[" + r.join() + "]";
		}
		return r;
	}
	return o.toString().replace(/\"\:/g, '":""');
}

function isNull() {
	if (!exp && typeof (exp) != "undefined" && exp.length != 0) {
		return true;
	}
	return false;
}

/*
 * Ajax通信方法
 */
function callAjax(params, url) {
	var lData = null;
	try {
		$.ajax({
			type : 'POST',
			url : url,
			dataType : 'json',
			data : params,
			async : false,
			success : function(data) {
				lData = data;
			},
			error : function() {
				g3_error_msg({
					body : "程序异常请联系管理员!"
				});
				lData = null;
			}
		});
	} catch (e) {
		alert(e);
		lData = null;
	}
	return lData;
}

function flexiAjax(id, params, url) {
	try {
		$.ajax({
			type : 'POST',
			url : url,
			dataType : 'json',
			data : params,
			async : false,
			success : function(data) {
				$('#' + id).flexReload(); // 表格重载
			},
			error : function(data) {
				// alert(data.status +"\n"+ data.readyState +"\n"+
				// data.responseText);
				g3_error_msg({
					body : "程序异常请联系管理员!"
				});
			}
		});
	} catch (e) {
		alert(e);
	}
}

/**
 * 同步AJAX提交
 * 
 * @param id
 * @param params
 * @param url
 * @returns
 */
function flexiAjaxNoAsync(id, params, url) {
	return $.ajax({
		type : 'POST',
		url : url,
		dataType : 'json',
		data : params,
		async : false
	}).responseText;
}

/**
 * 以POST发送一个参数为keyValue形式的AJAX请求
 * 
 * @param url
 * @param sendData
 * @param successCall
 */
function sendPostJQueryAjax(url, sendData, successCall) {
	sendJQueryAjax("POST", "application/x-www-form-urlencoded", url, "json", sendData, successCall, null);
}

/**
 * 发送jquery的异步请求
 * 
 * @param type
 * @param contentType
 * @param url
 * @param dataType
 * @param sendData
 * @param successCall
 */
function sendJQueryAjax(type, contentType, url, dataType, sendData, successCall, errorCall) {
	$.ajax({
		type : (type == null ? 'POST' : type),
		contentType : (contentType == null ? 'application/x-www-form-urlencoded' : contentType),
		url : url,
		dataType : (dataType == null ? 'json' : dataType),
		data : sendData,
		success : (successCall == null ? successCallback : successCall),
		error : (errorCall == null ? errorCallback : errorCall)
	});
}

function successCallback(rs) {
}

function errorCallback(XMLHttpRequest) {
	// alert(XMLHttpRequest.status);
}

/*
 * 弹出框封装方法
 */

function openDialog(options) {
	return window.parent.openWindow(options);
	
	//refer to /Framework/g3.dialog.js
}

function closeDialog(id) {
	window.parent.closeWindow(id);
}

function g3_info_msg(options) {
	var msg = $.extend({
		id : 'g3_msg',
		width : 400,
		height : 250,
		modal : true,
		type : 'html',
		show : "",
		hide : "",
		title : "信息提示",
		body : '',
		buttons : {
			"确定" : function() {
				closeDialog(this.id);
			}
		}
	}, options);
	openDialog(msg);
}

function g3_error_msg(options) {
	var msg = $.extend({
		id : 'g3_msg',
		width : 400,
		height : 250,
		modal : true,
		type : 'html',
		show : "",
		hide : "",
		title : "信息提示",
		body : '',
		buttons : {
			"确定" : function() {
				closeDialog(this.id);
			}
		}
	}, options);
	openDialog(msg);
}

function getHeight(l_type) {
	var pageHeight;

	if (l_type == 1) {
		pageHeight = document.documentElement.clientHeight;
	} else {
		pageHeight = window.screen.height;
	}

	return pageHeight;
}

function getWidth(l_type) {
	var pageWidth;

	if (l_type == 1) {
		pageWidth = document.documentElement.clientWidth;
	} else {
		pageWidth = window.screen.width;
	}
	return pageWidth - 6;
}

function notNull(obj) {
	if (typeof (obj) == undefined) {
		return false;
	}
	if (obj == null) {
		return false;
	}
	if (obj.toString().Trim() == '') {
		return false;
	}
	return true;
}

function notSubmit(obj) {
	if ($(obj).hasClass('lov')) {
		return false;
	}
	if ($(obj).hasClass('notsubmit')) {
		return false;
	}
	if ($(obj).attr("type") == 'button') {
		return false;
	}
	if (!notNull($(obj).attr("name"))) {
		return false;
	}
	return true;
}

function jsonToString(obj) {
	var THIS = this;
	switch (typeof (obj)) {
	case 'string':
		return '"' + obj.replace(/(["\\])/g, '\\$1') + '"';
	case 'array':
		return '[' + obj.map(THIS.jsonToString).join(',') + ']';
	case 'object':
		if (obj instanceof Array) {
			var strArr = [];
			var len = obj.length;
			for ( var i = 0; i < len; i++) {
				strArr.push(THIS.jsonToString(obj[i]));
			}
			return '[' + strArr.join(',') + ']';
		} else if (obj == null) {
			return 'null';

		} else {
			var string = [];
			for ( var property in obj)
				string.push(THIS.jsonToString(property) + ':' + THIS.jsonToString(obj[property]));
			return '{' + string.join(',') + '}';
		}
	case 'number':
		return obj;
	case false:
		return obj;
	}
}

function stringToJSON(obj) {
	return eval('(' + obj + ')');
}
