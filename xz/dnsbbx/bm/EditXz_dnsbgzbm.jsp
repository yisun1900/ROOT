<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dnsbgzbm=null;
String dnsbgzmc=null;
String wherednsbgzbm=cf.GB2Uni(request.getParameter("dnsbgzbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dnsbgzbm,dnsbgzmc ";
	ls_sql+=" from  xz_dnsbgzbm";
	ls_sql+=" where  (dnsbgzbm='"+wherednsbgzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dnsbgzbm=cf.fillNull(rs.getString("dnsbgzbm"));
		dnsbgzmc=cf.fillNull(rs.getString("dnsbgzmc"));
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
<form method="post" action="SaveEditXz_dnsbgzbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���Լ��豸���ϱ���</td> 
  <td width="31%"> 
    <input type="text" name="dnsbgzbm" size="20" maxlength="2"  value="<%=dnsbgzbm%>" >
  </td>
  <td align="right" width="19%">���Լ��豸��������</td> 
  <td width="31%"> 
    <input type="text" name="dnsbgzmc" size="20" maxlength="50"  value="<%=dnsbgzmc%>" >
  </td>
</tr>
<input type="hidden" name="wherednsbgzbm"  value="<%=wherednsbgzbm%>" >
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
	if(	javaTrim(FormName.dnsbgzbm)=="") {
		alert("������[���Լ��豸���ϱ���]��");
		FormName.dnsbgzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dnsbgzmc)=="") {
		alert("������[���Լ��豸��������]��");
		FormName.dnsbgzmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
