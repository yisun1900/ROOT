<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String ssfgs=null;
String gzfw=null;
String gzxx=null;
String gzsx=null;
String gsbl=null;
String gdsj=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,ssfgs,gzfw,gzxx,gzsx,gsbl,gdsj ";
	ls_sql+=" from  rs_ksbl";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		gzfw=cf.fillNull(rs.getString("gzfw"));
		gzxx=cf.fillNull(rs.getString("gzxx"));
		gzsx=cf.fillNull(rs.getString("gzsx"));
		gsbl=cf.fillNull(rs.getString("gsbl"));
		gdsj=cf.fillNull(rs.getString("gdsj"));
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
<form method="post" action="SaveEditRs_ksbl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >
  </td>
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh",ssfgs);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">工资范围</td> 
  <td width="35%"> 
    <input type="text" name="gzfw" size="20" maxlength="50"  value="<%=gzfw%>" >
  </td>
  <td align="right" width="15%">工资下限</td> 
  <td width="35%"> 
    <input type="text" name="gzxx" size="20" maxlength="17"  value="<%=gzxx%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">工资上限</td> 
  <td width="35%"> 
    <input type="text" name="gzsx" size="20" maxlength="17"  value="<%=gzsx%>" >
  </td>
  <td align="right" width="15%">个税比率</td> 
  <td width="35%"> 
    <input type="text" name="gsbl" size="20" maxlength="9"  value="<%=gsbl%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">固定税金</td> 
  <td width="35%"> 
    <input type="text" name="gdsj" size="20" maxlength="17"  value="<%=gdsj%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.gzfw)=="") {
		alert("请输入[工资范围]！");
		FormName.gzfw.focus();
		return false;
	}
	if(	javaTrim(FormName.gzxx)=="") {
		alert("请输入[工资下限]！");
		FormName.gzxx.focus();
		return false;
	}
	if(!(isFloat(FormName.gzxx, "工资下限"))) {
		return false;
	}
	if(	javaTrim(FormName.gzsx)=="") {
		alert("请输入[工资上限]！");
		FormName.gzsx.focus();
		return false;
	}
	if(!(isFloat(FormName.gzsx, "工资上限"))) {
		return false;
	}
	if(	javaTrim(FormName.gsbl)=="") {
		alert("请输入[个税比率]！");
		FormName.gsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.gsbl, "个税比率"))) {
		return false;
	}
	if(	javaTrim(FormName.gdsj)=="") {
		alert("请输入[固定税金]！");
		FormName.gdsj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdsj, "固定税金"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
