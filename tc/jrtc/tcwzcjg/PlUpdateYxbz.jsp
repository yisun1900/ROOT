<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] cpbm = request.getParameterValues("cpbm");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateYxbz.jsp" name="editform">
<div align="center">�ײ������Ŀ⣭�������á���Ч��־��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ���Ч</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfyx","1+��Զ��Ч&2+��Ч&3+�׶���Ч","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ч��ʼʱ��</td>
  <td width="32%"><input type="text" name="yxkssj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
  <td width="18%" align="right">��Ч����ʱ��</td>
  <td width="32%"><input type="text" name="yxjzsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
<%
	for (int i=0;i<cpbm.length ;i++ )
	{
		%>
		<input type="hidden" name="cpbm"  value="<%=cpbm[i]%>" >
		<%
	}
%>
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	!radioChecked(FormName.sfyx)) {
		alert("��ѡ��[�Ƿ���Ч]��");
		FormName.sfyx[0].focus();
		return false;
	}
	if (FormName.sfyx[2].checked)
	{
		if(	javaTrim(FormName.yxkssj)=="") {
			alert("������[��Ч��ʼʱ��]��");
			FormName.yxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yxkssj, "��Ч��ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.yxjzsj)=="") {
			alert("������[��Ч����ʱ��]��");
			FormName.yxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yxjzsj, "��Ч����ʱ��"))) {
			return false;
		}

		if (FormName.yxjzsj.value<FormName.yxkssj.value)
		{
			alert("����[��Ч����ʱ��]<[��Ч��ʼʱ��]");
			FormName.yxjzsj.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yxkssj)!="") {
			alert("���󣡲�������[��Ч��ʼʱ��]��");
			FormName.yxkssj.select();
			return false;
		}
		if(	javaTrim(FormName.yxjzsj)!="") {
			alert("���󣡲�������[��Ч����ʱ��]��");
			FormName.yxjzsj.select();
			return false;
		}
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
