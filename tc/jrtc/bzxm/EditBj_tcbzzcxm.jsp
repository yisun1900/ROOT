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
String sfbxx=null;
String sfyxsj=null;
String tcsjflbm=null;
String lrr=null;
String lrsj=null;
String sfyqxtpp=null;

String jldw=null;
String sfkjm=null;
String jmfl=null;
String jmjldw=null;
double yxjmzdsl=0;
double jmdj=0;
String sfkgh=null;
double khzdsl=0;
double ghzj=0;


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
	ls_sql="select bjbbh,sfyqxtpp,dqbm,bjjbbm,hxbm,jgwzbm,tccplbbm,bzsl,sfxzsl,sfbxx,sfyxsj,tcsjflbm,lrr,lrsj ";
	ls_sql+=" ,jldw,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj";
	ls_sql+=" from  bj_tcbzzcxm";
	ls_sql+=" where  (bjbbh='"+wherebjbbh+"') and (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"') and  (tccplbbm='"+wheretccplbbm+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		jmfl=cf.fillNull(rs.getString("jmfl"));
		jmjldw=cf.fillNull(rs.getString("jmjldw"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
		jmdj=rs.getDouble("jmdj");
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		khzdsl=rs.getDouble("khzdsl");
		ghzj=rs.getDouble("ghzj");

		sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		bzsl=cf.fillNull(rs.getString("bzsl"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
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
  <tr bgcolor="#E8E8FF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">报价版本号</font></td>
    <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:525PX">
        <%
	cf.selectItem(out,"select bjbbh c1,bjbbh c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') and bjbbh='"+bjbbh+"' order by bj_dzbjbb.dqbm,bjbbh",bjbbh);
%>
      </select>
    </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">地区</font></td>
  <td bgcolor="#E8E8FF"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">报价级别</font></td>
  <td bgcolor="#E8E8FF"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">户型</font></td>
  <td bgcolor="#E8E8FF"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
  </select></td>
  <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
  <td bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">结构位置</font></td> 
  <td width="32%" bgcolor="#E8E8FF"><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm where jgwzmc='"+jgwzbm+"'",jgwzbm);
%>
  </select></td>
  <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>产品类别</td> 
  <td width="32%" bgcolor="#E8E8FF"><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc",tccplbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>是否必选项</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfbxx","Y+是&N+否",sfbxx);
%></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>是否要求相同品牌</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyqxtpp","Y+是&N+否",sfyqxtpp);
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
<tr bgcolor="#FFFFCC">
  <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>计量单位</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>是否限制数量</td>
  <td><%
	cf.radioToken(out, "sfxzsl","1+超量需加价&2+不可超量&3+无数量限制",sfxzsl);
%></td>
  <td align="right"><font color="#FF0000">*</font>标准数量</td>
  <td><input type="text" name="bzsl" size="20" maxlength="17"  value="<%=bzsl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否可减免</td>
  <td><%
	cf.radioToken(out, "sfkjm","1+不可减免&2+可减免",sfkjm);
%></td>
  <td align="right">减免分类</td>
  <td><input type="text" name="jmfl" size="20" maxlength="50"  value="<%=jmfl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">减免计量单位</td>
  <td><select name="jmjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jmjldw);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许减免最大数量</td>
  <td><input type="text" name="yxjmzdsl" value="<%=yxjmzdsl%>" size="20" maxlength="17" ></td>
  <td align="right">减免单价</td>
  <td><input type="text" name="jmdj" value="<%=jmdj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>是否可更换</td>
  <td><%
	cf.radioToken(out, "sfkgh","1+不可换&2+可换",sfkgh);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">可换最大数量</td>
  <td><input type="text" name="khzdsl" value="<%=khzdsl%>" size="20" maxlength="17" ></td>
  <td align="right">更换折价</td>
  <td><input type="text" name="ghzj" value="<%=ghzj%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
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
		<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
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
	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("请选择[是否要求相同品牌]！");
		FormName.sfyqxtpp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxsj)) {
		alert("请选择[升级是否收费]！");
		FormName.sfyxsj[0].focus();
		return false;
	}

	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxzsl)) {
		alert("请选择[是否限制数量]！");
		FormName.sfxzsl[0].focus();
		return false;
	}

	if (FormName.sfxzsl[0].checked || FormName.sfxzsl[1].checked)
	{
		if(	javaTrim(FormName.bzsl)=="") {
			alert("错误！数量可增项，必须输入[标准数量]！");
			FormName.bzsl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzsl, "标准数量"))) {
			return false;
		}
	}
	else
	{
		FormName.bzsl.value="";
	}

	if(	!radioChecked(FormName.sfkjm)) {
		alert("请选择[是否可减免]！");
		FormName.sfkjm[0].focus();
		return false;
	}
	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.jmfl)=="") {
			alert("错误！必须输入[减免分类]！");
			FormName.jmfl.focus();
			return false;
		}
		if(	javaTrim(FormName.jmjldw)=="") {
			alert("错误！必须输入[减免计量单位]！");
			FormName.jmjldw.focus();
			return false;
		}
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("错误！必须输入[允许减免最大数量]！");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "允许减免最大数量"))) {
			return false;
		}
		if(	javaTrim(FormName.jmdj)=="") {
			alert("错误！必须输入[减免单价]！");
			FormName.jmdj.focus();
			return false;
		}
		if(!(isFloat(FormName.jmdj, "减免单价"))) {
			return false;
		}
	}
	else
	{
		FormName.jmfl.value="";
		FormName.jmjldw.value="";
		FormName.yxjmzdsl.value="";
		FormName.jmdj.value="";
	}

	if(	!radioChecked(FormName.sfkgh)) {
		alert("请选择[是否可更换]！");
		FormName.sfkgh[0].focus();
		return false;
	}
	if (FormName.sfkgh[1].checked)
	{
		if(	javaTrim(FormName.khzdsl)=="") {
			alert("错误！必须输入[可换最大数量]！");
			FormName.khzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.khzdsl, "可换最大数量"))) {
			return false;
		}
		if(	javaTrim(FormName.ghzj)=="") {
			alert("错误！必须输入[更换折价]！");
			FormName.ghzj.focus();
			return false;
		}
		if(!(isFloat(FormName.ghzj, "更换折价"))) {
			return false;
		}
	}
	else
	{
		FormName.khzdsl.value="";
		FormName.ghzj.value="";
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
