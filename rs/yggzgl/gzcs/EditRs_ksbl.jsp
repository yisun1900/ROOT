<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String ssfgs=null;
String gzfw=null;
String gzxx=null;
String gzsx=null;
String gsbl=null;
String gdsj=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,ssfgs,gzfw,gzxx,gzsx,gsbl,gdsj ";
	ls_sql+=" from  rs_ksbl";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		gzfw=cf.fillNull(rs.getString("gzfw"));
		gzxx=cf.fillNull(rs.getString("gzxx"));
		gzsx=cf.fillNull(rs.getString("gzsx"));
		gsbl=cf.fillNull(rs.getString("gsbl"));
		gdsj=cf.fillNull(rs.getString("gdsj"));
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
<form method="post" action="SaveEditRs_ksbl.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���</td> 
  <td width="35%"> 
    <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >
  </td>
  <td align="right" width="15%">�ֹ�˾</td> 
  <td width="35%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh",ssfgs);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ʷ�Χ</td> 
  <td width="35%"> 
    <input type="text" name="gzfw" size="20" maxlength="50"  value="<%=gzfw%>" >
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="gzxx" size="20" maxlength="17"  value="<%=gzxx%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="gzsx" size="20" maxlength="17"  value="<%=gzsx%>" >
  </td>
  <td align="right" width="15%">��˰����</td> 
  <td width="35%"> 
    <input type="text" name="gsbl" size="20" maxlength="9"  value="<%=gsbl%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�̶�˰��</td> 
  <td width="35%"> 
    <input type="text" name="gdsj" size="20" maxlength="17"  value="<%=gdsj%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.gzfw)=="") {
		alert("������[���ʷ�Χ]��");
		FormName.gzfw.focus();
		return false;
	}
	if(	javaTrim(FormName.gzxx)=="") {
		alert("������[��������]��");
		FormName.gzxx.focus();
		return false;
	}
	if(!(isFloat(FormName.gzxx, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gzsx)=="") {
		alert("������[��������]��");
		FormName.gzsx.focus();
		return false;
	}
	if(!(isFloat(FormName.gzsx, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gsbl)=="") {
		alert("������[��˰����]��");
		FormName.gsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.gsbl, "��˰����"))) {
		return false;
	}
	if(	javaTrim(FormName.gdsj)=="") {
		alert("������[�̶�˰��]��");
		FormName.gdsj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdsj, "�̶�˰��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
