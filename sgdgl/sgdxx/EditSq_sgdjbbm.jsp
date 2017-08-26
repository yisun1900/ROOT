<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgdjbbm=null;
String sgdjbmc=null;
String wheresgdjbbm=cf.GB2Uni(request.getParameter("sgdjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sgdjbbm,sgdjbmc ";
	ls_sql+=" from  sq_sgdjbbm";
	ls_sql+=" where  (sgdjbbm='"+wheresgdjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		sgdjbmc=cf.fillNull(rs.getString("sgdjbmc"));
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
<form method="post" action="SaveEditSq_sgdjbbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">级别编码</td> 
  <td width="35%"> 
    <input type="text" name="sgdjbbm" size="20" maxlength="1"  value="<%=sgdjbbm%>" >
  </td>
  <td align="right" width="15%">级别名称</td> 
  <td width="35%"> 
    <input type="text" name="sgdjbmc" size="20" maxlength="50"  value="<%=sgdjbmc%>" >
  </td>
</tr>
<input type="hidden" name="wheresgdjbbm"  value="<%=wheresgdjbbm%>" >
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
	if(	javaTrim(FormName.sgdjbbm)=="") {
		alert("请输入[级别编码]！");
		FormName.sgdjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdjbmc)=="") {
		alert("请输入[级别名称]！");
		FormName.sgdjbmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
