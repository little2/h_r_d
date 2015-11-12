var jzsoft = {
	version : '1.1',
	contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	dateFormat : 'yy-mm-dd'
};



jzsoft.grid = function(id, options, menup) {	
	$("#" + id).jqGrid($.extend({
		ajaxGridOptions : {
			type : "POST"
		},
		serializeGridData : function(postdata) {
			return postdata;
		},
		url : "",
		datatype : "json",
		colNames : [],
		colModel : [],
		rowNum : 10,
		rowList : [ 10, 25, 50, 100, 10000 ],
		jsonReader : {
			root : "page.list", // 數據行（預設為：rows）
			page : "page.curPage", // 當前頁
			total : "page.totalPage", // 總頁數
			records : "page.total", // 總記錄數
			repeatitems : false
		// 設置成false，在後臺設置值的時候，可以亂序。且並非每個值都得設
		},
		pager : '#pager',
		width : GRIDWIDTH,
		height : GRIDHEIGHT,
		sortname : 'key',
		viewrecords : true,
		sortorder : "asc",
		// rownumbers: true, 序號
		prmNames : {
			page : "page.curPage",
			rows : "page.count",
			sort : "page.sortName",
			order : "page.orderType",
			search : "search",			
			nd : "nd"
		}
	}, options)).navGrid(options.pager, $.extend({
		edit : false,
		add : false,
		del : false,
		refresh : false,
		search : false		
	}, menup));
};

jzsoft.grid.serializeData = function(newcase, postdata, otherdata) {
	var data = '';
	$.each(postdata, function(name) {
		if (name == 'oper' || name == 'id' || postdata[name] == '') {
			return true;
		}
		data += ",'" + newcase + "." + name + "':'" + postdata[name] + "'";
	});
	if (otherdata) {
		$.each(otherdata, function(name) {
			data += ",'" + newcase + "." + name + "':'" + otherdata[name] + "'";
		});
	}
	if (data != '') {
		return stringToJSON("{" + data.substring(1) + "}");
	}
	return null;
};

jzsoft.grid.getQueryParams = function() {
	var querystr = '';
	var parent = $(window.parent.document);
	$("#g3_dialog input", parent).each(function(i) {
		if ($(this).attr("value") != "") {
			querystr += "&" + $(this).attr("name") + "=" + $(this).attr('value');
		}
	});
	$("#g3_dialog select", parent).each(function(i) {
		if ($(this).val() != "") {
			querystr += "&" + $(this).attr("name") + "=" + $(this).val();
		}
	});
	return querystr;
};

jzsoft.grid.formQuery = function(id, tcode, url, title, width, height, divId) {
	openDialog({
		id : divId ? divId : 'g3_dialog',
		width : width ? width : 400,
		height : height ? height : 300,
		modal : true,
		refreshitem : false,
		type : 'url',
		show : "",
		hide : "",
		title : title ? title : "查詢",
		body : "function/query/query-evaluation-table-review-appraisee_list.php",
		buttons : {
			"查詢" : function() {
				$("#" + id).jqGrid('setGridParam', {
					url : url,
					postData : jzsoft.grid.getQueryParams(),
					page : 1
				}).trigger("reloadGrid");
				closeDialog("g3_dialog");
			},
			"關閉" : function() {
				closeDialog("g3_dialog");
			}
		}
	});
};

jzsoft.grid.formKey = function(array) {
	var querystr = '';
	if (array) {
		for ( var i = 0; i < array.length; i++) {
			var json = array[i];
			if ($("input[name=" + json.value + "]").attr("value") != "") {
				querystr += "&" + json.name + "=" + $("input[name=" + json.value + "]").attr('value');
			}
		}
		querystr = querystr.substring(1);
	}
	return querystr;
};



jzsoft.grid.formAdd = function(url, formKeys, title, width, height, divId ) {
	if (formKeys) {
		if (url.indexOf('?') > -1) {
			url += '&';
		} else {
			url += '?';
		}
		url += jzsoft.grid.formKey(formKeys);
	}
	openDialog({
		id : divId ? divId : 'g3_dialog',
		width : width ? width : 1000,
		height : height ? height : 600,
		modal : true,
		refreshitem : false,
		type : 'url',
		show : "",
		hide : "",
		title : title ? title : "詳細內容",
		body : url,
		buttons : null
	});
};

jzsoft.grid.formEdit = function(id, url, addParam, formKeys, title, titleCustom, width, height, divId) {

	var sels = $("#" + id).jqGrid('getGridParam', 'selrow');
	if (sels) {
		var rowdata = $("#" + id).jqGrid("getRowData", sels);
		url += "?entity.key=" + rowdata.key;
		if (addParam) {
			for ( var i = 0; i < addParam.length; i++) {
				url += "&" + addParam[i] + "=" + eval('rowdata.' + addParam[i]);
			}
		}
		if (titleCustom) {
			var custom = '';
			title += "(";
			for ( var i in titleCustom) {
				custom += '/' + rowdata[titleCustom[i]];
			}
			title += custom.substring(1) + ")";
		}
		jzsoft.grid.formAdd(url, formKeys, title, width, height, divId);
	} else {
		$("#" + id).message("請選擇要修改的項目！");
	}
};

jzsoft.grid.dele = function(id, url) {
	var sel = $("#" + id).jqGrid('getGridParam', 'selrow');
	if (sel == "") {
		$("#" + id).message("請選擇要刪除的項！");
	} else {
		if (confirm("您是否確認刪除？")) {
			var rowdata = $("#" + id).jqGrid("getRowData", sel);
			var ids = '&keys=' + rowdata.key;
			$.ajax({
				type : "POST",
				url : url,
				data : ids,
				beforeSend : function() {
					$("#" + id).message("正在請求...");
				},
				error : function() {
					$("#" + id).message("請求失敗...");
				},
				success : function(data) {
					if (data.msg) {
						$("#" + id).message("操作失敗！"+data.msg);
					} else {
						$("#" + id).trigger("reloadGrid");
						$("#" + id).message("已成功刪除!");
					}
				}
			});
		}
	}
};

jzsoft.grid.multiDele = function(id, url) {
	var sels = $("#" + id).jqGrid('getGridParam', 'selarrrow');
	
	
	if (sels == "") {
		//jzsoft.grid.dele(id, url);
	} else {
		if (confirm("您是否確認刪除？")) {
			var len = sels.length;
			var ids = "";
			for ( var i = 0; i < len; i++) {
				var rowdata = $("#" + id).jqGrid("getRowData", sels[i]);
				

				if(ids.length>0)
				{
					ids +="&";
				}
				
				ids += 'keys['+rowdata.key+']=' + rowdata.key;
			}
			
		
			
			$.ajax({
				type : "POST",
				url : url,
				data : ids,
				beforeSend : function() {
					$("#" + id).message("正在請求...");
				},
				error : function() {
					$("#" + id).message("請求失敗...");
				},
				success : function(data) {
					if (data.msg) {
						$("#" + id).message("操作失敗！"+data.msg);
					} else {
						$("#" + id).trigger("reloadGrid");
						$("#" + id).message("已成功刪除!");
					}
				}
			});
		}
	}
};

jzsoft.grid.barMenu = function(p) {
	if (p) {
		var buttons = [];
		if (p.queryUrl) {
			buttons.push({
				name : '查詢',
				bclass : 'search',
				onpress : function() {
					jzsoft.grid.formQuery(p.gridId, p.queryCode, p.queryUrl, p.queryWidth, p.queryHeight);
				}
			});
			buttons.push({
				separator : true
			});
		}
		if (p.addUrl) {
			buttons.push({
				name : '新增',
				bclass : 'add',
				onpress : function() {
					jzsoft.grid.formAdd(p.baseUrl + p.addUrl, p.formKeys, p.addTitle, p.addWidth, p.addHeight);
				}
			});
			buttons.push({
				separator : true
			});
		}
		if (p.deleUrl) {
			buttons.push({
				name : '刪除',
				bclass : 'delete',
				onpress : function() {
					jzsoft.grid.multiDele(p.gridId, p.baseUrl + p.deleUrl);
				}
			});
			buttons.push({
				separator : true
			});
		}
		if (p.editUrl) {
			buttons.push({
				name : '修改',
				bclass : 'edit',
				onpress : function() {
					jzsoft.grid.formEdit(p.gridId, p.baseUrl + p.editUrl, p.addParam, p.formKeys, p.editTitle, p.titleCustom, p.editWidth, p.editHeight);
				}
			});
			buttons.push({
				separator : true
			});
		}

		if (p.buttons) {
			for (key in p.buttons) {
				buttons.push(p.buttons[key]);
				buttons.push({
					separator : true
				});
			}

		}
		$('#t_' + p.gridId).newButtons(buttons);
		$("#" + p.gridId).jqGrid("setGridParam", {
			ondblClickRow : function(rowid, iRow, iCol, e) {
				jzsoft.grid.selectRow(p.gridId, rowid);
				jzsoft.grid.formEdit(p.gridId, p.baseUrl + p.editUrl, p.addParam, p.formKeys, p.editTitle, p.titleCustom, p.editWidth, p.editHeight);

			}
		});
	}
};

jzsoft.grid.selectRow = function(gridId, rowid) {
	var sels = $("#" + gridId).jqGrid('getGridParam', 'selarrrow');
	var len = sels.length;
	for ( var i = 0; i < len; i++) {
		$("#" + gridId).setSelection(sels[i]);
	}
	$("#" + gridId).setSelection(rowid);
};

jzsoft.grid.formMenu = function(o) {
	var options = $.extend({
		grid : "list",
		paper : "paper",
		edit : true,
		editicon : "ui-icon-pencil",
		add : true,
		addicon : "ui-icon-plus",
		del : true,
		delicon : "ui-icon-trash",
		search : true,
		searchicon : "ui-icon-search",
		refresh : true,
		refreshicon : "ui-icon-refresh"
	}, o);

	if (options.add) {
		$('#' + options.grid).navButtonAdd('#' + options.paper, {
			id : options.grid + '_iladd',
			caption : options.addtext ? options.addtext : '',
			title : options.addtitle ? options.addtitle : 'add',
			buttonicon : options.addicon,
			onClickButton : function() {
				var url = options.baseUrl + options.addUrl;
				jzsoft.grid.formAdd(url, options.formKeys, options.addTitle, options.addWidth, options.addHeight, options.divId);
			}
		});
	}
	if (options.edit) {
		$('#' + options.grid).navButtonAdd('#' + options.paper, {
			id : options.grid + '_iledit',
			caption : options.edittext ? options.edittext : '',
			title : options.edittitle ? options.edittitle : 'edit',
			buttonicon : options.editicon,
			onClickButton : function() {
				var url = options.baseUrl + options.editUrl;
				jzsoft.grid.formEdit(options.grid, url, options.addParam, options.formKeys, options.editTitle, options.titleCustom, options.editWidth, options.editHeight, options.divId);
			}
		});
	}

	if (options.del) {
		$('#' + options.grid).navButtonAdd('#' + options.paper, {
			id : options.grid + '_ildel',
			caption : options.deltext ? options.deltext : '',
			title : options.deltitle ? options.deltitle : 'del',
			buttonicon : options.delicon,
			onClickButton : function() {
				jzsoft.grid.multiDele(options.grid, p.baseUrl + p.deleUrl);
			}
		});
	}

	if (options.search) {
		$('#' + options.grid).navButtonAdd('#' + options.paper, {
			id : options.grid + '_ilsearch',
			caption : options.searchtext ? options.searchtext : '',
			title : options.searchtitle ? options.searchtitle : 'search',
			buttonicon : options.searchicon,
			onClickButton : function() {
				jzsoft.grid.formQuery(options.grid, options.queryCode, options.queryUrl, options.queryWidth, options.queryHeight, options.divId);
			}
		});
	}

	if (options.refresh) {
		$('#' + options.grid).navButtonAdd('#' + options.paper, {
			id : options.grid + '_ilrefresh',
			caption : options.refreshtext ? options.refreshtext : '',
			title : options.refreshtitle ? options.refreshtitle : 'refresh',
			buttonicon : options.refreshicon,
			onClickButton : function() {
				$("#" + options.grid).trigger("reloadGrid");
			}
		});
	}
};

jzsoft.grid.inlineMenu = function(o) {
	var options = {
		grid : o.grid,
		paper : o.paper,
		del : true,
		delicon : "ui-icon-trash",
		inlineParams : {
			addParams : {
				addRowParams : {
					extraparam : {},
					oneditfunc : function(rowid) {

						$("#" + rowid + " .rolov").each(function(i) {
							$(this).removeAttr("disabled");
							$(this).attr("class", "lov");
						});

						// 显示控件
						jzsoft.grid.formatCell(o.grid, rowid);
					}
				}
			},
			editParams : {
				url : o.baseUrl + o.saveService,
				restoreAfterError : false,
				oneditfunc : function(rowid) {
					var grid = "gbox_" + o.grid;

					$("#" + grid + " #" + rowid + " .rolov").each(function(i) {
						$(this).removeAttr("disabled");
						$(this).attr("class", "lov");
					});
					// 显示控件
					jzsoft.grid.formatCell(o.grid, rowid);
				},
				afterrestorefunc : function(rowid) {
					var grid = "gbox_" + o.grid;

					$("#" + grid + " #" + rowid + " .lov").each(function(i) {
						$(this).attr("disabled", "disabled");
						$(this).attr("class", "rolov");
					});
				},
				aftersavefunc : function(rowid, res) {
					if (res.msg) {
						$("#" + o.grid).message("操作失敗！");
					} else {
						$("#" + o.grid).message("成功保存!");
					}

					var grid = "gbox_" + o.grid;
					$("#" + grid + " #" + rowid + " .lov").each(function(i) {
						$(this).attr("disabled", "disabled");
						$(this).attr("class", "rolov");
					});
					$("#" + o.grid).trigger("reloadGrid"); // 重新载
					if (o.afterModify) {
						o.afterModify();
					}
				},
				errorfunc : function(rowid, res, stat, err) {
					$("#" + o.grid).message(err);
				}
			}
		},
		delurl : o.baseUrl + o.delService
	};
	$('#' + options.grid).inlineNav('#' + options.paper, options.inlineParams);

	if (options.del) {
		$('#' + options.grid).navButtonAdd('#' + options.paper, {
			id : options.grid + '_ildel',
			caption : options.deltext ? options.deltext : '',
			title : options.deltitle ? options.deltitle : '',
			buttonicon : options.delicon,
			onClickButton : function() {
				jzsoft.grid.multiDele(options.grid, options.delurl);
			}
		});
	}
};
jzsoft.grid.formatCell = function(gid, rowid) {
	var thisColModel = $("#" + gid).jqGrid('getGridParam', 'colModel');
	$(thisColModel).each(function(i) {
		var id = rowid + "_" + this.name;
		if (this.formatter == 'date' && this.editable) {
			if ($("#" + id)) {
				$("#" + id).addClass("date");
				$("#" + id).datepicker({
					dateFormat : 'yy-mm-dd'
				});
			}
		}

	});
};

jzsoft.grid.showLov = function(t, gid, rowId, o) {
	var o = $.extend({
		width : 600,
		height : 500,
		title : 'LOV',
		url : '/hrd/lov/lov.html?init=y',
		way : "id",
		lovCode : '',
		type : '1'
	}, o);

	openDialog({
		id : 'g3_lov',
		width : o.width,
		height : o.height,
		modal : true,
		type : 'url',
		title : o.title,
		body : o.url + '&lovCode=' + o.lovCode + '&lovType=' + o.type,
		init : o.callback,
		buttons : {
			"確定" : function() {
				jzsoft.grid.rtnLovValue(this.id, t, gid, rowId, o);
				closeDialog(this.id);
			},
			"取消" : function() {
				closeDialog(this.id);
			}
		}
	});
};

jzsoft.grid.setGridRowData = function(t, gid, rowid, data) {
	var thisColModel = $("#" + gid).jqGrid('getGridParam', 'colModel');
	var grid = "gbox_" + gid;
	$(thisColModel).each(function(j) {
		var nm = this.name;
		if (data[nm] !== undefined) {
			var outName = rowid + '_' + nm;
			if (this.editable) {
				$('[id="' + outName + '"]', $("#" + grid + " #" + rowid)).val(data[nm]);
			} else {
				if (this.formatter == 'lovFmatter') {
					$('[id="' + outName + '"]', $("#" + grid + " #" + rowid)).val(data[nm]);
				} else if (this.formatter == 'checkbox') {
					var td = $("td[role='gridcell']:eq(" + j + ")", $("#" + grid + " #" + rowid));
					if (data[nm]) {
						$('[type="checkbox"]', td).attr("checked", "checked");
					}
				} else {
					$("td[role='gridcell']:eq(" + j + ")", $("#" + grid + " #" + rowid)).html(data[nm]);
				}
			}
		}
	});
};

jzsoft.grid.rtnLovValue = function(id, t, gid, rowId, p) {
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
				var data = '';
				var dataRow;
				$.each(p.fields, function(i) {
					var col = colModel[i];
					if (col && p.fields[i] != '') {
						data += ",'" + p.fields[i] + "':'" + rowdata[col.name] + "'";
					}
				});
				if (data != '') {
					dataRow = eval("({" + data.substring(1) + "})");
					jzsoft.grid.setGridRowData(t, gid, rowId, dataRow);
				}
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
						ids += "," + rowdata[colModel[0].name];
						name += "," + rowdata[colModel[2].name];
						rowdatas.push(rowdata);
					}
					$("#" + p.key.id).val(ids.length > 0 ? ids.substring(1) : "");
					$(t).val(name.length > 0 ? name.substring(1) : "");
				}
			}
			break;
		}
		if (p.onload)
			p.onload(rowdatas);
	}
};




/**
 * 新的BarMenu 
 *  * @param
 */
jzsoft.grid.newBarMenu = function(p) {

	
	if (p) {
		
		var dialogID=$("#"+p.gridId).parentsUntil('div.ui-dialog').last().attr('id');    

		
		if(dialogID!="undefined")
		{
			p.fromDivId=dialogID+"";
			$('#'+p.fromDivId).parent().find('.ui-dialog-title').attr('data-dialogID',p.fromDivId)			
		}
		
		 var settings = new Object();		    
		 var settings = $.extend({},p); //物件複製	
		
	
	
		var buttons = [];

		for(var index in p)
		{					
		
			switch(index)
			{	
				case "add":
					buttons.push({
						name : p.add.name,
						bclass : p.add.bclass,						
						onpress : function() {					
							jzsoft.grid.newformAdd(p);
						}
					});
					buttons.push({
						separator : true
					});
					break;
			
				case "search":
					buttons.push({
						name : '查詢',
						bclass : 'search',
						onpress : function() {
							jzsoft.grid.formQuery(p.gridId, p.queryCode, p.queryUrl, p.queryWidth, p.queryHeight);
						}
					});
					buttons.push({
						separator : true
					});					
					break;

				case "filter":
					buttons.push({
						name : '篩選',
						bclass : 'filter',
						onpress : function() {
							jzsoft.grid.formFilter(p);
						}
					});
					buttons.push({
						separator : true
					});					
					break;					
				
				case "del":	
				case "delete":
					settings['delete']=settings['del'];
					buttons.push({
						name : settings['delete']['name'],
						bclass : 'delete',
						onpress : function() {							
							jzsoft.grid.newmultiDele(settings);
						}
					});
					buttons.push({
						separator : true
					});
		
					break;
					

				case "edit":
					buttons.push({
						name : p.edit.name,
						bclass : 'edit',
						onpress : function() {							
							jzsoft.grid.newformEdit(p);
						}
					});
					buttons.push({
						separator : true
					});
					break;		
					
				case "view":
					buttons.push({
						name : p.view.name,
						bclass : 'view',
						onpress : function() {
							jzsoft.grid.newformView(p);
						}
					});
					buttons.push({
						separator : true
					});
					break;		

				case "imp":		
				case "import":
					settings['import']=settings['imp'];
					buttons.push({
						name : '匯入',
						bclass : 'import',
						onpress : function() {
							settings['import']['width']=840;
							settings['import']['height']=620;					
							jzsoft.grid.openDialog(settings['import']);
						}
					});
					buttons.push({
						separator : true
					});
					break;								
				
				default:
					if(typeof(p[index]["bclass"])=='string')
					{
						buttons.push({
							name : p[index]["name"],
							bclass : p[index]["bclass"],
							onpress : p[index]["onpress"]
						});
						buttons.push({
							separator : true
						});
					}
									
					/*
					for (key in index) {
						buttons.push(p.index[key]);
						  // call_func(this,o);	
						buttons.push({
							separator : true
						});
					}	
					*/									
				break;
				
				
			}		       
		}		
		
		$('#t_' + p.gridId).newButtons(buttons);
		

		if(typeof(p.edit)!="undefined")
		{		
			$("#" + p.gridId).jqGrid("setGridParam", {
				ondblClickRow : function(rowid, iRow, iCol, e) {
					jzsoft.grid.selectRow(p.gridId, rowid);
					jzsoft.grid.newformEdit(p);
				}
			});
		}
		else if(typeof(p.view)!="undefined")
		{		
			$("#" + p.gridId).jqGrid("setGridParam", {
				ondblClickRow : function(rowid, iRow, iCol, e) {
					jzsoft.grid.selectRow(p.gridId, rowid);
					jzsoft.grid.newformView(p);
				}
			});
		}
	}
	
};



/**
 * 新的BarMenu 
 *  * @param
 */
jzsoft.grid.newformAdd = function(p) {
	var url=p.add.body;

	//url, formKeys, title, width, height, divId ,data
	
	//console.log('add:'+url);
	if (p.formKeys) {		
		if (p.url.indexOf('?') > -1) {
			url += '&';
		} else {
			url += '?';
		}
		url += jzsoft.grid.formKey(p.formKeys);		
	}
		
	
	 var setting = new Object();		    
	 
	 var setting = $.extend({}, p.add); //物件複製		
	 setting.fromDivId = p.fromDivId;
	 
	 setting.body+= ( (url.indexOf('?') > -1) ? '&':'?') + "gridId="+p.gridId;
	
	 //this.labelledby=$(this.container).parentsUntil('div.ui-dialog').parent().attr('aria-labelledby');
	 
	//console.log(setting);
	jzsoft.grid.openDialog(setting)

};

/**
 * 新的BarMenu 編輯功能
 *  * @param
 */
jzsoft.grid.newformEdit = function(p) {
	//p.gridId, p.baseUrl + p.editUrl, p.addParam, p.formKeys, p.editTitle, p.titleCustom, p.editWidth, p.editHeight
	//id, url, addParam, formKeys, title, titleCustom, width, height, divId
	var sels = $("#" + p.gridId).jqGrid('getGridParam', 'selrow');	
	if (sels) {
		var url=p.edit.body;					
		var rowdata = $("#" + p.gridId).jqGrid("getRowData", sels);		
		if (url.indexOf('?') > -1) {
			url += '&';
		} else {
			url += '?';
		}
		
		url += "entity.key=" + rowdata.key;		
		if (p.addParam) {
			for ( var i = 0; i < p.addParam.length; i++) {
				url += "&" + p.addParam[i] + "=" + eval('rowdata.' + p.addParam[i]);
			}
		}
		
		if (p.edit.titleCustom) {
			var custom = '';
			p.edit.title += "(";
			for ( var i in p.edit.titleCustom) {
				custom += '/' + rowdata[p.edit.titleCustom[i]];
			}
			p.edit.title += custom.substring(1) + ")";
		}
		

		 var setting = new Object();		
		 var setting = $.extend({}, p.edit); //物件複製		
		 setting.fromDivId = p.fromDivId;		 
		 
		 setting.body=url+ ( (url.indexOf('?') > -1) ? '&':'?') + "gridId="+p.gridId;

		//設定指定的標題列
		 var set_title_col=$("#" + p.gridId).jqGrid('getGridParam', 'set_title_col');
		if(set_title_col.length>0)
		{
			setting.set_title_col=rowdata[set_title_col];
		}		 
		 
		 
		 jzsoft.grid.openDialog(setting)

		
	} else {
		$("#" + p.gridId).message("請選擇要修改的項目！!");
	}
};


/**
 * 新的BarMenu 編輯功能
 *  * @param
 */
jzsoft.grid.newformView = function(p) {
	//p.gridId, p.baseUrl + p.editUrl, p.addParam, p.formKeys, p.editTitle, p.titleCustom, p.editWidth, p.editHeight
	//id, url, addParam, formKeys, title, titleCustom, width, height, divId
	var sels = $("#" + p.gridId).jqGrid('getGridParam', 'selrow');
	
	if (sels) {
		var url=p.view.body;				
		var rowdata = $("#" + p.gridId).jqGrid("getRowData", sels);		
		if (url.indexOf('?') > -1) {
			url += '&';
		} else {
			url += '?';
		}				
		url += "entity.key=" + rowdata.key;		
		if (p.addParam) {
			for ( var i = 0; i < p.addParam.length; i++) {
				url += "&" + p.addParam[i] + "=" + eval('rowdata.' + p.addParam[i]);
			}
		}
		 var setting = new Object();		
		 var setting = $.extend({}, p.edit); //物件複製		
		 setting.fromDivId = p.fromDivId;		 
		 
		 setting.body=url+ ( (url.indexOf('?') > -1) ? '&':'?') + "gridId="+p.gridId;

		//設定指定的標題列
		 var set_title_col=$("#" + p.gridId).jqGrid('getGridParam', 'set_title_col');
		if(set_title_col.length>0)
		{
			setting.set_title_col=rowdata[set_title_col];
		}		 
		jzsoft.grid.openDialog(setting)		
	} 
	else 
	{
		$("#" + p.gridId).message("請選擇要查閱的項目！");
	}
};


/**
 * 新的BarMenu 刪除功能
 *  * @param
 */
jzsoft.grid.newmultiDele = function(setting) {
	id=setting.gridId;
	
	url=setting['delete']['body'];
	var sels = $("#" + id).jqGrid('getGridParam', 'selarrrow');
	if (sels == "") {
		//jzsoft.grid.dele(id, url);
	} else {
		var confirmMsg=null;
		confirmMsg=(typeof(setting['delete']['confirmMsg'])!="undefined")?setting['delete']['confirmMsg']:'您是否確認刪除？';
		if (confirm(confirmMsg)) {
			var len = sels.length;
			var ids = "";
			for ( var i = 0; i < len; i++) {
				var rowdata = $("#" + id).jqGrid("getRowData", sels[i]);
				if(ids.length>0)
				{
					ids +="&";
				}
				
				ids += 'keys['+rowdata.key+']=' + rowdata.key;
			}
						
			$.ajax({
				type : "POST",
				url : url,
				data : ids,
				beforeSend : function() {
					$("#" + id).message("正在請求...");
				},
				error : function() {
					$("#" + id).message("請求失敗...");
				},
				success : function(data) {
					if (data.msg) {
						$("#" + id).message("操作失敗！"+data.msg);
					} else {
						$("#" + id).trigger("reloadGrid");
						$("#" + id).message("已成功刪除!");
					}
				}
			});
		}
	}
};


jzsoft.grid.openDialog = function(setting) 
{	
	if(setting.fromDivId!="undefined")
	{		
		//var dialogidtitle=$('#'+id).attr("data-dialogidtitle");
		
		if(typeof(setting.set_title_col)!="undefined")
		{
			setting.title=jzsoft.grid.getParentTitle(setting.fromDivId)+"："+setting.set_title_col+" > "+setting.title;
		}
		else 	if(typeof(setting.title)!="undefined")
		{
			setting.title=jzsoft.grid.getParentTitle(setting.fromDivId)+" > "+setting.title;
		}
		
	}		
	
	
	id=openDialog({	
		width : setting.width ? setting.width : 1020,
		height : setting.height ? setting.height : 620,
		modal : true,		
		type : 'url',
		show : "",
		hide : "",
		title : setting.title ? setting.title : "詳細內容",
		body : setting.body,
		data : setting.data,
		buttons : setting.buttons
	});


	

	$('#'+id).parent().find('.ui-dialog-title').attr('data-dialogID',id).attr('data-fromDialogID',setting.fromDivId)	
};

jzsoft.grid.getParentTitle = function (fromDivId) {
	var obj=$('#'+fromDivId).parent().find('.ui-dialog-title');

	var title=obj.text();	
	var fromDialogID=obj.attr('data-fromdialogid');	
//
//	if(typeof(fromDialogID)!="undefined" )
//	{
//		var parentTitle = jzsoft.grid.getParentTitle(fromDialogID);
//		if(typeof(parentTitle)!="undefined")
//		{
//			console.log('parentTitle='+parentTitle);
//			title=parentTitle + " > " + title;
//		}
//	}
	
	return title;
}


jzsoft.grid.formFilter = function(p) {
	
	var setting = new Object();		    
	setting = $.extend({}, p.filter); //物件複製			 
	setting.gridId = p.gridId;
		
	setting.width=400;
	setting.height=300;
	setting.title='篩選條件';
	
	/*
	 	var formContainer=$(event.target).parentsUntil('div.labDiv').parent();	        	        	
        $("#" + this.pick_list_id).jqGrid('setGridParam', {				
        		postData : $("#formPost",formContainer).serialize(),
        		page : 1
        }).trigger("reloadGrid");
	 */
	
	setting.buttons={
			"選篩" : function(event) {				
				var formContainer=$(event.target).parentsUntil('div.labDiv').parent();	   
				console.log(formContainer)
				$("#" + setting.gridId).jqGrid('setGridParam', {				
					postData :$("#formQueryPost",formContainer).serialize(),
					page : 1
				}).trigger("reloadGrid");
				console.log($("#formQueryPost"));
				closeDialog(this.id);
				
			},
			"關閉" : function() {
				closeDialog(this.id);
			}
		};
	jzsoft.grid.openDialog(setting);
};



jzsoft.grid.sendPost = function(id, url, msg) {
	var sels = $("#" + id).jqGrid('getGridParam', 'selarrrow');	
	if (sels == "") {
		//jzsoft.grid.dele(id, url);
	} else {
		if(typeof(msg)=='undefined') msg="您是否確認？";

		if (confirm(msg)) {
			var len = sels.length;
			var ids = "";
			for ( var i = 0; i < len; i++) {
				var rowdata = $("#" + id).jqGrid("getRowData", sels[i]);
				if(ids.length>0)
				{
					ids +="&";
				}				
				ids += 'keys['+rowdata.key+']=' + rowdata.key;
			}			
			$.ajax({
				type : "POST",
				url : url,
				data : ids,
				beforeSend : function() {
					$("#" + id).message("正在請求...");
				},
				error : function() {
					$("#" + id).message("請求失敗...");
				},
				success : function(data) {
					if (data.msg) {
						$("#" + id).message("操作失敗！"+data.msg);
					} else {
						$("#" + id).trigger("reloadGrid");
						$("#" + id).message("已成功!");
					}
				}
			});
		}
	}	
};


jzsoft.grid.sendDialogPost = function(id, url, msg) {
	var sels = $("#" + id).jqGrid('getGridParam', 'selarrrow');	
	if (sels == "") {
		//jzsoft.grid.dele(id, url);
	} else {
		if(typeof(msg)=='undefined') msg="您是否確認？";

		if (confirm(msg)) {
			var len = sels.length;
			var ids = "";
			for ( var i = 0; i < len; i++) {
				var rowdata = $("#" + id).jqGrid("getRowData", sels[i]);
				if(ids.length>0)
				{
					ids +="&";
				}				
				ids += 'keys['+rowdata.key+']=' + rowdata.key;
			}			
			$.ajax({
				type : "POST",
				url : url,
				data : ids,
				beforeSend : function() {
					$("#" + id).message("正在請求...");
					

					var setting = new Object();
					setting.width= 500;
					setting.height = 400;
					setting.id = 'g3_msg';
					setting.body= "/hrd/function/export/send_email.php" ,
					jzsoft.grid.openDialog(setting);
					///////////////////////////////////////
					
				},
				error : function() {
					$("#" + id).message("請求失敗...");
				},
				success : function(data) {
					if (data.msg) {
						$("#" + id).message("操作失敗！"+data.msg);
					} else {						
						$("#" + id).trigger("reloadGrid");
						$("#" + id).message("已成功!");						
					}
				}
			});
		}
	}	
};

