(function($) {
	/**
	 * 標准頁查詢模態窗共用方法
	 * 
	 * @param model
	 */
	var g3_query = function(model, callback) {
		var queryDivId = model.queryDivId;
		var gridDivId = model.gridDivId;
		var body = $('#' + queryDivId);
		return openDialog({
			id : 'g3_dialog',
			width : body.width()||450,
			height : body.height()||300,
			modal : true,
			type : 'url',
			show : "",
			hide : "",
			title : body.attr("title"),
			body : model.queryUrl,
			init : callback,
			buttons : {
				"查詢" : function() {
					var params = getQueryParams(this.id);
					$('#' + gridDivId).flexOptions({
						params : params,
						newp : 1
					});
					$('#' + gridDivId).flexReload();
					closeDialog(this.id);
				},
				"重置" : function() {
					clear(model, this.id);
				}
			}
		});
	};

	/**
	 * 標准頁編輯模態窗共用方法
	 * 
	 * @param model
	 */
	var g3_edit = function(model, callback) {
		var body = $('#' + model.editDivId);
		var buttons = {
			"提交" : function() {
				if (parent.$('#customForm').validationEngine('validate')) {
					var rtn = sumbit(model, this.id);
					if(rtn){
						var jsonObj = eval("(" + rtn + ")");
						if (jsonObj.status != null && jsonObj.status == false) {
							alert(jsonObj.msg);
						} else {
							closeDialog(this.id);
							$('#' + model.gridDivId).flexReload(); // 表格重载
						}
					}
				}
			},
			"取消" : function() {
				closeDialog(this.id);
			}
		};
		if (model.editButtons) {
			buttons = model.editButtons;
		}
		return openDialog({
			id : 'g3_dialog',
			width : body.width(),
			height : body.height(),
			modal : true,
			type : 'url',
			show : "",
			hide : "",
			title : body.attr("title"),
			body : model.editUrl,
			init : callback,
			buttons : buttons
		});
	};
	/**
	 * 標准頁查詢共用方法
	 * 
	 * @param grid
	 * @param model
	 */
	var query = function(grid, model) {
		g3_query(model);
	};

	/**
	 * 標准頁新增共用方法
	 * 
	 * @param grid
	 * @param model
	 */
	var add = function(grid, model) {
		var editDivId = model.editDivId;
		if (editDivId) {
			var colModel = model.colModel;
			g3_edit(model, function(id) {
				var parent = window.parent.document;
				$.each(colModel, function(i) {
					$('#' + id + ' input[name="' + colModel[i].name + '"]', parent).val('');
					$('#' + id + ' textarea[name="' + colModel[i].name + '"]', parent).val('');
					$('#' + id + ' select[name="' + colModel[i].name + '"]', parent).val('');
				});
			});
		}
	};

	/**
	 * 標准頁編輯共用方法
	 * 
	 * @param grid
	 * @param model
	 */
	var edit = function(grid, model) {
		var editDivId = model.editDivId;
		var colModel = model.colModel;
		if (editDivId) {
			g3_edit(model, function(id) {
				var parent = window.parent.document;
				selected_count = $('.trSelected', grid).length;
				if (selected_count == 0) {
					alert('請選擇壹條記錄!');
					return;
				}
				if (selected_count > 1) {
					alert('抱歉只能同時修改壹條記錄!');
					return;
				}
				var rowData = new Object();
				$('.trSelected td', grid).each(function(i) {
					$(rowData).data(colModel[i].name, $(this).children('div').text());
				});
				if (model.initType == 'LD') {
					$.each(colModel, function(i) {
						$('#' + id + ' input[name="' + colModel[i].name + '"]', parent).val(
								$(rowData).data(colModel[i].name).toString().Trim());
						if($('#' + id + ' input[name="' + colModel[i].name + '"]', parent).attr("type")=="checkbox"){
							if($(rowData).data(colModel[i].name).toString().Trim()){
								$('#' + id + ' input[name="' + colModel[i].name + '"]', parent).attr("checked",true);
							}else{
								$('#' + id + ' input[name="' + colModel[i].name + '"]', parent).removeAttr("checked");
							}
						}
						$('#' + id + ' textarea[name="' + colModel[i].name + '"]', parent).val(
								$(rowData).data(colModel[i].name).toString().Trim());
						$('#' + id + ' select[name="' + colModel[i].name + '"]', parent).val(
								$(rowData).data(colModel[i].name).toString().Trim());
					});
				}
				if (model.initType == 'RD') {
					if (model.initFunction) {
						var keyjson = {};
						$.each(model.key, function(i) {
							keyjson[model.key[i]] = $(rowData).data(model.key[i]).toString().Trim();
						});
						model.initFunction(id, model, keyjson);
					}
				}
			});

		}
	};

	/**
	 * 標准頁刪除共用方法
	 * 
	 * @param grid
	 * @param model
	 */
	var del = function(grid, model) {
		selected_count = $('.trSelected', grid).length;
		if (selected_count == 0) {
			alert('請選擇壹條記錄!');
			return;
		}
		ids = '';
		$('.trSelected td:nth-child(2) div', grid).each(function(i) {
			ids += '&keys=' + $(this).text();
		});
		var url = model.baseUrl + model.doAction.del;
		var id = model.gridDivId;
		if (confirm("是否確定刪除?")) {
			flexiAjax(id, ids, url);
		}

	};

	/**
	 * 標准頁導入共用方法
	 * 
	 * @param grid
	 * @param model
	 */
	var imp = function(grid, model) {
		openDialog({
			id : 'g3_dialog',
			width : 500,
			height : 400,
			modal : true,
			type : 'url',
			show : "",
			hide : "",
			title : "UPLOAD",
			body : model.baseUrl + "imp.html?baseUrl=" + model.baseUrl,
			init : null,
			buttons : null
		});
	};

	/**
	 * 標准頁導出共用方法
	 * 
	 * @param grid
	 * @param model
	 */
	var exp = function(com, grid, model) {
		alert('該功能正在建設中。');
	};

	/**
	 * 清空頁面數據
	 * 
	 * @param id
	 */
	var clear = function(id) {
		var parent = window.parent.document;
		$.each(colModel, function(i) {
			$('#' + id + ' input', parent).each(function(i) {
				this.val('');
			});
			$('#' + id + ' textarea', parent).each(function(i) {
				this.val('');
			});
			$('#' + id + ' select', parent).each(function(i) {
				this.val('');
			});
		});
	};

	/**
	 * 標准頁提交數據共用方法
	 * 
	 * @param model
	 * @param id
	 */
	var sumbit = function(model, id) {

		var parent = window.parent.document;
		var form = $('#' + id + ' form', parent);
		var data = "";
		var caseNew = model.caseNew;
		if (caseNew) {
			$('input', form).each(function(i) {
				if ($(this).hasClass('lov') == false && $(this).attr("type") != 'button') {
					if ($(this).val() != '' && $(this).val() != null)
						data += '&' + caseNew + '.' + $(this).attr("name") + '=' + $(this).val();
				}
			});
			$('textarea', form).each(function(i) {
				if ($(this).hasClass('lov') == false) {
					if ($(this).val() != '' && $(this).val() != null)
						data += '&' + caseNew + '.' + $(this).attr("name") + '=' + $(this).val();
				}
			});
			$('select', form).each(function(i) {
				if ($(this).val() != '' && $(this).val() != null)
					data += '&' + caseNew + '.' + $(this).attr("name") + '=' + $(this).val();
			});

		} else {
			$('input', form).each(function(i) {
				if ($(this).hasClass('lov') == false && $(this).attr("type") != 'button') {
					if ($(this).attr("type") == 'checkbox' && !$(this).is(":checked")) {
						return;
					}
					if ($(this).val() != '' && $(this).val() != null)
						data += '&' + $(this).attr("name") + '=' + $(this).val();
				}
			});
			$('textarea', form).each(function(i) {
				if ($(this).hasClass('lov') == false) {
					if ($(this).val() != '' && $(this).val() != null)
						data += '&' + $(this).attr("name") + '=' + $(this).val();
				}
			});
			$('select', form).each(function(i) {
				if ($(this).val() != '' && $(this).val() != null)
					data += '&' + $(this).attr("name") + '=' + $(this).val();
			});
		}

		data = data.substring(1);
		var url = model.baseUrl + model.doAction.edit;
		var id = model.gridDivId;
		if (data.length > 0) {
			return flexiAjaxNoAsync(id, data, url);
		} else {
			return "";
		}
	};

	/**
	 * 標准頁獲得查詢表單共用方法
	 * 
	 * @param id
	 */
	var getQueryParams = function(id) {
		var queryjson = '';
		if (id) {
			var parent = $(window.parent.document);
			$("#" + id + ' input', parent).each(function(i) {
				if ($(this).attr("value") != "") {
					queryjson += ",{";
					queryjson += "name:'" + $(this).attr("name") + "'";
					queryjson += ",value:'" + $(this).attr('value') + "'";
					queryjson += "}";
				}
			});
			$("#" + id + ' select', parent).each(function(i) {
				if ($(this).val() != "") {
					queryjson += ",{";
					queryjson += "name:'" + $(this).attr("name") + "'";
					queryjson += ",value:'" + $(this).val() + "'";
					queryjson += "}";
				}
			});
			queryjson = '[' + queryjson.substring(1) + ']';
		}
		return eval(queryjson);
	};

	$.fn.newGrid = function(model, options) {
		var d = {
			caseNew : 'entity', // 提交後台實例
			key : [ 'key' ],
			baseUrl : '', // 基本的URL
			editUrl : '',
			queryUrl : '',
			initType : 'LD', // LD 本地數據 、RD 遠程數據
			doAction : {
				query : 'pageList.html',
				info : 'pageEdit.html',
				add : 'saveOrUpdate.html',
				del : 'delete.html',
				edit : 'saveOrUpdate.html',
				imp : 'import.html',
				exp : 'export.html'
			}, // 動作
			colModel : {}, // 列數據
			buttons : {}, // 按鈕數據
			queryDivId : false,
			editDivId : false,
			gridDivId : false,
			initFunction : false
		};
		d = $.extend(d, model);

		var query = $(this).find(".queryDiv");
		d.queryDivId = $(query).attr("id");

		var edit = $(this).find(".editDiv");
		d.editDivId = $(edit).attr("id");

		var defaults = {
			url : d.baseUrl + d.doAction.query,
			dataType : 'json',
			method : 'POST',
			autoload : true,
			colModel : d.colModel,
			expend : d,
			buttons : d.buttons,
			sortname : "id",
			sortorder : "asc",
			usepager : true,
			chooseType : 'checkbox', // 是否要多選框
			rowId : 'rid', // 多選框綁定行的id
			rp : 10,
			resizable : false,
			showToggleBtn : false,
			showTableToggleBtn : false,
			dragCol : false,
			procmsg : '加載中, 請稍等 ...',
			height : GRIDHEIGHT-5,
			minwidth : 30, // 列的最小寬度
			minheight : 80,
			onRowDblclick : $(this).rowdbclick, // 賦句柄
			params : false
		// 賦句柄
		};
		var options = $.extend(defaults, options);
		var g3grid = $(this).find(".g3grid");
		if (g3grid) {
			$(g3grid).flexigrid(options);
			d.gridDivId = $(g3grid).attr("id");
		}
	};

	$.fn.action = function(com, grid, model) {
		switch (com) {
		case 'search':
			query(grid, model);
			break;
		case 'add':
			add(grid, model);
			break;
		case 'edit':
			edit(grid, model);
			break;
		case 'delete':
			del(grid, model);
			break;
		case 'import':
			imp(grid, model);
			break;
		case 'export':
			exp(grid, model);
			break;
		}
	};

	/**
	 * Grid雙擊事件方法
	 * 
	 * @param rowData,
	 *            model, grid
	 */
	$.fn.rowdbclick = function(rowData, model, grid) {
		
		if (model) {
			var editDivId = model.editDivId;
			var colModel = model.colModel;
			if (editDivId) {
				
				g3_edit(model, function(id) {
					if (model.initType == 'LD') {
						var parent = window.parent.document;
						$.each(colModel, function(i) {
							$('#' + id + ' input[name="' + colModel[i].name + '"]', parent).val(
									$(rowData).data(colModel[i].name).toString().Trim());
							if($('#' + id + ' input[name="' + colModel[i].name + '"]', parent).attr("type")=="checkbox"){
								if($(rowData).data(colModel[i].name).toString().Trim()=='true'){
									$('#' + id + ' input[name="' + colModel[i].name + '"]', parent).attr("checked",true);
								}else{
									$('#' + id + ' input[name="' + colModel[i].name + '"]', parent).removeAttr("checked");
								}
							}
							
							$('#' + id + ' textarea[name="' + colModel[i].name + '"]', parent).val(
									$(rowData).data(colModel[i].name).toString().Trim());
							$('#' + id + ' select[name="' + colModel[i].name + '"]', parent).val(
									$(rowData).data(colModel[i].name).toString().Trim());
						});
					}
					if (model.initType == 'RD') {
						if (model.initFunction) {
							var keyjson = {};
							$.each(model.key, function(i) {
								keyjson[model.key[i]] = $(rowData).data(model.key[i]).toString().Trim();
							});
							model.initFunction(id, model, keyjson);
						}
					}
				});
			}
		}
	};

	$.fn.g3_query_model = function(model, callback) {
		g3_query(model, callback);
	};

	$.fn.g3_edit_model = function(model, callback) {
		g3_edit(model, callback);
	};
})(jQuery);