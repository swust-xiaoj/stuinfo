<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="jxl.*"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

try{
	String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199&useUnicode=true&characterEncoding=utf-8";  //数据库的连接接字符串
	Class.forName("com.mysql.jdbc.Driver");  //注册驱动
	Connection conn = DriverManager.getConnection(url);   //建立连接
	Statement stmt = conn.createStatement();   //创建Statement对象
	
	
	Workbook book = Workbook.getWorkbook(new File("d:baseinfo.xls"));
	
	Sheet sheet = book.getSheet(0);
	int columnum = sheet.getColumns();
	int rownum = sheet.getRows();
	 for (int i = 1; i < rownum; i++) {
		 String sqlStr =  "Insert Into baseinfo (stuId,stuName,stuSex,birthday,origin,classId,specialty) Values(";
		for (int j=0;j<columnum;j++) {
			Cell cell = sheet.getCell(j,i);
			String result = cell.getContents();
			if(j==0||j==1)
                sqlStr=sqlStr+"'"+result+"',";
            else if(j==2)
       	     sqlStr=sqlStr+Integer.valueOf(result);
            else if(j==3||j==4)
       	      sqlStr=sqlStr+",'"+result+"'";
            else if(j==5||j==6)
       	      sqlStr=sqlStr+","+Integer.valueOf(result);

		}
		sqlStr+=")";
		

		out.print(sqlStr);
		stmt.executeUpdate(sqlStr);
		System.out.println("");
		}
	book.close();
	conn.close();
	stmt.close();
		}catch(Exception e){
	out.print(e.getMessage());
}
%>
</body>
</html>