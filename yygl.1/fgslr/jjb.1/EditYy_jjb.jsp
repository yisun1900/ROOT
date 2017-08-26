<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_jjb_ygmc=null;
String ssbm=null;
String ssfgs=null;
String yy_jjbqntq=null;
String yy_jjbbyjh=null;
String yy_jjbylj=null;
String yy_jjbdmbylj=null;
String yy_jjbszjh=null;
String yy_jjbszwc=null;
String yy_jjbbzyj=null;
String yy_jjb_lrsj=null;
String yy_jjb_lrr=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_jjb_ygmc=cf.getParameter(request,"yy_jjb_ygmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_jjb_ygmc,ssbm,ssfgs,yy_jjbqntq,yy_jjbbyjh,yy_jjbylj,yy_jjbdmbylj,yy_jjbszjh,yy_jjbszwc,yy_jjbbzyj,yy_jjb_lrsj,yy_jjb_lrr ";
	ls_sql+=" from  yy_jjb";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_jjb_ygmc='"+whereyy_jjb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_jjb_ygmc=cf.fillNull(rs.getString("yy_jjb_ygmc"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_jjbqntq=cf.fillNull(rs.getString("yy_jjbqntq"));
		yy_jjbbyjh=cf.fillNull(rs.getString("yy_jjbbyjh"));
		yy_jjbylj=cf.fillNull(rs.getString("yy_jjbylj"));
		yy_jjbdmbylj=cf.fillNull(rs.getString("yy_jjbdmbylj"));
		yy_jjbszjh=cf.fillNull(rs.getString("yy_jjbszjh"));
		yy_jjbszwc=cf.fillNull(rs.getString("yy_jjbszwc"));
		yy_jjbbzyj=cf.fillNull(rs.getString("yy_jjbbzyj"));
		yy_jjb_lrsj=cf.fillNull(rs.getDate("yy_jjb_lrsj"));
		yy_jjb_lrr=cf.fillNull(rs.getString("yy_jjb_lrr"));
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
<form method="post" action="SaveEditYy_jjb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">周期数</td> 
  <td width="35%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" >
  </td>
  <td align="right" width="15%">家居部员工名称</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjb_ygmc" size="20" maxlength="20"  value="<%=yy_jjb_ygmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">所属部门</td> 
  <td width="35%"> 
    <select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'",ssbm);
%>
    </select>
  </td>
  <td align="right" width="15%">所属分公司</td> 
  <td width="35%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">去年同期月度主材产值</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbqntq" size="20" maxlength="17"  value="<%=yy_jjbqntq%>" >
  </td>
  <td align="right" width="15%">本月计划</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbbyjh" size="20" maxlength="17"  value="<%=yy_jjbbyjh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">本月累计</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbylj" size="20" maxlength="17"  value="<%=yy_jjbylj%>" >
  </td>
  <td align="right" width="15%">所属店面本月累计工程产值</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbdmbylj" size="20" maxlength="17"  value="<%=yy_jjbdmbylj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">上周计划</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbszjh" size="20" maxlength="17"  value="<%=yy_jjbszjh%>" >
  </td>
  <td align="right" width="15%">上周完成</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbszwc" size="20" maxlength="17"  value="<%=yy_jjbszwc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">本周预计</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjbbzyj" size="20" maxlength="17"  value="<%=yy_jjbbzyj%>" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjb_lrsj" size="20" maxlength="10"  value="<%=yy_jjb_lrsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="yy_jjb_lrr" size="20" maxlength="20"  value="<%=yy_jjb_lrr%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_jjb_ygmc"  value="<%=whereyy_jjb_ygmc%>" >
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
	if(	javaTrim(FormName.yy_jjb_ygmc)=="") {
		alert("请输入[家居部员工名称]！");
		FormName.yy_jjb_ygmc.focus();
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
	if(	javaTrim(FormName.yy_jjbqntq)=="") {
		alert("请输入[去年同期月度主材产值]！");
		FormName.yy_jjbqntq.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbqntq, "去年同期月度主材产值"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbbyjh)=="") {
		alert("请输入[本月计划]！");
		FormName.yy_jjbbyjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbbyjh, "本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbylj)=="") {
		alert("请输入[本月累计]！");
		FormName.yy_jjbylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbylj, "本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbdmbylj)=="") {
		alert("请输入[所属店面本月累计工程产值]！");
		FormName.yy_jjbdmbylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbdmbylj, "所属店面本月累计工程产值"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbszjh)=="") {
		alert("请输入[上周计划]！");
		FormName.yy_jjbszjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbszjh, "上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbszwc)=="") {
		alert("请输入[上周完成]！");
		FormName.yy_jjbszwc.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbszwc, "上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjbbzyj)=="") {
		alert("请输入[本周预计]！");
		FormName.yy_jjbbzyj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_jjbbzyj, "本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjb_lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.yy_jjb_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_jjb_lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_jjb_lrr)=="") {
		alert("请输入[录入人]！");
		FormName.yy_jjb_lrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
