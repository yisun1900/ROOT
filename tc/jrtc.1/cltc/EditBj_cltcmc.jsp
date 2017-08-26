<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String tcmc=null;
String hxbm=null;
String tcjg=null;
String zcsfxxz=null;
String lx=null;

String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wheretcmc=cf.getParameter(request,"tcmc");
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,tcmc,hxbm,tcjg,zcsfxxz,lx ";
	ls_sql+=" from  bj_cltcmc";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (tcmc='"+wheretcmc+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		tcjg=cf.fillNull(rs.getString("tcjg"));
		zcsfxxz=cf.fillNull(rs.getString("zcsfxxz"));
		lx=cf.fillNull(rs.getString("lx"));
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
<form method="post" action="" name="editform" target="_blank">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">地区</span></td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">户型</span></td> 
  <td width="32%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>套餐名称</td>
  <td colspan="3"><input type="text" name="tcmc" value="<%=tcmc%>" size="73" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>套餐价格</td> 
  <td width="32%"><input type="text" name="tcjg" size="20" maxlength="17"  value="<%=tcjg%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>主材是否需选择</td>
  <td><%
	cf.radioToken(out, "zcsfxxz","1+自动选择&2+人工选择",zcsfxxz);
%></td>
  <td align="right"><span class="STYLE1">*</span>类型</td>
  <td><%
	cf.radioToken(out, "lx","1+窗帘套餐",lx);
%></td>
</tr>
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wheretcmc"  value="<%=wheretcmc%>" >
<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
      <input name="button" type="button" onClick="f_lrmx(editform)"  value="录入房间数量">
      <input name="button22" type="button" onClick="f_ckmx(editform)"  value="查看房间数量">
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请选择[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("请输入[套餐价格]！");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "套餐价格"))) {
		return false;
	}
	if(	!radioChecked(FormName.zcsfxxz)) {
		alert("请选择[主材是否需选择]！");
		FormName.zcsfxxz[0].focus();
		return false;
	}
/*
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
*/
	FormName.action="SaveEditBj_cltcmc.jsp";
	FormName.submit();
	return true;
}
function f_lrmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请选择[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="InsertBj_cltcfjsl.jsp";
	FormName.submit();
	return true;
}



function f_ckmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请选择[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="Bj_cltcfjslList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
