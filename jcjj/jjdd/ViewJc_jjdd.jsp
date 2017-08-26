<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String kgrq=null;
String jgrq=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String qyrq=null;
String qydm=null;
String ssfgs=null;
String cxhdbm=null;

String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh="";

String jc_jjdd_ddbh=null;
String jc_jjdd_khbh=null;
String jc_jjdd_dj=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jc_jjdd_jhccsj=null;
String jc_jjdd_jjsjs=null;


String jc_jjdd_sccsj=null;
String jc_jjdd_ccbz=null;

String jc_jjdd_qhtsj=null;
String jc_jjdd_qhtr=null;
String jc_jjdd_htbz=null;
String jc_jjdd_tdsj=null;
String jc_jjdd_tdblr=null;
String jc_jjdd_tdsm=null;
String jc_jjdd_jhazrq=null;
String jc_jjdd_sazrq=null;
String clztmc=null;
String jc_jjdd_lrr=null;
String jc_jjdd_lrsj=null;
String jc_jjdd_bz=null;

String jc_jjdd_rksj=null;
String sq_dwxx_dwmc=null;
String jc_jjdd_rkr=null;
String jc_jjdd_rksm=null;

String jhccxgr=null;
String jhccxgsj=null;
String jhccxgyy=null;
String ccr=null;


String pdgc=null;
String pdgcmc=null;
String jjgys=null;
String jjppmc=null;
String xcmgc=null;
String xcmgcmc=null;
String xcmgys=null;
String xcmppmc=null;
String pdr=null;
String pdsj=null;
String pdsm=null;

String kclf=null;
String jctdyybm=null;

String sfpsjs=null;
String sjsgpyybm=null;

String jc_jjdd_sjsdh="";


String htqrr=null;
String htqrsj=null;
String htqrbz=null;
String pgcr=null;
String pgcsj=null;
String pgcsm=null;
String sfkgh=null;
String gcjsr=null;
String gcjssj=null;
String gcjsbz=null;

String kazsj=null;
String kazsjlrr=null;
String azsjbz=null;
String azr=null;
String ksazsj=null;
String sazrq=null;
String azsm=null;
String ycyybm=null;
String ycclzt=null;
String zsycyybm=null;
String ychsqk=null;
String ychsr=null;
String ychssj=null;
String sfxwyj=null;
String wyj=null;
String jjfa=null;
String wjsj=null;
String wjlrr=null;
String sfjs=null;
String jstx=null;
String aztzr=null;
String aztzsj=null;

String ssfgsbh=null;
String qddm=null;
String jzsjs=null;
String fkfs=null;
String khjl=null;


double jjzkl=0;
String dzyy=null;
double cbze=0;

double htze=0;
double jjje=0;
double xcmje=0;
double cpjjje=0;

double wdzje=0;
double zqjjje=0;
double zqxcmje=0;
double zqcpjjje=0;

double jjzjje=0;
double xcmzjje=0;
double cpjjzjje=0;
double zjhze=0;

double zqjjzjje=0;
double zqxcmzjje=0;
double zqcpjjzjje=0;
double zqzjhze=0;

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";


try {
	conn=cf.getConnection();
	ls_sql="select jc_jjdd.fkfs,jc_jjdd.fgsbh,jc_jjdd.qddm,jc_jjdd.jzsjs,jc_jjdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.jgrq,crm_khxx.sgd,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.dwbh,cxhdbm,jc_jjdd.fgsbh";
	ls_sql+=" ,jc_jjdd.aztzr,jc_jjdd.aztzsj,jc_jjdd.kazsj,jc_jjdd.kazsjlrr,jc_jjdd.azsjbz,jc_jjdd.azr,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.azsm,jc_jjdd.ycyybm,jc_jjdd.ycclzt,jc_jjdd.zsycyybm,jc_jjdd.ychsqk,jc_jjdd.ychsr,jc_jjdd.ychssj,jc_jjdd.sfxwyj,jc_jjdd.wyj,jc_jjdd.jjfa,jc_jjdd.wjsj,jc_jjdd.wjlrr,jc_jjdd.sfjs,jc_jjdd.jstx,jc_jjdd.htqrr,jc_jjdd.htqrsj,jc_jjdd.htqrbz,jc_jjdd.pgcr,jc_jjdd.pgcsj,jc_jjdd.pgcsm,jc_jjdd.sfkgh,jc_jjdd.gcjsr,jc_jjdd.gcjssj,jc_jjdd.gcjsbz,jc_jjdd.htbz,sjsgpyybm,sfpsjs,kclf,jctdyybm,pdgc,xcmgc,jc_jjdd.pdr,jc_jjdd.pdsj,jc_jjdd.pdsm,jc_jjdd.rkr jc_jjdd_rkr,jc_jjdd.rksm jc_jjdd_rksm,jhccxgr,jhccxgsj,jhccxgyy,ccr,jc_jjdd.ddbh as jc_jjdd_ddbh,jc_jjdd.khbh as jc_jjdd_khbh,jc_jjdd.dj as jc_jjdd_dj,jc_jjdd.clgw as clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.jhccsj as jc_jjdd_jhccsj,jc_jjdd.jjsjs as jc_jjdd_jjsjs,jc_jjdd.sccsj as jc_jjdd_sccsj,jc_jjdd.ccbz as jc_jjdd_ccbz,jc_jjdd.qhtsj as jc_jjdd_qhtsj,jc_jjdd.qhtr as jc_jjdd_qhtr,jc_jjdd.tdsj as jc_jjdd_tdsj,jc_jjdd.tdblr as jc_jjdd_tdblr,jc_jjdd.tdsm as jc_jjdd_tdsm,jc_jjdd.jhazrq as jc_jjdd_jhazrq,jc_jjdd.sazrq as jc_jjdd_sazrq,clztmc,jc_jjdd.lrr as jc_jjdd_lrr,jc_jjdd.lrsj as jc_jjdd_lrsj,jc_jjdd.bz as jc_jjdd_bz,jc_jjdd.rksj as jc_jjdd_rksj,sq_dwxx.dwmc as sq_dwxx_dwmc ";
	ls_sql+=" ,jc_jjdd.pdgcmc,jc_jjdd.jjgys,jc_jjdd.jjppmc,jc_jjdd.xcmgcmc,jc_jjdd.xcmgys,jc_jjdd.xcmppmc";
	ls_sql+=" ,jc_jjdd.jjzkl,jc_jjdd.dzyy,jc_jjdd.cbze";	
	ls_sql+=" ,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.cpjjje         ,jc_jjdd.wdzje,jc_jjdd.zqjjje,jc_jjdd.zqxcmje,jc_jjdd.zqcpjjje";
	ls_sql+=" ,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.cpjjzjje  ,jc_jjdd.zqzjhze,jc_jjdd.zqjjzjje,jc_jjdd.zqxcmzjje,jc_jjdd.zqcpjjzjje ";	
	ls_sql+=" ,jc_jjdd.khjl";
	
	ls_sql+=" from  jc_jjdd,crm_khxx,sq_dwxx,jdm_jjddzt";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.dwbh=sq_dwxx.dwbh and  (jc_jjdd.ddbh='"+ddbh+"')  ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		cbze=rs.getDouble("cbze");

		htze=rs.getDouble("htze");
		jjje=rs.getDouble("jjje");
		xcmje=rs.getDouble("xcmje");
		cpjjje=rs.getDouble("cpjjje");

		wdzje=rs.getDouble("wdzje");
		zqjjje=rs.getDouble("zqjjje");
		zqxcmje=rs.getDouble("zqxcmje");
		zqcpjjje=rs.getDouble("zqcpjjje");

		zjhze=rs.getDouble("zjhze");
		jjzjje=rs.getDouble("jjzjje");
		xcmzjje=rs.getDouble("xcmzjje");
		cpjjzjje=rs.getDouble("cpjjzjje");

		zqzjhze=rs.getDouble("zqzjhze");
		zqjjzjje=rs.getDouble("zqjjzjje");
		zqxcmzjje=rs.getDouble("zqxcmzjje");
		zqcpjjzjje=rs.getDouble("zqcpjjzjje");

		fkfs=cf.fillNull(rs.getString("fkfs"));
		ssfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qydm=cf.fillNull(rs.getString("dwbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		kazsjlrr=cf.fillNull(rs.getString("kazsjlrr"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		azr=cf.fillNull(rs.getString("azr"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azsm=cf.fillNull(rs.getString("azsm"));
		ycyybm=cf.fillNull(rs.getString("ycyybm"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
		zsycyybm=cf.fillNull(rs.getString("zsycyybm"));
		ychsqk=cf.fillNull(rs.getString("ychsqk"));
		ychsr=cf.fillNull(rs.getString("ychsr"));
		ychssj=cf.fillNull(rs.getDate("ychssj"));
		sfxwyj=cf.fillNull(rs.getString("sfxwyj"));
		wyj=cf.fillNull(rs.getString("wyj"));
		jjfa=cf.fillNull(rs.getString("jjfa"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		jstx=cf.fillNull(rs.getString("jstx"));

		htqrr=cf.fillNull(rs.getString("htqrr"));
		htqrsj=cf.fillNull(rs.getDate("htqrsj"));
		htqrbz=cf.fillNull(rs.getString("htqrbz"));
		pgcr=cf.fillNull(rs.getString("pgcr"));
		pgcsj=cf.fillNull(rs.getDate("pgcsj"));
		pgcsm=cf.fillNull(rs.getString("pgcsm"));
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		gcjsr=cf.fillNull(rs.getString("gcjsr"));
		gcjssj=cf.fillNull(rs.getDate("gcjssj"));
		gcjsbz=cf.fillNull(rs.getString("gcjsbz"));

		
		jc_jjdd_htbz=cf.fillNull(rs.getString("htbz"));
		sjsgpyybm=cf.fillNull(rs.getString("sjsgpyybm"));
		sfpsjs=cf.fillNull(rs.getString("sfpsjs"));
		kclf=cf.fillNull(rs.getString("kclf"));
		jctdyybm=cf.fillNull(rs.getString("jctdyybm"));

		
		pdgc=cf.fillNull(rs.getString("pdgc"));
		pdgcmc=cf.fillNull(rs.getString("pdgcmc"));
		jjgys=cf.fillNull(rs.getString("jjgys"));
		jjppmc=cf.fillNull(rs.getString("jjppmc"));
		xcmgc=cf.fillNull(rs.getString("xcmgc"));
		xcmgcmc=cf.fillNull(rs.getString("xcmgcmc"));
		xcmgys=cf.fillNull(rs.getString("xcmgys"));
		xcmppmc=cf.fillNull(rs.getString("xcmppmc"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdsm=cf.fillNull(rs.getString("pdsm"));

		jc_jjdd_rkr=cf.fillNull(rs.getString("jc_jjdd_rkr"));
		jc_jjdd_rksm=cf.fillNull(rs.getString("jc_jjdd_rksm"));
		jhccxgr=cf.fillNull(rs.getString("jhccxgr"));
		jhccxgsj=cf.fillNull(rs.getDate("jhccxgsj"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		ccr=cf.fillNull(rs.getString("ccr"));

		jc_jjdd_ddbh=cf.fillNull(rs.getString("jc_jjdd_ddbh"));
		jc_jjdd_khbh=cf.fillNull(rs.getString("jc_jjdd_khbh"));
		jc_jjdd_dj=cf.fillNull(rs.getString("jc_jjdd_dj"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jc_jjdd_jhccsj=cf.fillNull(rs.getDate("jc_jjdd_jhccsj"));
		jc_jjdd_jjsjs=cf.fillNull(rs.getString("jc_jjdd_jjsjs"));
		jc_jjdd_sccsj=cf.fillNull(rs.getDate("jc_jjdd_sccsj"));
		jc_jjdd_ccbz=cf.fillNull(rs.getString("jc_jjdd_ccbz"));


		jc_jjdd_qhtsj=cf.fillNull(rs.getDate("jc_jjdd_qhtsj"));
		jc_jjdd_qhtr=cf.fillNull(rs.getString("jc_jjdd_qhtr"));
		jc_jjdd_tdsj=cf.fillNull(rs.getDate("jc_jjdd_tdsj"));
		jc_jjdd_tdblr=cf.fillNull(rs.getString("jc_jjdd_tdblr"));
		jc_jjdd_tdsm=cf.fillNull(rs.getString("jc_jjdd_tdsm"));
		jc_jjdd_jhazrq=cf.fillNull(rs.getDate("jc_jjdd_jhazrq"));
		jc_jjdd_sazrq=cf.fillNull(rs.getDate("jc_jjdd_sazrq"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		jc_jjdd_lrr=cf.fillNull(rs.getString("jc_jjdd_lrr"));
		jc_jjdd_lrsj=cf.fillNull(rs.getDate("jc_jjdd_lrsj"));
		jc_jjdd_bz=cf.fillNull(rs.getString("jc_jjdd_bz"));
		jc_jjdd_rksj=cf.fillNull(rs.getDate("jc_jjdd_rksj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
	}
	rs.close();
	ps.close();

	//家具设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+jc_jjdd_jjsjs+"' and ssfgs='"+ssfgs+"' and zwbm='12'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jc_jjdd_sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+qydm+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">家具订单 </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">客户编号</td>
    <td width="30%"><%=khbh%></td>
    <td align="right" width="20%">合同号</td>
    <td width="30%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">客户姓名</td>
    <td width="30%"><%=khxm%>（ 
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
      ） </td>
    <td align="right" width="20%">参加促销活动</td>
    <td width="30%"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">签约店面</td>
    <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qydm+"'",qydm,true);
%></td>
    <td align="right" width="20%">家装设计师</td>
    <td width="30%"><%=sjs%>（<%=sjsdh%>）</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">施工队</td>
    <td width="30%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> （<%=dzdh%>） </td>
    <td align="right" width="20%">班长</td>
    <td width="30%"><%=sgbz%>（<%=bzdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">家装签约日期</td>
    <td width="30%"><%=qyrq%> </td>
    <td align="right" width="20%">质检</td>
    <td width="30%"><%=zjxm%>（<%=zjdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">合同开工日期</td>
    <td width="30%"><%=kgrq%> </td>
    <td align="right" width="20%">合同竣工日期</td>
    <td width="30%"><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td colspan="4" align="center"> 
      <input type="button" name="Button4" value="查看预订单" onClick="window.open('ViewJc_jjyddmx.jsp?ddbh=<%=ddbh%>')">    </td>
  </tr>
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
    <td width="20%" align="right">家装设计师</td>
    <td width="30%"><%=jzsjs%> </td>
    <td width="20%" align="right">客户经理</td>
    <td width="30%"><%=khjl%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" width="20%">订单编号</td>
    <td width="30%"><%=jc_jjdd_ddbh%></td>
    <td align="right" width="20%">处理状态</td>
    <td width="30%"><%=clztmc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">项目专员</td>
    <td width="30%"><%=xmzy%></td>
    <td width="20%" align="right"></td>
    <td width="30%"></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">驻店家居顾问</td>
    <td width="30%"><%=clgw%> </td>
    <td width="20%" align="right">展厅家居顾问</td>
    <td width="30%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">录入人</td>
    <td width="30%"> <%=jc_jjdd_lrr%> </td>
    <td width="20%" align="right">录入时间</td>
    <td width="30%"> <%=jc_jjdd_lrsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">录入部门</td>
    <td width="30%"> <%=sq_dwxx_dwmc%></td>
    <td width="20%" align="right"></td>
    <td width="30%"></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">备注</td>
    <td colspan="3"><%=jc_jjdd_bz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">是否需派设计师</td>
    <td width="30%"><%
	cf.radioToken(out, "1+是&2+否",sfpsjs,true);
%></td>
    <td width="20%" align="right">家居设计师</td>
    <td width="30%"><%=jc_jjdd_jjsjs%>（<%=jc_jjdd_sjsdh%>）</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">派单人</td>
    <td width="30%"><%=pdr%></td>
    <td width="20%" align="right">派单时间</td>
    <td width="30%"><%=pdsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">设计师改派原因</td>
    <td colspan="3"><%
	cf.selectItem(out,"select sjsgpyybm,sjsgpyymc from jdm_sjsgpyybm where sjsgpyybm='"+sjsgpyybm+"'",sjsgpyybm,true);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">派单说明</td>
    <td colspan="3"><%=pdsm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td colspan="4" align="center"> 
      <input type="button" name="Button2" value="设计师改派记录" onClick="window.open('ViewJc_jjsjsgpjl.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button22" value="设计师联系客户记录" onClick="window.open('ViewJc_jjsjslxjl.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button" value="查看初测单" onClick="window.open('ViewJc_cgccdmx.jsp?ddbh=<%=ddbh%>')">    </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">计划初测时间</td>
    <td colspan="3"><%=jc_jjdd_jhccsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">计划初测录入人</td>
    <td width="30%"><%=jhccxgr%></td>
    <td width="20%" align="right">计划初测录入时间</td>
    <td width="30%"><%=jhccxgsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">计划初测备注</td>
    <td colspan="3"><%=jhccxgyy%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">实初测录入人</td>
    <td width="30%"><%=ccr%></td>
    <td width="20%" align="right">实初测时间</td>
    <td width="30%"><%=jc_jjdd_sccsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">实初测备注</td>
    <td colspan="3"><%=jc_jjdd_ccbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td colspan="4" align="center"> 
      <input type="button" name="Button5" value="查看合同明细" onClick="window.open('ViewJc_jjddmx.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button3" value="查看增减项" onClick="window.open('ViewJc_jjzjx.jsp?ddbh=<%=ddbh%>')">    </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td colspan="4" bgcolor="#FFFFFF"><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td align="right">折扣率</td>
        <td><%=jjzkl %></td>
        <td width="20%" align="right">成本总额</td>
        <td width="30%"><%=cbze%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">打折原因</td>
        <td colspan="3"><%=dzyy %></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right"><strong>家具合同金额-折前</strong></td>
        <td width="30%"><%=zqjjje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>家具合同金额-折后</strong></span></td>
        <td width="30%"><%=jjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right"><strong>型材门合同金额-折前</strong></td>
        <td width="30%"><%=zqxcmje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>型材门合同金额-折后</strong></span></td>
        <td width="30%"><%=xcmje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right"><strong>成品家具合同金额-折前</strong></td>
        <td><%=zqcpjjje%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>成品家具合同金额-折后</strong></span></td>
        <td><%=cpjjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right"><strong>未打折合同额</strong></td>
        <td width="30%"><%=wdzje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>合同总额-折后</strong></span></td>
        <td width="30%"><%=htze%></td>
      </tr>

      <tr bgcolor="#FFFFFF">
        <td colspan="4" align="right">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right" bgcolor="#FFFFFF"><strong>家具增减后金额-折前</strong></td>
        <td width="30%"><%=zqjjzjje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>家具增减后金额-折后</strong></span></td>
        <td width="30%"><%=jjzjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right" bgcolor="#FFFFFF"><strong>型材门增减后金额-折前</strong></td>
        <td width="30%"><%=zqxcmzjje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>型材门增减后金额-折后</strong></span></td>
        <td width="30%"><%=xcmzjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><strong>成品家具增减后金额-折前</strong></td>
        <td><%=zqcpjjzjje%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>成品家具增减后金额-折后</strong></span></td>
        <td><%=cpjjzjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right" bgcolor="#FFFFFF"><strong>增减后总额-折前</strong></td>
        <td width="30%"><%=zqzjhze%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>增减后总额-折后</strong></span></td>
        <td width="30%"><%=zjhze%></td>
      </tr>

    </table></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> 签合同时间</td>
    <td width="30%"><%=jc_jjdd_qhtsj%></td>
    <td width="20%" align="right">签合同人</td>
    <td width="30%"><%=jc_jjdd_qhtr%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">计划安装日期</td>
    <td width="30%"><%=jc_jjdd_jhazrq%></td>
    <td align="right" width="20%">可减项截止时间</td>
    <td width="30%"><%=jc_jjdd_jhazrq%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">合同备注</td>
    <td colspan="3"><%=jc_jjdd_htbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#FFFFCC" width="20%"><b><font color="#CC0000">付款方式</font></b></td>
    <td bgcolor="#FFFFCC" width="30%"><%
	cf.selectToken(out,"1+已交家具款&2+橱柜预付款&3+主材预付款&4+家具预付款&5+木门预付款&9+未付款",fkfs,true);
%></td>
    <td align="right" bgcolor="#FFFFCC" width="20%">&nbsp;</td>
    <td bgcolor="#FFFFCC" width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">交款确认人</td>
    <td bgcolor="#FFFFCC" width="30%"><%=htqrr%></td>
    <td align="right" bgcolor="#FFFFCC" width="20%"> 交款确认时间</td>
    <td bgcolor="#FFFFCC" width="30%"><%=htqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">交款确认说明</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=htqrbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">家具工厂编号</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pdgc%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">型材门工厂编号</td>
    <td bgcolor="#CCCCFF" width="30%"><%=xcmgc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">家具工厂名称</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pdgcmc%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">型材门工厂名称</td>
    <td bgcolor="#CCCCFF" width="30%"><%=xcmgcmc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">家具供应商</td>
    <td bgcolor="#CCCCFF" width="30%"><%=jjgys%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">型材门供应商</td>
    <td bgcolor="#CCCCFF" width="30%"><%=xcmgys%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">家具品牌</td>
    <td bgcolor="#CCCCFF" width="30%"><%=jjppmc%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">型材门品牌</td>
    <td bgcolor="#CCCCFF" width="30%"><%=xcmppmc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">派工厂人</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pgcr%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">派工厂时间</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pgcsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">派工厂说明</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=pgcsm%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">是否可供货</td>
    <td bgcolor="#CCCCFF" width="30%"><%
	cf.radioToken(out,"Y+可供货&N+无货",sfkgh,true);
%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">&nbsp;</td>
    <td bgcolor="#CCCCFF" width="30%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">工厂接收人</td>
    <td bgcolor="#CCCCFF" width="30%"><%=gcjsr%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">工厂接收时间</td>
    <td bgcolor="#CCCCFF" width="30%"><%=gcjssj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">工厂接收说明</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=gcjsbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">入库人</td>
    <td width="30%"><%=jc_jjdd_rkr%> </td>
    <td width="20%" align="right"> 入库时间</td>
    <td width="30%"><%=jc_jjdd_rksj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">入库说明</td>
    <td colspan="3"><%=jc_jjdd_rksm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td height="24" colspan="4" align="center" bgcolor="#FFFFCC"> 
      <input type="button"  value="协商安装时间记录" onClick="window.open('ViewJc_jjazsjjl.jsp?ddbh=<%=ddbh%>')" >
      <input type="button" value="上门安装记录"  onClick="window.open('ViewJc_jjazjl.jsp?ddbh=<%=ddbh%>')" >    </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">协商安装时间</td>
    <td width="30%"><%=kazsj%></td>
    <td align="right" width="20%">协商安装时间录入人</td>
    <td width="30%"><%=kazsjlrr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">安装时间说明</td>
    <td colspan="3"><%=azsjbz%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">发安装通知时间</td>
    <td width="30%"><%=aztzsj%></td>
    <td align="right" width="20%">发安装通知人</td>
    <td width="30%"><%=aztzr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">实安装录入人</td>
    <td bgcolor="#CCCCFF" width="30%"><%=azr%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">&nbsp;</td>
    <td bgcolor="#CCCCFF" width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">开始安装时间 </td>
    <td bgcolor="#CCCCFF" width="30%"><%=ksazsj%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">安装完成时间</td>
    <td bgcolor="#CCCCFF" width="30%"><%=sazrq%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">实安装说明</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=azsm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">延迟原因</td>
    <td width="30%"><%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",ycyybm,true);
%></td>
    <td align="right" width="20%">真实延迟原因</td>
    <td width="30%"><%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",zsycyybm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">延迟处理状态</td>
    <td width="30%"> <%
	cf.radioToken(out, "0+未延迟&1+延迟未核实&2+延迟原因属实&3+延迟原因不属实",ycclzt,true);
%> </td>
    <td align="right" width="20%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">延迟核实情况</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=ychsqk%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">延迟核实人</td>
    <td bgcolor="#CCCCFF" width="30%"><%=ychsr%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">延迟核实时间</td>
    <td bgcolor="#CCCCFF" width="30%"><%=ychssj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">否支付违约金</td>
    <td bgcolor="#CCCCFF" width="30%"> <%
	cf.radioToken(out, "Y+需要&N+不需要",sfxwyj,true);
%> </td>
    <td align="right" bgcolor="#CCCCFF" width="20%">违约金</td>
    <td bgcolor="#CCCCFF" width="30%"><%=wyj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">解决方案</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=jjfa%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">完结时间</td>
    <td bgcolor="#FFFFCC" width="30%"><%=wjsj%></td>
    <td align="right" bgcolor="#FFFFCC" width="20%">完结录入人</td>
    <td bgcolor="#FFFFCC" width="30%"><%=wjlrr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">是否与工厂结算</td>
    <td bgcolor="#FFFFCC" width="30%"> <%
	cf.selectToken(out,"N+未结算&Y+已结算",sfjs,true);
%> </td>
    <td align="right" bgcolor="#FFFFCC" width="20%">&nbsp;</td>
    <td bgcolor="#FFFFCC" width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">结算提醒</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=jstx%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">扣测量费</td>
    <td width="30%"><%=kclf%> </td>
    <td width="20%" align="right">退单原因</td>
    <td width="30%"><%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm where jctdyybm='"+jctdyybm+"'",jctdyybm,false);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">退单时间</td>
    <td width="30%"> <%=jc_jjdd_tdsj%> </td>
    <td width="20%" align="right">退单办理人</td>
    <td width="30%"> <%=jc_jjdd_tdblr%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">退单说明</td>
    <td colspan="3"><%=jc_jjdd_tdsm%></td>
  </tr>
</table>

</body>
</html>
