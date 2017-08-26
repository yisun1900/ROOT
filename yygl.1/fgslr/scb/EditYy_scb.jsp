<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_scb_ygmc=null;
String ssbm=null;
String ssfgs=null;
String yy_scbkh_byjh=null;
String yy_scbkh_bylj=null;
String yy_scbkh_szjh=null;
String yy_scbkh_szwc=null;
String yy_scbkh_bzyj=null;
String yy_scbdj_byjh=null;
String yy_scbdj_bylj=null;
String yy_scbdj_szjh=null;
String yy_scbdj_szwc=null;
String yy_scbdj_bzjh=null;
String yy_scb_lrr=null;
String yy_scb_lrsj=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_scb_ygmc=cf.getParameter(request,"yy_scb_ygmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_scb_ygmc,ssbm,ssfgs,yy_scbkh_byjh,yy_scbkh_bylj,yy_scbkh_szjh,yy_scbkh_szwc,yy_scbkh_bzyj,yy_scbdj_byjh,yy_scbdj_bylj,yy_scbdj_szjh,yy_scbdj_szwc,yy_scbdj_bzjh,yy_scb_lrr,yy_scb_lrsj ";
	ls_sql+=" from  yy_scb";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_scb_ygmc='"+whereyy_scb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_scb_ygmc=cf.fillNull(rs.getString("yy_scb_ygmc"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_scbkh_byjh=cf.fillNull(rs.getString("yy_scbkh_byjh"));
		yy_scbkh_bylj=cf.fillNull(rs.getString("yy_scbkh_bylj"));
		yy_scbkh_szjh=cf.fillNull(rs.getString("yy_scbkh_szjh"));
		yy_scbkh_szwc=cf.fillNull(rs.getString("yy_scbkh_szwc"));
		yy_scbkh_bzyj=cf.fillNull(rs.getString("yy_scbkh_bzyj"));
		yy_scbdj_byjh=cf.fillNull(rs.getString("yy_scbdj_byjh"));
		yy_scbdj_bylj=cf.fillNull(rs.getString("yy_scbdj_bylj"));
		yy_scbdj_szjh=cf.fillNull(rs.getString("yy_scbdj_szjh"));
		yy_scbdj_szwc=cf.fillNull(rs.getString("yy_scbdj_szwc"));
		yy_scbdj_bzjh=cf.fillNull(rs.getString("yy_scbdj_bzjh"));
		yy_scb_lrr=cf.fillNull(rs.getString("yy_scb_lrr"));
		yy_scb_lrsj=cf.fillNull(rs.getDate("yy_scb_lrsj"));
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
<form method="post" action="SaveEditYy_scb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">所属分公司</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">所属部门</span></td>
  <td><select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'",ssbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">周期数</span></td> 
  <td width="31%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">市场部员工姓名</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_scb_ygmc" size="20" maxlength="20"  value="<%=yy_scb_ygmc%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本月计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_byjh" size="20" maxlength="8"  value="<%=yy_scbkh_byjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本月累计</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_bylj" size="20" maxlength="8"  value="<%=yy_scbkh_bylj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量上周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_szjh" size="20" maxlength="8"  value="<%=yy_scbkh_szjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量上周完成</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_szwc" size="20" maxlength="8"  value="<%=yy_scbkh_szwc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本周预计</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_bzyj" size="20" maxlength="8"  value="<%=yy_scbkh_bzyj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金本月计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_byjh" size="20" maxlength="8"  value="<%=yy_scbdj_byjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金本月累计</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_bylj" size="20" maxlength="8"  value="<%=yy_scbdj_bylj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金上周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_szjh" size="20" maxlength="8"  value="<%=yy_scbdj_szjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金上周完成</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_szwc" size="20" maxlength="8"  value="<%=yy_scbdj_szwc%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金本周预计</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_bzjh" size="20" maxlength="8"  value="<%=yy_scbdj_bzjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_scb_lrr" size="20" maxlength="20"  value="<%=yy_scb_lrr%>" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_scb_lrsj" size="20" maxlength="10"  value="<%=yy_scb_lrsj%>" readonly>  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_scb_ygmc"  value="<%=whereyy_scb_ygmc%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.yy_scb_ygmc)=="") {
		alert("请输入[市场部员工姓名]！");
		FormName.yy_scb_ygmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ssbm)=="") {
		alert("请选择[所属部门]！");
		FormName.ssbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_byjh)=="") {
		alert("请输入[目标客户数量本月计划]！");
		FormName.yy_scbkh_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_byjh, "目标客户数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_bylj)=="") {
		alert("请输入[目标客户数量本月累计]！");
		FormName.yy_scbkh_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_bylj, "目标客户数量本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_szjh)=="") {
		alert("请输入[目标客户数量上周计划]！");
		FormName.yy_scbkh_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_szjh, "目标客户数量上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_szwc)=="") {
		alert("请输入[目标客户数量上周完成]！");
		FormName.yy_scbkh_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_szwc, "目标客户数量上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_bzyj)=="") {
		alert("请输入[目标客户数量本周预计]！");
		FormName.yy_scbkh_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_bzyj, "目标客户数量本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_byjh)=="") {
		alert("请输入[收取定金本月计划]！");
		FormName.yy_scbdj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_byjh, "收取定金本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_bylj)=="") {
		alert("请输入[收取定金本月累计]！");
		FormName.yy_scbdj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_bylj, "收取定金本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_szjh)=="") {
		alert("请输入[收取定金上周计划]！");
		FormName.yy_scbdj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_szjh, "收取定金上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_szwc)=="") {
		alert("请输入[收取定金上周完成]！");
		FormName.yy_scbdj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_szwc, "收取定金上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_bzjh)=="") {
		alert("请输入[收取定金本周预计]！");
		FormName.yy_scbdj_bzjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_bzjh, "收取定金本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scb_lrr)=="") {
		alert("请输入[录入人]！");
		FormName.yy_scb_lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_scb_lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.yy_scb_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_scb_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
