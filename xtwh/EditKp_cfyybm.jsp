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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditKp_cfyybm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">处罚原因编码</td> 
  <td width="35%"> 
    <input type="text" name="cfyybm" size="20" maxlength="2"  value="<%=cfyybm%>" >
  </td>
  <td align="right" width="15%">处罚原因名称</td> 
  <td width="35%"> 
    <input type="text" name="cfyymc" size="20" maxlength="50"  value="<%=cfyymc%>" >
  </td>
</tr>
<input type="hidden" name="wherecfyybm"  value="<%=wherecfyybm%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cfyybm)=="") {
		alert("请输入[处罚原因编码]！");
		FormName.cfyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.cfyymc)=="") {
		alert("请输入[处罚原因名称]！");
		FormName.cfyymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
