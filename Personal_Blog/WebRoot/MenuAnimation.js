/**
 * 
 */
function mouseOverMenu(n)
{	
    var div=document.getElementsByClassName('menu-item')[n];
    div.style.background="#000000";
    var tagA=div.getElementsByTagName('a')[0];
    tagA.style.color="#ffffff";
}
function mouseOutMenu(n)
{	
    var div=document.getElementsByClassName('menu-item')[n];
    div.style.background="#ffffff";
    var tagA=div.getElementsByTagName('a')[0];
    tagA.style.color="#000000";
}
function onClickMenu(n)
{
	var div=document.getElementsByClassName('menu-item');
	for(var i=0;i<5;++i)
	{
		var tagA=div[i].getElementsByTagName('a')[0];
		var nowPageTag=tagA.getElementsByClassName('icon-star-empty')[0];
		if(nowPageTag)
		{
			tagA.removeChild(nowPageTag);
		}
	}
	var newNowPageTag=document.createElement("i");
	newNowPageTag.setAttribute("class", "icon-star-empty");
	newNowPageTag.style.float="right";
	newNowPageTag.style.fontSize="0.8em";
	newNowPageTag.style.marginTop="8px";
	div[n].getElementsByTagName("a")[0].appendChild(newNowPageTag);
}
function clickSearchButton()
{
	/*------------------background----------------------*/
	var div=document.getElementsByClassName("searchBackground")[0];
	var height=document.body.clientHeight;
	var width=document.body.clientWidth;
	div.style.height=height+"px";
	div.style.width=width+"px";
	div.style.display="block";
	/*-----------------background end----------------------*/
	div=document.getElementsByClassName("pop-up")[0];
	div.style.display="block";
	div.style.zIndex="3";
	div.style.background="#ffffff";
}
function closeSearchSpan()
{
	var div=document.getElementsByClassName("searchBackground")[0];
	div.style.display="none";
	div=document.getElementsByClassName("pop-up")[0];
	div.style.display="none";
}