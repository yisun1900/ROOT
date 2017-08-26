<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String spjrybm=null;
String spjry=null;
String wherespjrybm=cf.GB2Uni(request.getParameter("spjrybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select spjrybm,spjry ";
	ls_sql+=" from  crm_spjrybm";
	ls_sql+=" where  (spjrybm='"+wherespjrybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));
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
<form method="post" action="SaveEditCrm_spjrybm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="22%">��������Ա����(2λ)</td> 
      <td width="28%"> 
        <input type="text" name="spjrybm" size="20" maxlength="2"  value="<%=spjrybm%>" >
  </td>
      <td align="right" width="19%">��������Ա</td> 
      <td width="31%"> 
        <input type="text" name="spjry" size="20" maxlength="20"  value="<%=spjry%>" >
  </td>
</tr>
<input type="hidden" name="wherespjrybm"  value="<%=wherespjrybm%>" >
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
	if(	javaTrim(FormName.spjrybm)=="") {
		alert("������[��������Ա����]��");
		FormName.spjrybm.focus();
		return false;
	}
	if (FormName.spjrybm.value.length!=2)
	{
		alert("[��������Ա����]ӦΪ2λ��");
		FormName.spjrybm.focus();
		return false;
	}
	if(	javaTrim(FormName.spjry)=="") {
		alert("������[��������Ա]��");
		FormName.spjry.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
