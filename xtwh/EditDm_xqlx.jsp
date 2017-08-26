<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xqlxbm=null;
String xqlx=null;
String wherexqlxbm=cf.GB2Uni(request.getParameter("xqlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xqlxbm,xqlx ";
	ls_sql+=" from  dm_xqlx";
	ls_sql+=" where  (xqlxbm='"+wherexqlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xqlxbm=cf.fillNull(rs.getString("xqlxbm"));
		xqlx=cf.fillNull(rs.getString("xqlx"));
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
<form method="post" action="SaveEditDm_xqlx.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">С�����ͱ���</td> 
  <td width="35%"> 
    <input type="text" name="xqlxbm" size="20" maxlength="2"  value="<%=xqlxbm%>" >
  </td>
  <td align="right" width="15%">С������</td> 
  <td width="35%"> 
    <input type="text" name="xqlx" size="20" maxlength="20"  value="<%=xqlx%>" >
  </td>
</tr>
<input type="hidden" name="wherexqlxbm"  value="<%=wherexqlxbm%>" >
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
	if(	javaTrim(FormName.xqlxbm)=="") {
		alert("������[С�����ͱ���]��");
		FormName.xqlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqlx)=="") {
		alert("������[С������]��");
		FormName.xqlx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
