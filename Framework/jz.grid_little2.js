jzsoft.grid.newBarMenu = function(p) {
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
				name : '編輯',
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