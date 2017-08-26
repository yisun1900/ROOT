<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mtxbm=null;
String mtxmc=null;
String ztmjjl=null;
String ykjjl=null;
String ctjjl=null;
String wheremtxbm=cf.GB2Uni(request.getParameter("mtxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mtxbm,mtxmc,ztmjjl,ykjjl,ctjjl ";
	ls_sql+=" from  jdm_mtxbm";
	ls_sql+=" where  (mtxbm='"+wheremtxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mtxbm=cf.fillNull(rs.getString("mtxbm"));
		mtxmc=cf.fillNull(rs.getString("mtxmc"));
		ztmjjl=cf.fillNull(rs.getString("ztmjjl"));
		ykjjl=cf.fillNull(rs.getString("ykjjl"));
		ctjjl=cf.fillNull(rs.getString("ctjjl"));
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
<form method="post" action="SaveEditJdm_mtxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">门套线编码</td> 
      <td width="33%"> 
        <input type="text" name="mtxbm" size="20" maxlength="2"  value="<%=mtxbm%>" >
  </td>
      <td align="right" width="18%">门套线名称</td> 
      <td width="32%"> 
        <input type="text" name="mtxmc" size="20" maxlength="50"  value="<%=mtxmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">整樘门加价率</td> 
      <td width="33%"> 
        <input type="text" name="ztmjjl" size="10" maxlength="9"  value="<%=ztmjjl%>" >
        % </td>
      <td align="right" width="18%">哑口加价率</td> 
      <td width="32%"> 
        <input type="text" name="ykjjl" size="10" maxlength="9"  value="<%=ykjjl%>" >
        % </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="17%">窗套加价率</td> 
      <td width="33%"> 
        <input type="text" name="ctjjl" size="10" maxlength="9"  value="<%=ctjjl%>" >
        % </td>
      <td align="right" width="18%">&nbsp; </td>
      <td width="32%">&nbsp; </td>
</tr>
<input type="hidden" name="wheremtxbm"  value="<%=wheremtxbm%>" >
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
	if(	javaTrim(FormName.mtxbm)=="") {
		alert("请输入[门套线编码]！");
		FormName.mtxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mtxmc)=="") {
		alert("请输入[门套线名称]！");
		FormName.mtxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmjjl)=="") {
		alert("请输入[整樘门加价率]！");
		FormName.ztmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ztmjjl, "整樘门加价率"))) {
		return false;
	}
	if(	javaTrim(FormName.ykjjl)=="") {
		alert("请输入[哑口加价率]！");
		FormName.ykjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ykjjl, "哑口加价率"))) {
		return false;
	}
	if(	javaTrim(FormName.ctjjl)=="") {
		alert("请输入[窗套加价率]！");
		FormName.ctjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ctjjl, "窗套加价率"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
