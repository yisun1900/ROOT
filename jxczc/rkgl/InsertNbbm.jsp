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
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF"  onLoad="insertform.xh.focus();" >
<form method="post" action="SaveInsertXh.jsp" name="insertform" target="_back">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ڲ�����</td> 
  <td colspan="3"><input type="text" name="xh" id="txt" size="40" maxlength="100"  onKeyup="changheIn(insertform,this);" onDblClick="changheIn2(insertform,this);" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'">
  ������<input type="text" name="sl" value="0" size="8" maxlength="50" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'" onKeyup="ksl(insertform);">
  <input type="button" name="cp" value=" �� �� " onClick="f_do(insertform)" onKeyup="kcp(insertform);">
  <!--  <input type="button" name="tj" value="�ύ�ɹ��ƻ�" onClick="f_tj(insertform)"> -->
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
            <p>��Ʒ��Ϣ��ѯ 
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
	//Ajax�Ļ��������������޸ģ�����������������������������������������ʼ
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
				alert("û���ҵ�ƥ������");
			}
		}
	}

	//Ajax�Ļ��������������޸ģ���������������������������������������������������

	var xhsz;
	var xhsz2;
	var len;
	var bmvalue;

	var oldtext;

	var mark="";
	var inputthis;

	//�����������ⵥ��ʱ����������ʧ
	document.onclick=function()
	{
		insertform.xhlist.style.display='none';
	}

	//����Ajax�ķ���ֵ������ֵ�Ǹ��ַ�����������ajaxRetStr2��
	function getAjax(ajaxRetStr2) 
	{
		//ȥ��ǰ��Ļ��з�
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

		//����������
		insertform.xhlist.length=0;//�������������

		if (ajaxRetStr2!="")
		{
			xhsz=ajaxRetStr2.split("^");
			len=xhsz.length;

			insertform.xhlist.style.display='block';//��ʾ������
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
			insertform.xhlist.style.display='none';//����������
		}

	}
		//�����������¼���ݴ����¼�
	function changheIn(FormName,ithis2)
	{   
		if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
		inputthis=ithis2;  
//		alert(event.keyCode);
		
		//�����س�����
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
		//�����ϼ�ͷ����
		else if(event.keyCode==38)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[FormName.xhlist.length-1].selected=true;
			mark="last";

			oldtext=FormName.xh.value;

			FormName.xh.value=FormName.xhlist.options[FormName.xhlist.length-1].text;
			FormName.clbm.value=FormName.xhlist.value;
		}
		//�����¼�ͷ����
		else if(event.keyCode==40)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[0].selected=true;
			mark="first";

			oldtext=FormName.xh.value;

			FormName.xh.value=FormName.xhlist.options[0].text;
			FormName.clbm.value=FormName.xhlist.value;
		}
		//������������
		else{
			if(FormName.xh.value=="") 
			{
				insertform.xhlist.style.display='none';
				return;
			}

			//ִ��Ajax��ѯ
			actionStr="GetNbbmListByAjax.jsp?dqbm="+FormName.dqbm.value+"&xh="+FormName.xh.value;
			window.open(actionStr);
			openAjax(actionStr);  
		}

	}                       

	//�����������¼���ݴ����¼�
	function changheIn2(FormName,ithis)
	{   
		if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
		inputthis=ithis;
//		alert(event.keyCode);
		
		//�����س�����
		if(event.keyCode==13)
		{
			FormName.xh.focus();
			insertform.xhlist.style.display='none';

		}
		//�����ϼ�ͷ����
		else if(event.keyCode==38)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[FormName.xhlist.length-1].selected=true;
			mark="last";

			oldtext=FormName.xh.value;

			FormName.xh.value=FormName.xhlist.options[FormName.xhlist.length-1].text;
			FormName.clbm.value=FormName.xhlist.value;
		}
		//�����¼�ͷ����
		else if(event.keyCode==40)
		{
			FormName.xhlist.focus();
			FormName.xhlist.options[0].selected=true;
			mark="first";

			oldtext=FormName.xh.value;

			FormName.xh.value=FormName.xhlist.options[0].text;
			FormName.clbm.value=FormName.xhlist.value;
		}
		//������������
		else{
//			if(FormName.xh.value=="") 
//			{
//				insertform.xhlist.style.display='none';
//				return;
//			}

			//ִ��Ajax��ѯ
			actionStr="GetNbbmListByAjax.jsp?dqbm="+FormName.dqbm.value+"&xh="+FormName.xh.value+"&cglb="+FormName.cglb.value+"&cllb="+FormName.cllb.value ;
//			window.open(actionStr);
			openAjax(actionStr);  
		}

	}                                        

	//�����򴥷��¼�
	function changeItem(FormName,field)
	{
		//�����ϼ�ͷ����
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
		//�����¼�ͷ����
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

		//�����س�����
		else if(event.keyCode==13)
		{
			FormName.xh.focus();
			insertform.xhlist.style.display='none';
		}
	}


	//��굥�������򴥷��¼�
	function selectCk(FormName,field)
	{
		insertform.xhlist.style.display='none';//����
		FormName.xh.focus();
		FormName.xh.value=field.options[field.selectedIndex].text;
		FormName.clbm.value=FormName.xhlist.value;
	}
function ksl(FormName)
	{  
		//�����س�����
		if(event.keyCode==13)
		{
			if(	javaTrim(FormName.xh)=="") {
			alert("������[�ͺ�]��");
			FormName.xh.focus();
			return false;
			}
			if(	javaTrim(FormName.sl)=="") {
			alert("������[����]��");
			FormName.sl.focus();
			return false;
			}
			if(!(isFloat(FormName.sl, "����"))) {
			return false;
			}
			if (FormName.sl.value=="0")
			{
				alert("[����]����Ϊ0��");
				FormName.sl.select();
				return false;
			}
			FormName.cp.focus();

		}
	}
function kcp(FormName)//����FormName:Form������
{
	//�����س�����
	if(event.keyCode==13)
	{
		f_do("insertform");
	}
}
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xh)=="") {
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
	return false;
	}
	if (FormName.sl.value=="0")
	{
		alert("[����]����Ϊ0��");
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
function f_tj(FormName)//����FormName:Form������
{
//	alert("[����]����Ϊ0��");
	FormName.target="";
	FormName.action="tjcgjh.jsp";
	FormName.submit();  
	return true;
}
//-->
</SCRIPT>
