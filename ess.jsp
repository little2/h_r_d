<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>index</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" href="Framework/Themes/essfw.css" rel="stylesheet" />
</head>
<body class="bodybg" style="height:100%;margin:0px;">
	<div class="mainbg">
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="4" align="center" height="10">
					<jsp:include page="/Include/essTop.jsp" />
				</td>
			</tr>
			<tr>
				<td width="5" valign="top" bgcolor="" valign="top">&nbsp;</td>
				<td width="178" valign="top" align=right class="Main_left" id='t4'>
					<jsp:include page="/Include/essMenu.jsp" />
				</td>
				<td width="17" valign="top" bgcolor=""></td>
				<td align="left" valign="top">
					<div id="panel">
						<jsp:include page="/e_home.jsp" />
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center" height="20" class="framebottom">Copyright &copy; 2012 技叁软件系统技术有限公司 版权所有</td>
			</tr>
		</table>
	</div>
</body>
</html>