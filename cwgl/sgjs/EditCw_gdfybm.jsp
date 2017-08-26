<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fybm=null;
String fymc=null;
String xh=null;
String wherefybm=cf.GB2Uni(request.getParameter("fybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fybm,fymc,xh ";
	ls_sql+=" from  cw_gdfybm";
	ls_sql+=" where  (fybm='"+wherefybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fybm=cf.fillNull(rs.getString("fybm"));
		fymc=cf.fillNull(rs.getString("fymc"));
		xh=cf.fillNull(rs.getString("xh"));
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
<form method="post" action="SaveEditCw_gdfybm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">费用编码</td> 
  <td width="35%"> 
    <input type="text" name="fybm" size="20" maxlength="2"  value="<%=fybm%>" >
  </td>
  <td align="right" width="15%">费用名称</td> 
  <td width="35%"> 
    <input type="text" name="fymc" size="20" maxlength="50"  value="<%=fymc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherefybm"  value="<%=wherefybm%>" >
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
	if(	javaTrim(FormName.fybm)=="") {
		alert("请输入[费用编码]！");
		FormName.fybm.focus();
		return false;
	}
	if(	javaTrim(FormName.fymc)=="") {
		alert("请输入[费用名称]！");
		FormName.fymc.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
