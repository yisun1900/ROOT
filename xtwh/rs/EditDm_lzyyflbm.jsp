<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String lzyyflbm=null;
String lzyyflmc=null;
String wherelzyyflbm=cf.GB2Uni(request.getParameter("lzyyflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select lzyyflbm,lzyyflmc ";
	ls_sql+=" from  dm_lzyyflbm";
	ls_sql+=" where  (lzyyflbm='"+wherelzyyflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lzyyflbm=cf.fillNull(rs.getString("lzyyflbm"));
		lzyyflmc=cf.fillNull(rs.getString("lzyyflmc"));
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
<form method="post" action="SaveEditDm_lzyyflbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ְԭ��������</td> 
  <td width="35%"> 
    <input type="text" name="lzyyflbm" size="20" maxlength="2"  value="<%=lzyyflbm%>" >
  </td>
  <td align="right" width="15%">��ְԭ���������</td> 
  <td width="35%"> 
    <input type="text" name="lzyyflmc" size="20" maxlength="50"  value="<%=lzyyflmc%>" >
  </td>
</tr>
<input type="hidden" name="wherelzyyflbm"  value="<%=wherelzyyflbm%>" >
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
	if(	javaTrim(FormName.lzyyflbm)=="") {
		alert("������[��ְԭ��������]��");
		FormName.lzyyflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lzyyflmc)=="") {
		alert("������[��ְԭ���������]��");
		FormName.lzyyflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
