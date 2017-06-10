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
	<script>
		function addcomment()
		{
			var from=document.forms[0];
			from.style.display="block";
			from.getElementsByTagName("textarea")[0].focus();
		}
	</script>
  </head>
  
  <body>
    <jsp:include page="./lib/MenuReuse.html"></jsp:include>
    <div id="page">
    	<div id="articleSpan">
    	<% 	String fileType=(String)request.getAttribute("filetype");
    		if(fileType.equals("notes"));
    		String urlPath="./Notes/p/"+(String)request.getAttribute("filename"); 
    	%>
    	<jsp:include page="<%=urlPath%>"  />
    	<%="asd" %>
    	</div>
    	<div id="commentSpan">
    		<h3>评论</h3>
    		<% 	ArrayList<String> commentList=(ArrayList<String>) request.getAttribute("filecomment"); 
    			for(int i=0;i<commentList.size();++i)
    				out.println("<div class=\"comments\">"+commentList.get(i)+"</div><br>");
    			if(commentList.size()==0) out.println("还没有评论，快抢沙发~~");
    		%>
    		<p style="text-align:right">[ <a  href="javascript:addcomment()" >添加评论</a> ] </p>
    		<form style="display:none" align="center" method="post"  action="DocumentAndComment.fun?filename=<%=request.getAttribute("filename") %>&filetype=notes">
    			<textarea name="comments"></textarea>
    			<button type="submit" >提交</button>
    		</form>
    	</div>
    </div>
  </body>
</html>
