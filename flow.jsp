<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>index</title>
<link type="text/css" href="Framework/Themes/flow.css" rel="stylesheet" />
<link type="text/css" href="Framework/Plugins/TabPanel/jquery.tabpanel.css" rel="stylesheet" />
<script type="text/javascript" src="Framework/Core/jquery-1.8.3.js"></script>
<script type="text/javascript" src="Framework/Plugins/TabPanel/jquery.tabpanel.js"></script>
<script type="text/javascript">
	$(function() {
		function openUrl(id, name, lUrl) {
			$("#tabPanel", window.parent.document).opentabitem({
				id : id,
				text : name,
				isactive : true,
				closeable : true,
				iframe : true,
				url : lUrl
			}, true);
		}
		
		$("#tra").click(function() {
			openUrl('1','內訓報名單','${pageContext.request.contextPath}/training/trTraineeSelectedCoursesApprove/list.html');
		});
		
		$("#trb").click(function() {
			openUrl('2','外訓報名單','${pageContext.request.contextPath}/training/trOutsideTrainApprove/list.html');
		});
		$("#trc").click(function() {
			openUrl('3','訓練請假單','${pageContext.request.contextPath}/training/trTraineeLeaveApproveAction/list.html');
		});
		$("#trd").click(function() {
			openUrl('4','課後報告單','${pageContext.request.contextPath}/training/trTraineeAfterschoolReportApprove/list.html');
		});
		$("#tre").click(function() {
			openUrl('5','課後執行單','${pageContext.request.contextPath}/training/trTraineeAfterschoolReportApprove/list.html');
		});
		$("#trf").click(function() {
			openUrl('6','初選參訓員工','${pageContext.request.contextPath}/training/trPrimaryEmployeeTraining/list.html');
		});
		$("#trg").click(function() {
			openUrl('7','個人學習申請單','${pageContext.request.contextPath}/training/trPersonTrainingMapApprove/list.html');
		});
		$("#trh").click(function() {
			openUrl('8','部門年度訓練需求','${pageContext.request.contextPath}/training/trDepartAnnualTrainingApprove/list.html');
		});
		$("#tri").click(function() {
			openUrl('9','年度訓練計畫','${pageContext.request.contextPath}/training/trAnnualTrainingPlanApprove/list.html');
		});
		$("#trj").click(function() {
			openUrl('10','外訓費用報銷','${pageContext.request.contextPath}/training/trOutsideTrainExpenseApprove/list.html');
		});

	});
</script>
</head>
<body class="pbodybg" style="height:100%;margin:0px;">
	<div class="spbody">
		<div class="ptitle">
			<div class="ptitlea">待審批信息</div>
		</div>
		<div class="spbox">
			<div class="sptop" id="tra">
				<img src="Framework/Themes/images/flow/sp1.jpg" width="150" height="110" /><br />內訓報名單
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="trb">
				<img src="Framework/Themes/images/flow/sp2.jpg" width="150" height="110" /><br />外訓報名單
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="trc">
				<img src="Framework/Themes/images/flow/sp3.jpg" width="150" height="110" /><br />訓練請假單
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="trd">
				<img src="Framework/Themes/images/flow/sp4.jpg" width="150" height="110" /><br />課後報告單
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="tre">
				<img src="Framework/Themes/images/flow/sp5.jpg" width="150" height="110" /><br />課後執行單
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="trf">
				<img src="Framework/Themes/images/flow/sp6.jpg" width="150" height="110" /><br />初選參訓員工
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="trg">
				<img src="Framework/Themes/images/flow/sp7.jpg" width="150" height="110" /><br />個人學習申請單
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="trh">
				<img src="Framework/Themes/images/flow/sp8.jpg" width="150" height="110" /><br />部門年度訓練需求
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="tri">
				<img src="Framework/Themes/images/flow/sp9.jpg" width="150" height="110" /><br />年度訓練計畫
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>

		<div class="spbox">
			<div class="sptop" id="trj">
				<img src="Framework/Themes/images/flow/sp10.jpg" width="150" height="110" /><br />外訓費用報銷
			</div>
			<div class="spbottom">
				<div class="sparea">
					<a href="#">3</a><br />待審
				</div>
				<div class="sparea">
					<a href="#">0</a><br />核決
				</div>
				<div class="sparea">
					<a href="#">653</a><br />歷史
				</div>
			</div>
		</div>
	</div>
</body>
</html>