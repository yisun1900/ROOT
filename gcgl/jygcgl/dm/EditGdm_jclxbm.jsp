<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jclxbm=null;
String jclxmc=null;
String wherejclxbm=cf.GB2Uni(request.getParameter("jclxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jclxbm,jclxmc ";
	ls_sql+=" from  gdm_jclxbm";
	ls_sql+=" where  (jclxbm='"+wherejclxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jclxbm=cf.fillNull(rs.getString("jclxbm"));
		jclxmc=cf.fillNull(rs.getString("jclxmc"));
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
<form method="post" action="SaveEditGdm_jclxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">监察类型编码</td> 
  <td width="35%"> 
    <input type="text" name="jclxbm" size="20" maxlength="1"  value="<%=jclxbm%>" >
  </td>
  <td align="right" width="15%">监察类型名称</td> 
  <td width="35%"> 
    <input type="text" name="jclxmc" size="20" maxlength="50"  value="<%=jclxmc%>" >
  </td>
</tr>
<input type="hidden" name="wherejclxbm"  value="<%=wherejclxbm%>" >
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
	if(	javaTrim(FormName.jclxbm)=="") {
		alert("请输入[监察类型编码]！");
		FormName.jclxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jclxmc)=="") {
		alert("请输入[监察类型名称]！");
		FormName.jclxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
