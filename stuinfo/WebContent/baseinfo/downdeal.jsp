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

	<%	request.setCharacterEncoding("utf-8"); 
		
		
		Connection conn = null;	
		Statement stmt = null;	
		ResultSet rs = null;
		ArrayList<ArrayList<String>> result=new ArrayList();
	
		String url = "jdbc:mysql://localhost/stuinfo?user=root&password=20121199";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url); 
		stmt = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		String stuId = request.getParameter("stuId");		
		String count[]= request.getParameterValues("check");
		/* if(count!=null&&count.length!=0){
			out.print(count.length);
			for(int i=0;i<count.length;i++)
			out.print(count[i]);
		} */

		if(stuId==null){
			try{
				String sqlStr = "Select * From baseinfo";
				rs = stmt.executeQuery(sqlStr);
				ResultSetMetaData metaData=rs.getMetaData();
				int col=metaData.getColumnCount();
				int t=0,k=0;
				while(rs.next()){
					t++;
					if(k==count.length) break;
					ArrayList<String> ends=new ArrayList();
					if(t==Integer.parseInt(count[k])){
						k++;
					for(int i=1;i<=col;i++){
					ends.add(rs.getString(i));
					}
					result.add(ends);
					}
				}
				ArrayList<String> title=new ArrayList();
				title.add("学号");
				title.add("姓名");
				title.add("性别");
				title.add("生日");
				title.add("籍贯");
				title.add("专业");
				title.add("班级");
				
				
				WritableWorkbook workbook=Workbook.createWorkbook(new File("d:/baseinfo.xls") );
				WritableSheet writableSheet=workbook.createSheet("baseinfo", 0);
				
				
				Label label=null;
				
				for(int i=0;i<title.size();i++){
					
					label=new Label(i,0,title.get(i));
					writableSheet.addCell(label);
				}
				
				for(int i=0;i<result.size();i++){
					for(int j=0;j<result.get(i).size();j++){
						String temp=result.get(i).get(j);
						label=new Label(j,i+1,temp);
						writableSheet.addCell(label);
					}
				}
				workbook.write();
				workbook.close();
			    out.print("学生信息导出成功！");
			    //alert("学生信息导出成功！");
				rs.close(); 
				stmt.close();
				conn.close();
				
			}catch(SQLException e){
				out.print(e.getMessage());

			}
		}
			
		%>
