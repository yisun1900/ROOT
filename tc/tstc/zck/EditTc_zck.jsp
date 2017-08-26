<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String cpbm=null;
String dqbm=null;
String bjjbbm=null;
String nbbm=null;
String cldl=null;
String clxl=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String xdjldw=null;
String xdb=null;
String sh=null;
String sfxclxs=null;
String jsj=null;
String khxsdj=null;
String sgddj=null;
String lx=null;
String lbxmbm=null;
String cxxmbm=null;
String sfyx=null;
String yxkssj=null;
String yxjzsj=null;
String xuhao=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sjj1=null;
String sjj2=null;
String sjj3=null;
String sjj4=null;
String sjj5=null;
String wherecpbm=cf.GB2Uni(request.getParameter("cpbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpbm,dqbm,bjjbbm,nbbm,cldl,clxl,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,khxsdj,sgddj,lx,lbxmbm,cxxmbm,sfyx,yxkssj,yxjzsj,xuhao,lrr,lrsj,bz,sjj1,sjj2,sjj3,sjj4,sjj5 ";
	ls_sql+=" from  tc_zck";
	ls_sql+=" where  (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpbm=cf.fillNull(rs.getString("cpbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		cldl=cf.fillNull(rs.getString("cldl"));
		clxl=cf.fillNull(rs.getString("clxl"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		xdjldw=cf.fillNull(rs.getString("xdjldw"));
		xdb=cf.fillNull(rs.getString("xdb"));
		sh=cf.fillNull(rs.getString("sh"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		jsj=cf.fillNull(rs.getString("jsj"));
		khxsdj=cf.fillNull(rs.getString("khxsdj"));
		sgddj=cf.fillNull(rs.getString("sgddj"));
		lx=cf.fillNull(rs.getString("lx"));
		lbxmbm=cf.fillNull(rs.getString("lbxmbm"));
		cxxmbm=cf.fillNull(rs.getString("cxxmbm"));
		sfyx=cf.fillNull(rs.getString("sfyx"));
		yxkssj=cf.fillNull(rs.getDate("yxkssj"));
		yxjzsj=cf.fillNull(rs.getDate("yxjzsj"));
		xuhao=cf.fillNull(rs.getString("xuhao"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sjj1=cf.fillNull(rs.getString("sjj1"));
		sjj2=cf.fillNull(rs.getString("sjj2"));
		sjj3=cf.fillNull(rs.getString("sjj3"));
		sjj4=cf.fillNull(rs.getString("sjj4"));
		sjj5=cf.fillNull(rs.getString("sjj5"));
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
<form method="post" action="SaveEditTc_zck.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品编码</td> 
  <td width="32%"> 
    <input type="text" name="cpbm" size="20" maxlength="13"  value="<%=cpbm%>" readonly>  </td>
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">报价级别</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm);
%>
    </select>  </td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"> 
    <input type="text" name="nbbm" size="20" maxlength="20"  value="<%=nbbm%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品大类</td> 
  <td width="32%"> 
    <select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(editform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc",cldl);
%>
    </select>  </td>
  <td align="right" width="18%">产品小类</td> 
  <td width="32%"> 
    <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+cldl+"' order by clxlmc",clxl);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品名称</td> 
  <td width="32%"> 
    <input type="text" name="cpmc" size="20" maxlength="50"  value="<%=cpmc%>" >  </td>
  <td align="right" width="18%">型号</td> 
  <td width="32%"> 
    <input type="text" name="xh" size="20" maxlength="100"  value="<%=xh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">规格</td> 
  <td width="32%"> 
    <input type="text" name="gg" size="20" maxlength="100"  value="<%=gg%>" >  </td>
  <td align="right" width="18%">品牌</td> 
  <td width="32%"> 
    <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc",ppmc);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商</td> 
  <td width="32%"> 
    <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc",gysmc);
%>
    </select>  </td>
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">下单计量单位</td> 
  <td width="32%"> 
    <select name="xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",xdjldw);
%>
    </select>  </td>
  <td align="right" width="18%">下单比</td> 
  <td width="32%"> 
    <input type="text" name="xdb" size="20" maxlength="17"  value="<%=xdb%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">损耗</td> 
  <td width="32%"> 
    <input type="text" name="sh" size="20" maxlength="9"  value="<%=sh%>" >  </td>
  <td align="right" width="18%">排序序号</td> 
  <td width="32%"><input type="text" name="xuhao" size="20" maxlength="9"  value="<%=xuhao%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需处理小数</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfxclxs","1+向上取整&2+向下取整&3+4舍5入&4+不处理",sfxclxs);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算价</td> 
  <td width="32%"> 
    <input type="text" name="jsj" size="20" maxlength="17"  value="<%=jsj%>" >  </td>
  <td align="right" width="18%">客户销售单价</td> 
  <td width="32%"> 
    <input type="text" name="khxsdj" size="20" maxlength="17"  value="<%=khxsdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">升级价1</td>
  <td><input type="text" name="sjj1" size="20" maxlength="17"  value="<%=sjj1%>" ></td>
  <td align="right">升级价2</td>
  <td><input type="text" name="sjj2" size="20" maxlength="17"  value="<%=sjj2%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">升级价3</td>
  <td><input type="text" name="sjj3" size="20" maxlength="17"  value="<%=sjj3%>" ></td>
  <td align="right">升级价4</td>
  <td><input type="text" name="sjj4" size="20" maxlength="17"  value="<%=sjj4%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">施工队单价</td>
  <td><input type="text" name="sgddj" size="20" maxlength="17"  value="<%=sgddj%>" ></td>
  <td align="right">升级价5</td>
  <td><input type="text" name="sjj5" size="20" maxlength="17"  value="<%=sjj5%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">类型</td> 
  <td colspan="3"><%
	cf.radioToken(out, "lx","1+套餐项&2+促销项&3+礼包项&4+套餐外",lx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">礼包项目编码</td> 
  <td width="32%"> 
    <input type="text" name="lbxmbm" size="20" maxlength="6"  value="<%=lbxmbm%>" >  </td>
  <td align="right" width="18%">促销项目编码</td> 
  <td width="32%"> 
    <input type="text" name="cxxmbm" size="20" maxlength="6"  value="<%=cxxmbm%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有效</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "sfyx","1+正在销售&2+停止销售&3+阶段销售&4+售前核实",sfyx);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">有效开始时间</td> 
  <td width="32%"><input type="text" name="yxkssj" size="20" maxlength="10"  value="<%=yxkssj%>"  onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">有效结束时间</td> 
  <td width="32%"><input type="text" name="yxjzsj" size="20" maxlength="10"  value="<%=yxjzsj%>" onDblClick="JSCalendar(this)" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

function changeDl(FormName)
{
	FormName.clxl.length=1;

	if (FormName.cldl.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+FormName.cldl.value+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(editform.clxl,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cpbm)=="") {
		alert("请输入[产品编码]！");
		FormName.cpbm.focus();
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
	if(	javaTrim(FormName.cldl)=="") {
		alert("请选择[产品大类]！");
		FormName.cldl.focus();
		return false;
	}
	if(	javaTrim(FormName.clxl)=="") {
		alert("请选择[产品小类]！");
		FormName.clxl.focus();
		return false;
	}
	if(	javaTrim(FormName.cpmc)=="") {
		alert("请输入[产品名称]！");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请选择[供应商]！");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdjldw)=="") {
		alert("请选择[下单计量单位]！");
		FormName.xdjldw.focus();
		return false;
	}
	if(	javaTrim(FormName.xdb)=="") {
		alert("请输入[下单比]！");
		FormName.xdb.focus();
		return false;
	}
	if(!(isFloat(FormName.xdb, "下单比"))) {
		return false;
	}
	if(	javaTrim(FormName.sh)=="") {
		alert("请输入[损耗]！");
		FormName.sh.focus();
		return false;
	}
	if(!(isFloat(FormName.sh, "损耗"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxclxs)) {
		alert("请选择[是否需处理小数]！");
		FormName.sfxclxs[0].focus();
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
	if(	javaTrim(FormName.khxsdj)=="") {
		alert("请输入[客户销售单价]！");
		FormName.khxsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.khxsdj, "客户销售单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgddj)=="") {
		alert("请输入[施工队单价]！");
		FormName.sgddj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgddj, "施工队单价"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyx)) {
		alert("请选择[是否有效]！");
		FormName.sfyx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "有效开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "有效结束时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xuhao)=="") {
		alert("请输入[排序序号]！");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isFloat(FormName.xuhao, "排序序号"))) {
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
	if(!(isFloat(FormName.sjj1, "升级价1"))) {
		return false;
	}
	if(!(isFloat(FormName.sjj2, "升级价2"))) {
		return false;
	}
	if(!(isFloat(FormName.sjj3, "升级价3"))) {
		return false;
	}
	if(!(isFloat(FormName.sjj4, "升级价4"))) {
		return false;
	}
	if(!(isFloat(FormName.sjj5, "升级价5"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
