<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	//int screenWidth = java.awt.Toolkit.getDefaultToolkit().getScreenSize().width;
	//int screenHeight = java.awt.Toolkit.getDefaultToolkit().getScreenSize().height;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>index</title>
<jsp:include page="/Include/Init.jsp"></jsp:include>
<link type="text/css" href="Framework/Themes/frame.css" rel="stylesheet" />
<link type="text/css" href="Framework/Plugins/TabPanel/jquery.tabpanel.css" rel="stylesheet" />
<script type="text/javascript" src="Framework/Plugins/TabPanel/jquery.tabpanel.js"></script>
<script type="text/javascript" src="Framework/frame.js"></script>
</head>
<body>
	<table id="frametable" align="center" width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="4" align="center" height="10"><jsp:include page="/Include/top.jsp" /></td>
		</tr>
		<tr>
			<td width="5px" valign="top" valign="top">&nbsp;</td>
			<td class="Main_left"><jsp:include page="/Include/menu.jsp" /></td>
			<td width="12px" valign="top"><div class="goLeft"></div></td>
			<td class="Main_right" align="center" valign="top">
				<div id="tabPanel"></div>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center" class="framebottom">Copyright © 2014 台灣緯任數位科技股份有限公司 版權所有</td>
		</tr>
	</table>
	<div id="g3_dialog_mini"></div>
	<div id="g3_upload"></div>
	<div id="g3_dialog"></div>
	<div id="g3_lov"></div>
	<div id="g3_msg"></div>
</body>
</html>