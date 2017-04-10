<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="g3/i18n" prefix="i"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="Framework/Themes/login.css" type="text/css" charset="utf-8"
	rel="stylesheet" />
<title>HRD Login</title>
<script type="text/javascript" src="Framework/Core/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		if ($('#languageType').val() == 'CN') {
			$('.language').css("background-image",
					"url(Framework/Themes/images/login/cn.gif)");
		} else if ($('#languageType').val() == 'TW') {
			$('.language').css("background-image",
					"url(Framework/Themes/images/login/tw.gif)");
		} else if ($('#languageType').val() == 'EN') {
			$('.language').css("background-image",
					"url(Framework/Themes/images/login/en.gif)");
		}

		$('.language').click(
				function() {
					if ($('#languageType').val() == 'CN') {
						$('.language').css("background-image",
								"url(Framework/Themes/images/login/tw.gif)");
						$('#languageType').attr("value", "TW");
					} else if ($('#languageType').val() == 'TW') {
						$('.language').css("background-image",
								"url(Framework/Themes/images/login/en.gif)");
						$('#languageType').attr("value", "EN");
					} else if ($('#languageType').val() == 'EN') {
						$('.language').css("background-image",
								"url(Framework/Themes/images/login/cn.gif)");
						$('#languageType').attr("value", "CN");
					}
					$('#login').attr("action", "changeLanguage.html");
					$('#login').submit();
				});

		$('#btn1').click(login);
		$("input").keypress(function(event) {
			if (event.keyCode == 13) {
				login();
			}
		});
	});

	function login() {
		$('#login').attr("action", "login.html");
		$('#login').submit();
	}

	function reloadImages(url) {
		document.getElementById("images").src = url + "?Date"
				+ new Date().getTime();
	}
</script>
</head>
<body class="loginbody" style="overflow: hidden">
	<form method="post" id="login" action="">
		<div class="loginframe">
			<div class="loginframetop">
				<img src="Framework/Themes/images/login/clogo.jpg">
			</div>
			<div class="loginframebody">
				<div class="loginframeleft">
					<table width="200" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="60" class="loginframelefta">HRD</td>
						</tr>
						<tr>
							<td height="20" class="loginframeleftb">Human Resource
								Development</td>
						</tr>
						<tr>
							<td height="20" class="loginframeleftc">版本號 V 1.0.1</td>
						</tr>
					</table>
				</div>
				<div class="loginframeform">
					<input type="hidden" id="languageType" name="languageType"
						value="${languageType}" />
					<TABLE width="308" border=0 cellPadding=3 cellSpacing=0>
						<TBODY>
							<TR>
								<TD width="72">&nbsp;</TD>
								<TD colspan="2"><FONT color=#ff0000>${msg}</FONT>
								</TD>
							</TR>
							<TR>
								<TD align=right><i:o c="COMPANYNAME"
										languageType="${languageType}" />
								</TD>
								<TD colspan="2"><SELECT class=sel id=selType name=selType>
										<OPTION label=台灣緯任數位科技股份有限公司 value=ZHS selected>台灣緯任數位科技股份有限公司</OPTION>
								</SELECT>
								</TD>
							</TR>
							<TR>
								<TD align=right><i:o c="ACCOUNT"
										languageType="${languageType}" /></TD>
								<TD colspan="2"><input name="account.account" value=""
									class="inp" id="username" value="${account.account }" />
								</TD>
							</TR>
							<TR>
								<TD align=right><i:o c="PASSWORD"
										languageType="${languageType}" /></TD>
								<TD colspan="2"><input name="account.accountPassword"
									value="" type="password" class="inp"
									value="${account.accountPassword }" />
								</TD>
							</TR>
							<TR>
								<TD align=right><i:o c="VERIFICATIONCODE"
										languageType="${languageType}" />
								</TD>
								<TD width="93"><INPUT name="validateCode" class="inpsort"
									value="">
								</TD>
								<TD width="125"><img border=0
									src="${pageContext.request.contextPath}/Include/image.jsp"
									id="images" style="cursor: hand;" title="看不清,请点击" name="images"
									onclick="reloadImages(this.src);" alt="loading"></TD>
							</TR>
							<TR>
								<TD></TD>
								<TD colspan="2"><input id="btn1" type="button"
									title='<i:o c="LOGIN" languageType="${languageType}" />'
									value='<i:o c="LOGIN" languageType="${languageType}" />' /> <A
									href="#" target=_blank class="pslink"><i:o
											c="FORGOTPASSWORD" languageType="${languageType}" /> </A></TD>
							</TR>
						</TBODY>
					</TABLE>
					<div class="language"></div>
				</div>
			</div>
		</div>
		<div class="loginfoot">版權所有  台灣緯任數位科技股份有限公司</div>
	</form>
</body>
</html>
