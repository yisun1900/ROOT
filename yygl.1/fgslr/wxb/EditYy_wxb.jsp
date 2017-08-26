<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_wxb_ygmc=null;
String ssbm=null;
String ssfgs=null;
String yy_wxbkh_byjh=null;
String yy_wxbkh_bylj=null;
String yy_wxbkh_szjh=null;
String yy_wxbkh_szwc=null;
String yy_wxbkh_bzyj=null;
String yy_wxbdj_byjh=null;
String yy_wxbdj_bylj=null;
String yy_wxbdj_szjh=null;
String yy_wxbdj_szwc=null;
String yy_wxbdj_bzjh=null;
String yy_wxb_lrr=null;
String yy_wxb_lrsj=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_wxb_ygmc=cf.getParameter(request,"yy_wxb_ygmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_wxb_ygmc,ssbm,ssfgs,yy_wxbkh_byjh,yy_wxbkh_bylj,yy_wxbkh_szjh,yy_wxbkh_szwc,yy_wxbkh_bzyj,yy_wxbdj_byjh,yy_wxbdj_bylj,yy_wxbdj_szjh,yy_wxbdj_szwc,yy_wxbdj_bzjh,yy_wxb_lrr,yy_wxb_lrsj ";
	ls_sql+=" from  yy_wxb";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_wxb_ygmc='"+whereyy_wxb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_wxb_ygmc=cf.fillNull(rs.getString("yy_wxb_ygmc"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_wxbkh_byjh=cf.fillNull(rs.getString("yy_wxbkh_byjh"));
		yy_wxbkh_bylj=cf.fillNull(rs.getString("yy_wxbkh_bylj"));
		yy_wxbkh_szjh=cf.fillNull(rs.getString("yy_wxbkh_szjh"));
		yy_wxbkh_szwc=cf.fillNull(rs.getString("yy_wxbkh_szwc"));
		yy_wxbkh_bzyj=cf.fillNull(rs.getString("yy_wxbkh_bzyj"));
		yy_wxbdj_byjh=cf.fillNull(rs.getString("yy_wxbdj_byjh"));
		yy_wxbdj_bylj=cf.fillNull(rs.getString("yy_wxbdj_bylj"));
		yy_wxbdj_szjh=cf.fillNull(rs.getString("yy_wxbdj_szjh"));
		yy_wxbdj_szwc=cf.fillNull(rs.getString("yy_wxbdj_szwc"));
		yy_wxbdj_bzjh=cf.fillNull(rs.getString("yy_wxbdj_bzjh"));
		yy_wxb_lrr=cf.fillNull(rs.getString("yy_wxb_lrr"));
		yy_wxb_lrsj=cf.fillNull(rs.getDate("yy_wxb_lrsj"));
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
<form method="post" action="SaveEditYy_wxb.jsp" name="editform">
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
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">网销部员工名称</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_wxb_ygmc" size="20" maxlength="20"  value="<%=yy_wxb_ygmc%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本月计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_byjh" size="20" maxlength="8"  value="<%=yy_wxbkh_byjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本月累计</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_bylj" size="20" maxlength="8"  value="<%=yy_wxbkh_bylj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量上周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_szjh" size="20" maxlength="8"  value="<%=yy_wxbkh_szjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量上周完成</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_szwc" size="20" maxlength="8"  value="<%=yy_wxbkh_szwc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>目标客户数量本周预计</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_bzyj" size="20" maxlength="8"  value="<%=yy_wxbkh_bzyj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量本月计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_byjh" size="20" maxlength="8"  value="<%=yy_wxbdj_byjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量本月累计</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_bylj" size="20" maxlength="8"  value="<%=yy_wxbdj_bylj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量上周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_szjh" size="20" maxlength="8"  value="<%=yy_wxbdj_szjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量上周完成</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_szwc" size="20" maxlength="8"  value="<%=yy_wxbdj_szwc%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>收取定金数量本周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_bzjh" size="20" maxlength="8"  value="<%=yy_wxbdj_bzjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_wxb_lrr" size="20" maxlength="20"  value="<%=yy_wxb_lrr%>" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_wxb_lrsj" size="20" maxlength="10"  value="<%=yy_wxb_lrsj%>" readonly>  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_wxb_ygmc"  value="<%=whereyy_wxb_ygmc%>" >
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
	if(	javaTrim(FormName.yy_wxb_ygmc)=="") {
		alert("请输入[网销部员工名称]！");
		FormName.yy_wxb_ygmc.focus();
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
	if(	javaTrim(FormName.yy_wxbkh_byjh)=="") {
		alert("请输入[目标客户数量本月计划]！");
		FormName.yy_wxbkh_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_byjh, "目标客户数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbkh_bylj)=="") {
		alert("请输入[目标客户数量本月累计]！");
		FormName.yy_wxbkh_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_bylj, "目标客户数量本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbkh_szjh)=="") {
		alert("请输入[目标客户数量上周计划]！");
		FormName.yy_wxbkh_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_szjh, "目标客户数量上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbkh_szwc)=="") {
		alert("请输入[目标客户数量上周完成]！");
		FormName.yy_wxbkh_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_szwc, "目标客户数量上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbkh_bzyj)=="") {
		alert("请输入[目标客户数量本周预计]！");
		FormName.yy_wxbkh_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_bzyj, "目标客户数量本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_byjh)=="") {
		alert("请输入[收取定金数量本月计划]！");
		FormName.yy_wxbdj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_byjh, "收取定金数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_bylj)=="") {
		alert("请输入[收取定金数量本月累计]！");
		FormName.yy_wxbdj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_bylj, "收取定金数量本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_szjh)=="") {
		alert("请输入[收取定金数量上周计划]！");
		FormName.yy_wxbdj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_szjh, "收取定金数量上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_szwc)=="") {
		alert("请输入[收取定金数量上周完成]！");
		FormName.yy_wxbdj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_szwc, "收取定金数量上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_bzjh)=="") {
		alert("请输入[收取定金数量本周计划]！");
		FormName.yy_wxbdj_bzjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_bzjh, "收取定金数量本周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxb_lrr)=="") {
		alert("请输入[录入人]！");
		FormName.yy_wxb_lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_wxb_lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.yy_wxb_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_wxb_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
