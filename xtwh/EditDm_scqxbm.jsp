<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String scqxbm=null;
String scqxmc=null;
String wherescqxbm=cf.GB2Uni(request.getParameter("scqxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select scqxbm,scqxmc ";
	ls_sql+=" from  dm_scqxbm";
	ls_sql+=" where  (scqxbm='"+wherescqxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		scqxbm=cf.fillNull(rs.getString("scqxbm"));
		scqxmc=cf.fillNull(rs.getString("scqxmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_scqxbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ɫ��ȡ�����</td> 
  <td width="35%"> 
    <input type="text" name="scqxbm" size="20" maxlength="2"  value="<%=scqxbm%>" >
  </td>
  <td align="right" width="15%">ɫ��ȡ������</td> 
  <td width="35%"> 
    <input type="text" name="scqxmc" size="20" maxlength="50"  value="<%=scqxmc%>" >
  </td>
</tr>
<input type="hidden" name="wherescqxbm"  value="<%=wherescqxbm%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
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
	if(	javaTrim(FormName.scqxbm)=="") {
		alert("������[ɫ��ȡ�����]��");
		FormName.scqxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.scqxmc)=="") {
		alert("������[ɫ��ȡ������]��");
		FormName.scqxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
