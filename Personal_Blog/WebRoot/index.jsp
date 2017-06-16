<%@ page language="java" import="java.util.*,com.model.LatestUpdate" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ZYH'Blog</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./styles.css">
    <link rel="stylesheet" type="text/css" href="./lib/css/font-awesome.min.css">
    <script type="text/javascript" src="MenuAnimation.js"></script>
  </head>
  
  <body onload="onClickMenu(0)" >
   <jsp:include page="./lib/MenuReuse.html" ></jsp:include>
   <% String webPath=(String)application.getRealPath("/");
   	  LatestUpdate latestArticle=new LatestUpdate();
   	  String fileName=latestArticle.searchLatestFlie(webPath);
   	%>
  	<div id="page">
  		<h2>最近更新</h2>
  		<div id="articleSpan" >
  		<h3>
  		<%	
  			String fileType=latestArticle.getType();
  			out.println("<a href=\"./DocumentAndComment.fun?filename="+fileName+"&filetype="+fileType);
  		  	out.println("\">"+fileName+"</a>");
  		%>
  		</h3>
  		<%
		 	String urlPath="";
    		if(!fileName.isEmpty()) 
   	  		{
    			if(fileType.equals("notes"));
    			urlPath="./Notes/p/"+fileName; 
   	  		}
   	  		else out.println("暂无文章");
    	%>
    	<!--bug  -->
    	<jsp:include page="<%=urlPath%>"  />
    	</div>
  	</div>
  	<div id="footer">
  	</div>
  </body>
</html>
