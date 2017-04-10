<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>index</title>
<link type="text/css" href="Framework/Themes/home.css" rel="stylesheet" />
</head>
<BODY class="pbodybg" style="height:100%;margin:0px;">
	<div class="spbody">


		<div class="pbleft">
			<div class="pbleftx">
				<img src="Framework/Themes/images/home/people.jpg">
					<div>王小明</div>
					<div>緯任數位科技</div>
					<div>系统開發组</div>
					<div>4等2级</div>
					<div>開發工程师</div>
			</div>
		</div>

		<div class="pbright">
			<div class="ptitle">
				<div class="ptitlea">重要訊息</div>
			</div>

			<div class="rbleft">

				<div class="rbleftco">
					<div class="pboxleft">
						<img src="Framework/Themes/images/home/r1.png">
					</div>
					<div class="pboxright">
						<div>訓練課程</div>
						<div>2013年度</div>
						<div>
							必修课程共<a href="#">6</a>門
						</div>
						<div>
							選修课程共<a href="#">3</a>門
						</div>
						<div>
							尚有<a href="#">10</a>筆選修資訊待您查閱
						</div>
					</div>
				</div>

				<div class="rbleftse">
					<div class="pboxleft">
						<img src="Framework/Themes/images/home/r2.png">
					</div>
					<div class="pboxright">
						<div>待審批資料</div>
						<div>
							>>目前共有<a href="#">5</a>筆資料未查閱
						</div>
						<div>
							>>訓練報名申請單<a href="#">2</a>筆
						</div>
						<div>
							>>訓練請假申請單<a href="#">2</a>筆
						</div>
						<div>
							>>學員課後報告<a href="#">0</a>筆
						</div>
					</div>
				</div>
			</div>

			<div class="rbright">
				<div class="rbbox">
					<div class="rbtitle">&nbsp;待審批資料</div>

					<div class="pline">
						<div class="plineleft">訓練申請單</div>
						<div class="plineright">
							<a href="#">2</a><br>待審 
						</div>
					</div>

					<div class="pline">
						<div class="plineleft">訓練申請單</div>
						<div class="plineright">
							<a href="#">2</a><br>待審 
						</div>
					</div>

					<div class="pline">
						<div class="plineleft">訓練申請單</div>
						<div class="plineright">
							<a href="#">2</a><br>待審 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>