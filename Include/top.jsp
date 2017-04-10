<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!--Hearder start-->
<DIV class=Header>
	<DIV class=Header_logoBar>
		<img src="Framework/Themes/images/frame/logo.gif">
	</DIV>
	<!--Header_navBar start-->
	<DIV class=Header_navBar>
		<div class="Header_navBarleft">
			<a href="#" class="topmenuse">訓練管理</a> <a href="#" class="topmenuco">績效管理</a>
			<a href="#" class="topmenuco">職能管理</a> <a href="#" class="topmenuco">職涯規劃</a>
			<a href="#" class="topmenuco">接班人規劃</a>
		</div>
		<div class="Header_navBarright">
			<a href="#" class="navrighta"><img
				src="Framework/Themes/images/frame/navuser.png" align="absbottom">&nbsp;${ROLES}&nbsp;&nbsp;</a>
			 <a href="#" class="navrighta"><img
				src="Framework/Themes/images/frame/navnews.png" align="absbottom">&nbsp;(5)&nbsp;&nbsp;&nbsp;</a>
			<!-- <a href="/hrd/landESS.html" class="navrighta"><img 
			    src="Framework/Themes/images/frame/backxy.png" align="absbottom">&nbsp;自助&nbsp;&nbsp;</a>	 --> 
			 <a href="javascript:logout(this);" class="navrighta"><img
				src="Framework/Themes/images/frame/navout.png" align="absbottom">&nbsp;登出
			</a>
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
	function logout(obj){
		var url="${pageContext.request.contextPath}/logout.html?mid=' "+ Math.random();
		obj.parent.location.href=url;
	}
</script>
