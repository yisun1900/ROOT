<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khxxCxList.jsp" name="insertform"  >
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�����ֹ�˾</td> 
  <td width="31%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���������ʼʱ��</td> 
  <td width="31%"><input type="text" name="tcqssj" value="<%=cf.firstDay()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">������ɽ���ʱ�� </td>
  <td width="31%"><input type="text" name="tcjzsj" value="<%=cf.lastDay()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.tcqssj)=="") {
		alert("������[���������ʼʱ��]��");
		FormName.tcqssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tcqssj, "���������ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjzsj)=="") {
		alert("������[������ɽ���ʱ��]��");
		FormName.tcjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tcjzsj, "������ɽ���ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
