<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String tckb_zck_dqbm=null;

	tckb_zck_dqbm=request.getParameter("tckb_zck_dqbm");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateGys.jsp" name="editform">
<div align="center">�ײ����ı���ά���������޸Ĺ�Ӧ��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="21%" height="17" align="right"><font color="#FF0000">*</font>����</td>
    <td width="79%"><select name="tckb_zck_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+tckb_zck_dqbm+"' order by dqbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>ԭ��Ӧ��</td>
    <td><select name="oldgysmc" style="FONT-SIZE:12PX;WIDTH:523PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
	%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>�¹�Ӧ��</td>
    <td><select name="newgysmc" style="FONT-SIZE:12PX;WIDTH:523PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
	%>
    </select></td>
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
	if(	javaTrim(FormName.oldgysmc)=="") {
		alert("������[ԭ��Ӧ��]��");
		FormName.oldgysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.newgysmc)=="") {
		alert("������[�¹�Ӧ��]��");
		FormName.newgysmc.focus();
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
