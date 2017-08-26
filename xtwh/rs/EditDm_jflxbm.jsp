<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jflxbm=null;
String jflxmc=null;
String lx=null;
String wherejflxbm=cf.GB2Uni(request.getParameter("jflxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jflxbm,jflxmc,lx ";
	ls_sql+=" from  dm_jflxbm";
	ls_sql+=" where  (jflxbm='"+wherejflxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jflxbm=cf.fillNull(rs.getString("jflxbm"));
		jflxmc=cf.fillNull(rs.getString("jflxmc"));
		lx=cf.fillNull(rs.getString("lx"));
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
<form method="post" action="SaveEditDm_jflxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">奖罚类型编码</td> 
  <td width="35%"> 
    <input type="text" name="jflxbm" size="20" maxlength="2"  value="<%=jflxbm%>" >
  </td>
  <td align="right" width="15%">奖罚类型名称</td> 
  <td width="35%"> 
    <input type="text" name="jflxmc" size="20" maxlength="50"  value="<%=jflxmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">类型</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "lx","1+处罚&2+奖励",lx);
%>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherejflxbm"  value="<%=wherejflxbm%>" >
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
	if(	javaTrim(FormName.jflxbm)=="") {
		alert("请输入[奖罚类型编码]！");
		FormName.jflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jflxmc)=="") {
		alert("请输入[奖罚类型名称]！");
		FormName.jflxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
