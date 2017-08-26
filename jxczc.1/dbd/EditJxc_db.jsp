<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String ygbh=(String)session.getAttribute("ygbh");
%>
<%

String dbyy=null;
String dcgs=null;
String dcdq=null;
String drgs=null;
String lrr=null;
String lrsj=null;
String bz=null;
String dbph=cf.GB2Uni(request.getParameter("dbph"));

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//表示录入存盘直接转过来
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dbyy,dcgs,dcdq,drgs,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  jxc_db";
	ls_sql+=" where  (dbph='"+dbph+"')  ";
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
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">修改调拨单（调拨批号：<%=dbph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>调拨原因</td> 
  <td width="32%"> 
    <select name="dbyy" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+集团调货&1+退货调拨",dbyy);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>调出公司</td>
  <td><select name="dcgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",dcgs);
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh",dcgs);
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dcgs+"'",dcgs);
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
	}
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>调入公司</td>
  <td><select name="drgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh",drgs);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20"  readonly>
  </td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20"  readonly>
  </td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'  order by dwbh","");
   %>
  </select>
  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
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
      <input name="button" type="button" onClick="f_tj(insertform)"  value=" 提 交 " >
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
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveEditJxc_db.jsp";
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

	FormName.action="/jxcdy/dydbd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
