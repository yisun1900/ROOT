<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwjb=null;
String dwjbmc=null;
String wheredwjb=cf.GB2Uni(request.getParameter("dwjb"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwjb,dwjbmc ";
	ls_sql+=" from  dm_dwjb";
	ls_sql+=" where  (dwjb='"+wheredwjb+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwjb=cf.fillNull(rs.getString("dwjb"));
		dwjbmc=cf.fillNull(rs.getString("dwjbmc"));
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
<form method="post" action="SaveEditDm_dwjb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��λ����</td> 
  <td width="35%"> 
    <input type="text" name="dwjb" size="20" maxlength="2"  value="<%=dwjb%>" >
  </td>
  <td align="right" width="15%">��λ��������</td> 
  <td width="35%"> 
    <input type="text" name="dwjbmc" size="20" maxlength="50"  value="<%=dwjbmc%>" >
  </td>
</tr>
<input type="hidden" name="wheredwjb"  value="<%=wheredwjb%>" >
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
	if(	javaTrim(FormName.dwjb)=="") {
		alert("������[��λ����]��");
		FormName.dwjb.focus();
		return false;
	}
	if(	javaTrim(FormName.dwjbmc)=="") {
		alert("������[��λ��������]��");
		FormName.dwjbmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
