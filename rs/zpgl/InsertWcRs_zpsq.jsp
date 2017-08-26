<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String sjzprs=null;
String sjzpfy=null;
String sjkssj=null;
String sjjssj=null;
String sjzpsj=null;
String zpjglrr=null;
String zpjglsj=null;
String wherezpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sjzprs,sjzpfy,sjkssj,sjjssj,sjzpsj,zpjglrr,zpjglsj ";
	ls_sql+=" from  rs_zpsq";
	ls_sql+=" where  (zpsqbh='"+wherezpsqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjzprs=cf.fillNull(rs.getString("sjzprs"));
		sjzpfy=cf.fillNull(rs.getString("sjzpfy"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjzpsj=cf.fillNull(rs.getString("sjzpsj"));
		zpjglrr=cf.fillNull(rs.getString("zpjglrr"));
		zpjglsj=cf.fillNull(rs.getDate("zpjglsj"));
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
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertWcRs_zpsq.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" style="FONT-SIZE:12" border="1" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ����Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="sjzprs" size="20" maxlength="8"  value="<%=sjzprs%>" >  </td>
  <td align="right" width="15%">ʵ����Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="sjzpfy" size="20" maxlength="9"  value="<%=sjzpfy%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ����Ƹ��ʼʱ��</td> 
  <td width="35%"><input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">ʵ����Ƹ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ˵��</td> 
  <td width="35%" colspan="3"> 
    <textarea name="sjzpsj" cols="72" rows=""><%=sjzpsj%></textarea>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">���¼����</span></td> 
  <td width="35%"> 
    <input type="text" name="zpjglrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">���¼��ʱ��</span></td> 
  <td width="35%"> 
    <input type="text" name="zpjglsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<input type="hidden" name="wherezpsqbh"  value="<%=wherezpsqbh%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(!(isDatetime(FormName.zpjglsj, "��Ƹ���¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
