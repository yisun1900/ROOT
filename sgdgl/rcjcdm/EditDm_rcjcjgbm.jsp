<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rcjcjgbm=null;
String rcjcjgmc=null;
String wherercjcjgbm=cf.GB2Uni(request.getParameter("rcjcjgbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rcjcjgbm,rcjcjgmc ";
	ls_sql+=" from  dm_rcjcjgbm";
	ls_sql+=" where  (rcjcjgbm='"+wherercjcjgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rcjcjgbm=cf.fillNull(rs.getString("rcjcjgbm"));
		rcjcjgmc=cf.fillNull(rs.getString("rcjcjgmc"));
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
<form method="post" action="SaveEditDm_rcjcjgbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ճ����������</td> 
  <td width="35%"> 
    <input type="text" name="rcjcjgbm" size="20" maxlength="2"  value="<%=rcjcjgbm%>" >
  </td>
  <td align="right" width="15%">�ճ����������</td> 
  <td width="35%"> 
    <input type="text" name="rcjcjgmc" size="20" maxlength="50"  value="<%=rcjcjgmc%>" >
  </td>
</tr>
<input type="hidden" name="wherercjcjgbm"  value="<%=wherercjcjgbm%>" >
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
	if(	javaTrim(FormName.rcjcjgbm)=="") {
		alert("������[�ճ����������]��");
		FormName.rcjcjgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rcjcjgmc)=="") {
		alert("������[�ճ����������]��");
		FormName.rcjcjgmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
