<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String spjrybm=null;
String spjry=null;
String wherespjrybm=cf.GB2Uni(request.getParameter("spjrybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select spjrybm,spjry ";
	ls_sql+=" from  crm_spjrybm";
	ls_sql+=" where  (spjrybm='"+wherespjrybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_spjrybm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="22%">受评价人员编码(2位)</td> 
      <td width="28%"> 
        <input type="text" name="spjrybm" size="20" maxlength="2"  value="<%=spjrybm%>" >
  </td>
      <td align="right" width="19%">受评价人员</td> 
      <td width="31%"> 
        <input type="text" name="spjry" size="20" maxlength="20"  value="<%=spjry%>" >
  </td>
</tr>
<input type="hidden" name="wherespjrybm"  value="<%=wherespjrybm%>" >
    <tr> 
      <td colspan="4" >
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
	if(	javaTrim(FormName.spjrybm)=="") {
		alert("请输入[受评价人员编码]！");
		FormName.spjrybm.focus();
		return false;
	}
	if (FormName.spjrybm.value.length!=2)
	{
		alert("[受评价人员编码]应为2位！");
		FormName.spjrybm.focus();
		return false;
	}
	if(	javaTrim(FormName.spjry)=="") {
		alert("请输入[受评价人员]！");
		FormName.spjry.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
