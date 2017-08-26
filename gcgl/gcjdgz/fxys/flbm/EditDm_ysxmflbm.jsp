<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ysxmflbm=null;
String ysxmflmc=null;
String whereysxmflbm=cf.GB2Uni(request.getParameter("ysxmflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ysxmflbm,ysxmflmc ";
	ls_sql+=" from  dm_ysxmflbm";
	ls_sql+=" where  (ysxmflbm='"+whereysxmflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysxmflbm=cf.fillNull(rs.getString("ysxmflbm"));
		ysxmflmc=cf.fillNull(rs.getString("ysxmflmc"));
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
<form method="post" action="SaveEditDm_ysxmflbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">������Ŀ�������(2λ)</td> 
  <td width="29%"> 
    <input type="text" name="ysxmflbm" size="20" maxlength="2"  value="<%=ysxmflbm%>" >
  </td>
  <td align="right" width="21%">������Ŀ��������</td> 
  <td width="29%"> 
    <input type="text" name="ysxmflmc" size="20" maxlength="50"  value="<%=ysxmflmc%>" >
  </td>
</tr>
<input type="hidden" name="whereysxmflbm"  value="<%=whereysxmflbm%>" >
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
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("������[������Ŀ�������]��");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflmc)=="") {
		alert("������[������Ŀ��������]��");
		FormName.ysxmflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
