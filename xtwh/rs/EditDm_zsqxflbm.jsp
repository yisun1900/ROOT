<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zsqxflbm=null;
String zsqxflmc=null;
String qsz=null;
String zzz=null;
String wherezsqxflbm=cf.GB2Uni(request.getParameter("zsqxflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zsqxflbm,zsqxflmc,qsz,zzz ";
	ls_sql+=" from  dm_zsqxflbm";
	ls_sql+=" where  (zsqxflbm='"+wherezsqxflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zsqxflbm=cf.fillNull(rs.getString("zsqxflbm"));
		zsqxflmc=cf.fillNull(rs.getString("zsqxflmc"));
		qsz=cf.fillNull(rs.getString("qsz"));
		zzz=cf.fillNull(rs.getString("zzz"));
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
<form method="post" action="SaveEditDm_zsqxflbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="21%">��˾���޷������</td> 
      <td width="29%"> 
        <input type="text" name="zsqxflbm" size="20" maxlength="2"  value="<%=zsqxflbm%>" >
  </td>
      <td align="right" width="20%">��˾���޷�������</td> 
      <td width="30%"> 
        <input type="text" name="zsqxflmc" size="20" maxlength="50"  value="<%=zsqxflmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="21%">��ʼֵ���£�</td> 
      <td width="29%"> 
        <input type="text" name="qsz" size="12" maxlength="8"  value="<%=qsz%>" >
        �� >=�� </td>
      <td align="right" width="20%">��ֵֹ���£�</td> 
      <td width="30%"> 
        <input type="text" name="zzz" size="12" maxlength="8"  value="<%=zzz%>" >
        �� &lt;�� </td>
</tr>
<input type="hidden" name="wherezsqxflbm"  value="<%=wherezsqxflbm%>" >
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
	if(	javaTrim(FormName.zsqxflbm)=="") {
		alert("������[��˾���޷������]��");
		FormName.zsqxflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zsqxflmc)=="") {
		alert("������[��˾���޷�������]��");
		FormName.zsqxflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qsz)=="") {
		alert("������[��ʼֵ���£�]��");
		FormName.qsz.focus();
		return false;
	}
	if(!(isNumber(FormName.qsz, "��ʼֵ���£�"))) {
		return false;
	}
	if(	javaTrim(FormName.zzz)=="") {
		alert("������[��ֵֹ���£�]��");
		FormName.zzz.focus();
		return false;
	}
	if(!(isNumber(FormName.zzz, "��ֵֹ���£�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
