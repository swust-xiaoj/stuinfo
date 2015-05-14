<%@page import="jxl.write.Label"%>
<%@page import="jxl.write.WritableSheet"%>
<%@page import="jxl.Workbook"%>
<%@page import="jxl.write.WritableWorkbook"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息删除</title>
<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
<script type="text/javascript">			
</head>
<body>
    <% 
    Connection conn = null;	
	Statement stmt = null;	
    String stuid = request.getParameter("delids");
    String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199";
    Class.forName("com.mysql.jdbc.Driver");  //注册驱动
	 conn = DriverManager.getConnection(url);   //建立连接
	Statement stmtt = conn.createStatement();   //创建Statement对象
	String stuId[]=stuid.split(",");
	try{
		for(int i=0;i<stuId.length;i++)
		{  
			String sqlStr = "Delete  From baseinfo Where stuId='"+stuId[i]+"'";
		    stmtt.executeUpdate(sqlStr) ;
		}
		out.print("已删除！");
	}catch(SQLException e){
		out.print(e.getMessage());
	}
	stmtt.close();
	conn.close();
    %><% 
    response.sendRedirect("upstudent.jsp");%>
</body>
</html>