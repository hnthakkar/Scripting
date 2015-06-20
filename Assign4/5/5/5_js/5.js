// JavaScript Document
var turn=0; // 0 when anonymous user1, 1 one anonymous user2
function checkKey(e)
{
	var key=e.keyCode || e.which;
  	if (key==13)
	{
		updateStatus();
    }
}


function updateStatus()
{
	status=document.getElementById("statusBox").value;
	document.getElementById("statusBox").value='';
	pattern=/\S/; // \S means negation of space characters, thats why checking false condititon below
	testresult=pattern.test(status);
	
	if(false==testresult)
	{
		return false;
	}
	
	var newdiv=document.createElement("div");
	newdiv.setAttribute("class","statusblock");

	parent=document.getElementById("newsfeed");
	parent.insertBefore(newdiv, parent.firstChild);
	
	var divHeader=document.createElement("div");
	divHeader.setAttribute("class","headerBlock");
	var DP=document.createElement("img");
	var heading=document.createElement("h1");
	var userStatus=document.createElement("h3");
	var timestamp=document.createElement("p");
	userStatus.innerHTML=status;
	var now= new Date();
	day=now.getDate();
	month=now.getMonth();
	year=now.getFullYear();
	timestamp.innerHTML=day+"-"+month+"-"+year;
	if (turn==0)
	{
		DP.src="5_images/anonymousUser_1.jpg";
		heading.innerHTML="AnonymousUser_1";
		turn=1;
	}
	else
	{
		DP.src="5_images/anonymousUser_2.jpg";
		heading.innerHTML="AnonymousUser_2";
		turn=0;
	}
	
	divHeader.appendChild(DP);
	divHeader.appendChild(heading);
	divHeader.appendChild(timestamp);
	newdiv.appendChild(divHeader);
	newdiv.appendChild(userStatus);
	
	var commentarea=document.createElement("div");
	commentarea.setAttribute("class","comment-area");
	newdiv.appendChild(commentarea);
	
	var commentlink = document.createElement("a");
	commentlink.setAttribute("class","comment-link");
	commentlink.setAttribute("href","#");
	commentlink.setAttribute("onClick","createcommentbox(this)");
	commentlink.innerHTML="Comment";
	commentarea.appendChild(commentlink);
	
	
	var likelink=document.createElement("a");
	likelink.setAttribute("class","like-link");
	likelink.setAttribute("href","#");
	likelink.innerHTML="Like";
	likelink.setAttribute("onClick","incrementLikeCount(this)")
	commentarea.appendChild(likelink);
	
	var likeimage=document.createElement("img");
	likeimage.src="5_images/like_button.jpeg";
	likeimage.setAttribute("class","like-image");
	likeimage.style.width="20px";
	likeimage.style.height="21px";
	likeimage.style.border="none";
	likeimage.style.display="inline";
	likeimage.style.marginBottom="-5px";
	likeimage.style.cssFloat="none";
	commentarea.appendChild(likeimage);
	
	var likecount=document.createElement("input");
	likecount.setAttribute("class","like-count");
	likecount.setAttribute("type","text");
	likecount.setAttribute("size","1");
	likecount.readOnly=true;
	likecount.value=0;
	commentarea.appendChild(likecount);
	
	var commentinputcount = document.createElement("div");
	commentinputcount.setAttribute("class","commentinputboxcount");
	commentinputcount.hidden=true;
	commentinputcount.innerHTML=0;
	commentarea.appendChild(commentinputcount);
}


function createcommentbox(info)
{
	divinfo=info.parentNode;
	if (divinfo.getElementsByClassName("commentinputboxcount")[0].innerHTML=="1")
	{
		return false;
	}
	else
	{
		var commentbox=document.createElement("input");
		commentbox.setAttribute("type","text");
		commentbox.setAttribute("class","comment-box");
		commentbox.setAttribute("onKeyPress","commentupdate(event,this)");
		commentbox.setAttribute("placeholder","write your commment here");
		divinfo.appendChild(commentbox);
		divinfo.getElementsByClassName("commentinputboxcount")[0].innerHTML=1;
		
	}
	
	
}

function commentupdate(e,info)
{
	var divinfo=info;
	var key=e.keyCode || e.which;
  	if (key==13)
	{
		var comment=document.createElement("div");
		var text = document.createElement("p");
		text.innerHTML=divinfo.value;
		text.style.fontSize="16px";
		comment.appendChild(text);
		var timestamp=document.createElement("h2");
		var now= new Date();
		day=now.getDate();
		month=now.getMonth();
		year=now.getFullYear();
		timestamp.innerHTML=day+"-"+month+"-"+year;
		comment.setAttribute("class","comment");
		divinfo.parentNode.appendChild(comment);
		timestamp.style.color="#CCC";
		timestamp.style.fontSize="12px";
		comment.appendChild(timestamp);
		divinfo.parentNode.getElementsByClassName("commentinputboxcount")[0].innerHTML=0;
		divinfo.parentNode.removeChild(divinfo);
		
    }
	
}


function incrementLikeCount(info)
{
	var divinfo=info.parentNode;
	var likecount=divinfo.getElementsByClassName("like-count")[0].value;
	likecount++;
	divinfo.getElementsByClassName("like-count")[0].value=likecount;
	
}