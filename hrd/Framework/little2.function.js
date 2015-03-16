function init_tab(container_id)
{
	var container =$('#'+container_id);
	
	
	//console.log(container.attr('data-from'));
	//console.log(container.attr('id'));

	
	$(".lable",container).each(function() {
	
		$(this).click(function() {
			var divn = $(this).attr("dis");
			$(".lable",container).each(function() {
				$(this).css("background-color", "#F0F0F0");
			});
			$(".labDiv",container).each(function() {
				$(this).hide();
			});
			$(this).css("background-color", "yellow");
			$("#" + divn).show();
		});
	});		
}


function open_department(group_id)
{
	var setting = new Object();		    
	//http://localhost/hrd/organization/department/edit.html?company_id=1&gridId=organization_department_list&entity.key=3
	setting.body="./organization/department/edit.html?entity.key="+group_id+"&gridId=organization_department_list"
	jzsoft.grid.openDialog(setting)	
}

function open_dialog(key,gridId)
{
	console.log(gridId);
	grid_row=gridId.split('_');
	
	var setting = new Object();		    
	//http://localhost/hrd/organization/department/edit.html?company_id=1&gridId=organization_department_list&entity.key=3
	setting.body="./"+grid_row[0]+'/'+grid_row[1]+'/edit.html?entity.key='+key+"&gridId="+gridId	
	console.log(setting.body);
	jzsoft.grid.openDialog(setting)	
}


function test123()
{
	alert('test');
}



function call_func(obj,nobj)
{

//	var url ='${pageContext.request.contextPath}/training/trOrganizationDepartAnnualStartClassIntentionSurvey/convertIntoAnnualTrainingPlan.html';
//	var sels = $("#list1").jqGrid('getGridParam', 'selrow');
//	if (sels) {
////		var rowdata = $("#list1").jqGrid("getRowData", sels);
//		var data = {'entity.key':rowdata.key};
//		$.post(url,data,function(){
//			$().message("已转换为年度训练计划！");
//		},'json');
//	} else {
//		$("#list1").message("請選擇要修改的項目！");
//	}
	
	if(nobj)
	{	
		var id=openDialog({		
			width : nobj.width,		
			height : nobj.height,		
			modal : true,
			type : 'url',
			show : "",
			hide : "",
			title : nobj.title+' ID:'+nobj.gridId,
			body : nobj.body,
			data : nobj.data,
			buttons : {	}
		});
	
	}
	

}



function mypost(o)
{
//	$.Dialog.close()

	$(this).message("Wait");
//	$.blockUI({ message: '<h2><img src="./images/busy.gif" /> 處理中, 請稍侯...</h2>' });        		
	var data = (o.data)?o.data:$("#formPost").serialize();	
	$.ajax({
		type : 'POST', //GET or POST
		url : o.url, 						//請求的頁面
		cache : false,									//防止抓到快取的回應
		data : data, //要傳送到頁面的參數
		success :  function(data) {
				//$.unblockUI();
				o.onSuccess(data)
			}, 			
		error : function(data) {
			//$.unblockUI();
			alert("Error");
		}, //當請求失敗後此事件會被呼叫
		statusCode : { //狀態碼處理
			404 : function() {
				//$.unblockUI();
				alert ("page not found");        				
			}
		}
	});	 
}










// Call from list/basisevalutiontable_evaluator.php
function modify_basisevalutiontableevaluator(obj,gridId)
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "修改受評者的評鑑者",
		body : "/hrd/basisevaluationtable/evaluator/edit.html",
		data : {},
		buttons : {}
	});
}

//修改受評人的訊息 (修改所屬評鑑者)
function modify_basisevalutiontable_reportee(obj,gridId)
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "修改受評者的評鑑者",
		body : "/hrd/basisevaluationtable/reportee/edit.html",
		data : {},
		buttons : {}
	});
}

function modify_classevalutiontableevalutor()
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "修改職能評鑑者",
		body : "/hrd/classevaluationtable/competencyevalutor/edit.html",
		data : {},
		buttons : {}
	});
}


function modify_classevalutiontable(obj,gridId)
{	
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "修改職能評鑑",
		body : "/hrd/classevaluationtable/competencyedit/edit.html",
		data : {},
		buttons : {}
	});
}



function course_detail(obj,gridId)
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "課程設定",
		body : "/hrd/competency/course/edit.html",
		data : {request_gridId:gridId},
		buttons : {}
	});
}


function cs_manage(obj,gridId)
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "職能標準 cs_manage",
		body : "/hrd/competency/standard/edit.html",
		data : {request_gridId:gridId},
		buttons : {}
	});	
}

//evaluationtable_item_detail
function eti_detail(obj,gridId)
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "能力指標",
		body : "/hrd/ability/list/edit.html",
		data : {request_gridId:gridId},
		buttons : {}
	});
}


function positionlevel_manage(obj,gridId)
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "職等職稱",
		body : "/hrd/position_level/detail/edit.html",
		data : {request_gridId:gridId},
		buttons : {}
	});
}

function create_ability(obj,gridId)
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "能力指標",
		body : "/hrd/ability/list/edit.html",
		data : {request_gridId:gridId},
		buttons : {}
	});
}

function create_competency_level(obj,gridId)
{
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "分級職能信息",
		body : "/hrd/competency/level/edit.html",
		data : {request_gridId:gridId},
		buttons : {}
	});
}

function create_competency(obj,gridId)
{	
	//	console.log($(tag).html())
	//console.log("C-"+obj.parent.name)
	/*
	var container=$('#competency_setting');
		$(".lable",container).each(function() {
			$(this).click(function() {
				var divn = $(this).attr("dis");
				$(".lable",container).each(function() {
					$(this).css("background-color", "#F0F0F0");
				});
				$(".labDiv",container).each(function() {
					$(this).hide();
				});
				$(this).css("background-color", "yellow");
				$("#" + divn).show();
			});
		});
	*/
	
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "職能",
		body : "/hrd/competency/setting/edit.html",
		data : {request_gridId:gridId},
		buttons : {}
	});
}

function create_behavior(obj)
{	
	openDialog({
		width : 1020,		
		height : 620,
		modal : true,
		type : 'url',
		show : "",
		hide : "",
		title : "行為",
		body : "/hrd/behavior/setting/edit.html",
		data : {},
		buttons : {}
	});
}

//-------------------------

function call_user_func(cb) {
	  //  discuss at: http://phpjs.org/functions/call_user_func/
	  // original by: Brett Zamir (http://brett-zamir.me)
	  // improved by: Diplom@t (http://difane.com/)
	  // improved by: Brett Zamir (http://brett-zamir.me)
	  //   example 1: call_user_func('isNaN', 'a');
	  //   returns 1: true

	  var func;

	  if (typeof cb === 'string') {
	    func = (typeof this[cb] === 'function') ? this[cb] : func = (new Function(null, 'return ' + cb))();
	  } else if (Object.prototype.toString.call(cb) === '[object Array]') {
	    func = (typeof cb[0] === 'string') ? eval(cb[0] + "['" + cb[1] + "']") : func = cb[0][cb[1]];
	  } else if (typeof cb === 'function') {
	    func = cb;
	  }

	  if (typeof func !== 'function') {
	    throw new Error(func + ' is not a valid function');
	  }

	  var parameters = Array.prototype.slice.call(arguments, 1);
	  return (typeof cb[0] === 'string') ? func.apply(eval(cb[0]), parameters) : (typeof cb[0] !== 'object') ? func.apply(
	    null, parameters) : func.apply(cb[0], parameters);
	}

