<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpjjxlbm=null;
String cpjjxl=null;
String wherecpjjxlbm=cf.GB2Uni(request.getParameter("cpjjxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpjjxlbm,cpjjxl ";
	ls_sql+=" from  jdm_cpjjxl";
	ls_sql+=" where  (cpjjxlbm='"+wherecpjjxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjxlbm=cf.fillNull(rs.getString("cpjjxlbm"));
		cpjjxl=cf.fillNull(rs.getString("cpjjxl"));
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
<form method="post" action="SaveEditJdm_cpjjxl.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ʒ�Ҿ�ϵ�б���</td> 
  <td width="35%"> 
    <input type="text" name="cpjjxlbm" size="20" maxlength="2"  value="<%=cpjjxlbm%>" >
  </td>
  <td align="right" width="15%">��Ʒ�Ҿ�ϵ��</td> 
  <td width="35%"> 
    <input type="text" name="cpjjxl" size="20" maxlength="50"  value="<%=cpjjxl%>" >
  </td>
</tr>
<input type="hidden" name="wherecpjjxlbm"  value="<%=wherecpjjxlbm%>" >
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
	if(	javaTrim(FormName.cpjjxlbm)=="") {
		alert("������[��Ʒ�Ҿ�ϵ�б���]��");
		FormName.cpjjxlbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
