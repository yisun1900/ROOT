<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>


<html>
<head>
<title>��װ���Ϸ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="Bj_jzglfxbPlthList.jsp" name="insertform" target="_blank">
  <div align="center">���Ϸ����������滻����</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    
    <tr bgcolor="#FFFFCC">
      <td height="37" align="right"><span class="STYLE1">*</span>����</td>
      <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
      </select></td>
      <td align="right"><span class="STYLE1">*</span>���滻���ϱ���</td>
      <td><input type="text" name="oldglfxclbm" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="35" colspan="4" align="center" bgcolor="#99FFFF"><strong>�滻�����</strong></td>
    </tr>

    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%"><span class="STYLE2">*</span>ѡ���²�������</td>
      <td colspan="3"><input type="text" name="glfxclmc" value="" size="67" maxlength="100"  onKeyUp="changheIn(insertform)" >       </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span><span class="STYLE1">���ϱ���</span></td>
      <td><input type="text" name="glfxclbm" value="" size="20" maxlength="100"  readonly></td>
      <td align="right"><span class="STYLE2">*</span><span class="STYLE1">������λ</span></td>
      <td><input type="text" name="jldwbm" value="" size="20" maxlength="20" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">
		<select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
	  </select>&nbsp;</td>
      <td align="right" width="19%"><span class="STYLE2">*</span><span class="STYLE1">����</span></td>
      <td width="31%"><input type="text" name="dj" value="" size="20" maxlength="17" readonly></td>
    </tr>
    <tr align="center"> 
      <td height="40" colspan="4"> 
        <input type="button" onClick="f_do(insertform)"  value="�����滻" name="th">
        <input type="button"  value="�鿴���滻������Ŀ" onClick="f_ck(insertform)"></td>
    </tr>
  </table>




</form>

</body>
</html>




<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%
	cf.ajax(out);//����AJAX
%>

var lx;
//�����������ⵥ��ʱ����������ʧ
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}


//�ı�����ֵ
function changheIn(FormName)
{   
	if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//�ϼ�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.glfxclmc.value;

		var valueStr=FormName.valuelist.options[FormName.valuelist.length-1].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.glfxclmc.value;

		var valueStr=FormName.valuelist.options[0].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;
	}
	else{//������
		if(javaTrim(FormName.glfxclmc)=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

//		alert("ddd");

		//��ȡ�ͺ��б�
		var actionStr="GetListByAjaxClbm.jsp?dqbm=<%=dqbm%>&invalue="+FormName.glfxclmc.value;

//		window.open(actionStr);
		lx="1";
		openAjax(actionStr);  
	}

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		//ȥ��ǰ��Ļ��з�
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

		//����������
		insertform.valuelist.length=0;

		if (ajaxRetStr!="")
		{
			insertform.valuelist.style.display='block';
			strToItem3(insertform.valuelist,ajaxRetStr);
		}
		else{
			insertform.valuelist.style.display='none';
		}
	}

}

//�ı���������Ŀ
function changeItem(FormName,field)
{
	if(event.keyCode==38)//�ϼ�ͷ
	{
		if (mark=="last")
		{
			mark="";
		}

		var valueStr=field.options[field.selectedIndex].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext;

				FormName.glfxclmc.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		if (mark=="first")
		{
			mark="";
		}

		var valueStr=field.options[field.selectedIndex].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext
				FormName.glfxclmc.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
		FormName.glfxclmc.focus();
	}
}

//˫����������Ŀ
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	var valueStr=field.options[field.selectedIndex].text;

		//����
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//����
		pos=valueStr.indexOf("��/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//������λ
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

	FormName.glfxclmc.focus();
}



function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.oldglfxclbm)=="") {
		alert("��ѡ��[���滻���ϱ���]��");
		FormName.oldglfxclbm.focus();
		return false;
	}
	
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("������[��������]��");
		FormName.glfxclmc.focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclbm)=="") {
		alert("��ѡ��[���ϱ���]��");
		FormName.glfxclbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("������[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}

	FormName.action="SavePlthClbm.jsp";
	FormName.submit();
	FormName.th.disabled=true;
	return true;
}
function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.oldglfxclbm)=="") {
		alert("��ѡ��[���滻���ϱ���]��");
		FormName.oldglfxclbm.focus();
		return false;
	}
	if (FormName.oldglfxclbm.value==FormName.oldglfxclbm.value)
	{
	}

	FormName.action="Bj_jzglfxbPlthList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
