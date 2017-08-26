<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cfyybm=null;
String cfyymc=null;
String wherecfyybm=cf.GB2Uni(request.getParameter("cfyybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cfyybm,cfyymc ";
	ls_sql+=" from  kp_cfyybm";
	ls_sql+=" where  (cfyybm='"+wherecfyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfyybm=cf.fillNull(rs.getString("cfyybm"));
		cfyymc=cf.fillNull(rs.getString("cfyymc"));
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
<form method="post" action="SaveEditKp_cfyybm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ԭ�����</td> 
  <td width="35%"> 
    <input type="text" name="cfyybm" size="20" maxlength="2"  value="<%=cfyybm%>" >
  </td>
  <td align="right" width="15%">����ԭ������</td> 
  <td width="35%"> 
    <input type="text" name="cfyymc" size="20" maxlength="50"  value="<%=cfyymc%>" >
  </td>
</tr>
<input type="hidden" name="wherecfyybm"  value="<%=wherecfyybm%>" >
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
	if(	javaTrim(FormName.cfyybm)=="") {
		alert("������[����ԭ�����]��");
		FormName.cfyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.cfyymc)=="") {
		alert("������[����ԭ������]��");
		FormName.cfyymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
