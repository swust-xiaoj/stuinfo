<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>程序设计综合训练--示例</title>
	<link rel="stylesheet" type="text/css" href="css/easyui/easyui.css" />
	<link rel="stylesheet" type="text/css" href="css/easyui/icon.css" />
	<link rel="stylesheet" type="text/css" href="css/easyui/tabs.css" />
 	<link rel="stylesheet" type="text/css" href="css/base.css" />
 	<script type="text/javascript" src="js/easyui/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    
  </head>  
  <body>  
		<div id="container" class="easyui-layout" style="width:1260px;height:760px;padding:1px;margin-left:auto; margin-right:auto;">
			<div data-options="region:'north'" style="width:1260px;height:112px;">
			<div id="logo"></div>
				<div id="info"> 
				<a href="/stuinfo/index.jsp">返回首页</a>
			</div></div>
			<div data-options="region:'south',split:true" style="height:50px;background:#62a2d7;"></div>
			<div data-options="region:'west',split:true" title="系统菜单" style="width:180px;">
				<div class="easyui-accordion" style="width:173px;height:300px;">
					<div title="基本信息添加" data-options="iconCls:'icon-tip'" style="overflow:auto;padding:10px;">
						<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/addstuinfo.jsp')">增加学生信息</a></p>
					<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/addclassinfo.jsp')">增加班级信息</a></p>
					<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/addspecialty.jsp')">增加专业信息</a></p>
					</div><div title="基本信息修改" data-options="iconCls:'icon-tip'" style="padding:10px;">
						<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/upstudent.jsp')">学生信息修改</a></p>
						<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/upclassinfo.jsp')">班级信息修改</a></p>
						<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/upspecialty.jsp')">专业信息修改</a></p>
						</div>
					<div title="查询与更新" data-options="iconCls:'icon-tip'" style="padding:10px;">
					<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/querystu.jsp')">学生信息查询</a></p>
					<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/queryclass.jsp')">班级信息查询</a></p>
					<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/downstuinfo.jsp')">学生信息导出</a></p>
					<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/showstuinfo.jsp')">学生信息展示</a></p>
					<p><a class="easyui-linkbutton" href="javascript:void(0)" onclick="nav('/stuinfo/baseinfo/tests.jsp')">test</a></p>
					</div>
				</div>
			</div>
			<div data-options="region:'center',title:'欢迎',iconCls:'icon-ok'" style="height:100%;">
				<iframe id="iframemain" name="iframemain" src="" scrolling="no" frameBorder="0" width="100%" onload="this.height=100"></iframe>	
			</div>
		</div>
<script type="text/javascript">

	function nav(url){
		document.getElementById('iframemain').src=url;
	}
	
	function resetIframe(){  
        var iframe = document.getElementById("iframemain");  
        try{  
            var bHeight = iframe.contentWindow.document.body.scrollHeight;  
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;  
            var height = Math.max(bHeight, dHeight);  
            iframe.height =  height; 
        }catch(ex){
        	//ex.message();
        }  
    }  
   window.setInterval("resetIframe()", 200);
</script>
  </body>
</html>