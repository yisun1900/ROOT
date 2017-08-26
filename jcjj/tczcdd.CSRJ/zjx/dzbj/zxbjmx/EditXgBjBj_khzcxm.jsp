<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改客户主材项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE5 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditXgBjBj_khzcxm.jsp" name="insertform">


<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String sxh=cf.GB2Uni(request.getParameter("sxh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String fjddbh=null;
String cpbm=null;
String bjjbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
String clxlmc=null;
String ppmc=null;
String ptcpsm=null;
double ysl=0;
double sl=0;
String slStr=null;
double dj=0;
String sfkgdj=null;
String lx=null;
String bjjldw=null;

String clztmc="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cpbm,tccpdlbm,tccplbbm,clxlmc,bjjbbm,ppmc,ptcpsm,sl,dj,sfkgdj,lx,fjddbh,jldw";
	ls_sql+=" from  bj_khzcxmh,jxc_clxlbm";
	ls_sql+=" where bj_khzcxmh.tccplbbm=jxc_clxlbm.clxlbm and zjxxh='"+zjxxh+"' and sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpbm=cf.fillNull(rs.getString("cpbm"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		ptcpsm=cf.fillNull(rs.getString("ptcpsm"));
		ysl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		lx=cf.fillNull(rs.getString("lx"));//1：原项目；2：增减项；3：新增项
		fjddbh=cf.fillNull(rs.getString("fjddbh"));
		bjjldw=cf.fillNull(rs.getString("jldw"));
	}
	else{
		out.println("错误！不存在，请关掉窗口重新尝试");
		return;
	}
	rs.close();
	ps.close();


	String xclbz="";
	String clzt="";
	ls_sql="select xclbz,jc_zcdd.clzt,clztmc";
	ls_sql+=" from  jc_zcdd,jdm_zcddzt";
	ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt and ddbh='"+fjddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xclbz=cf.fillNull(rs.getString("xclbz"));
		clzt=cf.fillNull(rs.getString("clzt"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
	}
	rs.close();
	ps.close();
	if (xclbz.equals("2"))//1：非定制式产品；2：定制式产品
	{
		//00：录入预订单：02：预订单已接收；03：测量已通知；05：已测量； 25：通知复尺；26：复尺；07：合同未完成；09：合同已完成；11：合同已确认；13：工厂已接收；27：入库；15：确定送货时间；17：已通知送货；18：已出库；19：已送货；20：部分送货；21：已通知退补货；23：已退补货；30：单项完结；98:取消预订单；99：退单
		if (clzt.compareTo("09")>0 && !clzt.equals("25") && !clzt.equals("26"))
		{
			out.println("错误！【定制产品】厂商已接受，不能增减项");
			return;
		}
	}
	else{
		//00：录入预订单：02：预订单已接收；03：测量已通知；05：已测量； 25：通知复尺；26：复尺；07：合同未完成；09：合同已完成；11：合同已确认；13：工厂已接收；27：入库；15：确定送货时间；17：已通知送货；18：已出库；19：已送货；20：部分送货；21：已通知退补货；23：已退补货；30：单项完结；98:取消预订单；99：退单
		if (clzt.equals("19") || clzt.equals("20") || clzt.equals("30"))
		{
			out.println("错误！【非定制式产品】已送货，不能增减项");
			return;
		}
	}


	ls_sql="select sl";
	ls_sql+=" from  bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and oldsxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getDouble("sl");
	}
	rs.close();
	ps.close();


	if (sl==0)
	{
		slStr="";
	}
	else {
		slStr=""+sl;
	}
%>

<div align="center"><B>[<%=jgwzbm%>]选择的所有[<%=clxlmc%>]型号</B></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">类型</td>
	<td  width="9%">产品编码</td>
	<td  width="9%">产品名称</td>
	<td  width="8%">品牌</td>
	<td  width="12%">型号</td>
	<td  width="9%">规格</td>
	<td  width="5%">计量单位</td>
	<td  width="5%">数量</td>
	<td  width="5%">单价</td>
	<td  width="6%">收费</td>
	<td  width="5%">下单数量</td>
	<td  width="6%">报价级别</td>
	<td  width="15%">配套产品说明</td>
</tr>
<%

	String lxmc=null;
	String bjjbmc=null;
	double getsl=0;
	double getxdsl=0;
	double allgetsl=0;
	double allgetxdsl=0;
	double getdj=0;
	double getje=0;
	double allgetje=0;
	String getptcpsm=null;
	String getcpbm=null;
	String cpmc=null;
	String getppmc=null;
	String xh=null;
	String gg=null;
	String jldw=null;
	ls_sql="SELECT DECODE(bj_khzcxmh.lx,'1','原项目','2','增项','3','减项','4','新增项') lxmc,bjjbmc,bj_khzcxmh.sl,bj_khzcxmh.xdsl,bj_khzcxmh.dj,ROUND(bj_khzcxmh.sl*bj_khzcxmh.dj,2) je,bj_khzcxmh.ptcpsm,bj_khzcxmh.cpbm,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.gg,bj_khzcxmh.jldw";
	ls_sql+=" FROM bdm_bjjbbm,bj_khzcxmh  ";
    ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzbm+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
    ls_sql+=" and bj_khzcxmh.zclx in('1','2')";//主材类型  1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
    ls_sql+=" order by bj_khzcxmh.ppmc,bj_khzcxmh.xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lxmc=cf.fillNull(rs.getString("lxmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		getsl=rs.getDouble("sl");
		getxdsl=rs.getDouble("xdsl");
		getdj=rs.getDouble("dj");
		getje=rs.getDouble("je");
		getptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		getcpbm=cf.fillHtml(rs.getString("cpbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		getppmc=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillHtml(rs.getString("jldw"));

		allgetsl+=getsl;
		allgetxdsl+=getxdsl;

		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=lxmc%></td>
			<td><%=getcpbm%></td>
			<td><%=cpmc%></td>
			<td><%=getppmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
			<td><%=jldw%></td>
			<td><%=getsl%></td>
			<td><%=getdj%></td>
			<td><%=getje%></td>
			<td><%=getxdsl%></td>
			<td><%=bjjbmc%></td>
			<td><%=getptcpsm%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
	<tr bgcolor="#FFFFF"  align="center">
		<td>小 计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.round(allgetsl,2)%></td>
		<td>&nbsp;</td>
		<td><%=cf.round(allgetje,2)%></td>
		<td><%=cf.round(allgetxdsl,2)%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%
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

<BR>
<div align="center">修改客户主材项目</div>

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
  <td align="right"><span class="STYLE5">分解订单编号</span></td>
  <td><span class="STYLE5"><%=fjddbh%></span></td>
  <td align="right"><span class="STYLE5">订单状态</span></td>
  <td><span class="STYLE5"><%=clztmc%></span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>品牌</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value="<%=ppmc%>"><%=ppmc%></option>
  </select></td>
  <td align="right"><span class="STYLE1"><strong>原数量</strong></span></td>
  <td><%=ysl%></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品</td> 
  <td colspan="3"> 
  <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX" >
    <%
	String sql="select cpbm,cpmc||'（'||xh||'）（'||gg||'）'||'（'||jldw||'）' from bj_khzcxmh where zjxxh='"+zjxxh+"' and sxh="+sxh;
	cf.selectItem(out,sql,cpbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>计量单位</strong></td>
  <td><strong><%=bjjldw%></strong></td>
  <td colspan="2"><span class="STYLE1"><strong>注意：是[报价计量单位]，非[下单计量单位]</strong></span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>增减数量</td>
  <td><input type="text" name="sl" value="<%=slStr%>" size="10" maxlength="17" >
    <span class="STYLE4">减项录入负数</span></td>
  <td align="right"><span class="STYLE1">*</span>实际单价</td>
  <td><input type="text" name="dj" value="<%=dj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><%if (tccplbbm.equals("36")) out.println("玻璃型号");if (tccplbbm.equals("50")) out.println("坑距");%></td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="<%=ptcpsm%>" size="73" maxlength="200" <%if (!tccplbbm.equals("36") && !tccplbbm.equals("50") ) out.println("disabled");%>>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="hidden" name="ysl" value="<%=ysl%>"> 
	<input type="hidden" name="oldcpbm" value="<%=cpbm%>"> 
	<input type="hidden" name="sxh" value="<%=sxh%>">	</td>
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
		alert("请输入[产品编码]！");
		FormName.cpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("请选择[产品大类]！");
		FormName.tccpdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[减项数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "减项数量"))) {
		return false;
	}

	if ((parseFloat(FormName.sl.value)+parseFloat(FormName.ysl.value))<0)
	{
		alert("错误！[减项数量]不能超过原数量[<%=ysl%>]！");
		FormName.sl.select();
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
