<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tzph=request.getParameter("tzph");
String ckbh=request.getParameter("ckbh");
%>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">���Ŀ���ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center" bgcolor="#D6D3CE"> 
  <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <input type="button"  value="�����ϸ��ѯ" onClick="f_do(selectform,1)">
    &nbsp;&nbsp;
    <input type="reset"  value="����">  
		<input type="hidden" name="tzph" value="<%=tzph%>">
	
	</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">���ϱ���</td>
  <td bgcolor="#FFFFCC"><input type="text" name="jxc_kcb_clbm" size="20" maxlength="13"  onkeyup="singleAdd(selectform)"></td>
  <td rowspan="4" align="right" bgcolor="#FFFFCC">
<div align="right"  valign="middle"> 
                  <p> 
                    <input type="button"  value="����" onClick="add(selectform)">
                  </p>
                  <p> 
                    <input type="button"  value="ɾ��" onClick="remove(selectform)">
                  </p>
                </div></td>
  <td rowspan="4" bgcolor="#FFFFCC">
<select name="clbmlist" size="7" multiple style="FONT-SIZE:12px;WIDTH:152px">
                </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99FFCC">���ڲֿ�</td>
  <td bgcolor="#99FFCC"><select name="jxc_kcb_ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeckbh(selectform)">
    <%
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc where ckbh='"+ckbh+"'","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99FFCC">���ڻ���</td>
  <td bgcolor="#99FFCC"><select name="jxc_kcb_hjbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changehjbh(selectform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hjbh,hjmc from jxc_hjmc where ckbh='"+ckbh+"' order by hjbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99FFCC">���ڻ�λ</td>
  <td bgcolor="#99FFCC"><select name="jxc_kcb_hwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#66CCCC">��������</td> 
  <td width="35%" bgcolor="#66CCCC"><input type="text" name="jxc_kcb_clmc" size="20" maxlength="50" ></td>
  <td width="15%" align="right" bgcolor="#66CCCC">�������</td> 
  <td width="35%" bgcolor="#66CCCC">
  <select name="jxc_kcb_cllb" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value="2">�������</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#66CCCC">���ϴ���</td> 
  <td width="35%" bgcolor="#66CCCC">
  <select name="jxc_kcb_cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(selectform)">
    <option value=""></option>
 <%
	  out.print("<optgroup label=\"���Ĵ���\"> </optgroup>");
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb='1' order by cldlmc","");
	out.print("<optgroup label=\"ͨ�ô���\"> </optgroup>");
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb='3' order by cldlmc","");
%>
  </select></td>
  <td width="15%" align="right" bgcolor="#66CCCC">����С��</td> 
  <td width="35%" bgcolor="#66CCCC">
  <select name="jxc_kcb_clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
<td width="15%" align="right" bgcolor="#66CCCC">��Ʒ��</td> 
  <td width="35%" bgcolor="#66CCCC"><input name="jxc_kcb_ppmc" type="text" id="jxc_kcb_ppmc" size="20" maxlength="50" ></td>
  <td width="15%" align="right" bgcolor="#66CCCC">&nbsp;</td> 
  <td width="35%" bgcolor="#66CCCC">
 <select name="jxc_kcb_ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#66CCCC">�ͺ�</td> 
  <td width="35%" bgcolor="#66CCCC"><input type="text" name="jxc_kcb_xh" size="20" maxlength="100" ></td>
  <td width="15%" align="right" bgcolor="#66CCCC">���</td> 
  <td width="35%" bgcolor="#66CCCC"><input type="text" name="jxc_kcb_gg" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" class="STYLE1">��������</td>
  <td><input type="text" name="scph" size="20" maxlength="50" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">��������</span> ��</td>
  <td><input type="text" name="scrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="scrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function singleAdd(FormName)
{               
	if (FormName.jxc_kcb_clbm.value=="")
	{
		return;
	}
	if (event.keyCode==13)	
	{
		add(FormName);
		FormName.jxc_kcb_clbm.value="";
		FormName.jxc_kcb_clbm.focus();
	}        
}                                                                                                                                                       

function add(FormName)//����FormName:Form������
{
	if (isExisted(FormName.clbmlist,FormName.jxc_kcb_clbm.value)!=-1){        
		alert("���ϱ���["+FormName.jxc_kcb_clbm.value+"]�ѱ�ɨ�뵽�б��У�");        
		FormName.jxc_kcb_clbm.focus() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.jxc_kcb_clbm.value;
	op1.text=FormName.clbmlist.options.length+1+":"+FormName.jxc_kcb_clbm.value;
	FormName.clbmlist.add(op1);
}
function remove(FormName)//����FormName:Form������
{
	for (var i=FormName.clbmlist.options.length-1; i>=0; i--)
	{
		if (FormName.clbmlist.options[i].selected)
		{
			FormName.clbmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.clbmlist.options.length; i++)
	{
		FormName.clbmlist.options[i].text=i+1+":"+FormName.clbmlist.options[i].value;
	}
}

//�ж��ظ�¼��                                          
  
function isExisted(o,val){//�ڳ����Ʒ�б����ж�        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value.substring(0,13)==val) return index;  
		index++;  
	}    
	return -1;    
}        
function f_do(FormName,cxlx)//����FormName:Form������
{
	if(!(isDatetime(FormName.scrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.scrq2, "��������"))) {
		return false;
	}
	FormName.action="Jxc_kcbCxList.jsp";
	FormName.submit();
	return true;

}
//-->
<!--

//��ʼ��Ajax����������������������������������������������ʼ���̶����벻��ı�
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
function openAjax2(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax2;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function openAjax3(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax3;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function openAjax4(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax4;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function responseAjax4() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax4(retStr);
		}
		else
		{	
			alert("����Ajax��Ӧʧ�ܣ�");
		}
    }
//	else
//	{
//		alert(xmlHttp.readyState);
//	}
}
function openAjax5(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax5;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function responseAjax5() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax5(retStr);
		}
		else
		{	
			alert("����Ajax��Ӧʧ�ܣ�");
		}
    }
//	else
//	{
//		alert(xmlHttp.readyState);
//	}
}
function responseAjax3() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax3(retStr);
		}
		else
		{	
			alert("����Ajax��Ӧʧ�ܣ�");
		}
    }
//	else
//	{
//		alert(xmlHttp.readyState);
//	}
}
function responseAjax2() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax2(retStr);
		}
		else
		{	
			alert("����Ajax��Ӧʧ�ܣ�");
		}
    }
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
			alert("����Ajax��Ӧʧ�ܣ�");
		}
    }
}
//��ʼ��Ajax������������������������������������������


function changeClxlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.jxc_kcb_clxlbm.length=1;

	if (FormName.jxc_kcb_cldlbm.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select clxlmc mc,clxlmc from jxc_clxlbm where cldlmc='"+FormName.jxc_kcb_cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
	}
}
function changePp(FormName) //�ı������б��ֵ������Ajax
{
	FormName.jxc_kcb_ppmc.length=1;

	if (FormName.jxc_kcb_scsmc.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select ppmc mc,ppmc from jxc_ppxx where scsmc='"+FormName.jxc_kcb_scsmc.value+"' order by ppmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax2(actionStr);
	}
}

function getAjax(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect(selectform.jxc_kcb_clxlbm,ajaxRetStr);
}
function getAjax2(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect(selectform.jxc_kcb_ppmc,ajaxRetStr);
}

function changedqbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.jxc_kcb_ckbh.length=1;

	if (FormName.jxc_kcb_dqbm.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select ckbh,ckmc from jxc_ckmc where dqbm='"+FormName.jxc_kcb_dqbm.value+"' order by ckmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax3(actionStr);
	}
}

function getAjax3(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect(selectform.jxc_kcb_ckbh,ajaxRetStr);
}
function changeckbh(FormName) //�ı������б��ֵ������Ajax
{
	FormName.jxc_kcb_hjbh.length=1;

	if (FormName.jxc_kcb_ckbh.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select hjbh,hjmc from jxc_hjmc where ckbh='"+FormName.jxc_kcb_ckbh.value+"' order by hjmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax4(actionStr);
	}
}

function getAjax4(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect(selectform.jxc_kcb_hjbh,ajaxRetStr);
}

function changehjbh(FormName) //�ı������б��ֵ������Ajax
{
	FormName.jxc_kcb_hwbh.length=1;

	if (FormName.jxc_kcb_hjbh.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select hwbh,hwmc from jxc_hwmc where hjbh='"+FormName.jxc_kcb_hjbh.value+"' order by hwmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax5(actionStr);
	}
}

function getAjax5(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect(selectform.jxc_kcb_hwbh,ajaxRetStr);
}

//���ַ���ת��Ϊ�����б����ݣ���%��+�ָ�
//��ͬ��%�ָͬһ���ã��ָ�
function strToSelect(field,str)
{ 
	//����ֵ��һ���س����У���ȡ����������������������ʼ
	while (true)
	{
		if (str.substring(0,1)=="\r")
		{
			str=str.substring(1);
		}
		else if (str.substring(0,1)=="\n")
		{
			str=str.substring(1);
		}
		else{
			break;
		}
	}
	//����ֵ��һ���س����У���ȡ��������������������������������

	if (str=="")//��ֵ����
	{
		return;
	}


	if (str.substring(0,1)=="%")//��һ���ַ���%��ɾ��
	{
		str=str.substring(1);
	}
	
	//������������
	var i=0;
	field.options[i] = new Option("","" );
	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("+");
		lend=str.indexOf("%");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);

		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}
//-->
</SCRIPT>
