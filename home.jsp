<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.g3.base.helper.util.WebUtil"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";	
	String empID =WebUtil.getEmpId();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>index</title>
<jsp:include page="/Include/Init.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		var empId = $("#empId").val();
		var url='${pageContext.request.contextPath}/hr/hrEmployee/findEmpById.html';
		$.post(url,{'empId':empId},function(data){
			
		},'json');
		
		
		$("#tabs").tabs();

	
		/* jzsoft.grid("list1", {
			url : '',
			postData : {
				'entity.isAgent' : '0'
			},
			colNames : [ 'ID', '營運/專案','員工分類', '目標', '權重', '預計完成日','目標形態','檢視'],
			colModel : [ {
				name : 'key',
				index : 'key',
				width : 55,
				hidden : true
			}, {
				name : 'years',
				index : 'years',
				width : 80
			}, {
				name : 'objects.empName',
				index : 'objects.empName',
				width : 80
			},{
				name : 'diaryContent',
				index : 'diaryContent',
				width : 80
			}, {
				name : 'diaryRecordDate',
				index : 'diaryRecordDate',
				width : 130
			}, {
				name : '',
				index : '',
				width : 80
			},{
				name : 'diaryRecordDate',
				index : 'diaryRecordDate',
				width : 130
			}, {
				name : '',
				index : '',
				width : 80
			}],
			width:GRIDWIDTH*0.65,
			height : '165',
			pager : '#pager1',
		});
			jzsoft.grid("list2", {
			url : '',
			postData : {
				'entity.isAgent' : '0'
			},
			colNames : [ 'ID', '營運/專案','員工分類', '目標', '權重', '預計完成日','目標形態','檢視'],
			colModel : [ {
				name : 'key',
				index : 'key',
				width : 55,
				hidden : true
			}, {
				name : 'years',
				index : 'years',
				width : 80
			}, {
				name : 'objects.empName',
				index : 'objects.empName',
				width : 80
			},{
				name : 'diaryContent',
				index : 'diaryContent',
				width : 80
			}, {
				name : 'diaryRecordDate',
				index : 'diaryRecordDate',
				width : 130
			}, {
				name : '',
				index : '',
				width : 80
			},{
				name : 'diaryRecordDate',
				index : 'diaryRecordDate',
				width : 130
			}, {
				name : '',
				index : '',
				width : 80
			}],
			width:GRIDWIDTH*0.65,
			height : '165',
			pager : '#pager2',
		});
			jzsoft.grid("list3", {
			url : '',
			postData : {
				'entity.isAgent' : '0'
			},
			colNames : [ 'ID', '營運/專案','員工分類', '目標', '權重', '預計完成日','目標形態','檢視'],
			colModel : [ {
				name : 'key',
				index : 'key',
				width : 55,
				hidden : true
			}, {
				name : 'years',
				index : 'years',
				width : 80
			}, {
				name : 'objects.empName',
				index : 'objects.empName',
				width : 80
			},{
				name : 'diaryContent',
				index : 'diaryContent',
				width : 80
			}, {
				name : 'diaryRecordDate',
				index : 'diaryRecordDate',
				width : 130
			}, {
				name : '',
				index : '',
				width : 80
			},{
				name : 'diaryRecordDate',
				index : 'diaryRecordDate',
				width : 130
			}, {
				name : '',
				index : '',
				width : 80
			}],
			width:(GRIDWIDTH-20)*0.65,
			height : '165',
			pager : '#pager3',
		}); */
		
		jzsoft.grid("list22", {
			url : '${pageContext.request.contextPath}/hr/HrAdministrativeAnnouncement/pageList.html',
		
			colNames : [ 'ID','公告日期', '公告標題','公告單位','檢視','content'],
			colModel : [ {
				name : 'key',
				index : 'key',
				editable : true,
				width : 55,
				hidden : true
			}, {
				name : 'ADate',
				index : 'ADate',
				editable : true,
				width : 50,
				align: 'center'
			}, {
				name : 'ATitle',
				index : 'ATitle',
				width : 80,
				editable : true,
			},{
				name : 'orgDepart.departName',
				index : 'orgDepart.departName',
				width : 50,
				formatter : 'lovFmatter',
				editrules : {
					required : false
				},
				formatoptions : {
					lovCode : 'DEPT',
					type : '1',
					fields : [ 'orgDepart.key', '', 'orgDepart.departName' ]
				}
			},{
				name : 'que',
				index : 'que',
				align : 'center',
				width : 40
			},{
				name : 'AContent',
				index : 'AContent',
				editable : true,
				width : 55,
				hidden : true
			}],
			width:(GRIDWIDTH-20)*0.65,
			height : '115',
			pager : '#pager22',
			rownumbers: true,
			gridComplete : function() {
				var ids = jQuery("#list22").jqGrid('getDataIDs');
				for ( var i = 0; i < ids.length; i++) {
					var cl = ids[i];
					var rowdata = jQuery("#list22").jqGrid("getRowData", cl);
					var que = "<input class='editbutton' type='button' value='' onclick=\"editButton2('" + rowdata.AContent + "');\"/>";
					jQuery("#list22").jqGrid('setRowData', ids[i], {
						que : que
					});
				}
			}
		});
	});
	function editButton2(content){
		openDialog({
			id : 'g3_dialog_mini',
			width : 400,
			height : 250,
			modal : true,
			type : 'html',
			resizable:false,
			show : "",
			hide : "",
			title : "內容",
			body : "<textarea readonly='true' style='width:360px;height:165px'>"+content+"</textarea>",

		});
	}
</script>
</head>
<body>
<input type="hidden" id="empId" value="<%=empID%>"/>
<!-- <table style="width:100%">
<tr style="vertical-align:top">
 <td style="width:30%"> -->
  	<div  style="width:30%;height:250px;border:1px solid #b6d9db; float:left;">
  		<div style="font-size:20px;padding-left:4px">My Information</div>
  		<div id="accountInfo" style="padding-left:4px">
	  		<div style="font-size:12px; margin-top:8px;">姓名：${ACCOUNT_REL_NAME}</div>
	  		<div style="font-size:12px;margin-top:4px;">部門：${DEPART_NAME}</div>
	  		<div style="font-size:12px;margin-top:4px;">職等：${DUTY_GRADE_NAME}</div>
	  		<div style="font-size:12px;margin-top:4px;">職稱：${POST_NAME}</div>
	  		<div style="font-size:12px;margin-top:4px;">登入身份：${ROLES}</div> 	
  		</div>	
  	</div>
  	<!-- <div style="width:100%;height:300px;border:1px solid #b6d9db; float:left; margin-top:2px">  -->		
  	</div>
<!--   </td>
  <td style="width:70%"> -->
  <div style="width:65%;height:250px;margin-left:4px;border:1px solid #b6d9db; float:left;">
  		<div style="font-size:20px">系統公告</div>
  		<div id="tabs2" class="g3-tabs">
			<div id="tab22">
				<table id="list22"></table>
				<div id="pager22"></div>
			</div>
		</div>
  	</div>
  	<!-- <div style="width:95.5%;height:300px;margin-top:4px;border:1px solid #b6d9db; float:left;">
  		<div style="font-size:20px">個人績效管理</div>
  		<div id="tabs" class="g3-tabs">
			<ul>
				<li><a href="#tab1">個人年度目標</a></li>
				<li><a href="#tab2">部門年度目標</a></li>
				<li><a href="#tab3">公司年度目標</a></li>
			</ul>
			<div id="tab1">
				<table id="list1"></table>
				<div id="pager1"></div>
			</div>
			<div id="tab2">
				<table id="list2"></table>
				<div id="pager2"></div>
			</div>
			<div id="tab3">
				<table id="list3"></table>
				<div id="pager3"></div>
			</div>
		</div>
  	</div> -->
  	
<!--   </td>
</tr>
</table> -->


</body>
</html>