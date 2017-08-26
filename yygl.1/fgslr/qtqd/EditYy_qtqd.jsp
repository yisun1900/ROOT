<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String ssfgs=null;
String yy_qtqdkh_byjh=null;
String yy_qtqdkh_bylj=null;
String yy_qtqdkh_szjh=null;
String yy_qtqdkh_szwc=null;
String yy_qtqdkh_bzyj=null;
String yy_qtqddj_byjh=null;
String yy_qtqddj_bylj=null;
String yy_qtqddj_szjh=null;
String yy_qtqddj_szwc=null;
String yy_qtqddj_bzyj=null;
String yy_qtqd_lrsj=null;
String yy_qtqd_lrr=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,ssfgs,yy_qtqdkh_byjh,yy_qtqdkh_bylj,yy_qtqdkh_szjh,yy_qtqdkh_szwc,yy_qtqdkh_bzyj,yy_qtqddj_byjh,yy_qtqddj_bylj,yy_qtqddj_szjh,yy_qtqddj_szwc,yy_qtqddj_bzyj,yy_qtqd_lrsj,yy_qtqd_lrr ";
	ls_sql+=" from  yy_qtqd";
	ls_sql+=" where  (zqs="+wherezqs+") and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_qtqdkh_byjh=cf.fillNull(rs.getString("yy_qtqdkh_byjh"));
		yy_qtqdkh_bylj=cf.fillNull(rs.getString("yy_qtqdkh_bylj"));
		yy_qtqdkh_szjh=cf.fillNull(rs.getString("yy_qtqdkh_szjh"));
		yy_qtqdkh_szwc=cf.fillNull(rs.getString("yy_qtqdkh_szwc"));
		yy_qtqdkh_bzyj=cf.fillNull(rs.getString("yy_qtqdkh_bzyj"));
		yy_qtqddj_byjh=cf.fillNull(rs.getString("yy_qtqddj_byjh"));
		yy_qtqddj_bylj=cf.fillNull(rs.getString("yy_qtqddj_bylj"));
		yy_qtqddj_szjh=cf.fillNull(rs.getString("yy_qtqddj_szjh"));
		yy_qtqddj_szwc=cf.fillNull(rs.getString("yy_qtqddj_szwc"));
		yy_qtqddj_bzyj=cf.fillNull(rs.getString("yy_qtqddj_bzyj"));
		yy_qtqd_lrsj=cf.fillNull(rs.getDate("yy_qtqd_lrsj"));
		yy_qtqd_lrr=cf.fillNull(rs.getString("yy_qtqd_lrr"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditYy_qtqd.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">周期数</span></td> 
  <td width="31%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" readonly>
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">所属分公司</span></td> 
  <td width="31%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本月计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_byjh" size="20" maxlength="8"  value="<%=yy_qtqdkh_byjh%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本月累计</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_bylj" size="20" maxlength="8"  value="<%=yy_qtqdkh_bylj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量上周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_szjh" size="20" maxlength="8"  value="<%=yy_qtqdkh_szjh%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量上周完成</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_szwc" size="20" maxlength="8"  value="<%=yy_qtqdkh_szwc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本周预计</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_bzyj" size="20" maxlength="8"  value="<%=yy_qtqdkh_bzyj%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量本月计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_byjh" size="20" maxlength="8"  value="<%=yy_qtqddj_byjh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量本月累计</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_bylj" size="20" maxlength="8"  value="<%=yy_qtqddj_bylj%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量上周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_szjh" size="20" maxlength="8"  value="<%=yy_qtqddj_szjh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量上周完成</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_szwc" size="20" maxlength="8"  value="<%=yy_qtqddj_szwc%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量本周预计</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_bzyj" size="20" maxlength="8"  value="<%=yy_qtqddj_bzyj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqd_lrsj" size="20" maxlength="10"  value="<%=yy_qtqd_lrsj%>" readonly>
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqd_lrr" size="20" maxlength="20"  value="<%=yy_qtqd_lrr%>" readonly>
  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
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
	if(	javaTrim(FormName.zqs)=="") {
		alert("请输入[周期数]！");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "周期数"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_byjh)=="") {
		alert("请输入[目标客户数量本月计划]！");
		FormName.yy_qtqdkh_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_byjh, "目标客户数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_bylj)=="") {
		alert("请输入[目标客户数量本月累计]！");
		FormName.yy_qtqdkh_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_bylj, "目标客户数量本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_szjh)=="") {
		alert("请输入[目标客户数量上周计划]！");
		FormName.yy_qtqdkh_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_szjh, "目标客户数量上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_szwc)=="") {
		alert("请输入[目标客户数量上周完成]！");
		FormName.yy_qtqdkh_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_szwc, "目标客户数量上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_bzyj)=="") {
		alert("请输入[目标客户数量本周预计]！");
		FormName.yy_qtqdkh_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_bzyj, "目标客户数量本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_byjh)=="") {
		alert("请输入[收取定金数量本月计划]！");
		FormName.yy_qtqddj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_byjh, "收取定金数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_bylj)=="") {
		alert("请输入[收取定金数量本月累计]！");
		FormName.yy_qtqddj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_bylj, "收取定金数量本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_szjh)=="") {
		alert("请输入[收取定金数量上周计划]！");
		FormName.yy_qtqddj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_szjh, "收取定金数量上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_szwc)=="") {
		alert("请输入[收取定金数量上周完成]！");
		FormName.yy_qtqddj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_szwc, "收取定金数量上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_bzyj)=="") {
		alert("请输入[收取定金数量本周预计]！");
		FormName.yy_qtqddj_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_bzyj, "收取定金数量本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqd_lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.yy_qtqd_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_qtqd_lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqd_lrr)=="") {
		alert("请输入[录入人]！");
		FormName.yy_qtqd_lrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
