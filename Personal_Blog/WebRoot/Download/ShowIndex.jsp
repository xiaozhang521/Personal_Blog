<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ShowIndex.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./styles.css">
	<link rel="stylesheet" type="text/css" href="./lib/css/font-awesome.min.css">
	<script type="text/javascript" src="./Download/upload.js">	</script>
	<script type="text/javascript" src="./MenuAnimation.js"></script>

	<link rel="stylesheet" type="text/css" href="./Download/downloadstyles.css">
	
  </head>
  
  <body>
  <jsp:include page="../lib/MenuReuse.html"></jsp:include>
  	<div id="page">
  		<h3>资源下载</h3>
  		<div id="source">
  		<%
  			String[] sourceName=(String[])request.getAttribute("sourcename");
  			for(int i=0;i<sourceName.length;++i)
  			{
  				out.println("<a href=\"./Download/Source/"+sourceName[i]+"\">"+sourceName[i]+"</a><br>");
  			}
  		%>
  		</div>
  		<h3>资源上传</h3>
  		<div class="loadFile"  >
   				<form id="upLoadFile" method="post" action="javascript:enterPassword();">
   					<p>选择上传文件</p><input	type="file"></input>
   					<button type="submit" >确定</button>
   					<button onclick="cancelLoadFile()" >取消</button>
   				</form>
   				<div>Progessing (in Bytes): <span id="bytesRead"> 
 					</span> / <span id="bytesTotal"></span> <i class="icon-spinner icon-spin" style="Visibility:hidden" ></i> 
 				</div>
   		</div>
   		<div class="searchBackground" style="display:none" ></div>
   		<div id="checkID" style="display:none">
   			<form action="javascript:checkPassword();">
   			<p>输入密码</p><input type="password" name="password"></input><button onclick="checkPassword" >确定</button><button onclick="cancelCheck()" >取消</button>
   			</form>
   		</div>
    </div>
  </body>
</html>
