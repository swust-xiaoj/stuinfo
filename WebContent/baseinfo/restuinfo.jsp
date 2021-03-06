<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>程序设计综合训练--示例--学生信息修改</title>
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/icon.css" />
	<link rel="stylesheet" type="text/css" href="/stuinfo/css/easyui/tabs.css" />
 	<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
 	<script type="text/javascript" src="/stuinfo/js/easyui/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/stuinfo/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">	
		function check(){
			if(document.stuform.stuId.value.trim()==""){
				alert("学号没有填写!");
				document.stuform.stuId.focus();
				return false;
			}
			if(document.stuform.stuName.value.trim()==""){
				alert("姓名没有填写!");
				document.stuform.stuId.focus();
				return false;
			}
			if(document.stuform.birthday.value.trim()==""){
				alert("出生日期没有填写!");
				document.stuform.stuId.focus();
				return false;
			}
		}
	</script>
</head>
<body>
  <%
	//String stuId = request.getParameter("stuId");
    String stuId = request.getParameter("upid");
    String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199";
    Class.forName("com.mysql.jdbc.Driver");  //注册驱动
	Connection conn = DriverManager.getConnection(url);   //建立连接
	Statement stmtt = conn.createStatement();   //创建Statement对象
	String sqlStr = "Select * From baseinfo Where stuId='"+stuId+"'";  //操作数据库的SQL字符串
	ResultSet rs = stmtt.executeQuery(sqlStr);  //执行查询操作
	rs.next();%>

	<p align="center" class="title">学生基本信息修改</p>
	<table border="0" align="center">
	<tr><td width="170"></td><td width="830">
	<form name="stuform" action="upstuinfo.jsp" method="post" onSubmit="return check()"><table width="720">
		<tr><td width="300" align="right">学 号：</td><td width="420"><input type="text" name="stuId" class="easyui-validatebox"value="<%=rs.getString("stuId") %>" readOnly="readonly"/></td></tr>
		<tr><td width="300" align="right">姓 名：</td><td width="420"><input type="text" name="stuName" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" class="easyui-validatebox"value="<%=rs.getString("stuName") %>" /></td></tr>
		<tr><td width="300" align="right">性别：</td><td width="420"><select name="stuSex" id="stuSex">
			<option value="1">男</option><option value="0">女</option></select></td></tr>
		<tr><td width="300" align="right">出生日期：</td><td width="420"><input type="text" name="birthday" value="<%=rs.getString("birthday") %>"class="easyui-datebox"/></td></tr>
		<tr><td width="300" align="right">籍贯：</td><td width="420"><input size="30" type="text" name="origin" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" class="easyui-validatebox" value="<%=rs.getString("origin") %>" /></td></tr>
		 <tr><td width="300" align="right">专业：</td><td width="420"><select name="specialty" id="specialty"> 
	<%
	      Statement stmt = conn.createStatement(); 
		try{
			
			String sqlStr1 = "Select * From specialty";  //操作数据库的SQL字符串
			ResultSet rs1 = stmt.executeQuery(sqlStr1);  //执行查询操作
			while(rs1.next()){  //遍历查询结果
	%>
			<option value="<%= rs1.getString("specialtyId")%>"><%= rs1.getString("specialtyName")%></option>
	<%
			}	
			rs1.close();
		}catch(SQLException e){
			out.print(e.getMessage());
		}
	%> </select>
			</td></tr>
		<tr><td width="300" align="right">班级：</td><td width="420"><select name="className" id="classId">
	<%
		try{
			String sqlStr2 = "Select * From classinfo";  //操作数据库的SQL字符串
			ResultSet rs2 = stmt.executeQuery(sqlStr2);  //执行查询操作
			while(rs2.next()){  //遍历查询结果
	%>
			<option value="<%= rs2.getString("classId")%>"><%= rs2.getString("className")%></option>
	<%
			}	
			rs2.close();
		}catch(SQLException e){
			out.print(e.getMessage());
		}
	
	       stmt.close();
%>			</select>
			</td></tr>  
	     
	<tr><td width="300" align="right"><input type="submit" value="提 交" /></td><td width="420"><input type="reset" value="重 置" /></td></tr></table></form></td></tr>

			</table>
			<script type="text/javascript">
		$("#stuSex").val(<%= rs.getString("stuSex")%>);
		$("#specialty").val(<%= rs.getString("specialty")%>);
		$("#classId").val(<%= rs.getString("classId")%>);
	</script>
    <%      rs.close();
			stmtt.close();
			conn.close();%>
</body>
</html>