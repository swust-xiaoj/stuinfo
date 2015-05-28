<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>程序设计综合训练--示例--专业信息修改</title>
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/icon.css" />
 	<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
	<script type="text/javascript">	
		function check(){
			if(document.specialty.specialtyName.value.trim()==""){
				alert("专业名称没有填写!");
				document.specialty.specialtyName.focus();
				return false;
			}
		}
	</script>
</head>
<body>
<%
	String specialtyId = request.getParameter("specialtyId");
	String specialtyName = request.getParameter("specialtyName");
	specialtyName = new String(specialtyName.getBytes("ISO-8859-1"), "UTF-8");
%>
	<p align="center" class="title">专业基本信息修改</p>
	<table border="0" align="center">
	<tr><td width="170"></td><td width="830">
	<form name="specialty" action="upspecialty.jsp" method="post" onSubmit="return check()"><table width="720">
		<tr><td width="300" align="right">专业名称：<input name="specialtyId" type="hidden" value="<%= specialtyId%>"></td><td width="420"><input type="text" name="specialtyName" class="easyui-validatebox" value="<%=specialtyName %>" /></td></tr>
	<tr><td width="300" align="right"><input type="submit" value="提 交" /></td><td width="420"><input type="reset" value="重 置" /></td></tr></table></form></td></tr>
	</table>
</body>
</html>