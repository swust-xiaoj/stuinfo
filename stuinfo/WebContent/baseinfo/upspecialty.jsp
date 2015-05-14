<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专业信息查询</title>
<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
</head>
<body>
<%	request.setCharacterEncoding("utf-8");  %>
<p align="center" class="title">专业信息修改</p>
<div id="data_table" align="center">
	<table id="specialty" width="400" border="0" class="gridtable">
	<tr><th width="100" height="20">序号</th><th width="200" height="20">专业名称</th><th width="100" height="20">操作</th></tr>
	<% 
		Connection conn = null;	
		Statement stmt = null;	
		ResultSet rs = null;
		String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url); 
		stmt = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		String specialtyId = request.getParameter("specialtyId");
		String specialtyName = request.getParameter("specialtyName");
		if(specialtyId==null){
			try{
				
				String sqlStr = "Select * from specialty";
				rs = stmt.executeQuery(sqlStr);
				int i = 1;
				while(rs.next()){%>
					<tr><td width="100" height="20" align="center"><% specialtyId = rs.getString("specialtyId");out.print(i);%></td><td width="200" height="20"  align="center"><%= rs.getString("specialtyName")%></td><td width="100" height="20"  align="center"><a href="respecialty.jsp?specialtyId=<%= specialtyId%>&specialtyName=<%= rs.getString("specialtyName")%>">修改</a></td></tr>	
				<%
				i = i + 1;
				}
				rs.close(); 
				stmt.close();
				conn.close();
			}catch(SQLException e){
				out.print(e.getMessage());

			}
		}else{			
			try{
				String sqlStr = "Update specialty Set specialtyName = '"+specialtyName+"' Where specialtyId="+specialtyId;
				stmt.executeUpdate(sqlStr);
				stmt.close();
				conn.close();
				response.sendRedirect("upspecialty.jsp");	
			}catch(SQLException e){
				out.print(e.getMessage());

			}
		}
			
		%>
	</table>
</div>
</body>
</html>