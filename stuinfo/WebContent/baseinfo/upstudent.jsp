<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息修改</title>
<link rel="stylesheet" type="text/css" href="/stuinfo/css/base.css" />
 	<script type="text/javascript" src="/stuinfo/js/easyui/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/stuinfo/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function getDelData(){
		var str = document.getElementsByName("stuId");
		var datas = "";
		for(var i=0;i<str.length;i++){
			if(str[i].checked==true){
				if(datas == "")
					datas = str[i].value;
				else
						datas = datas + "," + str[i].value;
			}
		}
		if(datas==""){
			alert("请选择！");
			return false;
		}
		else{
			$("#delids").val(datas);
		}
	}
	function getUpData(){
		var str = document.getElementsByName("stuId");
		var datas = "";
		for(var i=0;i<str.length;i++){
			if(str[i].checked==true){
				datas = str[i].value;
				break;
			}
		}
		if(datas==""){
			alert("请选择！");
			return false;
		}
		else{
			$("#upid").val(datas);
		}
	}
</script>
</head>
<body>
<%	request.setCharacterEncoding("utf-8");  %>
<p align="center" class="title">学生信息修改</p>
<div id="data_table" align="center">
	<table width="400"><tr><td><form name="updateform" action="restuinfo.jsp" method="post" onSubmit="return getUpData();"><input type="hidden" name="upid" id="upid"><input type="submit" id="upids" value="修改" /></form></td>
	<td><form name="delform" action="delstu.jsp" method="post" onSubmit="getDelData();"><input type="hidden" name="delflag" /><input type="hidden" name="delids" id="delids"><input type="submit" value="删除" /></form></td></tr></table>
	<table id="stuinfo" width="800" border="0" class="gridtable">
	<tr><th width="100" height="20">学 号</th><th width="100" height="20">姓名</th><th width="50" height="20">性别</th>
		<th width="100" height="20">出生日期</th><th width="150" height="20">籍贯</th><th width="100" height="20">班级</th><th width="100" height="20">专业</th><th width="100" height="20">操作</th></tr>
	<% 
		
		Connection conn = null;	
		Statement stmt = null;	
		ResultSet rs = null;
		String stuId = null;
		String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url); 
		stmt = conn.createStatement();
			try{
				
				String sqlStr = "Select * From baseinfo";
				rs = stmt.executeQuery(sqlStr);
				int i = 1;
				while(rs.next()){%>
					<tr><td width="100" height="20" align="center"><% stuId = rs.getString("stuId");out.print(stuId);%></td><td width="100" height="20"  align="center"><%= rs.getString("stuName")%></td><td width="50" height="20"  align="center"><%
						if(rs.getString("stuSex").equals("1"))
							out.print("男");
						else
							out.print("女");
				%></td>
				<td width="100" height="20"  align="center"><%= rs.getString("birthday")%></td><td width="150" height="20"  align="center"><%= rs.getString("origin")%></td><td width="100" height="20"  align="center"><%
					sqlStr = "Select * From classinfo Where classId="+rs.getString("classId");
					//out.print(sqlStr);
					Statement stmt2 = conn.createStatement();
					ResultSet rst = stmt2.executeQuery(sqlStr);
					if(rst.next())
						out.print(rst.getString("className"));
					else
						out.print("该班级不存在");
					rst.close();					
				%></td><td width="100" height="20"  align="center"><%
					sqlStr = "Select * From specialty Where specialtyId="+rs.getString("specialty");
					rst = stmt2.executeQuery(sqlStr);
					if(rst.next())
						out.print(rst.getString("specialtyName"));
					else
						out.print("该专业不存在");
					rst.close();
					stmt2.close();
				%></td><td width="100" height="20"  align="center"><input type="checkbox" name="stuId" value="<%=stuId %>" /></td></tr>	
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