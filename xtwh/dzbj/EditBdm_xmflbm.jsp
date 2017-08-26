<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmflbm=null;
String xmflmc=null;
String wherexmflbm=cf.GB2Uni(request.getParameter("xmflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmflbm,xmflmc ";
	ls_sql+=" from  bdm_xmflbm";
	ls_sql+=" where  (xmflbm='"+wherexmflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		xmflmc=cf.fillNull(rs.getString("xmflmc"));
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
<form method="post" action="SaveEditBdm_xmflbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ŀ�������</td> 
  <td width="35%"> 
    <input type="text" name="xmflbm" size="20" maxlength="2"  value="<%=xmflbm%>" >
  </td>
  <td align="right" width="15%">��Ŀ��������</td> 
  <td width="35%"> 
    <input type="text" name="xmflmc" size="20" maxlength="50"  value="<%=xmflmc%>" >
  </td>
</tr>
<input type="hidden" name="wherexmflbm"  value="<%=wherexmflbm%>" >
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
	if(	javaTrim(FormName.xmflbm)=="") {
		alert("������[��Ŀ�������]��");
		FormName.xmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmflmc)=="") {
		alert("������[��Ŀ��������]��");
		FormName.xmflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>