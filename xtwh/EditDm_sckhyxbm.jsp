<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sckhyxbm=null;
String sckhyxmc=null;
String zt=null;
String wheresckhyxbm=cf.GB2Uni(request.getParameter("sckhyxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sckhyxbm,sckhyxmc,zt ";
	ls_sql+=" from  dm_sckhyxbm";
	ls_sql+=" where  (sckhyxbm='"+wheresckhyxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sckhyxbm=cf.fillNull(rs.getString("sckhyxbm"));
		sckhyxmc=cf.fillNull(rs.getString("sckhyxmc"));
		zt=cf.fillNull(rs.getString("zt"));
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
<form method="post" action="SaveEditDm_sckhyxbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ��������</td> 
  <td width="35%"> 
    <input type="text" name="sckhyxbm" size="20" maxlength="1"  value="<%=sckhyxbm%>" >
  </td>
  <td align="right" width="15%">�ͻ���������</td> 
  <td width="35%"> 
    <input type="text" name="sckhyxmc" size="20" maxlength="50"  value="<%=sckhyxmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ӧ״̬</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "zt","1+����&2+ʧ��&5+׼���ƽ�&6+׼��ʧ��",zt);
%>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wheresckhyxbm"  value="<%=wheresckhyxbm%>" >
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
	if(	javaTrim(FormName.sckhyxbm)=="") {
		alert("������[�ͻ��������]��");
		FormName.sckhyxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sckhyxmc)=="") {
		alert("������[�ͻ���������]��");
		FormName.sckhyxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.zt)) {
		alert("��ѡ��[��Ӧ״̬]��");
		FormName.zt[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
