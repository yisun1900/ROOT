<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String wheresql="";

	String bj_tcwzck_dqbm=null;

	bj_tcwzck_dqbm=request.getParameter("bj_tcwzck_dqbm");
	bj_tcwzck_dqbm=cf.GB2Uni(bj_tcwzck_dqbm);
	wheresql+=" (bj_tcwzck.dqbm='"+bj_tcwzck_dqbm+"')";

	String bj_tcwzck_clxlbm=null;
	bj_tcwzck_clxlbm=request.getParameter("bj_tcwzck_clxlbm");
	bj_tcwzck_clxlbm=cf.GB2Uni(bj_tcwzck_clxlbm);
	wheresql+=" and  (bj_tcwzck.tccplbbm='"+bj_tcwzck_clxlbm+"')";
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateXdb.jsp" name="editform">
<div align="center">�ײ������Ŀ⣭�����޸ġ��µ��ȡ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="48%" height="69" align="right"><font color="#FF0000">*</font>�µ���</td>
  <td width="52%"><input type="text" name="xdb" size="8" maxlength="9" >
    ���ۼ�����λ/�µ�������λ</td>
</tr>

    <tr> 
      <td colspan="2" >
	<div align="center">
		<input type="hidden" name="wheresql"  value="<%=wheresql%>" >
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
	if(	javaTrim(FormName.xdb)=="") {
		alert("������[�µ���]��");
		FormName.xdb.focus();
		return false;
	}
	if(!(isFloat(FormName.xdb, "�µ���"))) {
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
