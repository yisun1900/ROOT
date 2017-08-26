<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sjzprs=null;
String sjzpfy=null;
String sjkssj=null;
String sjjssj=null;
String bz=null;
String wherezpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sjzprs,sjzpfy,sjkssj,sjjssj,bz ";
	ls_sql+=" from  rs_zpjhjg";
	ls_sql+=" where  (zpjhbh='"+wherezpjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjzprs=cf.fillNull(rs.getString("sjzprs"));
		sjzpfy=cf.fillNull(rs.getString("sjzpfy"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditRs_zpjhjg.jsp" name="editform">
<div align="center">���޸���Ƹ���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ����Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="sjzprs" size="20" maxlength="8"  value="<%=sjzprs%>" >
  </td>
  <td align="right" width="15%">ʵ����Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="sjzpfy" size="20" maxlength="9"  value="<%=sjzpfy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ����Ƹ��ʼʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">ʵ����Ƹ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherezpjhbh"  value="<%=wherezpjhbh%>" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjzprs)=="") {
		alert("������[ʵ����Ƹ����]��");
		FormName.sjzprs.focus();
		return false;
	}
	if(!(isNumber(FormName.sjzprs, "ʵ����Ƹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzpfy)=="") {
		alert("������[ʵ����Ƹ����]��");
		FormName.sjzpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzpfy, "ʵ����Ƹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkssj)=="") {
		alert("������[ʵ����Ƹ��ʼʱ��]��");
		FormName.sjkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjkssj, "ʵ����Ƹ��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjssj)=="") {
		alert("������[ʵ����Ƹ����ʱ��]��");
		FormName.sjjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjssj, "ʵ����Ƹ����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("������[��ע]��");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
