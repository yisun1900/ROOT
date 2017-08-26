<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=null;
String tcmc=null;
String hxbm=null;
String jgwzbm=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String ydj=null;
String tcdj=null;
String sjzj=null;
String jsj=null;
String sl=null;
String lrr=null;
String lrsj=null;
String bz=null;

String wherecpbm=cf.GB2Uni(request.getParameter("cpbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,tcmc,hxbm,jgwzbm,cpmc,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz ";
	ls_sql+=" from  bj_wntczcmx";
    ls_sql+=" where cpbm='"+wherecpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		ydj=cf.fillNull(rs.getString("ydj"));
		tcdj=cf.fillNull(rs.getString("tcdj"));
		sjzj=cf.fillNull(rs.getString("sjzj"));
		jsj=cf.fillNull(rs.getString("jsj"));
		sl=cf.fillNull(rs.getString("sl"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<form method="post" action="SaveEditbj_wntczcmx.jsp" name="editform">
<div align="center">请修改－温暖套餐明细</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">地区</span></td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
      </select>
    </td>
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">户型</span></td>
    <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">套餐名称</span></td>
    <td colspan="3"><input type="text" name="tcmc" value="<%=tcmc%>" size="73" maxlength="50" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">结构位置</td>
    <td colspan="3"><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc",jgwzbm);
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品名称</td> 
  <td colspan="3"> 
    <input type="text" name="cpmc" size="73" maxlength="100"  value="<%=cpmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>型号</td>
  <td colspan="3"><input type="text" name="xh" size="73" maxlength="100"  value="<%=xh%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">规格</td>
  <td colspan="3"><input type="text" name="gg" size="73" maxlength="100"  value="<%=gg%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>品牌</td>
  <td colspan="3"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc",ppmc);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商</td> 
  <td colspan="3"><select name="gysmc" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc",gysmc);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计量单位</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>数量</td> 
  <td width="32%"><input type="text" name="sl" size="20" maxlength="17"  value="<%=sl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>原单价</td> 
  <td width="32%"> 
    <input type="text" name="ydj" size="20" maxlength="17"  value="<%=ydj%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>套餐单价</td> 
  <td width="32%"> 
    <input type="text" name="tcdj" size="20" maxlength="17"  value="<%=tcdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>结算价</td> 
  <td width="32%"><input type="text" name="jsj" size="20" maxlength="17"  value="<%=jsj%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>升级折价</td> 
  <td width="32%"><input type="text" name="sjzj" size="20" maxlength="17"  value="<%=sjzj%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wherecpbm"  value="<%=wherecpbm%>" >
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
	if(	javaTrim(FormName.cpmc)=="") {
		alert("请输入[产品名称]！");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[型号]！");
		FormName.xh.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.ydj)=="") {
		alert("请输入[原单价]！");
		FormName.ydj.focus();
		return false;
	}
	if(!(isFloat(FormName.ydj, "原单价"))) {
		return false;
	}
	if(	javaTrim(FormName.tcdj)=="") {
		alert("请输入[套餐单价]！");
		FormName.tcdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tcdj, "套餐单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzj)=="") {
		alert("请输入[升级折价]！");
		FormName.sjzj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzj, "升级折价"))) {
		return false;
	}
	if(	javaTrim(FormName.jsj)=="") {
		alert("请输入[结算价]！");
		FormName.jsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jsj, "结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
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
