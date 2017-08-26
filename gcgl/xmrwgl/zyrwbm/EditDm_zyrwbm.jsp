<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zyrwbm=null;
String zyrwmc=null;
String wherezyrwbm=cf.GB2Uni(request.getParameter("zyrwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zyrwbm,zyrwmc ";
	ls_sql+=" from  dm_zyrwbm";
	ls_sql+=" where  (zyrwbm='"+wherezyrwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zyrwbm=cf.fillNull(rs.getString("zyrwbm"));
		zyrwmc=cf.fillNull(rs.getString("zyrwmc"));
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
<form method="post" action="SaveEditDm_zyrwbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">ժҪ������루4λ��</td>
  <td><input type="text" name="zyrwbm" size="20" maxlength="4"  value="<%=zyrwbm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">ժҪ��������</td> 
  <td width="77%"><input type="text" name="zyrwmc" size="68" maxlength="50"  value="<%=zyrwmc%>" ></td>
  </tr>
<input type="hidden" name="wherezyrwbm"  value="<%=wherezyrwbm%>" >
    <tr> 
      <td colspan="2" >
	<div align="center">
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
	if(	javaTrim(FormName.zyrwbm)=="") {
		alert("������[ժҪ�������]��");
		FormName.zyrwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zyrwmc)=="") {
		alert("������[ժҪ��������]��");
		FormName.zyrwmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
