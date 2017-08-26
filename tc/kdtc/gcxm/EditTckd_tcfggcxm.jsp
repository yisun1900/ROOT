<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=null;
String bjjbbm=null;
String fgmc=null;
String hxbm=null;
String jgwzbm=null;
String xmbh=null;
String bzsl=null;
String lrr=null;
String lrsj=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherefgmc=cf.GB2Uni(request.getParameter("fgmc"));
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
String wherejgwzbm=cf.getParameter(request,"jgwzbm");
String wherexmbh=cf.GB2Uni(request.getParameter("xmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,fgmc,hxbm,jgwzbm,xmbh,bzsl,lrr,lrsj ";
	ls_sql+=" from  tckd_tcfggcxm";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (fgmc='"+wherefgmc+"') and  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"') and  (xmbh='"+wherexmbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		fgmc=cf.fillNull(rs.getString("fgmc"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		bzsl=cf.fillNull(rs.getString("bzsl"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<form method="post" action="SaveEditTckd_tcfggcxm.jsp" name="editform">
<div align="center">套餐标准工程项目－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">地区</font></td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">报价级别</font></td> 
  <td width="32%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">风格名称</font></td>
  <td><select name="fgmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select distinct tcmc c1,tcmc c2 from tckd_tcjgb where tcmc='"+fgmc+"' order by tcmc","");
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">户型</font></td>
  <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>结构位置</td>
  <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc",jgwzbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>项目编号</td> 
  <td width="32%"><input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>标准数量</td> 
  <td width="32%"><input type="text" name="bzsl" size="20" maxlength="17"  value="<%=bzsl%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
<input type="hidden" name="wherefgmc"  value="<%=wherefgmc%>" >
<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
<input type="hidden" name="wherejgwzbm"  value="<%=wherejgwzbm%>" >
<input type="hidden" name="wherexmbh"  value="<%=wherexmbh%>" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgmc)=="") {
		alert("请选择[风格名称]！");
		FormName.fgmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请选择[结构位置]！");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bzsl)=="") {
		alert("请输入[标准数量]！");
		FormName.bzsl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzsl, "标准数量"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
