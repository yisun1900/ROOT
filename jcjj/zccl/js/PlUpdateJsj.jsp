<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] xh = request.getParameterValues("xh");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateJsj.jsp" name="editform">
<div align="center"><strong>�޸ĵ�Ʒ�����</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="48%" height="69" align="right"><font color="#FF0000">*</font>�����</td>
  <td width="52%"><input name="cbj" type="text" size="20" maxlength="16" ></td>
</tr>

    <tr> 
      <td colspan="2" align="center" >
<%
for (int i=0;i<xh.length ;i++ )
{
	%>
		<input type="hidden" name="xh"  value="<%=xh[i]%>" >
	<%
}
%>
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">	 </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cbj)=="") {
		alert("������[�����]��");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "�����"))) {
		return false;
	}

	if (!confirm("�޸ĺ󲻿ɻָ�����Ҫ�Ĵ��ˣ�ȷʵҪ������?") )	
	{
		return true;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
