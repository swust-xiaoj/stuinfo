<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="jxl.write.Label"%>
<%@page import="jxl.write.WritableSheet"%>
<%@page import="jxl.Workbook"%>
<%@page import="jxl.write.WritableWorkbook"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/easyui/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="../js/highcharts/exporting.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="container" style="min-width:700px;height:400px"></div>
<%
Connection conn = null;	
Statement stmt = null;	
String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199";  //数据库的连接接字符串
Class.forName("com.mysql.jdbc.Driver");  //注册驱动
 conn = DriverManager.getConnection(url);   //建立连接
 stmt = conn.createStatement();   //创建Statement对象
String sqlStr = "Select * From specialty";  //操作数据库的SQL字符串
ResultSet rs = stmt.executeQuery(sqlStr);  //执行查询操作
String specialList = null;
int speCount = 0;
try{
while(rs.next()){
	speCount++;
	if(specialList==null)
		specialList = "['"+rs.getString("specialtyName")+"'";
	else
		specialList = specialList+ ",'" + rs.getString("specialtyName") + "'";
}
specialList +="]";
rs.close();
}catch(SQLException e){
out.print(e.getMessage());
}
Integer count[] = new Integer[100];
for(int i=0;i<100;i++)
	count[i] = 0;
try{
	sqlStr = "Select * From baseinfo Where specialty";
	ResultSet rst = stmt.executeQuery(sqlStr);
	while(rst.next()){
	count[Integer.parseInt(rst.getString("specialty"))]++;
}
rst.close();
stmt.close();
conn.close();
}catch(SQLException e){
out.print(e.getMessage());
}
String speValue = null;
for(int i = 0;i<speCount;i++){
	if(speValue==null)
		speValue = "["+count[i];
		else
			speValue =  speValue +","+ count[i]  ;
		}
speValue+= "]";
%>
<script>
$(function () {
    $('#container').highcharts({
        chart: {
            type: 'column',
            margin: [ 50, 50, 100, 80]
        },
        title: {
            text: '西科各专业人数统计图'
        },
        xAxis: {
            categories: <%=specialList%>,
            labels: {
                rotation: -45,
                align: 'right',
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: '人数（个）'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: '人数 in 2008: <b>{point.y:.1f} 百人</b>',
        },
        series: [{
            name: 'Population',
            data: <%=speValue%>,
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    });
});				
</script>
</body>
</html>