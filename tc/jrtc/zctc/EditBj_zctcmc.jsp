<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tcbm=null;
String dqbm=null;
String tcmc=null;
String yj=null;
String tcj=null;
String bz=null;
String lx=null;
String wheretcbm=cf.GB2Uni(request.getParameter("tcbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tcbm,dqbm,tcmc,yj,tcj,bz,lx ";
	ls_sql+=" from  bj_zctcmc";
	ls_sql+=" where  (tcbm="+wheretcbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tcbm=cf.fillNull(rs.getString("tcbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		yj=cf.fillNull(rs.getString("yj"));
		tcj=cf.fillNull(rs.getString("tcj"));
		bz=cf.fillNull(rs.getString("bz"));
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
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">套餐编码</span></td> 
  <td width="32%"> 
    <input type="text" name="tcbm" size="20" maxlength="8"  value="<%=tcbm%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">地区</span></td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>套餐名称</td> 
  <td colspan="3"> 
    <input type="text" name="tcmc" size="73" maxlength="100"  value="<%=tcmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>原价</td>
  <td><input type="text" name="yj" size="20" maxlength="17"  value="<%=yj%>" ></td>
  <td align="right"><span class="STYLE1">*</span>套餐价</td>
  <td><input type="text" name="tcj" size="20" maxlength="17"  value="<%=tcj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>类型</td>
  <td><%
	cf.radioToken(out, "lx","1+家具套餐&2+健康计划",lx);
%></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheretcbm"  value="<%=wheretcbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input name="button" type="button" onClick="f_lrmx(editform)"  value="录入明细">
	  <input name="button2" type="button" onClick="f_drmx(editform)"  value="导入明细">
	  <input name="button22" type="button" onClick="f_ckmx(editform)"  value="查看明细">
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
	if(	javaTrim(FormName.tcbm)=="") {
		alert("请输入[套餐编码]！");
		FormName.tcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tcbm, "套餐编码"))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请输入[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.yj)=="") {
		alert("请输入[原价]！");
		FormName.yj.focus();
		return false;
	}
	if(!(isFloat(FormName.yj, "原价"))) {
		return false;
	}
	if(	javaTrim(FormName.tcj)=="") {
		alert("请输入[套餐价]！");
		FormName.tcj.focus();
		return false;
	}
	if(!(isFloat(FormName.tcj, "套餐价"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}

	FormName.action="SaveEditBj_zctcmc.jsp";
	FormName.submit();
	return true;
}

function f_lrmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tcbm)=="") {
		alert("请输入[套餐编码]！");
		FormName.tcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tcbm, "套餐编码"))) {
		return false;
	}

	FormName.action="InsertBj_zctcmx.jsp";
	FormName.submit();
	return true;
}

function f_drmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tcbm)=="") {
		alert("请输入[套餐编码]！");
		FormName.tcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tcbm, "套餐编码"))) {
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function f_ckmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tcbm)=="") {
		alert("请输入[套餐编码]！");
		FormName.tcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tcbm, "套餐编码"))) {
		return false;
	}

	FormName.action="Bj_zctcmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
