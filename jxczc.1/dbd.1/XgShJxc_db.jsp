<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%

String dbyy=null;
String dcgs=null;
String dcdq=null;
String drgs=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String dbdzt=null;
String jgzyk=null;
String djck=null;
String shyj=null;

String dbph=cf.GB2Uni(request.getParameter("dbph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select dbyy,dcgs,dcdq,drgs,lrr,lrsj,dwmc,jxc_db.bz,dbdzt,jgzyk,djck,shyj ";
	ls_sql+=" from  jxc_db,sq_dwxx";
	ls_sql+=" where jxc_db.lrbm=sq_dwxx.dwbh and dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dbyy=cf.fillNull(rs.getString("dbyy"));
		dcgs=cf.fillNull(rs.getString("dcgs"));
		dcdq=cf.fillNull(rs.getString("dcdq"));
		drgs=cf.fillNull(rs.getString("drgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
		bz=cf.fillNull(rs.getString("bz"));
		dbdzt=cf.fillNull(rs.getString("dbdzt"));
		jgzyk=cf.fillNull(rs.getString("jgzyk"));
		djck=cf.fillNull(rs.getString("djck"));
		shyj=cf.fillNull(rs.getString("shyj"));
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
<title>调拨单－审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">调拨单－审核（调拨批号：<%=dbph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><span class="STYLE2">调出公司</span></td>
  <td width="32%"><select name="dcgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dcgs+"'",dcgs);
%>
  </select></td>
  <td width="18%" align="right"><span class="STYLE2">调拨原因</span></td>
  <td width="32%"><select name="dbyy" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectToken(out,"0+集团调货&1+退货调拨",dbyy,false);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入人</span></td>
  <td><%=lrr%></td>
  <td align="right"><span class="STYLE2">录入时间</span></td>
  <td><%=lrsj%></td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入部门</span></td>
  <td>
    <%=lrbm%>   </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">备注</span></td>
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>审核结论</td>
  <td><%
	cf.radioToken(out, "dbdzt","2+审核通过等待出库&7+审核未通过",dbdzt);
%></td>
  <td align="right"><span class="STYLE1">*</span>调入公司</td>
  <td><select name="drgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh",drgs);
%>
  </select></td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否经过总部中央库</td>
  <td><%
	cf.radioToken(out, "jgzyk","Y+经过中央库&N+否",jgzyk);
%></td>
  <td align="right">调经仓库</td>
  <td><select name="djck" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc where cksslx='0'  order by ckmc",djck);
%>
  </select></td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">审核人</span></td>
  <td><input type="text" name="shr" value="<%=yhmc%>" size="20"  readonly>  </td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">审核日期</span></td>
  <td><input type="text" name="shrq" value="<%=cf.today()%>" size="20"  readonly>  </td>
<tr bgcolor="#FFFFFF">
  <td align="right">审核意见</td>
  <td colspan="3"><textarea name="shyj" cols="71" rows="3"><%=shyj%></textarea></td>
  </tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="dbph"  value="<%=dbph%>" >
		<input type="hidden" name="dqbm"  value="<%=dcdq%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input name="button" type="button" onClick="f_pllr(insertform)"  value="常用材料录入" >
      <input name="button" type="button" onClick="f_cklr(insertform)"  value="选择录入" >
      <input name="button" type="button" onClick="f_ck(insertform)"  value="查看明细"  >
      <input name="button" type="button" onClick="f_print(insertform)"  value=" 打 印 " >
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
	if(	javaTrim(FormName.dbph)=="") {
		alert("请输入[调拨批号]！");
		FormName.dbph.focus();
		return false;
	}
	if(	javaTrim(FormName.dbyy)=="") {
		alert("请选择[调拨原因]！");
		FormName.dbyy.focus();
		return false;
	}
	if(	javaTrim(FormName.dcgs)=="") {
		alert("请选择[调出公司]！");
		FormName.dcgs.focus();
		return false;
	}
	if(	javaTrim(FormName.drgs)=="") {
		alert("请选择[调入公司]！");
		FormName.drgs.focus();
		return false;
	}


	if(	!radioChecked(FormName.jgzyk)) {
		alert("请选择[是否经过总部中央库]！");
		FormName.jgzyk[0].focus();
		return false;
	}
	if (FormName.jgzyk[0].checked)
	{
		if(	javaTrim(FormName.djck)=="") {
			alert("请输入[调经仓库]！");
			FormName.djck.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.djck)!="") {
			alert("错误！不经过中央库，不需选择[调经仓库]！");
			FormName.djck.focus();
			return false;
		}
	}
	
	
	if(	!radioChecked(FormName.dbdzt)) {
		alert("请选择[审核结论]！");
		FormName.dbdzt[0].focus();
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shrq)=="") {
		alert("请输入[审核日期]！");
		FormName.shrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.shrq, "审核日期"))) {
		return false;
	}

	if (FormName.dbdzt[1].checked)
	{
		if(	javaTrim(FormName.shyj)=="") {
			alert("请选择[审核意见]！");
			FormName.shyj.focus();
			return false;
		}
	}

	FormName.action="SaveXgShJxc_db.jsp";
	FormName.submit();
	return true;
}

function f_pllr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dbph)=="") {
		alert("请输入[调拨批号]！");
		FormName.dbph.focus();
		return false;
	}

	FormName.action="PlInsertJxc_clbm.jsp";
	FormName.submit();
	return true;
}


function f_cklr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dbph)=="") {
		alert("请输入[调拨批号]！");
		FormName.dbph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dbph)=="") {
		alert("请输入[调拨批号]！");
		FormName.dbph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clbm.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dbph)=="") {
		alert("请输入[调拨批号]！");
		FormName.dbph.focus();
		return false;
	}

	FormName.action="tjdbd.jsp";
	FormName.submit();
	return true;
}
function f_print(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dbph)=="") {
		alert("请输入[调拨批号]！");
		FormName.dbph.focus();
		return false;
	}

	FormName.action="/jxcdy/dypsd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
