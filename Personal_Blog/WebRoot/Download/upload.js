/**
 * 
 */
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
 					xhr.open("post","Download/DownloadSource.fun?filename="+file.name);
 					xhr.overrideMimeType("application/octet-stream");
 					xhr.send(reader.result);
 					xhr.onreadystatechange = function() { 
 						if (xhr.readyState == 4) { 
 							if (xhr.status == 200) { 
 								console.log("response: " + xhr.responseText);
 								//document.getElementsByClassName("loadFile")[0].style.display="none";
 								window.location.reload();
 								alert('上传完成'); 
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
function checkPassword()
{
	if(document.getElementsByName("password")[0].value='lalala')
	{
		uploadAndSubmit()
	}
	else
	{
		alert('密码错误');
	}
	var div=document.getElementById("checkID");
	div.style.display="none";
}
function enterPassword()
{
	var div=document.getElementById("checkID");
	div.style.display="block";
	var background=document.getElementsByClassName("searchBackground")[0];
	var height=document.body.clientHeight;
	var width=document.body.clientWidth;
	background.style.height=height+"px";
	background.style.width=width+"px";
	background.style.display="block";
}
function cancelCheck()
{
	var div=document.getElementById("checkID");
	div.style.display="none";
	var background=document.getElementsByClassName("searchBackground")[0];
	background.style.display="none";
}