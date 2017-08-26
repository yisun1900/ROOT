<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));

String dqbm=cf.executeQuery("select dqbm from jxc_rkd where rkph='"+rkph+"'");

%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF"  onLoad="insertform.xh.focus();" >
<form method="post" action="SaveInsertXh.jsp" name="insertform" target="_back">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">内部编码</td> 
  <td colspan="3"><input type="text" name="xh" id="txt" size="40" maxlength="100"  onKeyup="changheIn(insertform,this);" onDblClick="changheIn2(insertform,this);" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'">
  数量：<input type="text" name="sl" value="0" size="8" maxlength="50" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'" onKeyup="ksl(insertform);">
  <input type="button" name="cp" value=" 存 盘 " onClick="f_do(insertform)" onKeyup="kcp(insertform);">
  <!--  <input type="button" name="tj" value="提交采购计划" onClick="f_tj(insertform)"> -->
  <input type="hidden" name="dqbm" value="<%=dqbm%>" size="20" maxlength="50" readonly>
  <input type="hidden" name="clbm" value="" size="20" maxlength="50" readonly>
  <input type="hidden" name="rkph" value="<%=rkph%>" size="20" maxlength="50" readonly>
	
	<div style='position:absolute; WIDTH:153; left: 80; top:40; z-index:2' id='cen'> 
		<select name="xhlist" id="sel" style="FONT-SIZE:12px;WIDTH:100%;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
		</select>
	</div></td>
  </tr>
</tr>
    <tr align="center"  bgcolor="#FFFFFF"  height="300"> 
      <td colspan="4"> 
<iframe width="100%" height="100%" src="ViewJxc_cljgb2.jsp" name="centerframe" marginwidth="0" marginheight="0" scrolling="NO" FrameBorder="0"> 
            <p>产品信息查询 
            </iframe> 
	</td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
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
				var retStr2 = xmlHttp.responseText;
				getAjax(retStr2);
			}
			else
			{	
				alert("没有找到匹配结果！");
			}
		}
	}

	//Ajax的基础函数，不需修改＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	var xhsz;
	var xhsz2;
	var len;
	var bmvalue;

	var oldtext;

	var mark="";
	var inputthis;

	//当在下拉框外单击时，下拉框消失
	document.onclick=function()
	{
		insertform.xhlist.style.display='none';
	}

	//处理Ajax的返回值，返回值是个字符串，保存在ajaxRetStr2中
	function getAjax(ajaxRetStr2) 
	{
		//去除前面的换行符
		while (true)
		{
			if (ajaxRetStr2.substring(0,1)=="\r")
			{
				ajaxRetStr2=ajaxRetStr2.substring(1);
			}
			else if (ajaxRetStr2.substring(0,1)=="\n")
			{
				ajaxRetStr2=ajaxRetStr2.substring(1);
			}
			else{
				break;
			}
		}

		//生成下拉框
		insertform.xhlist.length=0;//清除下拉框数据

		if (ajaxRetStr2!="")
		{
			xhsz=ajaxRetStr2.split("^");
			len=xhsz.length;

			insertform.xhlist.style.display='block';//显示下拉框
			for(var i=0;i<len;i++)
			{
				if (len>10)
				{insertform.xhlist.size=10;}
				else
				{insertform.xhlist.size=len;}				

				var pos=xhsz[i].indexOf("~");
				var lsvalue=xhsz[i].substring(0,pos);
				var lstext=xhsz[i].substring(pos+1,xhsz[i].length);

				var op1=document.createElement("option");
				op1.value=lsvalue;
				op1.text=lstext;
				insertform.xhlist.add(op1);
				if (i==0)
				{
					bmvalue=lsvalue;
				}
			}
//		document.getElementById("txt").style.left=80;
//		document.getElementById("cen").style.left=document.getElementById("txt").offsetLeft;
		e=document.getElementById("txt");
		var   t=e.offsetTop;   
		var   l=e.offsetLeft;   
		while(e=e.offsetParent){   
		t+=e.offsetTop;   
		l+=e.offsetLeft;   
		}   
//		alert("top="+t+"/nleft="+l);   
		document.getElementById("cen").style.left=l;
		document.getElementById("cen").style.top=t+document.getElementById("txt").clientHeight+4;
		document.getElementById("cen").style.width=document.getElementById("txt").clientWidth+4;
//		document.getElementById("sel").style.width=document.getElementById("txt").clientWidth+4;

			
		}
		else{
			insertform.xhlist.style.display='none';//隐藏下拉框
		}

	}
		//输入框【姓名】录数据触发事件
	function changheIn(FormName,ithis2)
	{   
		if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
		inputthis=ithis2;  
//		alert(event.keyCode);
		
		//击【回车】键
		if(event.keyCode==13)
		{
			if (FormName.clbm.value=="")
			{FormName.clbm.value=bmvalue;}
//			FormName.clbm.value="111";
//			FormName.clbm.value=bmvalue;
			insertform.xhlist.style.display='none';
			FormName.sl.value="";
			FormName.sl.focus();
			FormName.target="centerframe";
			FormName.action="ViewJxc_cljgb.jsp?";
			FormName.submit();

		}
		//击【上箭头】键
		else if(event.keyCode==38)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[FormName.xhlist.length-1].selected=true;
			mark="last";

			oldtext=FormName.xh.value;

			FormName.xh.value=FormName.xhlist.options[FormName.xhlist.length-1].text;
			FormName.clbm.value=FormName.xhlist.value;
		}
		//击【下箭头】键
		else if(event.keyCode==40)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[0].selected=true;
			mark="first";

			oldtext=FormName.xh.value;

			FormName.xh.value=FormName.xhlist.options[0].text;
			FormName.clbm.value=FormName.xhlist.value;
		}
		//击【其它】键
		else{
			if(FormName.xh.value=="") 
			{
				insertform.xhlist.style.display='none';
				return;
			}

			//执行Ajax查询
			actionStr="GetNbbmListByAjax.jsp?dqbm="+FormName.dqbm.value+"&xh="+FormName.xh.value;
			window.open(actionStr);
			openAjax(actionStr);  
		}

	}                       

	//输入框【姓名】录数据触发事件
	function changheIn2(FormName,ithis)
	{   
		if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
		inputthis=ithis;
//		alert(event.keyCode);
		
		//击【回车】键
		if(event.keyCode==13)
		{
			FormName.xh.focus();
			insertform.xhlist.style.display='none';

		}
		//击【上箭头】键
		else if(event.keyCode==38)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[FormName.xhlist.length-1].selected=true;
			mark="last";

			oldtext=FormName.xh.value;

			FormName.xh.value=FormName.xhlist.options[FormName.xhlist.length-1].text;
			FormName.clbm.value=FormName.xhlist.value;
		}
		//击【下箭头】键
		else if(event.keyCode==40)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[0].selected=true;
			mark="first";

			oldtext=FormName.xh.value;

			FormName.xh.value=FormName.xhlist.options[0].text;
			FormName.clbm.value=FormName.xhlist.value;
		}
		//击【其它】键
		else{
//			if(FormName.xh.value=="") 
//			{
//				insertform.xhlist.style.display='none';
//				return;
//			}

			//执行Ajax查询
			actionStr="GetNbbmListByAjax.jsp?dqbm="+FormName.dqbm.value+"&xh="+FormName.xh.value+"&cglb="+FormName.cglb.value+"&cllb="+FormName.cllb.value ;
//			window.open(actionStr);
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

			FormName.xh.value=field.options[field.selectedIndex].text;
			FormName.clbm.value=FormName.xhlist.value;

			if (field.selectedIndex==0)
			{
				if (mark=="first")
				{
					field.value="";
					mark="";

					FormName.xh.value=oldtext;

					FormName.xh.focus();
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

			FormName.xh.value=field.options[field.selectedIndex].text;
			FormName.clbm.value=FormName.xhlist.value;

			if (field.selectedIndex==field.length-1)
			{
				if (mark=="last")
				{
					field.value="";
					mark="";

					FormName.xh.value=oldtext
					FormName.xh.focus();
				}
				else{
					mark="last";
				}
			}
		}

		//击【回车】键
		else if(event.keyCode==13)
		{
			FormName.xh.focus();
			insertform.xhlist.style.display='none';
		}
	}


	//鼠标单击下拉框触发事件
	function selectCk(FormName,field)
	{
		insertform.xhlist.style.display='none';//隐藏
		FormName.xh.focus();
		FormName.xh.value=field.options[field.selectedIndex].text;
		FormName.clbm.value=FormName.xhlist.value;
	}
function ksl(FormName)
	{  
		//击【回车】键
		if(event.keyCode==13)
		{
			if(	javaTrim(FormName.xh)=="") {
			alert("请输入[型号]！");
			FormName.xh.focus();
			return false;
			}
			if(	javaTrim(FormName.sl)=="") {
			alert("请输入[数量]！");
			FormName.sl.focus();
			return false;
			}
			if(!(isFloat(FormName.sl, "数量"))) {
			return false;
			}
			if (FormName.sl.value=="0")
			{
				alert("[数量]不能为0！");
				FormName.sl.select();
				return false;
			}
			FormName.cp.focus();

		}
	}
function kcp(FormName)//参数FormName:Form的名称
{
	//击【回车】键
	if(event.keyCode==13)
	{
		f_do("insertform");
	}
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[型号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
	return false;
	}
	if (FormName.sl.value=="0")
	{
		alert("[数量]不能为0！");
		FormName.sl.select();
		FormName.xh.focus();
		return false;
	}

	FormName.target="tjmain2";
	FormName.action="SaveInsertXh.jsp";
	FormName.submit();  
//	FormName.xh.value="";
	FormName.xh.select();
	FormName.xh.focus();
	FormName.clbm.value="";
//	FormName.sl.value="0";
	return true;
}
function f_tj(FormName)//参数FormName:Form的名称
{
//	alert("[数量]不能为0！");
	FormName.target="";
	FormName.action="tjcgjh.jsp";
	FormName.submit();  
	return true;
}
//-->
</SCRIPT>
