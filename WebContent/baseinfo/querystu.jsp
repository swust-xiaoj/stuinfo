<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>程序设计综合训练--示例--学生信息查询</title>
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/icon.css" />
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/tabs.css" />
 	<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
 	<script type="text/javascript" src="/stuinfo/js/easyui/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/stuinfo/js/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<%	request.setCharacterEncoding("utf-8");  %>
<p align="center" class="title" style="color:blue">学生信息查询</p>
<div id="data_table" align="center">
	<div id="query"><form style="color:purple" name="queryform" action="querystu.jsp" method="post">学号：<input onkeyup="value=value.replace(/[^\d{8}]/g,'')" type="text" name="stuId" class="easyui-validatebox" size="12" />&nbsp;姓名：<input type="text" name="stuName" class="easyui-validatebox" size="12" />
		&nbsp;出生年份：<input type="text" name="birthY" maxlength="4"  size="7" />&nbsp;班级：<select name="className"><option value=""></option>
<%
	Connection conn = null;	
	Statement stmtc = null;	
	ResultSet rs = null;
	String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url); 
	stmtc = conn.createStatement();
	try{
		String sqlStr = "Select * From classinfo";  //操作数据库的SQL字符串
		ResultSet rsc = stmtc.executeQuery(sqlStr);  //执行查询操作
		while(rsc.next()){  //遍历查询结果
%>
			<option value="<%= rsc.getString("classId")%>"><%= rsc.getString("className")%></option>
	<%
			}	
			rsc.close();
		}catch(SQLException ex){
			out.print(ex.getMessage());
		}
	%></select>&nbsp;专业：<select name="specialty"><option value=""></option>
	<%
		try{			
			String sqlStr = "Select * From specialty";  //操作数据库的SQL字符串
			ResultSet rsc = stmtc.executeQuery(sqlStr);  //执行查询操作
			while(rsc.next()){  //遍历查询结果
	%>
			<option value="<%= rsc.getString("specialtyId")%>"><%= rsc.getString("specialtyName")%></option>
	<%
			}	
			rsc.close();
		}catch(SQLException e){
			out.print(e.getMessage());
		}
	%>
			</select><input type="submit" value="查询" style="color:blue"/></form><hr width="800" color="red" /></div>
	<table id="stuinfo" width="800" border="0" class="gridtable">
	<tr><th width="100" height="20">学 号</th><th width="100" height="20">姓名</th><th width="50" height="20">性别</th>
		<th width="100" height="20">出生日期</th><th width="200" height="20">籍贯</th><th width="100" height="20">班级</th><th width="150" height="20">专业</th></tr>
	<% 
		Statement stmt = conn.createStatement();
		String sqlStr = "Select * From baseinfo";
		request.setCharacterEncoding("UTF-8");  //设置request的编码，避免中文乱码
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String birthY = request.getParameter("birthY");
		String specialty = request.getParameter("specialty");
		String classId = request.getParameter("className");
		String temp = "";
		if(stuId != null){
			if(!stuId.trim().isEmpty())
				sqlStr = sqlStr + " Where stuId='"+stuId.trim()+"'";
			else{
				if(!stuName.trim().isEmpty())
					temp = "stuName like '%"+stuName+"%'";
				if(!birthY.trim().isEmpty() && !temp.isEmpty())
					temp = temp + " and left(birthday,4)='"+birthY+"'";
				else if(!birthY.trim().isEmpty() && temp.isEmpty())
					temp = "left(birthday,4)='"+birthY+"'";
				if(!classId.isEmpty() && !temp.isEmpty())
					temp = temp + " and classId="+classId;
				else if(!classId.trim().isEmpty() && temp.isEmpty())
					temp = "classId="+classId;
				if(!specialty.isEmpty() && !temp.isEmpty())
					temp = temp + " and specialty="+specialty;
				else if(!specialty.trim().isEmpty() && temp.isEmpty())
					temp = "specialty="+specialty;
			}
		}
		if(!temp.isEmpty())
			sqlStr = sqlStr + " Where " + temp;
		try{			
			rs = stmt.executeQuery(sqlStr);
			if(!rs.next())
				out.print("没有符合条件的记录！");
			rs.beforeFirst();
			while(rs.next()){%>
				<tr><td width="100" height="20" align="center"><%= rs.getString("stuId") %></td><td width="100" height="20"  align="center"><%= rs.getString("stuName")%></td><td width="50" height="20"  align="center"><%
					if(rs.getString("stuSex").equals("1"))
						out.print("男");
					else
						out.print("女");
			%></td>
			<td width="100" height="20"  align="center"><%= rs.getString("birthday")%></td><td width="200" height="20"  align="center"><%= rs.getString("origin")%></td><td width="100" height="20"  align="center"><%
				sqlStr = "Select * From classinfo Where classId="+rs.getString("classId");
				//out.print(sqlStr);
				Statement stmt2 = conn.createStatement();
				ResultSet rst = stmt2.executeQuery(sqlStr);
				if(rst.next())
					out.print(rst.getString("className"));
				else
					out.print("该班级不存在");
				rst.close();					
			%></td><td width="150" height="20"  align="center"><%
				sqlStr = "Select * From specialty Where specialtyId="+rs.getString("specialty");
				rst = stmt2.executeQuery(sqlStr);
				if(rst.next())
					out.print(rst.getString("specialtyName"));
				else
					out.print("该专业不存在");
				rst.close();
				stmt2.close();
			%></td></tr>	
			<%
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