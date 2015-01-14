<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!--Hearder start-->
<DIV class=Header>
	<DIV class=Header_logoBar>
		<a href="index.html"><img src="Framework/Themes/images/ess/logo.gif"> </a>
	</DIV>
	<DIV class=Header_linkBar>
		<a href="#" class="navuser">G3</a> <a href="#" class="navnews">（5）</a> <a href="../hrd/index.html" class="backxy">系统</a>
		<a href="#" class="navout">登出</a>
		<form action="#" style="margin-top:10px;">
			<INPUT class=leftsearch maxLength=10 name=username id=username value="hrd001"> <INPUT type="image"
				src="Framework/Themes/images/ess/search_left.png">
		</form>
	</DIV>

	<!--Header_navBar start-->
	<DIV class=Header_navBar>
		<div class="Header_navBarleft">
			<a href="index.html" class="topmenu">首頁</a><img src="Framework/Themes/images/ess/topmenuline.gif" align="absmiddle"> 
			<a href="#" class="topmenu">我的信息</a><img src="Framework/Themes/images/ess/topmenuline.gif" align="absmiddle"> 
			<a href="#" class="topmenu">我的課程</a><img src="Framework/Themes/images/ess/topmenuline.gif" align="absmiddle"> 
			<a href="#" class="topmenu">我的社區</a><img src="Framework/Themes/images/ess/topmenuline.gif" align="absmiddle"> 
			<a href="#" class="topmenu">系统設置</a>
		</div>
		<div class="Header_navBarright">
			<a href="#" class="topmenur">導航設置 > </a>
		</div>
	</DIV>
	<!--Header_navBar end-->
	<DIV class=Header_stateBar>
		<DIV class=Header_stateBar_head></DIV>
		<DIV class=Header_stateBar_body></DIV>
		<DIV class=Header_stateBar_foot></DIV>
	</DIV>
</DIV>
<!--Hearder end-->
<script>
	function logout(obj) {
		var url = "${pageContext.request.contextPath}/logout.html?mid=' " + Math.random();
		obj.parent.location.href = url;
	}
</script>
