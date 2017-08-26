<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String jc_jjzjx_zjxxh=null;
String jc_jjzjx_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_zjxm=null;
String jc_jjzjx_zjxyybm=null;
String jc_jjzjx_jjzjxje=null;
String jc_jjzjx_xcmzjxje=null;
String jc_jjzjx_zjxze=null;
String jc_jjzjx_qrsj=null;
String jc_jjzjx_qrr=null;
String jc_jjzjx_srksj=null;
String jc_jjzjx_rkr=null;
String jc_jjzjx_rksm=null;
String jc_jjzjx_jhazsj=null;
String jc_jjzjx_azwcsj=null;
String jc_jjzjx_clzt=null;
String jc_jjzjx_lrr=null;
String jc_jjzjx_lrsj=null;
String jc_jjzjx_dwbh=null;
String jc_jjzjx_bz=null;
double cpjjzjxje=0;
double zqcpjjzjxje=0;
double zqjjzjxje=0;
double zqxcmzjxje=0;
double zqzjxze=0;
double jjzkl=0;
String dzyy=null;

String ssfgsbh=null;
String qddm=null;
String jzsjs=null;
String zjxfssj=null;

String pdgc=null;
String pdgcmc=null;
String jjgys=null;
String jjppmc=null;
String xcmgc=null;
String xcmgcmc=null;
String xcmgys=null;
String xcmppmc=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jjsjs=null;
String khjl=null;


String zjxxh=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select pdgc,pdgcmc,jjgys,jjppmc,xcmgc,xcmgcmc,xcmgys,xcmppmc,clgw,ztjjgw,jc_jjzjx.xmzy,jjsjs,jc_jjzjx.zjxfssj,jc_jjzjx.fgsbh,jc_jjzjx.qddm,jc_jjzjx.jzsjs,jc_jjzjx.ddbh as ddbh,jc_jjzjx.zjxxh as jc_jjzjx_zjxxh,jc_jjzjx.khbh as jc_jjzjx_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.zjxm as crm_khxx_zjxm,jc_jjzjx.zjxyybm as jc_jjzjx_zjxyybm,jc_jjzjx.jjzjxje as jc_jjzjx_jjzjxje,jc_jjzjx.xcmzjxje as jc_jjzjx_xcmzjxje,jc_jjzjx.zjxze as jc_jjzjx_zjxze,jc_jjzjx.qrsj as jc_jjzjx_qrsj,jc_jjzjx.qrr as jc_jjzjx_qrr,jc_jjzjx.srksj as jc_jjzjx_srksj,jc_jjzjx.rkr as jc_jjzjx_rkr,jc_jjzjx.rksm as jc_jjzjx_rksm,jc_jjzjx.jhazsj as jc_jjzjx_jhazsj,jc_jjzjx.azwcsj as jc_jjzjx_azwcsj,jc_jjzjx.clzt as jc_jjzjx_clzt,jc_jjzjx.lrr as jc_jjzjx_lrr,jc_jjzjx.lrsj as jc_jjzjx_lrsj,jc_jjzjx.dwbh as jc_jjzjx_dwbh,jc_jjzjx.bz as jc_jjzjx_bz ";
	ls_sql+=" ,jc_jjzjx.khjl,jc_jjzjx.cpjjzjxje,jc_jjzjx.zqcpjjzjxje,jc_jjzjx.zqjjzjxje,jc_jjzjx.zqxcmzjxje,jc_jjzjx.zqzjxze,jc_jjzjx.jjzkl,jc_jjzjx.dzyy";
	ls_sql+=" from  crm_khxx,jc_jjzjx";
	ls_sql+=" where jc_jjzjx.khbh=crm_khxx.khbh and  (jc_jjzjx.zjxxh="+zjxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		cpjjzjxje=rs.getDouble("cpjjzjxje");
		zqcpjjzjxje=rs.getDouble("zqcpjjzjxje");
		zqjjzjxje=rs.getDouble("zqjjzjxje");
		zqxcmzjxje=rs.getDouble("zqxcmzjxje");
		zqzjxze=rs.getDouble("zqzjxze");
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillHtml(rs.getString("dzyy"));

		pdgc=cf.fillHtml(rs.getString("pdgc"));
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		jjgys=cf.fillHtml(rs.getString("jjgys"));
		jjppmc=cf.fillHtml(rs.getString("jjppmc"));
		xcmgc=cf.fillHtml(rs.getString("xcmgc"));
		xcmgcmc=cf.fillHtml(rs.getString("xcmgcmc"));
		xcmgys=cf.fillHtml(rs.getString("xcmgys"));
		xcmppmc=cf.fillHtml(rs.getString("xcmppmc"));
		clgw=rs.getString("clgw");
		ztjjgw=rs.getString("ztjjgw");
		xmzy=rs.getString("xmzy");
		jjsjs=rs.getString("jjsjs");

		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		ssfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		jc_jjzjx_zjxxh=cf.fillNull(rs.getString("jc_jjzjx_zjxxh"));
		jc_jjzjx_khbh=cf.fillNull(rs.getString("jc_jjzjx_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		jc_jjzjx_zjxyybm=cf.fillNull(rs.getString("jc_jjzjx_zjxyybm"));
		jc_jjzjx_jjzjxje=cf.fillNull(rs.getString("jc_jjzjx_jjzjxje"));
		jc_jjzjx_xcmzjxje=cf.fillNull(rs.getString("jc_jjzjx_xcmzjxje"));
		jc_jjzjx_zjxze=cf.fillNull(rs.getString("jc_jjzjx_zjxze"));
		jc_jjzjx_qrsj=cf.fillNull(rs.getDate("jc_jjzjx_qrsj"));
		jc_jjzjx_qrr=cf.fillNull(rs.getString("jc_jjzjx_qrr"));
		jc_jjzjx_srksj=cf.fillNull(rs.getDate("jc_jjzjx_srksj"));
		jc_jjzjx_rkr=cf.fillNull(rs.getString("jc_jjzjx_rkr"));
		jc_jjzjx_rksm=cf.fillNull(rs.getString("jc_jjzjx_rksm"));
		jc_jjzjx_jhazsj=cf.fillNull(rs.getDate("jc_jjzjx_jhazsj"));
		jc_jjzjx_azwcsj=cf.fillNull(rs.getDate("jc_jjzjx_azwcsj"));
		jc_jjzjx_clzt=cf.fillNull(rs.getString("jc_jjzjx_clzt"));
		jc_jjzjx_lrr=cf.fillNull(rs.getString("jc_jjzjx_lrr"));
		jc_jjzjx_lrsj=cf.fillNull(rs.getDate("jc_jjzjx_lrsj"));
		jc_jjzjx_dwbh=cf.fillNull(rs.getString("jc_jjzjx_dwbh"));
		jc_jjzjx_bz=cf.fillNull(rs.getString("jc_jjzjx_bz"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">家具增减项(订单编号：<%=ddbh%>，增减项序号：<%=jc_jjzjx_zjxxh%>)</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#99CCFF"> 
    <td width="20%" align="right">所属分公司</td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgsbh+"'",ssfgsbh,true);
%> </td>
    <td width="20%" align="right">所属店面</td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">家装设计师</td>
    <td width="30%"><%=jzsjs%> </td>
    <td width="20%" align="right">客户经理</td>
    <td width="30%"><%=khjl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">家具工厂编号</td>
    <td width="30%" bgcolor="#99CCFF"><%=pdgc%></td>
    <td width="20%" align="right" bgcolor="#CCCCFF">型材门工厂编号</td>
    <td width="30%" bgcolor="#CCCCFF"><%=xcmgc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">家具工厂名称</td>
    <td width="30%" bgcolor="#99CCFF"><%=pdgcmc%></td>
    <td width="20%" align="right" bgcolor="#CCCCFF">型材门工厂名称</td>
    <td width="30%" bgcolor="#CCCCFF"><%=xcmgcmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">家具供应商</td>
    <td width="30%" bgcolor="#99CCFF"><%=jjgys%></td>
    <td width="20%" align="right" bgcolor="#CCCCFF">型材门供应商</td>
    <td width="30%" bgcolor="#CCCCFF"><%=xcmgys%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">家具品牌</td>
    <td width="30%" bgcolor="#99CCFF"><%=jjppmc%></td>
    <td width="20%" align="right" bgcolor="#CCCCFF">型材门品牌</td>
    <td width="30%" bgcolor="#CCCCFF"><%=xcmppmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">驻店家居顾问</td>
    <td width="30%"><%=clgw%></td>
    <td width="20%" align="right">展厅家居顾问</td>
    <td width="30%"><%=ztjjgw%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">项目专员</td>
    <td width="30%"><%=xmzy%></td>
    <td width="20%" align="right">家具设计师</td>
    <td width="30%"><%=jjsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 客户编号 </td>
    <td width="30%"> <%=jc_jjzjx_khbh%> </td>
    <td align="right" width="20%"> 客户姓名 </td>
    <td width="30%"> <%=crm_khxx_khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 房屋地址 </td>
    <td width="30%"> <%=crm_khxx_fwdz%> </td>
    <td align="right" width="20%"> 联系方式 </td>
    <td width="30%"> <%=crm_khxx_lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 合同号 </td>
    <td width="30%"> <%=crm_khxx_hth%> </td>
    <td align="right" width="20%"> 设计师 </td>
    <td width="30%"> <%=crm_khxx_sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 质检 </td>
    <td width="30%"> <%=crm_khxx_zjxm%> </td>
    <td align="right" width="20%"> 增减项原因 </td>
    <td width="30%"> <%=jc_jjzjx_zjxyybm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">折扣率</td>
    <td><%=jjzkl%></td>
    <td align="right" bgcolor="#99CCFF">增减项发生时间</td>
    <td bgcolor="#99CCFF"><%=zjxfssj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">打折原因</td>
    <td colspan="3"><%=dzyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">家具增减项金额-折后</span></td>
    <td><%=jc_jjzjx_jjzjxje%></td>
    <td align="right"><strong>家具增减项金额-折前</strong></td>
    <td><%=zqjjzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">型材门增减项金额-折后</span></td>
    <td><%=jc_jjzjx_xcmzjxje%></td>
    <td align="right"><strong>型材门增减项金额-折前</strong></td>
    <td><%=zqxcmzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"><span class="STYLE1">成品家具增减项金额-折后</span></td>
    <td width="30%"><%=cpjjzjxje%></td>
    <td width="20%" align="right"><strong>成品家具增减项金额-折前</strong></td>
    <td width="30%"><%=zqcpjjzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"><span class="STYLE1"> 增减项总额-折后 </span></td>
    <td width="30%"> <%=jc_jjzjx_zjxze%> </td>
    <td width="20%" align="right"><strong> 增减项总额-折前 </strong></td>
    <td width="30%"><%=zqzjxze%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 确认录入人 </td>
    <td width="30%"> <%=jc_jjzjx_qrr%> </td>
    <td align="right" width="20%">确认时间 </td>
    <td width="30%"><%=jc_jjzjx_qrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 入库录入人 </td>
    <td width="30%"> <%=jc_jjzjx_rkr%> </td>
    <td align="right" width="20%">实入库时间 </td>
    <td width="30%"><%=jc_jjzjx_srksj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%">入库说明</td>
    <td colspan="3"><%=jc_jjzjx_rksm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 计划安装时间 </td>
    <td width="30%"> <%=jc_jjzjx_jhazsj%> </td>
    <td align="right" width="20%"> 安装完成时间 </td>
    <td width="30%"> <%=jc_jjzjx_azwcsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 处理状态 </td>
    <td width="30%"> <%
	cf.selectToken(out,"00+录入未完成&01+录入已完成&02+工厂已确认&04+安装完成&99+退单",jc_jjzjx_clzt,true);
%> </td>
    <td align="right" width="20%"> 录入人 </td>
    <td width="30%"> <%=jc_jjzjx_lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 录入时间 </td>
    <td width="30%"> <%=jc_jjzjx_lrsj%> </td>
    <td align="right" width="20%"> 录入部门 </td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh",jc_jjzjx_dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> 备注 </td>
    <td colspan="3"> <%=jc_jjzjx_bz%> </td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">标志</td>
	<td  width="8%">柜体序号</td>
	<td  width="9%">柜体名称</td>
	<td  width="8%">安装位置</td>
	<td  width="9%">规格</td>
	<td  width="8%">家具系列</td>
	<td  width="12%">板材类型</td>
	<td  width="8%">板材颜色</td>
	<td  width="9%">增减金额-折后</td>
	<td  width="9%">增减金额-折前</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT DECODE(jc_gtzjxmx.ysl-jc_gtzjxmx.xsl,1,'减项',-1,'增项+'),jc_jjgtmx.gtxh,jc_jjgtmx.gtmc,jc_jjgtmx.jjazwz,jc_jjgtmx.guige,jc_jjgtmx.jjlx,jc_jjgtmx.bclx,jc_jjgtmx.bcys,(jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*jc_jjgtmx.zj,(jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*jc_jjgtmx.zqzj";
	ls_sql+=" FROM jc_jjgtmx,jc_gtzjxmx  ";
    ls_sql+=" where jc_jjgtmx.gtxh=jc_gtzjxmx.gtxh and jc_gtzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by gtxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">标志</td>
	<td  width="10%">型材门名称</td>
	<td  width="10%">高*宽(mm)</td>
	<td  width="12%">边框系列型号</td>
	<td  width="9%">边框颜色</td>
	<td  width="10%">面板材料1</td>
	<td  width="10%">面板材料2</td>
	<td  width="7%">折后总价</td>
	<td  width="7%">折前总价</td>
	<td  width="10%">备注</td>
</tr>
<%
	ls_sql="SELECT DECODE(jc_xcmzjxmx.ysl-jc_xcmzjxmx.xsl,1,'减项',-1,'增项+'),jc_jjxcmmx.xcmmc,jc_jjxcmmx.gd||'*'||jc_jjxcmmx.kd gg,jc_jjxcmmx.bklxxh,jc_jjxcmmx.bkys,jc_jjxcmmx.mbcl1,jc_jjxcmmx.mbcl2,(jc_xcmzjxmx.xsl-jc_xcmzjxmx.ysl)*jc_jjxcmmx.zj,(jc_xcmzjxmx.xsl-jc_xcmzjxmx.ysl)*jc_jjxcmmx.zqzj,jc_jjxcmmx.bz  ";
	ls_sql+=" FROM jc_jjxcmmx,jc_xcmzjxmx ";
    ls_sql+=" where jc_jjxcmmx.xcmxh=jc_xcmzjxmx.xcmxh and jc_xcmzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_jjxcmmx.xcmxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">家具名称</td>
	<td  width="7%">型号</td>
	<td  width="11%">规格(mm)</td>
	<td  width="14%">材质</td>
	<td  width="18%">花色纹理</td>
	<td  width="5%">原数量</td>
	<td  width="5%">新数量</td>
	<td  width="8%">增减总价-折后</td>
	<td  width="8%">增减总价-折前</td>
	<td  width="15%">备注</td>
</tr>
<%
	ls_sql="SELECT cpjjmc,xh,gg,cpjjcz,cpjjhs,jc_cpjjzjxmx.ysl,jc_cpjjzjxmx.xsl,jc_cpjjddmx.khdj*(jc_cpjjzjxmx.xsl-jc_cpjjzjxmx.ysl),jc_cpjjddmx.bzdj*(jc_cpjjzjxmx.xsl-jc_cpjjzjxmx.ysl),bz  ";
	ls_sql+=" FROM jc_cpjjddmx,jc_cpjjzjxmx  ";
    ls_sql+=" where jc_cpjjddmx.cpjjbh=jc_cpjjzjxmx.cpjjbh and jc_cpjjddmx.ddbh=jc_cpjjzjxmx.ddbh and jc_cpjjzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_cpjjzjxmx.lx,jc_cpjjzjxmx.cpjjbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>
</body>
</html>
