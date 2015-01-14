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
		
		
		$("#trf").click(function() {
			openUrl('1','个人目標設定','${pageContext.request.contextPath}/performance/perfChargeTargetC/list.html?isAgent=1');
		});
		$("#trg").click(function() {
			openUrl('2','期中檢討','${pageContext.request.contextPath}/performance/perfChargeMidTerm/list.html?isAgent=1');
		});
		$("#trh").click(function() {
			openUrl('3','期中修訂','${pageContext.request.contextPath}/performance/perfChargeMidCorrect/list.html?isAgent=1');
		});
		$("#tri").click(function() {
			openUrl('4','期末評鑑-MBO','${pageContext.request.contextPath}/performance/perfChargeFinalCriticism/list.html?isAgent=1');
		});
		$("#trj").click(function() {
			openUrl('5','期末評鑑-特殊評估考核','${pageContext.request.contextPath}/performance/perfFinalCriticismOfSpecialEvalutionTable/list.html?isAgent=1');
		});
		$("#tra").click(function() {
			openUrl('6','評鑑等第','${pageContext.request.contextPath}/performance/perfGroupFinalCriticismGradeApprove/list.html?isAgent=1');
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
			<div class="sptop" id="trf">
				<img src="Framework/Themes/images/flow/sp6.jpg" width="150" height="110" /><br />目標設定
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
				<img src="Framework/Themes/images/flow/sp7.jpg" width="150" height="110" /><br />期中檢討
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
				<img src="Framework/Themes/images/flow/sp8.jpg" width="150" height="110" /><br />期中修訂
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
				<img src="Framework/Themes/images/flow/sp9.jpg" width="150" height="110" /><br />期末評鑑-MBO
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
				<img src="Framework/Themes/images/flow/sp10.jpg" width="150" height="110" /><br />期末評鑑-特殊評估考核
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
			<div class="sptop" id="tra">
				<img src="Framework/Themes/images/flow/sp1.jpg" width="150" height="110" /><br />評鑑等第
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