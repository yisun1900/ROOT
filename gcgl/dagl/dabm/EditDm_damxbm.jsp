<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String damxbm=null;
String damxmc=null;
String gdbz=null;
String wheredamxbm=cf.GB2Uni(request.getParameter("damxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select damxbm,damxmc,gdbz ";
	ls_sql+=" from  dm_damxbm";
	ls_sql+=" where  (damxbm='"+wheredamxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		damxbm=cf.fillNull(rs.getString("damxbm"));
		damxmc=cf.fillNull(rs.getString("damxmc"));
		gdbz=cf.fillNull(rs.getString("gdbz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_damxbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������ϸ����</td> 
  <td width="32%"> 
    <input type="text" name="damxbm" size="20" maxlength="2"  value="<%=damxbm%>" >  </td>
  <td align="right" width="18%">�鵵��־</td> 
  <td width="32%"><%
	cf.radioToken(out, "gdbz","Y+����鵵&N+�ɲ��鵵",gdbz);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������ϸ����</td> 
  <td colspan="3"><input type="text" name="damxmc" size="72" maxlength="50"  value="<%=damxmc%>" >    </td>
  </tr>
<input type="hidden" name="wheredamxbm"  value="<%=wheredamxbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.damxbm)=="") {
		alert("������[������ϸ����]��");
		FormName.damxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.damxmc)=="") {
		alert("������[������ϸ����]��");
		FormName.damxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.gdbz)) {
		alert("��ѡ��[�鵵��־]��");
		FormName.gdbz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
