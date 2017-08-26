<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zffsbm=null;
String zffsmc=null;
String lx=null;
String wherezffsbm=cf.GB2Uni(request.getParameter("zffsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zffsbm,zffsmc,lx ";
	ls_sql+=" from  cw_zffsbm";
	ls_sql+=" where  (zffsbm='"+wherezffsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zffsbm=cf.fillNull(rs.getString("zffsbm"));
		zffsmc=cf.fillNull(rs.getString("zffsmc"));
		lx=cf.fillNull(rs.getString("lx"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_zffsbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">֧����ʽ����</td> 
  <td width="35%"> 
    <input type="text" name="zffsbm" size="20" maxlength="2"  value="<%=zffsbm%>" >
  </td>
  <td align="right" width="15%">֧����ʽ����</td> 
  <td width="35%"> 
    <input type="text" name="zffsmc" size="20" maxlength="50"  value="<%=zffsmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "lx","1+�ֽ�&2+���ֽ�",lx);
%>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherezffsbm"  value="<%=wherezffsbm%>" >
    <tr> 
      <td colspan="4" height="2">
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
	if(	javaTrim(FormName.zffsbm)=="") {
		alert("������[֧����ʽ����]��");
		FormName.zffsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zffsmc)=="") {
		alert("������[֧����ʽ����]��");
		FormName.zffsmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
