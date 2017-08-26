<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_sj_fgs=null;

int yy_sjzky_mbkh=0;//总客源目标客户数量本月计划
int yy_sjzky_sqdj=0;//总客源收取定金数量本月计划

double yy_sjsjb_sjf=0;//设计部设计费本月计划
double yy_sjsjb_tqsjf=0;//设计部去年同期月度设计费
double yy_sjsjb_gccz=0;//设计部工程产值本月计划
double yy_sjsjb_tqgccz=0;//设计部去年同期月度工程产值
double yy_sjjjb_byjh=0;//家居部主材产值本月计划
double yy_sjjjb_qntq=0;//家居部去年同期月度主材产值

int yy_sjscb_mbkh=0;//市场部目标客户数量本月计划
int yy_sjwxb_mbkh=0;//市场部收取定金数量本月计划
int yy_sjqtqd_mbkh=0;//网销部目标客户数量本月计划
int yy_sjscb_sqdj=0;//网销部收取定金数量本月计划
int yy_sjwxb_sqdj=0;//其他渠道目标客户数量本月计划
int yy_sjqtqd_sqdj=0;//其他渠道收取定金数量本月计划

String yy_sj_lrsj=null;
String lrr=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_sj_fgs=cf.GB2Uni(request.getParameter("yy_sj_fgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_sj_fgs,yy_sjzky_mbkh,yy_sjzky_sqdj,yy_sjsjb_sjf,yy_sjsjb_tqsjf,yy_sjsjb_gccz,yy_sjsjb_tqgccz,yy_sjjjb_byjh,yy_sjjjb_qntq,yy_sjscb_mbkh,yy_sjwxb_mbkh,yy_sjqtqd_mbkh,yy_sjscb_sqdj,yy_sjwxb_sqdj,yy_sjqtqd_sqdj,yy_sj_lrsj,lrr ";
	ls_sql+=" from  yy_sj";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_sj_fgs='"+whereyy_sj_fgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_sj_fgs=cf.fillNull(rs.getString("yy_sj_fgs"));

		yy_sjzky_mbkh=rs.getInt("yy_sjzky_mbkh");
		yy_sjzky_sqdj=rs.getInt("yy_sjzky_sqdj");

		yy_sjsjb_sjf=rs.getDouble("yy_sjsjb_sjf");
		yy_sjsjb_tqsjf=rs.getDouble("yy_sjsjb_tqsjf");
		yy_sjsjb_gccz=rs.getDouble("yy_sjsjb_gccz");
		yy_sjsjb_tqgccz=rs.getDouble("yy_sjsjb_tqgccz");
		yy_sjjjb_byjh=rs.getDouble("yy_sjjjb_byjh");
		yy_sjjjb_qntq=rs.getDouble("yy_sjjjb_qntq");

		yy_sjscb_mbkh=rs.getInt("yy_sjscb_mbkh");
		yy_sjwxb_mbkh=rs.getInt("yy_sjwxb_mbkh");
		yy_sjqtqd_mbkh=rs.getInt("yy_sjqtqd_mbkh");
		yy_sjscb_sqdj=rs.getInt("yy_sjscb_sqdj");
		yy_sjwxb_sqdj=rs.getInt("yy_sjwxb_sqdj");
		yy_sjqtqd_sqdj=rs.getInt("yy_sjqtqd_sqdj");

		yy_sj_lrsj=cf.fillNull(rs.getDate("yy_sj_lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
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
<form method="post" action="SaveEditYy_sj.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span><span class="STYLE2">周期数</span></td> 
  <td width="27%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" readonly>  </td>
  <td align="right" width="23%"><span class="STYLE1">*</span><span class="STYLE2">所属分公司</span></td> 
  <td width="27%"> 
    <select name="yy_sj_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yy_sj_fgs+"'",yy_sj_fgs);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span>总客源目标客户数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjzky_mbkh" size="20" maxlength="8"  value="<%=yy_sjzky_mbkh%>" >  </td>
  <td align="right" width="23%"><span class="STYLE1">*</span>总客源收取定金数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjzky_sqdj" size="20" maxlength="8"  value="<%=yy_sjzky_sqdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>市场部目标客户数量本月计划</td>
  <td><input type="text" name="yy_sjscb_mbkh" size="20" maxlength="8"  value="<%=yy_sjscb_mbkh%>" >
  </td>
  <td align="right"><span class="STYLE1">*</span>市场部收取定金数量本月计划</td>
  <td><input type="text" name="yy_sjscb_sqdj" size="20" maxlength="8"  value="<%=yy_sjscb_sqdj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>网销部目标客户数量本月计划</td>
  <td><input type="text" name="yy_sjwxb_mbkh" size="20" maxlength="8"  value="<%=yy_sjwxb_mbkh%>" ></td>
  <td align="right"><span class="STYLE1">*</span>网销部收取定金数量本月计划</td>
  <td><input type="text" name="yy_sjwxb_sqdj" size="20" maxlength="8"  value="<%=yy_sjwxb_sqdj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span>设计部设计费本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjsjb_sjf" size="20" maxlength="17"  value="<%=yy_sjsjb_sjf%>" >  </td>
  <td align="right" width="23%"><span class="STYLE1">*</span>设计部去年同期月度设计费</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjsjb_tqsjf" size="20" maxlength="17"  value="<%=yy_sjsjb_tqsjf%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span>设计部工程产值本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjsjb_gccz" size="20" maxlength="17"  value="<%=yy_sjsjb_gccz%>" >  </td>
  <td align="right" width="23%"><span class="STYLE1">*</span>设计部去年同期月度工程产值</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjsjb_tqgccz" size="20" maxlength="17"  value="<%=yy_sjsjb_tqgccz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span>家居部主材产值本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjjjb_byjh" size="20" maxlength="17"  value="<%=yy_sjjjb_byjh%>" >  </td>
  <td align="right" width="23%"><span class="STYLE1">*</span>家居部去年同期月度主材产值</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjjjb_qntq" size="20" maxlength="17"  value="<%=yy_sjjjb_qntq%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span>其他渠道目标客户数量本月计划</td> 
  <td width="27%"><input type="text" name="yy_sjqtqd_mbkh" size="20" maxlength="8"  value="<%=yy_sjqtqd_mbkh%>" ></td>
  <td align="right" width="23%"><span class="STYLE1">*</span>其他渠道收取定金数量本月计划</td> 
  <td width="27%"> 
    <input type="text" name="yy_sjqtqd_sqdj" size="20" maxlength="8"  value="<%=yy_sjqtqd_sqdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_lrsj" size="20" maxlength="10"  value="<%=yy_sj_lrsj%>" readonly>  </td>
  <td align="right" width="23%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="27%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_sj_fgs"  value="<%=whereyy_sj_fgs%>" >
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
	if(	javaTrim(FormName.yy_sj_fgs)=="") {
		alert("请选择[分公司]！");
		FormName.yy_sj_fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_sjzky_mbkh)=="") {
		alert("请输入[总客源目标客户数量本月计划]！");
		FormName.yy_sjzky_mbkh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjzky_mbkh, "总客源目标客户数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjzky_sqdj)=="") {
		alert("请输入[总客源收取定金数量本月计划]！");
		FormName.yy_sjzky_sqdj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjzky_sqdj, "总客源收取定金数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjsjb_sjf)=="") {
		alert("请输入[设计部设计费本月计划]！");
		FormName.yy_sjsjb_sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjsjb_sjf, "设计部设计费本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjsjb_tqsjf)=="") {
		alert("请输入[设计部去年同期月度设计费]！");
		FormName.yy_sjsjb_tqsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjsjb_tqsjf, "设计部去年同期月度设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjsjb_gccz)=="") {
		alert("请输入[设计部工程产值本月计划]！");
		FormName.yy_sjsjb_gccz.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjsjb_gccz, "设计部工程产值本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjsjb_tqgccz)=="") {
		alert("请输入[设计部去年同期月度工程产值]！");
		FormName.yy_sjsjb_tqgccz.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjsjb_tqgccz, "设计部去年同期月度工程产值"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjjjb_byjh)=="") {
		alert("请输入[家居部主材产值本月计划]！");
		FormName.yy_sjjjb_byjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjjjb_byjh, "家居部主材产值本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjjjb_qntq)=="") {
		alert("请输入[家居部去年同期月度主材产值]！");
		FormName.yy_sjjjb_qntq.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjjjb_qntq, "家居部去年同期月度主材产值"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjscb_mbkh)=="") {
		alert("请输入[市场部目标客户数量本月计划]！");
		FormName.yy_sjscb_mbkh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjscb_mbkh, "市场部目标客户数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjwxb_mbkh)=="") {
		alert("请输入[网销部目标客户数量本月计划]！");
		FormName.yy_sjwxb_mbkh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjwxb_mbkh, "网销部目标客户数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjqtqd_mbkh)=="") {
		alert("请输入[其他渠道目标客户数量本月计划]！");
		FormName.yy_sjqtqd_mbkh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjqtqd_mbkh, "其他渠道目标客户数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjscb_sqdj)=="") {
		alert("请输入[市场部收取定金数量本月计划]！");
		FormName.yy_sjscb_sqdj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjscb_sqdj, "市场部收取定金数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjwxb_sqdj)=="") {
		alert("请输入[网销部收取定金数量本月计划]！");
		FormName.yy_sjwxb_sqdj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjwxb_sqdj, "网销部收取定金数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjqtqd_sqdj)=="") {
		alert("请输入[其他渠道收取定金数量本月计划]！");
		FormName.yy_sjqtqd_sqdj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjqtqd_sqdj, "其他渠道收取定金数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sj_lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.yy_sj_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_sj_lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
