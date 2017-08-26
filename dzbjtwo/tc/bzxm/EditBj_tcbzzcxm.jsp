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
String tccplbbm=null;
String bzsl=null;
String sfxzsl=null;
String ccbfjj=null;
String sfbxx=null;
String sfyxsj=null;
String tcsjflbm=null;
String lrr=null;
String lrsj=null;
String sfyqxtpp=null;
String wherebjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
String wherejgwzbm=request.getParameter("jgwzbm");
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfyqxtpp,bjbbh,dqbm,bjjbbm,hxbm,jgwzbm,tccplbbm,bzsl,sfxzsl,ccbfjj,sfbxx,sfyxsj,tcsjflbm,lrr,lrsj ";
	ls_sql+=" from  bj_tcbzzcxm";
	ls_sql+=" where  (bjbbh='"+wherebjbbh+"') and  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"') and  (tccplbbm='"+wheretccplbbm+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		bzsl=cf.fillNull(rs.getString("bzsl"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		ccbfjj=cf.fillNull(rs.getString("ccbfjj"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfyxsj=cf.fillNull(rs.getString("sfyxsj"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
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
<form method="post" action="SaveEditBj_tcbzzcxm.jsp" name="editform">
<div align="center">套餐标准主材项目－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>报价版本号</td> 
  <td colspan="3"> 
    <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjbbh c1,bjbbh c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') order by bj_dzbjbb.dqbm,bjbbh",bjbbh);
%>
    </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>地区</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>报价级别</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' order by bjjbbm",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>户型</td> 
  <td width="32%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>结构位置</td> 
  <td width="32%"><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc",jgwzbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>产品类别</td> 
  <td width="32%"><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc",tccplbbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>是否必选项</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfbxx","Y+是&N+否",sfbxx);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>升级是否收费</td>
  <td><%
	cf.radioToken(out, "sfyxsj","Y+是&N+否",sfyxsj);
%></td>
  <td align="right">套餐升级分类</td>
  <td><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc",tcsjflbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否限制数量</td>
  <td><%
	cf.radioToken(out, "sfxzsl","1+可增项&2+不可增项&3+不控制",sfxzsl);
%></td>
  <td align="right"><font color="#FF0000">*</font>是否要求相同品牌</td>
  <td><%
	cf.radioToken(out, "sfyqxtpp","Y+是&N+否",sfyqxtpp);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>标准数量</td> 
  <td width="32%"><input type="text" name="bzsl" size="20" maxlength="17"  value="<%=bzsl%>" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>超出部分加价</td> 
  <td width="32%"><input type="text" name="ccbfjj" size="20" maxlength="17"  value="<%=ccbfjj%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

<input type="hidden" name="wherebjbbh"  value="<%=wherebjbbh%>" >
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
<input type="hidden" name="wherejgwzbm"  value="<%=wherejgwzbm%>" >
<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
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
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品类别]！");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxsj)) {
		alert("请选择[升级是否收费]！");
		FormName.sfyxsj[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.sfxzsl)) {
		alert("请选择[是否限制数量]！");
		FormName.sfxzsl[0].focus();
		return false;
	}
	if (FormName.sfxzsl[0].checked)
	{
		if(	javaTrim(FormName.bzsl)=="") {
			alert("错误！数量可增项，必须输入[标准数量]！");
			FormName.bzsl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzsl, "标准数量"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)=="") {
			alert("错误！数量可增项，必须输入[超出部分加价]！");
			FormName.ccbfjj.focus();
			return false;
		}
		if(!(isFloat(FormName.ccbfjj, "超出部分加价"))) {
			return false;
		}
	}
	else if (FormName.sfxzsl[1].checked)
	{
		if(	javaTrim(FormName.bzsl)=="") {
			alert("错误！数量不可增项，必须输入[标准数量]！");
			FormName.bzsl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzsl, "标准数量"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && javaTrim(FormName.ccbfjj)!="0" ) {
			alert("错误！数量不可增项，不需要[超出部分加价]！");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else
	{
		if(	javaTrim(FormName.bzsl)!="" && javaTrim(FormName.bzsl)!="0") {
			alert("错误！数量不控制 ，不需要[标准数量]！");
			FormName.bzsl.select();
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && javaTrim(FormName.ccbfjj)!="0" ) {
			alert("错误！数量不控制 ，不需要[超出部分加价]！");
			FormName.ccbfjj.select();
			return false;
		}
	}
	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("请选择[是否要求相同品牌]！");
		FormName.sfyqxtpp[0].focus();
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
