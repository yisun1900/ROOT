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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCl_jgmx.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֹ�˾</td> 
  <td width="35%"> 
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
    </select>
  </td>
      <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <select name="clbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clbm,clmc||'��'||clgg||'��' from cl_clbm order by clbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="cj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�볧�ҽ����</td> 
  <td width="35%"> 
    <input type="text" name="cjjsj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֹ�˾���ϵ���</td> 
  <td width="35%"> 
    <input type="text" name="fgsdj" value="" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">���Ӽ�</td> 
  <td width="35%"> 
    <input type="text" name="gdj" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֿ�����</td> 
  <td width="35%"> 
    <input type="text" name="ckmc" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">�Ƿ����</td> 
  <td width="35%"> 
    <input type="radio" name="sfrk"  value="Y">��
    <input type="radio" name="sfrk"  value="N">��
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>
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
	if(	javaTrim(FormName.ckmc)=="") {
		alert("������[�ֿ�����]��");
		FormName.ckmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfrk)) {
		alert("��ѡ��[�Ƿ����]��");
		FormName.sfrk[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
