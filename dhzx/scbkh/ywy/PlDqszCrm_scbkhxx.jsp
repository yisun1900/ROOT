<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String[] scbkhbh = request.getParameterValues("scbkhbh");

String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ssfgs";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where scbkhbh='"+scbkhbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
<title>���ڻط�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
.STYLE3 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlDqszCrm_scbkhxx.jsp" name="editform">
<div align="center">�г����ͻ����������ڻط�����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right"><span class="STYLE3">*</span>�طü��</td>
  <td width="35%"><input type="text" name="hfjg" size="10" maxlength="10"  value="" >
��</td>
  <td width="15%" align="right">&nbsp;</td>
  <td width="35%">&nbsp;</td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
<%
for (int i=0;i<scbkhbh.length ;i++ )
{
	%>
	<input type="hidden" name="scbkhbh"  value="<%=scbkhbh[i]%>" >
	<%
}
%>
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.hfjg)=="") {
		alert("������[�طü��]��");
		FormName.hfjg.focus();
		return false;
	}
	if(!(isNumber(FormName.hfjg, "�طü�� "))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
