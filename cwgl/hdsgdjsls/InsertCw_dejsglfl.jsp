<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_dejsglfl.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">���</td>
      <td width="29%"> 
        <input type="text" name="xh" value="" size="20" maxlength="8" >
      </td>
      <td align="right" width="21%">����</td>
      <td width="29%"> 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�ɱ������ʼֵ��>=��</td>
      <td width="29%"> 
        <input type="text" name="qsz" value="" size="20" maxlength="17" >
      </td>
      <td align="right" width="21%">�ɱ�����ֵֹ��<��</td>
      <td width="29%"> 
        <input type="text" name="jzz" value="" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">���ý������(0-100)</td>
      <td width="29%"> 
        <input type="text" name="jsbl" value="" size="20" maxlength="17" >
      </td>
      <td align="right" width="21%">&nbsp;</td>
      <td width="29%">&nbsp; </td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.qsz)=="") {
		alert("������[�ɱ������ʼֵ��>=��]��");
		FormName.qsz.focus();
		return false;
	}
	if(!(isFloat(FormName.qsz, "�ɱ������ʼֵ��>=��"))) {
		return false;
	}
	if(	javaTrim(FormName.jzz)=="") {
		alert("������[�ɱ�����ֵֹ��<��]��");
		FormName.jzz.focus();
		return false;
	}
	if(!(isFloat(FormName.jzz, "�ɱ�����ֵֹ��<��"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("������[�������(0-100)]��");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "�������(0-100)"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
