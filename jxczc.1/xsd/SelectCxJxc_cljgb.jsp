<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String xsph=request.getParameter("xsph");
String dqbm=request.getParameter("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_cljgbCxList.jsp" name="insertform">
<div align="center">���۵���ѡ����ϣ����۵��ţ�<%=xsph%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">��������</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc","");
%>
      </select>    </td>
    <td align="right">�Ƿ���</td>
    <td><input type="radio" name="sfcy" value="Y">����
      <input type="radio" name="sfcy" value="N">�ǳ���    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���۷�ʽ</td>
    <td colspan="3">
		<input type="radio" name="xsfs" value="1">����Ʒ���޿�棩
		<input type="radio" name="xsfs" value="2">�ֻ��µ����ֻ����� 
		<input type="radio" name="xsfs" value="3">����޻����µ����ֻ����� 	
		<input type="radio" name="xsfs" value="4">�������	
	</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right">���ϴ���</td>
  <td><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right">����С��</td>
  <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ʒ��</td>
  <td><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb in('1','3') order by scsmc","");
%>
  </select></td>
  <td align="right">��Ʒ��</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ϱ���</td> 
  <td width="32%"> 
    <input type="text" name="clbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"><input type="text" name="nbbm" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="clmc" size="20" maxlength="50" >��ģ����</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"><input type="text" name="xh" size="20" maxlength="100" ></td>
  <td align="right" width="18%">���</td> 
  <td width="32%"><input type="text" name="gg" size="20" maxlength="100" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">ÿҳ��ʾ����</td>
  <td><input type="text" name="myxssl" size="20" value="100"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
	  <input type="hidden" name="xsph" value="<%=xsph%>" >
    <input type="button"  value="��ѯ" onClick="f_do(insertform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
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
	FormName.clxlbm.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select clxlmc mc,clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
	}
}
function changePp(FormName) //�ı������б��ֵ������Ajax
{
	FormName.ppmc.length=1;

	if (FormName.scsmc.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select ppmc mc,ppmc from jxc_ppxx where scsmc='"+FormName.scsmc.value+"' order by ppmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax2(actionStr);
	}
}

function getAjax(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect(insertform.clxlbm,ajaxRetStr);
}
function getAjax2(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect(insertform.ppmc,ajaxRetStr);
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


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.myxssl)=="") {
		alert("��ѡ��[ÿҳ��ʾ����]��");
		FormName.myxssl.focus();
		return false;
	}
	if(!(isNumber(FormName.myxssl, "ÿҳ��ʾ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
