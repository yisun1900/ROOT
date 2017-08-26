<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sshybm=null;
String sshymc=null;
String wheresshybm=cf.GB2Uni(request.getParameter("sshybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sshybm,sshymc ";
	ls_sql+=" from  dm_sshybm";
	ls_sql+=" where  (sshybm='"+wheresshybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sshybm=cf.fillNull(rs.getString("sshybm"));
		sshymc=cf.fillNull(rs.getString("sshymc"));
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
<form method="post" action="SaveEditDm_sshybm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">������ҵ����</td> 
  <td width="33%"> 
    <input type="text" name="sshybm" size="20" maxlength="2"  value="<%=sshybm%>" >
  </td>
  <td align="right" width="18%">������ҵ����</td> 
  <td width="32%"> 
    <input type="text" name="sshymc" size="20" maxlength="50"  value="<%=sshymc%>" >
  </td>
</tr>
<input type="hidden" name="wheresshybm"  value="<%=wheresshybm%>" >
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
	if(	javaTrim(FormName.sshybm)=="") {
		alert("������[������ҵ����]��");
		FormName.sshybm.focus();
		return false;
	}
	if(	javaTrim(FormName.sshymc)=="") {
		alert("������[������ҵ����]��");
		FormName.sshymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
