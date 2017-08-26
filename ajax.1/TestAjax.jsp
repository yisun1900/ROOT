<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>



<body bgcolor="#FFFFFF" onload="selectform.inName.select()" style="FONT-SIZE:14" >

<form method="post" action="" name="selectform" target="_blank">


<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCFF" style="FONT-SIZE:12;HEIGHT:26"> 
  <td > 
	输入姓名<img src="/images/168.gif" > 
	
	<input type="text" name="inName" id="txt" size="50" maxlength="100" style='position:absolute; WIDTH:300;left:80; top:20; z-index:2' onKeyUp="changheIn(selectform);">
	
	<div style='position:absolute; WIDTH:300; left: 80; top:40; z-index:2' id='cen'> 
		<select name="xhlist" id="sel" style="FONT-SIZE:12px;WIDTH:100%;display:none" size="20" onKeyUp="changeItem(selectform,this)" onclick ="selectCk(selectform,this)">
		</select>
	</div>
  </td>
</tr>

	
</table>


</form>	

</body>
</html>




<SCRIPT language=javascript >
<!--

	//Ajax的基础函数，不需修改＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	function creatAjax() 
	{
	   if(window.XMLHttpRequest)
		{ 
			xmlHttp = new XMLHttpRequest();
		}
		else if (window.ActiveXObject)
		{
			try
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch (e)
			{
				try
				{
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch (e)
				{
				}
			}
		}
	}

	function openAjax(actionStr) 
	{
		creatAjax();
		xmlHttp.onreadystatechange = responseAjax;
		xmlHttp.open("GET",actionStr, true);
	   xmlHttp.send(null);
	}

	function responseAjax() 
	{
		if (xmlHttp.readyState == 4)
		{	
			if(xmlHttp.status == 200)
			{
				var retStr = xmlHttp.responseText;
				getAjax(retStr);
			}
			else
			{	
				alert("错误！Ajax响应失败！");
			}
		}
	}

	//Ajax的基础函数，不需修改＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	var xhsz;
	var xhsz2;
	var len;

	var oldtext;

	var mark="";

	//动态改变下拉框的位置，使它保持居中
	function Alors()
	{
		document.getElementById("txt").style.left=80;
		document.getElementById("cen").style.left=document.getElementById("txt").style.left;
	}

	Time=window.setInterval("Alors()",10);

	//当在下拉框外单击时，下拉框消失
	document.onclick=function()
	{
		selectform.xhlist.style.display='none';
	}

	//处理Ajax的返回值，返回值是个字符串，保存在ajaxRetStr中
	function getAjax(ajaxRetStr) 
	{
		//去除前面的换行符
		while (true)
		{
			if (ajaxRetStr.substring(0,1)=="\r")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else if (ajaxRetStr.substring(0,1)=="\n")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else{
				break;
			}
		}

		//生成下拉框
		selectform.xhlist.length=0;//清除下拉框数据

		if (ajaxRetStr!="")
		{
			xhsz=ajaxRetStr.split("^");
			len=xhsz.length;

			selectform.xhlist.style.display='block';//显示下拉框

			for(var i=0;i<len;i++)
			{
				selectform.xhlist.size=len;

				var pos=xhsz[i].indexOf("~");
				var lsvalue=xhsz[i].substring(0,pos);
				var lstext=xhsz[i].substring(pos+1,xhsz[i].length);

				var op1=document.createElement("option");
				op1.value=lsvalue;
				op1.text=lstext;
				selectform.xhlist.add(op1);
			}
		}
		else{
			selectform.xhlist.style.display='none';//隐藏下拉框
		}

	}

	//输入框【姓名】录数据触发事件
	function changheIn(FormName)
	{   
//		alert(event.keyCode);
		
		//击【回车】键
		if(event.keyCode==13)
		{
			selectform.xhlist.style.display='none';

		}
		//击【上箭头】键
		else if(event.keyCode==38)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[FormName.xhlist.length-1].selected=true;
			mark="last";

			oldtext=FormName.inName.value;

			FormName.inName.value=FormName.xhlist.options[FormName.xhlist.length-1].text;
		}
		//击【下箭头】键
		else if(event.keyCode==40)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[0].selected=true;
			mark="first";

			oldtext=FormName.inName.value;

			FormName.inName.value=FormName.xhlist.options[0].text;
		}
		//击【其它】键
		else{
			if(FormName.inName.value=="") 
			{
				selectform.xhlist.style.display='none';
				return;
			}

			//执行Ajax查询
			actionStr="GetXhListByAjax.jsp?inName="+FormName.inName.value ;
	//		window.open(actionStr);
			openAjax(actionStr);  
		}

	}                                                                                                                                                       

	//下拉框触发事件
	function changeItem(FormName,field)
	{
		//击【上箭头】键
		if(event.keyCode==38)
		{
			if (mark=="last")
			{
				mark="";
			}

			FormName.inName.value=field.options[field.selectedIndex].text;

			if (field.selectedIndex==0)
			{
				if (mark=="first")
				{
					field.value="";
					mark="";

					FormName.inName.value=oldtext;

					FormName.inName.focus();
				}
				else{
					mark="first";
				}
			}
		}
		//击【下箭头】键
		else if(event.keyCode==40)
		{
			if (mark=="first")
			{
				mark="";
			}

			FormName.inName.value=field.options[field.selectedIndex].text;

			if (field.selectedIndex==field.length-1)
			{
				if (mark=="last")
				{
					field.value="";
					mark="";

					FormName.inName.value=oldtext
					FormName.inName.focus();
				}
				else{
					mark="last";
				}
			}
		}

		//击【回车】键
		else if(event.keyCode==13)
		{
			selectform.xhlist.style.display='none';
		}
	}


	//鼠标单击下拉框触发事件
	function selectCk(FormName,field)
	{
		selectform.xhlist.style.display='none';//隐藏

		FormName.inName.value=field.options[field.selectedIndex].text;
	}




//-->
</SCRIPT>
