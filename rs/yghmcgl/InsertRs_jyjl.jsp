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
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_jyjl.jsp" name="insertform" target="_blank">
<div align="center">¼���������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000FF">Ա�����</font></td>
      <td width="35%"> 
        <input type="text" name="ygbh" value="<%=whereygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ʼʱ��</td>
      <td width="35%"> 
        <input type="text" name="kssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="15%">����ʱ��</td>
      <td width="35%">
        <input type="text" name="jzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��������</td>
      <td colspan="3"> 
        <input type="text" name="jyjg" value="" size="73" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����˵��</td>
      <td width="35%" colspan="3"> 
        <TEXTAREA NAME="jysm" ROWS="4" COLS="71"></TEXTAREA>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
        <input type="button" value="�޸Ľ�������" onClick="window.open('Rs_jyjlList.jsp?ygbh=<%=whereygbh%>')">
      </td>
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
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.kssj)=="") {
		alert("������[��ʼʱ��]��");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("������[����ʱ��]��");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jyjg)=="") {
		alert("������[��������]��");
		FormName.jyjg.focus();
		return false;
	}
	if(	javaTrim(FormName.jysm)=="") {
		alert("������[����˵��]��");
		FormName.jysm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
