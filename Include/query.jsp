<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="g3/i18n" prefix="i"%>
<%//验证是否包含查询设定 %>
<s:set name="flag" value="'N'"/>
<s:iterator value="conditionList">
	<s:if test="columnTextCode!=null&&columnTextCode!=''">
		<s:set name="flag" value="'Y'"/>
	</s:if>
</s:iterator>
<s:if test="#flag=='Y'">
<!-- 输出查询页面 conditionList-->
<table id="queryTbl" class="contb">
<s:iterator value="conditionList" status="s" var="l">
<s:if test="columnTextCode!=null&&columnTextCode!=''">
	<tr>
		<td align="right">
			<s:hidden name="conditionList[%{#s.index}].targetColumn"/>
			<s:hidden name="conditionList[%{#s.index}].columnSub2"/>
			<s:hidden name="conditionList[%{#s.index}].columnSub1"/>
			<s:hidden name="conditionList[%{#s.index}].subTbl"/>
			<s:hidden name="conditionList[%{#s.index}].subTblSql"/>
			<s:hidden name="conditionList[%{#s.index}].columnType"/>
			<i:o c="${l.columnTextCode}" defaultText="${l.columnTextCode}"/>:
		</td>
		<td align="right">
			<s:if test="columnType.toString()=='STRING'&&inputType.toString()!='LOV'">
				<i:select c="CONDITION_TYPE" name="conditionList[${s.index}].conditionType" styleClass="context" exception="LT,LE,GT,GE"/>
			</s:if>
			<s:if test="columnType.toString()=='STRING'&&inputType.toString()=='LOV'">
				<i:select c="CONDITION_TYPE" name="conditionList[${s.index}].conditionType" styleClass="context" exception="IN,LIKE,LT,LE,GT,GE"/>
			</s:if>
			<s:if test="columnType.toString()=='DATE'||columnType.toString()=='TIME'">
				<i:select c="CONDITION_TYPE" name="conditionList[${s.index}].conditionType" styleClass="context" exception="LIKE,IN"/>
			</s:if>
			<s:if test="columnType.toString()=='FLOAT'||columnType.toString()=='SHORT'||columnType.toString()=='INT'||columnType.toString()=='LONG'">
				<i:select c="CONDITION_TYPE" name="conditionList[${s.index}].conditionType" styleClass="context" exception="LIKE"/>
			</s:if>
		</td>
		<td align="left">
			<s:if test="columnType.toString()=='STRING'||columnType.toString()=='FLOAT'||columnType.toString()=='SHORT'||columnType.toString()=='INT'||columnType.toString()=='LONG'">
				<s:if test="inputType.toString()=='TEXT'"><%
					//如果是普通文本框
				%>
					<s:textfield name="conditionList[%{#s.index}].values"/>
				</s:if>
				<s:if test="inputType.toString()=='SELECT'"><%
					//如果是下拉选项
				%>
					<i:select c="${inputTypeParams}" name="conditionList[${s.index}].values" id="conditionList_${s.index}_values" value="g3_blank_constanst">
						<option value="" selected="selected"><i:o c="NOSELECT"/></option>
					</i:select>
				</s:if>
				<s:if test="inputType.toString()=='LOV'"><%//如果是LOV,则解析,语法规范CODE;FIELD1,FIELD2：%>
					<s:set var="CODE" value="inputTypeParams.split(';')[0]"/>
					<s:set var="FIELDS" value="inputTypeParams.split(';')[1].split(',')"/>
					<s:set var="FIELD" value="#FIELDS[0]"/>
					<s:iterator value="FIELDS" var="f" status="fi">
						<s:if test="#fi.index==0">
							<input name="${f}${s.index}" id="${f}${s.index}" class="lov"/>
						</s:if>
						<s:if test="#fi.index>0">
							<input name="${f}${s.index}" />
						</s:if>
					</s:iterator>
					<script>
						$(function() {
							$("#${FIELD}${s.index}").newLOV({
								code : "${CODE}",
								type : "1",
								key : "conditionList[${s.index}].values",
								fields : [
									<s:iterator value="FIELDS" var="f" status="fi">
										"${f}${s.index}"
										<s:if test="#fi.index<#FIELDS.length-1">
											,
										</s:if>
									</s:iterator>
								]
							});
						});
					</script>
				</s:if>
			</s:if>
			<s:if test="columnType.toString()=='DATE'">
				<!-- 加载日历空间 -->
				<s:textfield name="conditionList[%{#s.index}].values" id="conditionList_%{#s.index}_values"/>
				<script>
				$(function(){
					$("#conditionList_${s.index}_values").datepicker({
						dateFormat : 'yy-mm-dd'
					});
				});
				</script>
			</s:if>
			<s:if test="columnType.toString()=='TIME'">
				<!-- 加载带时间的日历空间 -->
				<s:textfield name="conditionList[%{#s.index}].values" id="conditionList_%{#s.index}_values"/>
				<script>
				$(function(){
					$("#conditionList_${s.index}_values").datepicker({
						dateFormat : 'yy-mm-dd HH:mm'
					});
				});
				</script>
			</s:if>
		</td>
	</tr>
</s:if>
</s:iterator>
</table>
</s:if>
