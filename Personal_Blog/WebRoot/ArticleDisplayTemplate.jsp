<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ArticleDisplayTemplate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet" type="text/css" href="ArticleDispalyStyles.css">
	<link rel="stylesheet" type="text/css" href="./lib/css/font-awesome.min.css">
	<script type="text/javascript" src="./MenuAnimation.js"></script>
  </head>
  
  <body>
    <jsp:include page="./lib/MenuReuse.html"></jsp:include>
    <div id="page">
    	<div id="articleSpan">
    	<jsp:include page="./Notes/p/Html_Tag.html"></jsp:include>
    	</div>
    	<div id="commentSpan">
    		<h3>评论</h3>
    		<p style="text-align:right">[ <a href="#">添加评论</a> ] </p>
    		<form method="post" action="getComment.fun?filename=Html_Tag.html&filetype=notes">
    			<input name="comments"></input>
    			<button type="submit" >提交</button>
    		</form>
    	</div>
    </div>
  </body>
</html>
