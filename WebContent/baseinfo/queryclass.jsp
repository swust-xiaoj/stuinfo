<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级信息查询</title>
<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
</head>
<body>
<%	request.setCharacterEncoding("utf-8");  %>
<p align="center" class="title" style="color:blue">班级信息查询</p>
<div id="data_table" align="center">
	<form name="classform" action="queryclass.jsp" method="post">
		班级名称：<input type="text" name="className" />&nbsp;&nbsp;<input type="submit" value="查 询" />
	</form>
	<hr width="400" color="red"/>
	<table id="classinfo" width="400" border="0" class="gridtable">
	<tr><th width="100" height="20">序号</th><th width="200" height="20">班级名称</th></tr>
	<% 
		Connection conn = null;	
		Statement stmt = null;	
		ResultSet rs = null;
		String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url); 
		stmt = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		String className = request.getParameter("className");
		String sqlStr = "Select * from classinfo";
		String temp = "";
		if(className != null && !className.isEmpty()){
			className = className.trim();
			temp = "className Like '%"+className+"%'";
		}
		if(!temp.isEmpty())
			sqlStr = sqlStr + " Where " + temp;
		//out.print(sqlStr);
		try{		
			rs = stmt.executeQuery(sqlStr);
			int i = 1;
			while(rs.next()){%>
				<tr><td width="100" height="20" align="center"><% out.print(i);%></td><td width="200" height="20"  align="center"><%= rs.getString("className")%></td></tr>	
			<%
			i = i + 1;
			}
			rs.close(); 
			stmt.close();
			conn.close();
		}catch(SQLException e){
			out.print(e.getMessage());

		}	
	%>
	</table>
</div>
</body>
</html>