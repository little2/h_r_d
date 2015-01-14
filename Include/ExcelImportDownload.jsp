<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="g3/i18n" prefix="i"%>
<%@ taglib uri="g3/va" prefix="va"%>
<%
	//导入页面
%>
<html>
<head>
<script>
	$(function() {
		$("#temp_file").uploadify({
			swf : "${pageContext.request.contextPath}/Framework/Plugins/uploadify/uploadify.swf",
			uploader : "${param.baseUrl}/importExcel.html",
			fileObjName : "fileUpload",
			buttonText : "${i:so('CHOOSE_FILE')}",
			auto : false,
			queueID : "uploadfileQueue",
			fileTypeDesc : "xlsx",
			fileTypeExts : "*.xlsx;",
			multi : false,
			uploadLimit : 1,
			height : 18,
			width : 65,
			removeCompleted : false,
			formData : {
				"languageType" : "${languageType}"
			},
			onUploadStart : function(file) {
				$("#msg").html("<img style='width:15px;' src='${pageContext.request.contextPath}/Framework/Themes/images/common/loading.gif'/>${i:so('UPLOADING_PARSING')},${i:so('PLZ_WAIT')}");
			},
			onUploadSuccess : function(file, data, response) {
				var obj = eval("(" + data + ");");
				if (obj.msg != null && obj.msg != "") {
					$("#msg").html(obj.msg);
				}
			}
		});
	});
</script>
</head>

<body>
	<div>
		<a href="${param.baseUrl}/downloadExcelTemp.html"><i:o c="DOWN_TEMP" /> </a> <span id="msg" style="color:red"></span>
	</div>
	<div style="margin-top:10px;">
		<span id="temp_file"></span>
	</div>
	<a href="javascript:$('#temp_file').uploadify('upload','*')"><i:o c="START_UP" /> </a>
	<a href="javascript:$('#temp_file').uploadify('stop','*')"><i:o c="CANCEL_UP" /> </a>
	<div id="uploadfileQueue" style="width: 400px;"></div>
</body>
</html>
