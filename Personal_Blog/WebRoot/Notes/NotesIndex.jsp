<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'NotesIndex.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./styles.css">
	<link rel="stylesheet" type="text/css" href="./Notes/Notesstyles.css">
	<link rel="stylesheet" type="text/css" href="./lib/css/font-awesome.min.css">
	<script type="text/javascript" src="./MenuAnimation.js"></script>
	<script type="text/javascript" src="./Notes/NotesShowAndUpload.js"></script>
  </head>
  
  <body onload="onClickMenu(1)" >
  	<jsp:include page="../lib/MenuReuse.html"></jsp:include>
  	<div id="page">
  		<button style="float:right; margin-right:20px" onclick="showLoadFile()" >新建</button>
  		<h2 >笔记分类</h2>
  		<div id="htmlDocument">
  			<h3>html笔记</h3>
   			<% String[] htmlArticle=(String[])request.getAttribute("html");
   				if(htmlArticle!=null)
   				{
   					for(int i=0;i<htmlArticle.length;++i)
   						out.println("<li><a onmouseover=\"mouseOnList("+i+")\" onmouseout=\"mouseLeaveList("+i+")\" href=\""+"./Notes/p/"+htmlArticle[i]+"\">"+htmlArticle[i]+"</a></li>");
   				}
   			%>
   		   	<div class="searchBackground" style="display:none;" ></div>
   			<div class="loadFile"  >
   				<form id="upLoadFile" method="post" action="javascript:uploadAndSubmit();">
   					<p>load file</p><input	type="file"></input>
   					<button type="submit" >确定</button>
   					<button onclick="cancelLoadFile()" >取消</button>
   				</form>
   				<div>Progessing (in Bytes): <span id="bytesRead"> 
 					</span> / <span id="bytesTotal"></span> <i class="icon-spinner icon-spin" style="Visibility:hidden" ></i> 
 				</div> 
   			</div>
   		</div>
   	</div>
  </body>
</html>
