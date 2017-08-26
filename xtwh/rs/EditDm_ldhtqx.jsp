<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ldhtqxbm=null;
String ldhtqx=null;
String whereldhtqxbm=cf.GB2Uni(request.getParameter("ldhtqxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ldhtqxbm,ldhtqx ";
	ls_sql+=" from  dm_ldhtqx";
	ls_sql+=" where  (ldhtqxbm='"+whereldhtqxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ldhtqxbm=cf.fillNull(rs.getString("ldhtqxbm"));
		ldhtqx=cf.fillNull(rs.getString("ldhtqx"));
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
<form method="post" action="SaveEditDm_ldhtqx.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ͷ���ͬ���ޱ���</td> 
  <td width="35%"> 
    <input type="text" name="ldhtqxbm" size="20" maxlength="2"  value="<%=ldhtqxbm%>" >
  </td>
  <td align="right" width="15%">�Ͷ���ͬ����</td> 
  <td width="35%"> 
    <input type="text" name="ldhtqx" size="20" maxlength="50"  value="<%=ldhtqx%>" >
  </td>
</tr>
<input type="hidden" name="whereldhtqxbm"  value="<%=whereldhtqxbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>
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
	if(	javaTrim(FormName.ldhtqxbm)=="") {
		alert("������[�Ͷ���ͬ���ޱ���]��");
		FormName.ldhtqxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ldhtqx)=="") {
		alert("������[�Ͷ���ͬ����]��");
		FormName.ldhtqx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
