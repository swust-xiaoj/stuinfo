<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<% 
	Connection conn = null;	
	Statement stmt = null;	
	request.setCharacterEncoding("UTF-8");  //设置request的编码，避免中文乱码
	String stuId = request.getParameter("stuId");
	String stuName = request.getParameter("stuName");
	String stuSex = request.getParameter("stuSex");
	String birthday = request.getParameter("birthday");
	String origin = request.getParameter("origin");
	String specialty = request.getParameter("specialty");
	String classId = request.getParameter("className");
	try{
		String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199"; //数据库的连接接字符串
		Class.forName("com.mysql.jdbc.Driver");  //注册驱动
		conn = DriverManager.getConnection(url);   //建立连接
		stmt = conn.createStatement();   //创建Statement对象
		String sqlStr = "Insert Into baseinfo (stuId,stuName,stuSex,birthday,origin,specialty,classId) Values"+
				"('"+stuId+"','"+stuName+"',"+stuSex+",'"+birthday+"','"+origin+"',"+specialty+","+classId+")";  //操作数据库的SQL字符串
		//out.println(sqlStr);
		stmt.execute(sqlStr);  //执行插入操作
		out.println("学生信息添加成功！");
		stmt.close();
		conn.close();
	}catch(SQLException e){
		out.print(e.getMessage());  //向页面输出异常信息
	}
%>
