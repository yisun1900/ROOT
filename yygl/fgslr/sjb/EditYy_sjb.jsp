<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_sjb_ygmc=null;
String ssbm=null;
String ssfgs=null;
String yy_sjbdj_sydjcb=null;
String yy_sjbdj_byjh=null;
String yy_sjbdj_bylj=null;
String yy_sjbdj_szjh=null;
String yy_sjbdj_szwc=null;
String yy_sjbdj_bzyj=null;
String yy_sjbdj_bztdj=null;
String yy_sjbdj_byljtdj=null;
String yy_sjbsjf_byjh=null;
String yy_sjbsjf_bylj=null;
String yy_sjbsjf_szjh=null;
String yy_sjbsjf_szwc=null;
String yy_sjbsjf_bzyj=null;
String yy_sjbgccz_byjh=null;
String yy_sjbgccz_bylj=null;
String yy_sjbgccz_szjh=null;
String yy_sjbgccz_szwc=null;
String yy_sjbgccz_bzyj=null;
String yy_sjbzccz_byjh=null;
String yy_sjbzccz_bylj=null;
String yy_sjbzccz_szjh=null;
String yy_sjbzccz_szwc=null;
String yy_sjbzccz_bzyj=null;
String yy_sjb_lrr=null;
String yy_sjb_lrsj=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String wheressbm=cf.GB2Uni(request.getParameter("ssbm"));
String whereyy_sjb_ygmc=cf.getParameter(request,"yy_sjb_ygmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_sjb_ygmc,ssbm,ssfgs,yy_sjbdj_sydjcb,yy_sjbdj_byjh,yy_sjbdj_bylj,yy_sjbdj_szjh,yy_sjbdj_szwc,yy_sjbdj_bzyj,yy_sjbdj_bztdj,yy_sjbdj_byljtdj,yy_sjbsjf_byjh,yy_sjbsjf_bylj,yy_sjbsjf_szjh,yy_sjbsjf_szwc,yy_sjbsjf_bzyj,yy_sjbgccz_byjh,yy_sjbgccz_bylj,yy_sjbgccz_szjh,yy_sjbgccz_szwc,yy_sjbgccz_bzyj,yy_sjbzccz_byjh,yy_sjbzccz_bylj,yy_sjbzccz_szjh,yy_sjbzccz_szwc,yy_sjbzccz_bzyj,yy_sjb_lrr,yy_sjb_lrsj ";
	ls_sql+=" from  yy_sjb";
	ls_sql+=" where  (zqs="+wherezqs+") and  (ssbm='"+wheressbm+"') and  (yy_sjb_ygmc='"+whereyy_sjb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_sjb_ygmc=cf.fillNull(rs.getString("yy_sjb_ygmc"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_sjbdj_sydjcb=cf.fillNull(rs.getString("yy_sjbdj_sydjcb"));
		yy_sjbdj_byjh=cf.fillNull(rs.getString("yy_sjbdj_byjh"));
		yy_sjbdj_bylj=cf.fillNull(rs.getString("yy_sjbdj_bylj"));
		yy_sjbdj_szjh=cf.fillNull(rs.getString("yy_sjbdj_szjh"));
		yy_sjbdj_szwc=cf.fillNull(rs.getString("yy_sjbdj_szwc"));
		yy_sjbdj_bzyj=cf.fillNull(rs.getString("yy_sjbdj_bzyj"));
		yy_sjbdj_bztdj=cf.fillNull(rs.getString("yy_sjbdj_bztdj"));
		yy_sjbdj_byljtdj=cf.fillNull(rs.getString("yy_sjbdj_byljtdj"));
		yy_sjbsjf_byjh=cf.fillNull(rs.getString("yy_sjbsjf_byjh"));
		yy_sjbsjf_bylj=cf.fillNull(rs.getString("yy_sjbsjf_bylj"));
		yy_sjbsjf_szjh=cf.fillNull(rs.getString("yy_sjbsjf_szjh"));
		yy_sjbsjf_szwc=cf.fillNull(rs.getString("yy_sjbsjf_szwc"));
		yy_sjbsjf_bzyj=cf.fillNull(rs.getString("yy_sjbsjf_bzyj"));
		yy_sjbgccz_byjh=cf.fillNull(rs.getString("yy_sjbgccz_byjh"));
		yy_sjbgccz_bylj=cf.fillNull(rs.getString("yy_sjbgccz_bylj"));
		yy_sjbgccz_szjh=cf.fillNull(rs.getString("yy_sjbgccz_szjh"));
		yy_sjbgccz_szwc=cf.fillNull(rs.getString("yy_sjbgccz_szwc"));
		yy_sjbgccz_bzyj=cf.fillNull(rs.getString("yy_sjbgccz_bzyj"));
		yy_sjbzccz_byjh=cf.fillNull(rs.getString("yy_sjbzccz_byjh"));
		yy_sjbzccz_bylj=cf.fillNull(rs.getString("yy_sjbzccz_bylj"));
		yy_sjbzccz_szjh=cf.fillNull(rs.getString("yy_sjbzccz_szjh"));
		yy_sjbzccz_szwc=cf.fillNull(rs.getString("yy_sjbzccz_szwc"));
		yy_sjbzccz_bzyj=cf.fillNull(rs.getString("yy_sjbzccz_bzyj"));
		yy_sjb_lrr=cf.fillNull(rs.getString("yy_sjb_lrr"));
		yy_sjb_lrsj=cf.fillNull(rs.getDate("yy_sjb_lrsj"));
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
<form method="post" action="SaveEditYy_sjb.jsp" name="editform">
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
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">设计部员工名称</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_sjb_ygmc" size="20" maxlength="20"  value="<%=yy_sjb_ygmc%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>以往(非本月)储备</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_sydjcb" size="20" maxlength="8"  value="<%=yy_sjbdj_sydjcb%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>本月计划收取定金</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_byjh" size="20" maxlength="8"  value="<%=yy_sjbdj_byjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>本月累计收取定金</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_bylj" size="20" maxlength="8"  value="<%=yy_sjbdj_bylj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>上周计划收取定金</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_szjh" size="20" maxlength="8"  value="<%=yy_sjbdj_szjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>上周完成收取定金</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_szwc" size="20" maxlength="8"  value="<%=yy_sjbdj_szwc%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>本周预计收取定金</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_bzyj" size="20" maxlength="8"  value="<%=yy_sjbdj_bzyj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>本周退定金</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_bztdj" size="20" maxlength="8"  value="<%=yy_sjbdj_bztdj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>本月累计退定金</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_byljtdj" size="20" maxlength="8"  value="<%=yy_sjbdj_byljtdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>设计费本月计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_byjh" size="20" maxlength="17"  value="<%=yy_sjbsjf_byjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>设计费本月累计</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_bylj" size="20" maxlength="17"  value="<%=yy_sjbsjf_bylj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>设计费上周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_szjh" size="20" maxlength="17"  value="<%=yy_sjbsjf_szjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>设计费上周完成</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_szwc" size="20" maxlength="17"  value="<%=yy_sjbsjf_szwc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>设计费本周预计</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_bzyj" size="20" maxlength="17"  value="<%=yy_sjbsjf_bzyj%>" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>工程产值本月计划</td>
  <td><input type="text" name="yy_sjbgccz_byjh" size="20" maxlength="17"  value="<%=yy_sjbgccz_byjh%>" ></td>
  <td align="right"><span class="STYLE1">*</span>工程产值本月累计</td>
  <td><input type="text" name="yy_sjbgccz_bylj" size="20" maxlength="17"  value="<%=yy_sjbgccz_bylj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>工程产值上周计划</td> 
  <td width="31%"><input type="text" name="yy_sjbgccz_szjh" size="20" maxlength="17"  value="<%=yy_sjbgccz_szjh%>" ></td>
  <td align="right" width="19%"><span class="STYLE1">*</span>工程产值上周完成</td> 
  <td width="31%"><input type="text" name="yy_sjbgccz_szwc" size="20" maxlength="17"  value="<%=yy_sjbgccz_szwc%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>工程产值本周预计</td> 
  <td width="31%"><input type="text" name="yy_sjbgccz_bzyj" size="20" maxlength="17"  value="<%=yy_sjbgccz_bzyj%>" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>主材产值本月计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_byjh" size="20" maxlength="17"  value="<%=yy_sjbzccz_byjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>主材产值本月累计</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_bylj" size="20" maxlength="17"  value="<%=yy_sjbzccz_bylj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>主材产值上周计划</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_szjh" size="20" maxlength="17"  value="<%=yy_sjbzccz_szjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>主材产值上周完成</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_szwc" size="20" maxlength="17"  value="<%=yy_sjbzccz_szwc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>主材产值本月预计</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_bzyj" size="20" maxlength="17"  value="<%=yy_sjbzccz_bzyj%>" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="31%"><input type="text" name="yy_sjb_lrr" size="20" maxlength="20"  value="<%=yy_sjb_lrr%>" readonly></td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span> </td>
  <td width="31%"><input type="text" name="yy_sjb_lrsj" size="20" maxlength="10"  value="<%=yy_sjb_lrsj%>" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
		<input type="hidden" name="wheressbm"  value="<%=wheressbm%>" >
		<input type="hidden" name="whereyy_sjb_ygmc"  value="<%=whereyy_sjb_ygmc%>" >
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
	if(	javaTrim(FormName.yy_sjb_ygmc)=="") {
		alert("请输入[设计部员工名称]！");
		FormName.yy_sjb_ygmc.focus();
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
	if(	javaTrim(FormName.yy_sjbdj_sydjcb)=="") {
		alert("请输入[以往(非本月)储备]！");
		FormName.yy_sjbdj_sydjcb.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_sydjcb, "以往(非本月)储备"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_byjh)=="") {
		alert("请输入[本月计划收取定金]！");
		FormName.yy_sjbdj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_byjh, "本月计划收取定金"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_bylj)=="") {
		alert("请输入[本月累计收取定金]！");
		FormName.yy_sjbdj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_bylj, "本月累计收取定金"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_szjh)=="") {
		alert("请输入[上周计划收取定金]！");
		FormName.yy_sjbdj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_szjh, "上周计划收取定金"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_szwc)=="") {
		alert("请输入[上周完成收取定金]！");
		FormName.yy_sjbdj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_szwc, "上周完成收取定金"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_bzyj)=="") {
		alert("请输入[本周预计收取定金]！");
		FormName.yy_sjbdj_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_bzyj, "本周预计收取定金"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_bztdj)=="") {
		alert("请输入[本周退定金]！");
		FormName.yy_sjbdj_bztdj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_bztdj, "本周退定金"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_byljtdj)=="") {
		alert("请输入[本月累计退定金]！");
		FormName.yy_sjbdj_byljtdj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_byljtdj, "本月累计退定金"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_byjh)=="") {
		alert("请输入[设计费本月计划]！");
		FormName.yy_sjbsjf_byjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_byjh, "设计费本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_bylj)=="") {
		alert("请输入[设计费本月累计]！");
		FormName.yy_sjbsjf_bylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_bylj, "设计费本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_szjh)=="") {
		alert("请输入[设计费上周计划]！");
		FormName.yy_sjbsjf_szjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_szjh, "设计费上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_szwc)=="") {
		alert("请输入[设计费上周完成]！");
		FormName.yy_sjbsjf_szwc.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_szwc, "设计费上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_bzyj)=="") {
		alert("请输入[设计费本周预计]！");
		FormName.yy_sjbsjf_bzyj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_bzyj, "设计费本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_byjh)=="") {
		alert("请输入[工程产值本月计划]！");
		FormName.yy_sjbgccz_byjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_byjh, "工程产值本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_bylj)=="") {
		alert("请输入[工程产值本月累计]！");
		FormName.yy_sjbgccz_bylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_bylj, "工程产值本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_szjh)=="") {
		alert("请输入[工程产值上周计划]！");
		FormName.yy_sjbgccz_szjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_szjh, "工程产值上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_szwc)=="") {
		alert("请输入[工程产值上周完成]！");
		FormName.yy_sjbgccz_szwc.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_szwc, "工程产值上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_bzyj)=="") {
		alert("请输入[工程产值本周预计]！");
		FormName.yy_sjbgccz_bzyj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_bzyj, "工程产值本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_byjh)=="") {
		alert("请输入[主材产值本月计划]！");
		FormName.yy_sjbzccz_byjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_byjh, "主材产值本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_bylj)=="") {
		alert("请输入[主材产值本月累计]！");
		FormName.yy_sjbzccz_bylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_bylj, "主材产值本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_szjh)=="") {
		alert("请输入[主材产值上周计划]！");
		FormName.yy_sjbzccz_szjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_szjh, "主材产值上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_szwc)=="") {
		alert("请输入[主材产值上周完成]！");
		FormName.yy_sjbzccz_szwc.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_szwc, "主材产值上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_bzyj)=="") {
		alert("请输入[主材产值本月预计]！");
		FormName.yy_sjbzccz_bzyj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_bzyj, "主材产值本月预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjb_lrr)=="") {
		alert("请输入[录入人]！");
		FormName.yy_sjb_lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_sjb_lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.yy_sjb_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_sjb_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
