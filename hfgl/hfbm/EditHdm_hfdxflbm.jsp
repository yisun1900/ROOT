<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hfdxflbm=null;
String hfdxflmc=null;
String wherehfdxflbm=cf.GB2Uni(request.getParameter("hfdxflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select hfdxflbm,hfdxflmc ";
	ls_sql+=" from  hdm_hfdxflbm";
	ls_sql+=" where  (hfdxflbm='"+wherehfdxflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfdxflbm=cf.fillNull(rs.getString("hfdxflbm"));
		hfdxflmc=cf.fillNull(rs.getString("hfdxflmc"));
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
<form method="post" action="SaveEditHdm_hfdxflbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�طö���������</td>
  <td><input type="text" name="hfdxflbm" size="20" maxlength="2"  value="<%=hfdxflbm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">�طö����������</td> 
  <td width="70%"><input type="text" name="hfdxflmc" size="50" maxlength="50"  value="<%=hfdxflmc%>" ></td>
  </tr>
<input type="hidden" name="wherehfdxflbm"  value="<%=wherehfdxflbm%>" >
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
	if(	javaTrim(FormName.hfdxflbm)=="") {
		alert("������[�طö���������]��");
		FormName.hfdxflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxflmc)=="") {
		alert("������[�طö����������]��");
		FormName.hfdxflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
