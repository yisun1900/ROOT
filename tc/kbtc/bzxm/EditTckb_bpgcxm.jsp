<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String bjbbh=null;
String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String jgwzbm=null;
String xmbh=null;
String jldw=null;
double sl=0;
double dj=0;
String sfksc=null;
String sfkth=null;
String lrr=null;
String lrsj=null;

String wherebjbbh=cf.getParameter(request,"bjbbh");
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
String wherejgwzbm=cf.getParameter(request,"jgwzbm");
String wherexmbh=cf.GB2Uni(request.getParameter("xmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bjbbh,dqbm,bjjbbm,jldw,hxbm,jgwzbm,xmbh,sl,dj,sfksc,sfkth,lrr,lrsj ";
	ls_sql+=" from  tckb_bpgcxm";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (bjbbh='"+wherebjbbh+"') and  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"') and  (xmbh='"+wherexmbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		sfksc=cf.fillNull(rs.getString("sfksc"));
		sfkth=cf.fillNull(rs.getString("sfkth"));
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
<form method="post" action="SaveEditTckb_bpgcxm.jsp" name="editform">
<div align="center">套餐标配工程项目－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">报价版本号</font></td>
    <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:525PX">
       <option value="<%=bjbbh%>"><%=bjbbh%></option>
      </select>    </td>
  </tr>

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
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">户型</font></td>
  <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>结构位置</td>
  <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc",jgwzbm);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>项目编号</td> 
  <td width="32%"><input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>计量单位</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>标配数量</td>
  <td><input type="text" name="sl" size="20" maxlength="17"  value="<%=sl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>单价</td>
  <td><input type="text" name="dj" value="<%=dj%>" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否可删除</td>
  <td><%
	cf.radioToken(out, "sfksc","Y+可删除&N+否",sfksc);
%></td>
  <td align="right"><font color="#FF0000">*</font>是否可替换</td>
  <td><%
	cf.radioToken(out, "sfkth","Y+可替换&N+否",sfkth);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherebjbbh"  value="<%=wherebjbbh%>" >
		<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
		<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
		<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
		<input type="hidden" name="wherejgwzbm"  value="<%=wherejgwzbm%>" >
		<input type="hidden" name="wherexmbh"  value="<%=wherexmbh%>" >
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
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
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
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[标配数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "标配数量"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfksc)) {
		alert("请选择[是否可删除]！");
		FormName.sfksc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkth)) {
		alert("请选择[是否可替换]！");
		FormName.sfkth[0].focus();
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
