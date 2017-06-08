/**
 * 
 */

function mouseOnList(n)
{
	var div=document.getElementById('htmlDocument');
	var list=div.getElementsByTagName("li")[n];
	list.style.opacity="1";
}
function mouseLeaveList(n)
{
	var div=document.getElementById('htmlDocument');
	var list=div.getElementsByTagName("li")[n];
	list.style.opacity="0.6";
}
function showLoadFile()
{
	document.getElementsByClassName("loadFile")[0].style.display="block";
	var div=document.getElementsByClassName("searchBackground")[0];
	var height=document.body.clientHeight;
	var width=document.body.clientWidth;
	div.style.height=height+"px";
	div.style.width=width+"px";
	div.style.display="block";
}
function cancelLoadFile()
{
	document.getElementsByClassName("loadFile")[0].style.display="none";
	document.getElementsByClassName("searchBackground")[0].style.display="none";
}
function uploadAndSubmit()
{
	var form=document.forms["upLoadFile"];
	var input=form.getElementsByTagName('input')[0]; 
	if(input.files.length>0)
	{
		var file=input.files[0];
		var reader=new FileReader();
		if(file.size>31457280)
		{
			alert('file too large');
		}
		else
		{
			reader.onloadstart = function()
			{
				document.getElementById("bytesTotal").textContent = file.size; 
			 	document.getElementsByClassName("icon-spin")[0].style.visibility="visible";
			}
			reader.onprogress = function(p) { 
 				document.getElementById("bytesRead").textContent = p.loaded; 
 			}
 			reader.onloadend =function()
 			{
 				if(reader.error)
 				{
 					console.log(reader.error);
 				}
 				else 
 				{
 					document.getElementsByClassName("icon-spin")[0].style.visibility="hidden";
 					var xhr=new XMLHttpRequest();
 					xhr.open("post","AddFile.fun?filename="+file.name);
 					xhr.overrideMimeType("application/octet-stream");
 					xhr.send(reader.result);
 					xhr.onreadystatechange = function() { 
 						if (xhr.readyState == 4) { 
 							if (xhr.status == 200) { 
 								console.log("response: " + xhr.responseText);
 								//document.getElementsByClassName("loadFile")[0].style.display="none";
 								window.location.reload();
 								alert('upload complete'); 
 							}
 						}
 					}
 				}
 			}
 			reader.readAsArrayBuffer(file);
 		}
	}
	else alert("please choose the file");
}