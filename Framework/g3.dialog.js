var openWindow = function(options) {
	var divId = "dialog" + Math.round(Math.random() * 100);
	var settings = {
		id : divId,
		width : 600,
		height : 400,
		modal : true,
		type : 'url', // url or html
		buttons : {},
		show : "",
		hide : "",
		title : "提示",
		body : "",
		iframe : false,
		resizable : false,
		init : false,
		errorPage : "/hrd/defaultError.htm",
		close : function() {
			$("#" + this.id).html("");			
			$("#" + this.id).dialog("close");
			if (options.refreshitem) {
				$("#tabPanel").refreshitem();
			}
		}
	};
	if (options) {
		$.extend(settings, options);
	}


	if (settings.id == divId)
		$("body").append('<div id="' + settings.id + '" title="Dialog Title"><p class="loading"></p></div>');

	if (settings.iframe) {
		var iframe = $('<iframe id="dialog_iframe_' + settings.id + '" name="dialog_iframe_' + settings.id + '" width="100%" height="100%" src="" marginwidth="0" marginheight="0" frameBorder="0" />');
		$('#' + settings.id).append(iframe);
	}
	// Dialog
	$("#" + settings.id).dialog({
		autoOpen : false,
		title : settings.title,
		width : settings.width,
		height : settings.height,
		modal : true,
		bgiframe : false,
		show : settings.show,
		hide : settings.hide,
		buttons : settings.buttons,
		resizable : settings.resizable,
		close : settings.close,
		open : function() {
			if (settings.iframe) {
				if (settings.body == '') {
					$("#dialog_iframe_" + settings.id).attr("src", settings.errorPage);
				}
				if (settings.type == 'url' && settings.body != '') {
					$("#dialog_iframe_" + settings.id).attr("src", settings.body);
				}
				if (settings.type == 'html' && settings.body != '') {
					$("#dialog_iframe_" + settings.id).html(settings.body);
				}
			} else {
				if (settings.body == '') {
					$("#" + settings.id).load(settings.errorPage);
				}
				if (settings.type == 'url' && settings.body != '') {
					$("#" + settings.id).load(settings.body, settings.data, function() {
						if (settings.init) {
							settings.init(settings.id);
						}
					});
				}
				if (settings.type == 'html' && settings.body != '') {
					$("#" + settings.id).html(settings.body);
					if (settings.init) {
						settings.init(settings.id);
					}
				}
			}
		},
		resizeStop : function() {
			$("#dialogFrame").css("width", parseInt($(this).css("width")) - 5);
			$("#dialogFrame").css("height", parseInt($(this).css("height")) - 5);
		}
	});

	$("#" + settings.id).dialog("open");
	return settings.id;
};

var closeWindow = function(id) {
	$("#" + id).html("");
	$("#" + id).dialog("close");
};
