<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_dzbjbb.jsp" name="insertform" target="_blank">
<div align="center">¼�뱨�۰汾</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>����</td> 
  <td width="33%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </select>  </td>
  <td align="right" width="17%">&nbsp;</td> 
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���۰汾��</td>
  <td colspan="3"><input type="text" name="bjbbh" value="" size="73" maxlength="50" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ����ð汾</td>
  <td colspan="3">
	<INPUT type="radio" name="sfzybb" value="1">δ����
	<INPUT type="radio" name="sfzybb" value="2">��ǰ��
	<INPUT type="radio" name="sfzybb" value="3">���ð�
	<INPUT type="radio" name="sfzybb" value="4">��ͣ��  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����ʱ��</td>
  <td><input type="text" name="qysj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>��Ч��</td>
  <td><input type="text" name="yxq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("������[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfzybb)) {
		alert("��ѡ��[�Ƿ����ð汾]��");
		FormName.sfzybb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.qysj)=="") {
		alert("������[����ʱ��]��");
		FormName.qysj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qysj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yxq)=="") {
		alert("������[��Ч��]��");
		FormName.yxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxq, "��Ч��"))) {
		return false;
	}
	if (FormName.yxq.value<FormName.qysj.value)
	{
		alert("[��Ч��]����С��[����ʱ��]��");
		FormName.yxq.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
