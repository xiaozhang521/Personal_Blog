/**
 * 
 */
function addcomment()
{
	var from=document.forms[0];
	from.style.display="block";
	from.getElementsByTagName("textarea")[0].focus();
}
function setBarrageMove(comment,i)
{
	var div=document.createElement("div");
	div.innerHTML=comment;
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
function getComment()
{
	for(var i=0;i<arguments.length;++i)
	{
		var comment=arguments[i];
		(function(i,comment){
		//console.log(arguments[i]);
		if(4<=i%8) {setTimeout(function(){setBarrageMove(comment,i);},1000);}
		else 
			setBarrageMove(comment,i);})(i,comment);
	}
}
function barrageMove(x,num,speed)
{
	var div=document.getElementById('barrage'+num);
	div.style.left=x;
	x=x-speed;
	if(x<endLength) {document.getElementById("articleSpan").removeChild(div);return;}
	setTimeout("barrageMove("+x+","+num+","+speed+")",100);
}