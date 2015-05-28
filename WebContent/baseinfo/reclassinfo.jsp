<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>程序设计综合训练--示例--班级信息修改</title>
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/icon.css" />
 	<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
	<script type="text/javascript">	
		function check(){
			if(document.classform.className.value.trim()==""){
				alert("班级名称没有填写!");
				document.classform.className.focus();
				return false;
			}
		}
	</script>
</head>
<body>
<%
	String classId = request.getParameter("classId");
	String className = request.getParameter("className");
	className = new String(className.getBytes("ISO-8859-1"), "UTF-8");
%>
	<p align="center" class="title">班级基本信息修改</p>
	<table border="0" align="center">
	<tr><td width="170"></td><td width="830">
	<form name="classform" action="upclassinfo.jsp" method="post" onSubmit="return check()"><table width="720">
		<tr><td width="300" align="right">班级名称：<input name="classId" type="hidden" value="<%= classId%>"></td><td width="420"><input type="text" name="className" class="easyui-validatebox" value="<%=className %>" /></td></tr>
	<tr><td width="300" align="right"><input type="submit" value="提 交" /></td><td width="420"><input type="reset" value="重 置" /></td></tr></table></form></td></tr>
	</table>
</body>
</html>