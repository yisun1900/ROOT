<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String tckd_tczcbj_dqbm=null;
	String tckd_tczcbj_bjjbbm=null;
	String clxlbm=null;

	tckd_tczcbj_dqbm=request.getParameter("tckd_tczcbj_dqbm");
	tckd_tczcbj_bjjbbm=request.getParameter("tckd_tczcbj_bjjbbm");
	clxlbm=request.getParameter("clxlbm");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateXdb.jsp" name="editform">
<div align="center">�ײ����ı���ά���������޸ġ��µ��ȡ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>����</td>
    <td><select name="tckd_tczcbj_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+tckd_tczcbj_dqbm+"' order by dqbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>���ۼ���</td>
    <td><select name="tckd_tczcbj_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where bjjbbm='"+tckd_tczcbj_bjjbbm+"'","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>��Ʒ���</td>
    <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm="+clxlbm,"");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="48%" height="69" align="right"><font color="#FF0000">*</font>�µ���</td>
  <td width="52%"><input type="text" name="xdb" size="8" maxlength="9" >
    ���ۼ�����λ/�µ�������λ</td>
</tr>

    <tr> 
      <td colspan="2" >
	<div align="center">
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