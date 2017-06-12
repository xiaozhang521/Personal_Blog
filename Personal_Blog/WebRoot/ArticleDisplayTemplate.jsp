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
		function getComment()
		{
			var reasult="";
			for(var i=0;i<arguments.length;++i)
			{
				//console.log(arguments[i]);
				var div=document.createElement("div");
				div.innerHTML=arguments[i];
				div.style.position="absolute";
				div.style.zIndex="2";
				div.setAttribute("id", "barrage"+i);
				var article=document.getElementById("articleSpan");
				article.appendChild(div);
				endLength=article.offsetLeft;
				var x=article.offsetWidth+endLength-div.offsetWidth;
				div.style.left=x;
				div.style.top=Math.round(Math.random()*(6-1)+1)*10;
				var speed=Math.round(Math.random()*(6-2)+2)*4.5;
				setTimeout("barrageMove("+x+","+i+","+speed+")",100);
			}
		}
		function barrageMove(x,num,speed)
		{
			var div=document.getElementById('barrage'+num);
			console.log(num)
			console.log(div.offsetLeft);
			div.style.left=x;
			x=x-speed;
			if(x<endLength) {document.getElementById("articleSpan").removeChild(div);console.log("end"+num);return;}
			setTimeout("barrageMove("+x+","+num+","+speed+")",100);
		}
	</script>
  </head>
  <% ArrayList<String> commentList=(ArrayList<String>) request.getAttribute("filecomment");%>
  <body onload="getComment(<%
  	for(int i=0;i<commentList.size();++i)
  	{if(i==0)
  		out.print("'");
  	else out.print(",'"); 
  		out.print(commentList.get(i)+"'");}
   %>)" >
    <jsp:include page="./lib/MenuReuse.html"></jsp:include>
    <div id="page"  >
    	<div id="articleSpan" >
    	<% 	String fileType=(String)request.getAttribute("filetype");
    		if(fileType.equals("notes"));
    		String urlPath="./Notes/p/"+(String)request.getAttribute("filename"); 
    	%>
    	<jsp:include page="<%=urlPath%>"  />
    	</div>
    	<div id="commentSpan" >
    		<h3>评论</h3>
    		<%
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
