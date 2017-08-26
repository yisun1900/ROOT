<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ldlxbm=null;
String ldlxmc=null;
String whereldlxbm=cf.GB2Uni(request.getParameter("ldlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ldlxbm,ldlxmc ";
	ls_sql+=" from  dm_ldlxbm";
	ls_sql+=" where  (ldlxbm='"+whereldlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ldlxbm=cf.fillNull(rs.getString("ldlxbm"));
		ldlxmc=cf.fillNull(rs.getString("ldlxmc"));
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
<form method="post" action="SaveEditDm_ldlxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">来电类型编码</td> 
  <td width="35%"> 
    <input type="text" name="ldlxbm" size="20" maxlength="2"  value="<%=ldlxbm%>" >
  </td>
  <td align="right" width="15%">来电类型名称</td> 
  <td width="35%"> 
    <input type="text" name="ldlxmc" size="20" maxlength="50"  value="<%=ldlxmc%>" >
  </td>
</tr>
<input type="hidden" name="whereldlxbm"  value="<%=whereldlxbm%>" >
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
	if(	javaTrim(FormName.ldlxbm)=="") {
		alert("请输入[来电类型编码]！");
		FormName.ldlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ldlxmc)=="") {
		alert("请输入[来电类型名称]！");
		FormName.ldlxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
