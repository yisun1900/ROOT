<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zpzw=null;
String zprs=null;
String bz=null;
String wherezpmxbh=cf.GB2Uni(request.getParameter("zpmxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zpzw,zprs,bz ";
	ls_sql+=" from  rs_zpjhmx";
	ls_sql+=" where  (zpmxbh='"+wherezpmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zpzw=cf.fillNull(rs.getString("zpzw"));
		zprs=cf.fillNull(rs.getString("zprs"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditRs_zpjhmx.jsp" name="editform">
<div align="center"><b>招聘明细（<%=wherezpmxbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘职位</td> 
  <td width="35%"> 
    <select name="zpzw" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm",zpzw);
%>
    </select>
  </td>
  <td align="right" width="15%">招聘人数</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8"  value="<%=zprs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherezpmxbh"  value="<%=wherezpmxbh%>" >
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
	if(	javaTrim(FormName.zpzw)=="") {
		alert("请选择[招聘职位]！");
		FormName.zpzw.focus();
		return false;
	}
	if(	javaTrim(FormName.zprs)=="") {
		alert("请输入[招聘人数]！");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "招聘人数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
