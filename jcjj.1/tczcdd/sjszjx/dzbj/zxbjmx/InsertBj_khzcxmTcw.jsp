<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String bjjbbm=null;
String tccpdlbm=null;

String sfkgh="";//是否可更换  1：不可换；2：可换
String sfkghStr="";
double khzdsl=0;//可换最大数量
double ghzj=0;//更换折价
String sfxzsl="";//是否限制数量  1：限制；3：不限制
String sfxzslStr="";
double bzsl=0;//标准数量
double sjjmsl=0;//实际减免数量
double sjsl=0;//实际数量
String tcsjflbm="";
String txxx="";
String bjjldw="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jxc_cldlbm.cldlbm";
	ls_sql+=" from  jxc_clxlbm,jxc_cldlbm";
	ls_sql+=" where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_clxlbm.clxlbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccpdlbm=cf.fillNull(rs.getString("cldlbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select bjjbbm";
	ls_sql+=" from  bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();


	double tcnsjsl=0;//套餐外实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx in('1')";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcnsjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tcnsjsl>0)
	{
		out.println("错误！已选择套餐主材，不能再选择大店主材");
		return;
	}

	ls_sql="select jldw,sfxzsl,bzsl,sjjmsl,sjsl,tcsjflbm,sfkgh,sfkgh,DECODE(sfkgh,'1','不可换','2','可换') sfkghStr,khzdsl,ghzj";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjldw=cf.fillNull(rs.getString("jldw"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		sfkghStr=cf.fillNull(rs.getString("sfkghStr"));
		khzdsl=rs.getDouble("khzdsl");
		ghzj=rs.getDouble("ghzj");
	}
	rs.close();
	ps.close();

	bzsl=khzdsl;

	if (sfxzsl.equals("2"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		sfxzsl="1";
	}

	if (sfkgh.equals("1"))
	{
		out.println("错误！不能更换");
		return;
	}

	if (sjjmsl>0)
	{
		out.println("已减免不能再选择，减免数量:"+sjjmsl);
		return;
	}


	if (sfxzsl.equals("1"))//1:超量需加价;2:不可超量;3:无数量限制
	{
		txxx="<span class=\"STYLE1\"><B>提醒！本类限制数量，标准数量:"+bzsl+"，实际数量:"+sjsl+"，超过标准数量将收费</B></span>";
		sfxzslStr="超量需加价";
	}
	else if (sfxzsl.equals("2"))//1:超量需加价;2:不可超量;3:无数量限制
	{
		if (sjsl>bzsl)
		{
			txxx="<span class=\"STYLE1\"><B>提醒！本类限制数量，不可超量，标准数量:"+bzsl+"，实际数量:"+sjsl+"，不能再录入</B></span>";
		}
		sfxzslStr="不可超量";
	}
	else{
		txxx="";
		sfxzslStr="不限制";
	}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_khzcxmTcw.jsp" name="insertform">
<div align="center">录入客户主材项目</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">类型</td>
	<td  width="5%">计量单位</td>
	<td  width="5%">数量</td>
	<td  width="5%">单价</td>
	<td  width="6%">收费</td>
	<td  width="21%">配套产品说明</td>
	<td  width="9%">产品编码</td>
	<td  width="9%">产品名称</td>
	<td  width="8%">品牌</td>
	<td  width="12%">型号</td>
	<td  width="9%">规格</td>
</tr>
<%
	String lx=null;
	String lxmc=null;
	String sxh=null;
	String bjjbmc=null;
	double sl=0;
	double dj=0;
	double je=0;
	String ptcpsm=null;
	String cpbm=null;
	String cpmc=null;
	String ppmc=null;
	String xh=null;
	String gg=null;
	String jldw=null;
	ls_sql="SELECT bj_khzcxmh.lx,DECODE(bj_khzcxmh.lx,'1','原项目','2','增项','3','减项','4','新增项') lxmc,bj_khzcxmh.sxh,bjjbmc,bj_khzcxmh.sl,bj_khzcxmh.dj,ROUND(bj_khzcxmh.sl*bj_khzcxmh.dj,2) je,bj_khzcxmh.ptcpsm,bj_khzcxmh.cpbm,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.gg,bj_khzcxmh.jldw";
	ls_sql+=" FROM bdm_bjjbbm,bj_khzcxmh  ";
    ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzbm+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
    ls_sql+=" and bj_khzcxmh.zclx in('3','4')";//主材类型  1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
    ls_sql+=" order by bj_khzcxmh.cpbm,bj_khzcxmh.sxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		je=rs.getDouble("je");
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		cpbm=cf.fillHtml(rs.getString("cpbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillHtml(rs.getString("jldw"));

		if (lx.equals("4"))//1：原项目；2：增项；3：减项；4：新增项
		{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>
					<A HREF="EditNewBj_khzcxmTcw.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>&jgwzbm=<%=jgwzbm%>" target="_blank">修改</A>  
					<A HREF="DeleteBj_khzcxmTcw.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>&jgwzbm=<%=jgwzbm%>" target="_blank">删除</A>
				</td>
				<td><%=lxmc%></td>
				<td><%=jldw%></td>
				<td><%=sl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
			</tr>
			<%
		}
		else if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：新增项
		{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>
					<A HREF="EditXgBjBj_khzcxmTcw.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>&jgwzbm=<%=jgwzbm%>" target="_blank">修改</A>  
				</td>
				<td><%=lxmc%></td>
				<td><%=jldw%></td>
				<td><%=sl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>&nbsp;</td>
				<td><%=lxmc%></td>
				<td><%=jldw%></td>
				<td><%=sl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
			</tr>
			<%
		}
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">增减项序号</span></td> 
  <td width="32%"> 
    <input type="text" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">产品大类</span></td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by cldlmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">产品类别</span></td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">结构位置</span></td>
  <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<OPTION SELECTED value="<%=jgwzbm%>"><%=jgwzbm%></OPTION>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">报价级别</span></td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">是否限制数量</span></td>
  <td><%=sfxzslStr%></td>
  <td align="right"><span class="STYLE4">标准数量</span></td>
  <td><%=bzsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="24" align="right"><span class="STYLE4">是否可更换</span></td>
  <td><%=sfkghStr%></td>
  <td align="right"><span class="STYLE4">可换最大数量</span></td>
  <td><%=khzdsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">实际数量</span></td>
  <td><%=sjsl%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">&nbsp;</td>
  <td colspan="3"><%=txxx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>品牌</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
	String sql="";
	sql="select distinct  ppmc c1,ppmc c2 from bj_tcwzck where tccplbbm='"+tccplbbm+"' and jjfs in('1') and cpbm not in(select cpbm from bj_khzcxmh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and zclx in('3','4')) and sfyx='1' order by ppmc";
	cf.selectItem(out,sql,"");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品</td> 
  <td colspan="3"> 
  <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX" onChange="changeCpbm(insertform)">
    <option value=""></option>
    <option value="0">请先选择品牌</option>
  </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>计量单位</strong></td>
  <td><%=bjjldw%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>数量</td>
  <td><input type="text" name="sl" value="" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>实际单价</td>
  <td><input type="text" name="dj" value="" size="20" maxlength="17"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><%if (tccplbbm.equals("36")) out.println("玻璃型号");if (tccplbbm.equals("50")) out.println("坑距");%></td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="" size="73" maxlength="200" <%if (!tccplbbm.equals("36") && !tccplbbm.equals("50") ) out.println("disabled");%>>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

var mark="";
function changePp(FormName)
{
	FormName.cpbm.length=1;

	if (FormName.ppmc.value=="")
	{
		return;
	}
	mark="pp";

	var sql;

	sql="select cpbm,cpmc||'（'||xh||'）（'||gg||'）'||DECODE(jjfs,'1','（补差价'||(CASE WHEN (dj-<%=ghzj%>) > 0 THEN (dj-<%=ghzj%>) ELSE 0 END)||'/'||jldw||'）','2','（￥'||dj||'/'||jldw||'）') from bj_tcwzck where ppmc='"+FormName.ppmc.value+"' and  tccplbbm='"+FormName.tccplbbm.value+"' and jjfs in('1')  and cpbm not in(select cpbm from bj_khzcxmh where zjxxh='<%=zjxxh%>' and jgwzbm='"+FormName.jgwzbm.value+"' and zclx in('3','4')) and sfyx='1' order by cpmc,xh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeCpbm(FormName)
{
	if (FormName.cpbm.value=="")
	{
		return;
	}

	mark="cpbm";

	var sql;
	sql="select sfkgdj from bj_tcwzck where cpbm='"+FormName.cpbm.value+"'";

	var actionStr="/ajax/getValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (mark=="pp")
	{
		strToSelect(insertform.cpbm,ajaxRetStr);
	}
	else if (mark=="cpbm")
	{
		ajaxRetStr=ajaxRetStr.substring(10,ajaxRetStr.length-4);

		if (ajaxRetStr=="Y")
		{
			insertform.dj.readOnly=false;
			insertform.dj.value="";
		}
		else {
			insertform.dj.readOnly=true;
			insertform.dj.value="0";
		}
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请选择[结构位置]！");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("请选择[产品]！");
		FormName.cpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("请选择[产品大类]！");
		FormName.tccpdlbm.focus();
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
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[实际单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "实际单价"))) {
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
