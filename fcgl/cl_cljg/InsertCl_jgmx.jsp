<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>�ֹ�˾</td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("	<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����</td>
      <td colspan="3">
	  <select name="clbm" style="FONT-SIZE:12PX;WIDTH:525PX">
        <%
	cf.selectItem(out,"select clbm,trim(clbm)||'��'||clmc||'��'||clgg||'��' from cl_clbm where clbm='"+clbm+"'","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>����</td>
      <td width="30%"> 
        <input type="text" name="cj" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="20%"><font color="#FF0033">*</font>�볧�ҽ����</td>
      <td width="30%"> 
        <input type="text" name="cjjsj" value="" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>�ֹ�˾���ϵ���</td>
      <td width="30%"> 
        <input type="text" name="fgsdj" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="20%"><font color="#FF0033">*</font>���Ӽ�</td>
      <td width="30%"> 
        <input type="text" name="gdj" value="" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font>�Ƿ��д���</td>
      <td width="30%"> 
        <input type="radio" name="sfycx" value="N">
        û���� 
        <input type="radio" name="sfycx" value="Y">
        �д��� </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="20%" align="right" height="2">������ʼʱ��</td>
      <td width="30%" height="2" bgcolor="#E8E8FF"> 
        <input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td width="20%" align="right" height="2">��������ʱ��</td>
      <td width="30%" height="2"> 
        <input type="text" name="cxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="20%" align="right">�����ڳ���</td>
      <td width="30%"> 
        <input type="text" name="cxcj" value="" size="20" maxlength="9" >      </td>
      <td width="20%" align="right">�������볧�ҽ����</td>
      <td width="30%"> 
        <input type="text" name="cxcjjsj" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="20%" align="right">�����ڷֹ�˾���ϵ���</td>
      <td width="30%"> 
        <input type="text" name="cxfgsdj" value="" size="20" maxlength="9" >      </td>
      <td width="20%" align="right">�����ڹ��Ӽ�</td>
      <td width="30%"> 
        <input type="text" name="cxgdj" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>�Ƿ����</td>
      <td width="30%"> 
        <input type="radio" name="sfrk"  value="Y">
        �� 
        <input type="radio" name="sfrk"  value="N">
        �� </td>
      <td align="right" width="20%">�ֿ�����</td>
      <td width="30%">
        <input type="text" name="ckmc" value="" size="20" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font><font color="#0000CC">������</font></td>
      <td width="30%"> 
        <input type="text" name="tzr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
      <td align="right" width="20%"><font color="#FF0033">*</font><font color="#0000CC">����ʱ��</font></td>
      <td width="30%"> 
        <input type="text" name="tzsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="button"  value="��������" onClick="f_exp(insertform)">
        <input type="button"  value="�����±���" onClick="f_drnew(insertform)">
        <input type="button"  value="���±���" onClick="f_edit(insertform)" >
        <input type="reset"  value="����" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.clbm)=="") {
		alert("������[���ϱ���]��");
		FormName.clbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cj)=="") {
		alert("������[����]��");
		FormName.cj.focus();
		return false;
	}
	if(!(isFloat(FormName.cj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.cjjsj)=="") {
		alert("������[�볧�ҽ����]��");
		FormName.cjjsj.focus();
		return false;
	}
	if(!(isFloat(FormName.cjjsj, "�볧�ҽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.fgsdj)=="") {
		alert("������[�ֹ�˾���ϵ���]��");
		FormName.fgsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.fgsdj, "�ֹ�˾���ϵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gdj)=="") {
		alert("������[���Ӽ�]��");
		FormName.gdj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdj, "���Ӽ�"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("��ѡ��[�Ƿ��д���]��");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxcj)=="") {
			alert("������[�����ڳ���]��");
			FormName.cxcj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcj, "�����ڳ���"))) {
			return false;
		}
		if(	javaTrim(FormName.cxcjjsj)=="") {
			alert("������[�������볧�ҽ����]��");
			FormName.cxcjjsj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcjjsj, "�������볧�ҽ����"))) {
			return false;
		}
		if(	javaTrim(FormName.cxfgsdj)=="") {
			alert("������[�����ڷֹ�˾���ϵ���]��");
			FormName.cxfgsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxfgsdj, "�����ڷֹ�˾���ϵ���"))) {
			return false;
		}
		if(	javaTrim(FormName.cxgdj)=="") {
			alert("������[�����ڹ��Ӽ�]��");
			FormName.cxgdj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxgdj, "�����ڹ��Ӽ�"))) {
			return false;
		}

		if(	javaTrim(FormName.cxkssj)=="") {
			alert("������[������ʼʱ��]��");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjzsj)=="") {
			alert("������[��������ʱ��]��");
			FormName.cxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjzsj, "��������ʱ��"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjzsj.value)
		{
			alert("[������ʼʱ��]���ܴ���[��������ʱ��]��");
			FormName.cxjzsj.select();
			return false;
		}
	}
	else{
		FormName.cxcj.value="";
		FormName.cxcjjsj.value="";
		FormName.cxfgsdj.value="";
		FormName.cxgdj.value="";
		FormName.cxkssj.value="";
		FormName.cxjzsj.value="";
	}
	
	
	if(	!radioChecked(FormName.sfrk)) {
		alert("��ѡ��[�Ƿ����]��");
		FormName.sfrk[0].focus();
		return false;
	}
	if (FormName.sfrk[0].checked)
	{
		if(	javaTrim(FormName.ckmc)=="") {
			alert("������[�ֿ�����]��");
			FormName.ckmc.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.ckmc)!="") {
			alert("����Ҫ����[�ֿ�����]��");
			FormName.ckmc.select();
			return false;
		}
	}

	if(	javaTrim(FormName.tzr)=="") {
		alert("������[������]��");
		FormName.tzr.focus();
		return false;
	}
	if(	javaTrim(FormName.tzsj)=="") {
		alert("������[����ʱ��]��");
		FormName.tzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tzsj, "����ʱ��"))) {
		return false;
	}

	
	FormName.action="SaveInsertCl_jgmx.jsp";
	FormName.submit();
	return true;
}


function f_exp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ExpCl_jgmx.jsp";
	FormName.submit();
	return true;

}

function f_drnew(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ImpAddData.jsp";
	FormName.submit();
	return true;

}

function f_edit(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ImpEditData.jsp";
	FormName.submit();
	return true;

}

//-->
</SCRIPT>
