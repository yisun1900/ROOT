<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>套餐客户结算</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE4 {color: #000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

double htsjf=0;
double sssjf=0;
double wdzgce=0;
double qye=0;
double zqljzjx=0;
double zhljzjx=0;
double zqhj=0;
double zhhj=0;
double jsze=0;
double yjzxk=0;
double dj=0;
double yjwk=0;
double yhje=0;
double fqbl=0;
double fqje=0;
double djfxje=0;
double dyq=0;
double yhze=0;
double shfqje=0;
double yjzck=0;
double zcddjezq=0;
double zcddyh=0;
double dgzcjezq=0;
double dgzcyh=0;
double zcjsje=0;
double pck=0;
double khbjk=0;
double zctcze=0;
String lrr=null;
String lrsj=null;
String bz=null;
String clzt="";
String spyj=null;
String spr=null;
String spsj=null;

String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String fwmj=null;
String hxmc=null;
String bjjbmc=null;
String hth=null;
String sjs=null;
String hyh=null;
String qyrq=null;
String kgrq=null;

double zqgczjf=0;
double zjxje=0;
double zqqtsf=0;
double zqqtsfzjx=0;
double zqwjrqyexm =0;
double zqwjrzjx=0;
String qtsfsm=null;
String wjrqyexmsm=null;

double glfbfb=0;
double zqguanlif=0;
double zqzjxguanlif=0;
double suijinbfb=0;
double zqsuijin=0;
double zqzjxsuijin=0;
String cxhdbm=null;
double zkl=0;
String zklmc="";
String fxgck=null;
double fxdj=0;

double tcbzjg=0;
double tcmjzjje=0;
double tczcsjcj=0;
double tczccljj=0;
double tcxsfzc=0;
double tczcjm=0;
double tcdpsj=0;
double tcdpdlsf=0;
double tcxpx=0;
double tcwsgzj=0;
double tcwgccljj=0;
double tcwzjzc=0;
double tcsgze=0;
double tcqtsf=0;


double tcbzjgzjx=0;
double tcmjzjjezjx=0;
double tczcsjcjzjx=0;
double tczccljjzjx=0;
double tcxsfzczjx=0;
double tczcjmzjx=0;
double tcdpsjzjx=0;
double tcdpdlsfzjx=0;
double tcxpxzjx=0;
double tcwsgzjzjx=0;
double tcwgccljjzjx=0;
double hqzjzcZq=0;
double hqzjzcZh=0;
double tcsgzezjx=0;
double tcqtsfzjx=0;
double tcwzjzczjx=0;

double zctcje=0;
double wntcje=0;
double jytcje=0;
double sctcje=0;
double jktcje=0;

double zctcjezjx=0;
double wntcjezjx=0;
double jytcjezjx=0;
double sctcjezjx=0;
double jktcjezjx=0;

double jddxht=0;
double jddxzjx=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,khxm,lxfs,fwdz,fwmj,hxmc,bjjbmc,hth,sjs,hyh,qyrq,kgrq";
	ls_sql+=" ,zqgczjf,zjxje,zqqtsf,zqqtsfzjx,zqwjrqyexm,zqwjrzjx,qtsfsm,wjrqyexmsm";
	ls_sql+=" ,glfbfb,zqguanlif,zqzjxguanlif,suijinbfb,zqsuijin,zqzjxsuijin,cxhdbm";
	
	ls_sql+=" from  crm_khxx,sq_dwxx,dm_hxbm,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ls_sql+=" and  crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxmc=cf.fillNull(rs.getString("hxmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hyh=cf.fillNull(rs.getString("hyh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));

		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		zqqtsf=rs.getDouble("zqqtsf");
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		qtsfsm=cf.fillNull(rs.getString("qtsfsm"));
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));

		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		suijinbfb=rs.getDouble("suijinbfb");
		zqsuijin=rs.getDouble("zqsuijin");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf      ,tcbzjgzjx,tcmjzjjezjx,tczcsjcjzjx,tczccljjzjx,tcxsfzczjx,tczcjmzjx,tcdpsjzjx,tcdpdlsfzjx,tcxpxzjx,tcwsgzjzjx,tcwgccljjzjx,tcsgzezjx,tcqtsfzjx ";
	ls_sql+=" ,zctcje,wntcje,jytcje,sctcje,jktcje";
	ls_sql+=" ,zctcjezjx,wntcjezjx,jytcjezjx,sctcjezjx,jktcjezjx";
	ls_sql+=" from  crm_tckhqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zctcje=rs.getDouble("zctcje");
		wntcje=rs.getDouble("wntcje");
		jytcje=rs.getDouble("jytcje");
		sctcje=rs.getDouble("sctcje");
		jktcje=rs.getDouble("jktcje");

		jytcjezjx=rs.getDouble("jytcjezjx");
		sctcjezjx=rs.getDouble("sctcjezjx");
		jktcjezjx=rs.getDouble("jktcjezjx");
		zctcjezjx=rs.getDouble("zctcjezjx");
		wntcjezjx=rs.getDouble("wntcjezjx");

		khbh=cf.fillNull(rs.getString("khbh"));
		tcbzjg=rs.getDouble("tcbzjg");
		tcmjzjje=rs.getDouble("tcmjzjje");
		tczcsjcj=rs.getDouble("tczcsjcj");
		tczccljj=rs.getDouble("tczccljj");
		tcxsfzc=rs.getDouble("tcxsfzc");
		tczcjm=rs.getDouble("tczcjm");
		tcdpsj=rs.getDouble("tcdpsj");
		tcdpdlsf=rs.getDouble("tcdpdlsf");
		tcxpx=rs.getDouble("tcxpx");
		tcwsgzj=rs.getDouble("tcwsgzj");
		tcwgccljj=rs.getDouble("tcwgccljj");
		tcwzjzc=rs.getDouble("tcwzjzc");
		tcsgze=rs.getDouble("tcsgze");
		tcqtsf=rs.getDouble("tcqtsf");

		tcbzjgzjx=rs.getDouble("tcbzjgzjx");
		tcmjzjjezjx=rs.getDouble("tcmjzjjezjx");
		tczcsjcjzjx=rs.getDouble("tczcsjcjzjx");
		tczccljjzjx=rs.getDouble("tczccljjzjx");
		tcxsfzczjx=rs.getDouble("tcxsfzczjx");
		tczcjmzjx=rs.getDouble("tczcjmzjx");
		tcdpsjzjx=rs.getDouble("tcdpsjzjx");
		tcdpdlsfzjx=rs.getDouble("tcdpdlsfzjx");
		tcxpxzjx=rs.getDouble("tcxpxzjx");
		tcwsgzjzjx=rs.getDouble("tcwsgzjzjx");
		tcwgccljjzjx=rs.getDouble("tcwgccljjzjx");
		tcsgzezjx=rs.getDouble("tcsgzezjx");
		tcqtsfzjx=rs.getDouble("tcqtsfzjx");
	}
	rs.close();
	ps.close();


	//选配订单
	double xpzcddje=0;
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";//1：系统存在品牌订单；2：系统不存在品牌订单；3：补录合同；4：有库存订单；5：套餐分解订单
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and jc_zcdd.sfjrht='N'";//是否计入合同  Y：计入；N：不计入
	ls_sql+=" and jc_zcdd.ddlx in('C')";
	//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材；D：套餐外主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xpzcddje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	tcxpxzjx=cf.round(tcxpxzjx+xpzcddje,2);


	String zklx="";
	double zdzk=0;
	double gcfqdzk=0;
	ls_sql="SELECT zklx,zdzk,gcfqdzk";
	ls_sql+=" FROM crm_khzk  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
	}
	rs.close();
	ps.close();
	
	
	if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		zkl=zdzk;

		zklmc="整单折扣:"+zkl;
	}
	else {
		zkl=gcfqdzk;
		zklmc="工程费折扣:"+zkl;
	}

	//订金折现
	ls_sql="SELECT fxgck";
	ls_sql+=" FROM jc_cxhd  ";
	ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxgck=cf.fillNull(rs.getString("fxgck"));//多倍返现工程款
	}
	rs.close();
	ps.close();

	double zdfxdj=0;//最大返现订金
	ls_sql="select jc_cxhddjfxbz.zdfxdj";
	ls_sql+=" from jc_cxhd,jc_cxhddjfxbz";
	ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhddjfxbz.cxhdbm and jc_cxhd.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_cxhd.hdlx in('1','2') and jc_cxhd.cxhdmc='"+cxhdbm+"'";
	ls_sql+=" and qd<"+wdzgce+" and "+wdzgce+"<=zd ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdfxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//客户交返现订金
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl ";
	ls_sql+=" where cw_khfkjl.fkje!=0";
	ls_sql+=" and  cw_khfkjl.scbz='N'";
	ls_sql+=" and  cw_khfkjl.fklxbm in('52')";//51：促销活动订金；52：量房订金；53：设计费
	ls_sql+=" and khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if (fxdj>zdfxdj)
	{
		fxdj=zdfxdj;
	}

	ls_sql="select spr,spsj,spyj,clzt,htsjf,sssjf,wdzgce,qye,zqljzjx,zhljzjx,zqhj,zhhj,jsze,yjzxk,dj,yjwk,yhje,fqbl,fqje,djfxje,dyq,yhze,shfqje,yjzck,zcddjezq,zcddyh,dgzcjezq,dgzcyh,zcjsje,pck,khbjk,lrr,lrsj,lrbm,bz,zctcze ";
	ls_sql+=" from  cw_jrkhjs";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		htsjf=rs.getDouble("htsjf");
		sssjf=rs.getDouble("sssjf");
		wdzgce=rs.getDouble("wdzgce");

		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");

		zhljzjx=rs.getDouble("zhljzjx");
		zqhj=rs.getDouble("zqhj");
		zhhj=rs.getDouble("zhhj");
		jsze=rs.getDouble("jsze");
		yjzxk=rs.getDouble("yjzxk");
		dj=rs.getDouble("dj");
		yjwk=rs.getDouble("yjwk");
		yhje=rs.getDouble("yhje");
		fqbl=rs.getDouble("fqbl");
		fqje=rs.getDouble("fqje");
		djfxje=rs.getDouble("djfxje");
		dyq=rs.getDouble("dyq");
		yhze=rs.getDouble("yhze");
		shfqje=rs.getDouble("shfqje");
		yjzck=rs.getDouble("yjzck");
		zcddjezq=rs.getDouble("zcddjezq");
		zcddyh=rs.getDouble("zcddyh");
		dgzcjezq=rs.getDouble("dgzcjezq");
		dgzcyh=rs.getDouble("dgzcyh");
		zcjsje=rs.getDouble("zcjsje");
		pck=rs.getDouble("pck");
		khbjk=rs.getDouble("khbjk");
		zctcze=rs.getDouble("zctcze");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	//套餐外增加主材
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";//1：系统存在品牌订单；2：系统不存在品牌订单；3：补录合同；4：有库存订单；5：套餐分解订单
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and sfjrht='N'";//是否计入合同  Y：计入；N：不计入
	ls_sql+=" and ddlx in('5','D')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzjzczjx=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (clzt.equals("1"))//1：未审批；2：审批同意；3：审批不同意 
	{
		out.println("错误！结算未审核");
//		return;
	}

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<div align="center">套餐客户结算(客户编号:<%=khbh%>)</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF">
    <td width="16%" align="right">客户姓名</td>
    <td width="29%"><%=khxm%></td>
    <td width="23%" align="right" bgcolor="#FFFFFF">联系方式</td>
    <td width="32%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">房屋地址</td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF">面积</td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">户型</td>
    <td><%=hxmc%></td>
    <td align="right" bgcolor="#FFFFFF">报价级别</td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">合同号</td>
    <td><%=hth%></td>
    <td align="right" bgcolor="#FFFFFF">会员卡号</td>
    <td><%=hyh%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">签约日期</td>
    <td><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF">开工日期</td>
    <td><%=kgrq%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">设计费情况</span></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="16%" align="right" bgcolor="#FFFFFF">合同设计费</td> 
  <td width="29%"><%=htsjf%></td>
  <td width="23%" align="right" bgcolor="#FFFFFF">实收设计费</td> 
  <td width="32%"><%=sssjf%></td>
</tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td>&nbsp;</td>
    <td><strong>合同</strong></td>
    <td><strong>增减项</strong></td>
    <td><strong>合计</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">标准价格</td>
    <td align="center"><%=tcbzjg%></td>
    <td align="center"><%=tcbzjgzjx%></td>
    <td align="center"><%=cf.round(tcbzjg+tcbzjgzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 面积增加金额 </td>
    <td align="center"><%=tcmjzjje%> </td>
    <td align="center"><%=tcmjzjjezjx%></td>
    <td align="center"><%=cf.round(tcmjzjje+tcmjzjjezjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">主材升级差价</td>
    <td align="center"><%=cf.round(tczcsjcj+tcxsfzc,2)%></td>
    <td align="center"><%=cf.round(tczcsjcjzjx+tcxsfzczjx,2)%></td>
    <td align="center"><%=cf.round(tczcsjcj+tczcsjcjzjx+tcxsfzc+tcxsfzczjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">顶配升级</td>
    <td align="center"><%=tcdpsj%></td>
    <td align="center"><%=tcdpsjzjx%></td>
    <td align="center"><%=cf.round(tcdpsj+tcdpsjzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 主材超量加价 </td>
    <td align="center"><%=tczccljj%> </td>
    <td align="center"><%=tczccljjzjx%></td>
    <td align="center"><%=cf.round(tczccljj+tczccljjzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 套餐内主材核减 </td>
    <td align="center"> -<%=tczcjm%> </td>
    <td align="center">-<%=tczcjmzjx%></td>
    <td align="center">-<%=cf.round(tczcjm+tczcjmzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 套餐外施工项造价 </td>
    <td align="center"><%=cf.round(tcwsgzj+tcwgccljj,2)%></td>
    <td align="center"><%=cf.round(tcwsgzjzjx+tcwgccljjzjx,2)%></td>
    <td align="center"><%=cf.round(tcwsgzj+tcwsgzjzjx+tcwgccljj+tcwgccljjzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">远程费</td>
    <td align="center"><%=tcqtsf%></td>
    <td align="center"><%=tcqtsfzjx%></td>
    <td align="center"><%=cf.round(tcqtsf+tcqtsfzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>
    套餐金额小计</strong></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf,2)%></td>
    <td align="center"><%=cf.round(tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">套餐外增加主材</td>
    <td align="center"><%=tcwzjzc%></td>
    <td align="center"><%=cf.round(tcwzjzczjx-tcwzjzc,2)%></td>
    <td align="center"><%=tcwzjzczjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>
    合 计</strong></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcwzjzc,2)%></td>
    <td align="center"><%=cf.round(tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx+(tcwzjzczjx-tcwzjzc),2)%></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx+tcwzjzczjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFFF">主材套餐</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">顶配独立收费</td>
    <td align="center"><%=tcdpdlsf%></td>
    <td align="center"><%=tcdpdlsfzjx%></td>
    <td align="center"><%=cf.round(tcdpdlsf+tcdpdlsfzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">选配主材</td>
    <td align="center"><%=tcxpx%></td>
    <td align="center"><%=tcxpxzjx%></td>
    <td align="center"><%=cf.round(tcxpx+tcxpxzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">家具套餐金额</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=zctcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">温暖套餐金额</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=jktcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">静音套餐金额</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=wntcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">色彩套餐金额</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=jytcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">健康套餐金额</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=sctcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>
    小 计</strong></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=cf.round(zctcjezjx+wntcjezjx+jytcjezjx+sctcjezjx+jktcjezjx+tcdpdlsf+tcdpdlsfzjx+tcxpx+tcxpxzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td width="16%" align="right" bgcolor="#FFFFFF">客户已交装修款</td>
  <td width="29%"><%=yjzxk%></td><td colspan="2" bgcolor="#FFFFFF">其中定金转家装款:<%=dj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">应交装修尾款</td>
  <td><%=yjwk%></td><td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">优惠情况</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">促销活动内容</td>
  <td colspan="3"><%=cxhdbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">返券优惠</td>
  <td><%=fqje%>  </td>
  <td colspan="2">返券比例:<%=fqbl%>％ </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">折扣优惠</td>
  <td><%=yhje%>  </td>
  <td colspan="2"><%=zklmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">订金折现优惠</td>
  <td><%=djfxje%>  </td>
  <td colspan="2"><%=fxgck%>倍订金折现，客户交订金:<%=fxdj%>，订金折现优惠=<%=fxdj%>*(<%=fxgck%>-1)倍*<%=zkl%>折</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">抵用券</td>
  <td><%=dyq%></td>
  <td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收回减项返券金额</td>
  <td><%=shfqje%>  </td><td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">优惠合计金额</td>
  <td><%=yhze%> </td><td colspan="2">优惠金额＝折扣优惠+订金折现优惠＋抵用券-收回减项返券金额</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">主材情况</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">已交主材款</td>
  <td><%=yjzck%></td><td width="23%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">机电代销</td>
  <td><%=zcddjezq%>    </td>
  <td align="right" bgcolor="#FFFFFF">主材套餐</td>
  <td><%=zctcze%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">代购主材</td>
  <td><%=dgzcjezq%></td><td align="right" bgcolor="#FFFFFF">代购主材优惠</td>
  <td ><%=dgzcyh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">主材结算额</td>
  <td><%=zcjsje%>  </td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">客户赔偿款</td>
  <td><%=pck%></td><td align="right">客户补交款</td>
  <td><%=khbjk%></td></tr>

<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><%=bz%></td>
</tr>
</table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF">
    <td height="28">结 算 人：<%=lrr%></td>
    <td>审 核 人：<%=spr%></td>
    <td bgcolor="#FFFFFF">客户签字：</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" height="28">结算时间：<%=lrsj%></td>
    <td width="25%">审核时间：<%=spsj%></td>
    <td width="25%" bgcolor="#FFFFFF">时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
    <td width="25%">&nbsp;</td>
  </tr>
</table>

</body>
</html>


