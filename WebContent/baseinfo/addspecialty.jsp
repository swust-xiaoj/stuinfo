<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>程序设计综合训练--示例--专业信息录入</title>
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/icon.css" />
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/tabs.css" />
 	<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
 	<script type="text/javascript" src="/stuinfo/js/easyui/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/stuinfo/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">	
		function check(){
			if(document.stuform.specialtyName.value.trim()==""){
				alert("专业信息没有填写!");
				document.stuform.specialtyName.focus();
				return false;
			}
		
		//正则表达式
		}
	</script>
</head>
<body>
	<p align="center" class="title">专业基本信息录入</p>
	<table border="0" align="center">
	<tr><td width="170"></td><td width="830">
	<form name="stuform" action="inputspecialty.jsp" method="post" onSubmit="return check()"><table width="720">
		<tr><td width="300" align="right">专业：</td><td width="420"><input type="text" name="specialtyName" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" class="easyui-validatebox" /></td></tr>
		
	<tr><td width="300" align="right"><input type="submit" value="提 交" /></td><td width="420"><input type="reset" value="重 置" /></td></tr></table></form></td></tr>
	</table>
	
</body>
</html>