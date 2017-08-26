<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dnsbflbm=null;
String dnsbflmc=null;
String wherednsbflbm=cf.GB2Uni(request.getParameter("dnsbflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dnsbflbm,dnsbflmc ";
	ls_sql+=" from  xz_dnsbflbm";
	ls_sql+=" where  (dnsbflbm='"+wherednsbflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dnsbflbm=cf.fillNull(rs.getString("dnsbflbm"));
		dnsbflmc=cf.fillNull(rs.getString("dnsbflmc"));
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
<form method="post" action="SaveEditXz_dnsbflbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���Լ��豸�������</td> 
  <td width="31%"> 
    <input type="text" name="dnsbflbm" size="20" maxlength="2"  value="<%=dnsbflbm%>" >
  </td>
  <td align="right" width="18%">���Լ��豸��������</td> 
  <td width="32%"> 
    <input type="text" name="dnsbflmc" size="20" maxlength="50"  value="<%=dnsbflmc%>" >
  </td>
</tr>
<input type="hidden" name="wherednsbflbm"  value="<%=wherednsbflbm%>" >
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
	if(	javaTrim(FormName.dnsbflbm)=="") {
		alert("������[���Լ��豸�������]��");
		FormName.dnsbflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dnsbflmc)=="") {
		alert("������[���Լ��豸��������]��");
		FormName.dnsbflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
