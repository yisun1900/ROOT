<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckjgbz=(String)session.getAttribute("ckjgbz");

String khxm=null;
String xb=null;
String cqbm=null;
String xqbm=null;
String fwdz=null;
String lxfs=null;
String nlqjbm=null;
String zybm=null;
String fj=null;
String sjs=null;
String khlxbm=null;
String yjzxsj=null;
String zxysbm=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String hdbz=null;
String cgdz=null;
String yzxxbz=null;
String hdsfss=null;
String zxhfsj=null;
String hfjlh=null;
String sfxhf=null;
String hfrq=null;
String lfsj=null;
String ctsj=null;
String shbz=null;
String shsj=null;
String shr=null;
String qdsj=null;
String xjf=null;

String zxdm=null;
String zxzt=null;
String sbyybm=null;
String zxdjbm=null;
String lrr=null;
String lrsj=null;
String bz=null;

String bjjb=null;
String ywy=null;
String ssfgs=null;
String lfbz=null;
String ctbz=null;

String sjsfpsj=null;
String jhjfsj=null;
String hdr=null;
String zxdmfpsj=null;
String jzbz=null;
String sjsbh=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String sbyyxs=null;
String sbsj=null;
String louhao=null;
String sfzdzbj=null;
String dzbjze=null;
String khfwjlh=null;
String sjsjdjlh=null;
String dmjdjlh=null;

double spzkl=0;
double zjxzkl=0;
String sfpzqtyh=null;
String pzqtyhnr=null;
String sfjczjz=null;
String lfdjbz=null;
String lfdj=null;
String jlfdjsj=null;
String cxhdbm=null;
String hddjbz=null;
String hddj=null;
String jhddjsj=null;
String hth=null;
String lrkhxm=null;
String lrfwdz=null;
String lrlxfs=null;

String sjfbz=null;
String sjf=null;
String jsjfsj=null;
String zklx=null;
String email=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

String cxgtbz=null;
String cxgtsj=null;
String csgtbz=null;
String csgtsj=null;
String sczbjsj=null;
String zjzbjsj=null;
String qsjhtbz=null;
String qsjhtsj=null;
String sjhtje=null;
String ysshbz=null;
String ysshsj=null;
String ysshr=null;
String ysshyj=null;

String bjdysq=null;
String bjdysqsj=null;
String bjdysqr=null;
String tcmc=null;
String yxtxdz=null;
String sshybm=null;
String gmyx=null;
String ybjyx=null;
String zzystybj=null;
String zzydlgj=null;
String scbkhbh=null;
String khjl=null;
String xxlysm=null;

String jhctsj=null;
String jhcxgtsj=null;
String jhcsgtsj=null;
String jhzbjsj=null;
String khzyxz=null;
String sjhth=null;
String bjbbh=null;
String ysy=null;
String sgdmc=null;

double qdhdzk=0;
double glfzk=0;
double zjxhdzk=0;
double ysshdf=0;

String xxly="";
String jzsjs="";
String djbbh=null;
String zjxm=null;
String hyh=null;
String clgw=null;
String sgbz=null;
String hty=null;
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	stmt = conn.createStatement();

	ls_sql="select clgw,sgbz,hty,ysy,DECODE(crm_zxkhxx.bjdysq,'0','未授权','1','可导出') bjdysq,crm_zxkhxx.bjdysqr,crm_zxkhxx.bjdysqsj,ysshyj,ysshbz,ysshsj,ysshr,zklx,crm_zxkhxx.email,cxhdbmxq,cxhdbmzh,DECODE(sjfbz,'N','未交设计费','Y','已交设计费','T','退设计费') sjfbz,sjf,jsjfsj,lrlxfs,lrkhxm,lrfwdz,hth,DECODE(lfdjbz,'N','未交订金','Y','已交订金','T','退订金') lfdjbz,lfdj,jlfdjsj,cxhdbm,DECODE(hddjbz,'N','未交订金','Y','已交订金','T','退订金') hddjbz,hddj,jhddjsj,sfjczjz,spzkl,zjxzkl,sfpzqtyh,pzqtyhnr,sfzdzbj,dzbjze,khfwjlh,sjsjdjlh,dmjdjlh,louhao,sbsj,sbyyxs,ysrbm,rddqbm,hxwzbm,sjsbh,jzbz,sjsfpsj,jhjfsj,hdr,zxdmfpsj,lfbz,ctbz,crm_zxkhxx.ssfgs,ywy,bjjb,crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm as khxm,crm_zxkhxx.xb as xb,crm_zxkhxx.cqbm as cqbm,crm_zxkhxx.xqbm as xqbm,crm_zxkhxx.fwdz as fwdz,crm_zxkhxx.lxfs as lxfs,crm_zxkhxx.nlqjbm as nlqjbm,crm_zxkhxx.zybm as zybm,crm_zxkhxx.fj as fj,crm_zxkhxx.sjs as sjs,crm_zxkhxx.khlxbm as khlxbm,crm_zxkhxx.yjzxsj as yjzxsj,crm_zxkhxx.zxysbm as zxysbm,crm_zxkhxx.fwlxbm as fwlxbm,crm_zxkhxx.hxbm as hxbm,crm_zxkhxx.fwmj as fwmj,DECODE(trim(crm_zxkhxx.xjf),'1','新房','2','旧房')xjf,crm_zxkhxx.fgyqbm as fgyqbm,crm_zxkhxx.hdbz as hdbz,crm_zxkhxx.cgdz as cgdz,crm_zxkhxx.yzxxbz as yzxxbz,crm_zxkhxx.hdsfss as hdsfss,crm_zxkhxx.zxhfsj as zxhfsj,crm_zxkhxx.hfjlh as hfjlh,crm_zxkhxx.sfxhf as sfxhf,crm_zxkhxx.hfrq as hfrq,crm_zxkhxx.lfsj as lfsj,crm_zxkhxx.ctsj as ctsj,crm_zxkhxx.shbz as shbz,crm_zxkhxx.shsj as shsj,crm_zxkhxx.shr as shr,crm_zxkhxx.qdsj as qdsj,crm_zxkhxx.zxdm as zxdm,crm_zxkhxx.zxzt as zxzt,crm_zxkhxx.sbyybm as sbyybm,crm_zxkhxx.zxdjbm as zxdjbm,crm_zxkhxx.lrr as lrr,crm_zxkhxx.lrsj as lrsj,crm_zxkhxx.bz as bz ";
	ls_sql+=" ,crm_zxkhxx.cxgtbz,crm_zxkhxx.cxgtsj,crm_zxkhxx.csgtbz,crm_zxkhxx.csgtsj,crm_zxkhxx.sczbjsj,crm_zxkhxx.zjzbjsj,crm_zxkhxx.qsjhtbz,crm_zxkhxx.qsjhtsj,crm_zxkhxx.sjhtje";
	ls_sql+=" ,crm_zxkhxx.tcmc,yxtxdz,sshybm,gmyx,ybjyx,zzystybj,zzydlgj,scbkhbh,khjl,xxlysm";
	ls_sql+=" ,jhctsj,jhcxgtsj,jhcsgtsj,jhzbjsj,khzyxz,sjhth,bjbbh,ysshdf,sgdmc,djbbh,zjxm,hyh,clgw";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_zxkhxx.zxdjbm=sq_dwxx.dwbh(+) and  crm_zxkhxx.khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.sgd=sq_sgd.sgd(+) ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		clgw=cf.fillNull(rs.getString("clgw"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		hty=cf.fillNull(rs.getString("hty"));
		hyh=cf.fillNull(rs.getString("hyh"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		djbbh=cf.fillNull(rs.getString("djbbh"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		ysshdf=rs.getDouble("ysshdf");
		ysy=cf.fillNull(rs.getString("ysy"));
		jhctsj=cf.fillNull(rs.getDate("jhctsj"));
		jhcxgtsj=cf.fillNull(rs.getDate("jhcxgtsj"));
		jhcsgtsj=cf.fillNull(rs.getDate("jhcsgtsj"));
		jhzbjsj=cf.fillNull(rs.getDate("jhzbjsj"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));
		sjhth=cf.fillNull(rs.getString("sjhth"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));

		khjl=cf.fillNull(rs.getString("khjl"));
		xxlysm=cf.fillNull(rs.getString("xxlysm"));
		yxtxdz=cf.fillNull(rs.getString("yxtxdz"));
		sshybm=cf.fillNull(rs.getString("sshybm"));
		gmyx=cf.fillNull(rs.getString("gmyx"));
		ybjyx=cf.fillNull(rs.getString("ybjyx"));
		zzystybj=cf.fillNull(rs.getString("zzystybj"));
		zzydlgj=cf.fillNull(rs.getString("zzydlgj"));

		tcmc=cf.fillNull(rs.getString("tcmc"));
		bjdysq=cf.fillNull(rs.getString("bjdysq"));
		bjdysqr=cf.fillNull(rs.getString("bjdysqr"));
		bjdysqsj=cf.fillNull(rs.getString("bjdysqsj"));
		ysshyj=cf.fillNull(rs.getString("ysshyj"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshsj=cf.fillNull(rs.getDate("ysshsj"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		cxgtbz=cf.fillNull(rs.getString("cxgtbz"));
		cxgtsj=cf.fillNull(rs.getDate("cxgtsj"));
		csgtbz=cf.fillNull(rs.getString("csgtbz"));
		csgtsj=cf.fillNull(rs.getDate("csgtsj"));
		sczbjsj=cf.fillNull(rs.getDate("sczbjsj"));
		zjzbjsj=cf.fillNull(rs.getDate("zjzbjsj"));
		qsjhtbz=cf.fillNull(rs.getString("qsjhtbz"));
		qsjhtsj=cf.fillNull(rs.getDate("qsjhtsj"));
		sjhtje=cf.fillNull(rs.getString("sjhtje"));

		zklx=cf.fillNull(rs.getString("zklx"));
		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		sjfbz=cf.fillNull(rs.getString("sjfbz"));
		sjf=cf.fillNull(rs.getString("sjf"));
		jsjfsj=cf.fillNull(rs.getDate("jsjfsj"));

		lrlxfs=cf.fillNull(rs.getString("lrlxfs"));
		lrkhxm=cf.fillNull(rs.getString("lrkhxm"));
		lrfwdz=cf.fillNull(rs.getString("lrfwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		lfdjbz=cf.fillNull(rs.getString("lfdjbz"));
		lfdj=cf.fillNull(rs.getString("lfdj"));
		jlfdjsj=cf.fillNull(rs.getDate("jlfdjsj"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		hddjbz=cf.fillNull(rs.getString("hddjbz"));
		hddj=cf.fillNull(rs.getString("hddj"));
		jhddjsj=cf.fillNull(rs.getDate("jhddjsj"));
		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));
		spzkl=rs.getDouble("spzkl");
		zjxzkl=rs.getDouble("zjxzkl");
		sfpzqtyh=cf.fillNull(rs.getString("sfpzqtyh"));
		pzqtyhnr=cf.fillNull(rs.getString("pzqtyhnr"));

		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		dzbjze=cf.fillNull(rs.getString("dzbjze"));
		khfwjlh=cf.fillNull(rs.getString("khfwjlh"));
		sjsjdjlh=cf.fillNull(rs.getString("sjsjdjlh"));
		dmjdjlh=cf.fillNull(rs.getString("dmjdjlh"));
		louhao=cf.fillNull(rs.getString("louhao"));
		sbsj=cf.fillNull(rs.getDate("sbsj"));
		sbyyxs=cf.fillNull(rs.getString("sbyyxs"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		sjsfpsj=cf.fillNull(rs.getDate("sjsfpsj"));
		jhjfsj=cf.fillNull(rs.getDate("jhjfsj"));
		hdr=cf.fillNull(rs.getString("hdr"));
		zxdmfpsj=cf.fillNull(rs.getDate("zxdmfpsj"));

		lfbz=cf.fillNull(rs.getString("lfbz"));
		ctbz=cf.fillNull(rs.getString("ctbz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		xjf=cf.fillNull(rs.getString("xjf"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		yzxxbz=cf.fillNull(rs.getString("yzxxbz"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		zxhfsj=cf.fillNull(rs.getDate("zxhfsj"));
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		lfsj=cf.fillNull(rs.getDate("lfsj"));
		ctsj=cf.fillNull(rs.getDate("ctsj"));
		shbz=cf.fillNull(rs.getString("shbz"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shr=cf.fillNull(rs.getString("shr"));
		qdsj=cf.fillNull(rs.getDate("qdsj"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		scbkhbh=cf.fillNull(rs.getString("scbkhbh"));
	}
	rs.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		jzsjs+="、"+rs.getString("sjs");
	}
	rs.close();

	ls_sql="select xxlymc";
	ls_sql+=" from  crm_khxxly,dm_xxlybm";
	ls_sql+=" where crm_khxxly.xxlybm=dm_xxlybm.xxlybm and crm_khxxly.khbh='"+khbh+"' and crm_khxxly.khlx='2'";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		xxly+=cf.fillNull(rs.getString("xxlymc"))+"、";
	}
	rs.close();

	ls_sql="select qdhdzk,glfzk,zjxhdzk";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qdhdzk=rs.getDouble("qdhdzk");
		glfzk=rs.getDouble("glfzk");
		zjxhdzk=rs.getDouble("zjxhdzk");
	}
	rs.close();

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
</head>

<body bgcolor="#FFFFFF">
<div align="center">咨询客户信息</div> 
<div align="center">
  <input type="button" value="咨询回访" onClick="window.open('ViewZxhf.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input type="button" value="设计师咨询" onClick="window.open('ViewSjszx.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input type="button" value="样板间参观申请" onClick="window.open('ViewYbj_cgsq.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input name="button6" type="button" onClick="window.open('/dhzx/dhzx/ViewYx_lqlpdj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="领取礼品">
  <input type="button" value="付款情况" onClick="window.open('ViewCrm_jdjdj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_zxkhfwjl.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="客户服务记录">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_sjsjdjl.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="设计师接单记录">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_dmjdjl.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="店面接单记录">
  <BR>
  <input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="电子报价">
  <input type="button" onClick="window.open('ViewGlfx.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="工料分析">
  <input type="button" onClick="window.open('ViewYltj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="用料统计">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewFjxx.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="房间信息">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewBjxm.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="报价项目">
  <input type="button" onClick="window.open('/dzbj/zxbjmx/ViewHbzbBj_fjxx.jsp?khbh=<%=khbh%>')"  value="环保指标">
  <input type="button" onClick="window.open('/dhzx/dhzx/YyCpddCxList.jsp?khbh=<%=khbh%>')" value="产品订单">
  <input name="button" type="button" onClick="window.open('/dhzx/sjszx/dybj.jsp?khbh=<%=khbh%>')"  value="打印报价"   />
  <input name="button22" type="button" onClick="window.open('/dzbj/zxbjmx/ViewBj_khgcxmxj.jsp?khbh=<%=khbh%>')"  value="套餐－工程项目小计">
</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      咨询状态    </td>
    <td width="29%"> <%
	cf.selectToken(out,"0+未分配店面&1+分配店面&2+店面退回客户&3+已签约&4+公司签单失败&5+重新分配店面",zxzt,true);
%></td>
    <td width="29%" align="right"> 
      客户编号    </td>
    <td width="29%"><%=khbh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" bgcolor="#CCCCFF"> 
      <font color="#FF0000">*</font><b>客户姓名</b>    </td>
    <td width="29%"><%=khxm%>（<%cf.radioToken(out, "M+男&W+女",xb,true);%>）</td>
    <td width="29%" align="right"> 
      <font color="#FF0000">*</font><b><font color="#0000FF">首次录入客户姓名</font></b>    </td>
    <td width="29%"><%=lrkhxm%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"><font color="#FF0000">*</font><b>电话</b></td>
    <td width="29%"> 
      <input type="button" value="查看电话" onClick="window.open('ViewZxDh.jsp?khbh=<%=khbh%>')">    </td>
    <td width="29%" align="right">电子邮件</td>
    <td width="29%"><%=email%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"><font color="#FF0000">*</font><b>房屋地址</b></td>
    <td width="29%" bgcolor="#CCCCFF"><%=fwdz%></td>
    <td width="29%" align="right"><font color="#FF0000">*</font><b><font color="#0000FF">首次录入房屋地址</font></b></td>
    <td width="29%"><%=lrfwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF">客户所属分公司</td>
    <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%></td>
    <td align="right" bgcolor="#CCCCFF">咨询店面</td>
    <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",zxdm,true);
%>
      ：
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
	%>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF">设计师</td>
    <td bgcolor="#CCCCFF"><%=sjs%><%=jzsjs%></td>
    <td align="right" bgcolor="#CCCCFF">业务员</td>
    <td bgcolor="#CCCCFF"><%=ywy%>（市场部客户编号:<%=scbkhbh%>） </td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF">客户经理</td>
    <td bgcolor="#CCCCFF"><%=khjl%></td>
    <td align="right" bgcolor="#CCCCFF">&nbsp;</td>
    <td bgcolor="#CCCCFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">预算员</td>
    <td><%=ysy%></td>
    <td align="right">绘图员</td>
    <td><%=hty%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">材料顾问</td>
    <td><%=clgw%></td>
    <td align="right">质检</td>
    <td><%=zjxm%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">施工队</td>
    <td><%=sgdmc%></td>
    <td align="right">班长</td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">会员卡号</td>
    <td><%=hyh%></td>
    <td align="right">客户洽谈登记表编号</td>
    <td><%=djbbh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">有效通信地址</td>
    <td><%=yxtxdz%></td>
    <td align="right">客户资源性质</td>
    <td><%=khzyxz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">购买意向</td>
    <td colspan="3"><%=gmyx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">样板间意向</td>
    <td colspan="3"><%=ybjyx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">最中意的实体样板间</td>
    <td><%=zzystybj%></td>
    <td align="right">最中意的独立隔间</td>
    <td><%=zzydlgj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">信息来源</td>
    <td colspan="3"><%=xxly%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">信息来源说明</td>
    <td colspan="3"><%=xxlysm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">有效信息标志</td>
    <td width="29%"><%
	cf.selectToken(out,"Y+有效信息&N+无效信息",yzxxbz,true);
%></td>
    <td width="29%" align="right">家装标志</td>
    <td width="29%"><%
	cf.selectToken(out,"1+家装&2+公装",jzbz,true);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">定金促销</td>
    <td colspan="3"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">折扣赠品</td>
    <td colspan="3"><%=cxhdbmxq%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" height="19">特殊申请</td>
    <td colspan="3" height="19"><%=cxhdbmzh%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">套餐名称</td>
    <td><%=tcmc%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><b>*</b></font><strong>签设计合同标志</strong></td>
    <td><%
	cf.selectToken(out,"N+未签&Y+签合同",qsjhtbz,true);
%></td>
    <td align="right">合同号</td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">签设计合同时间</td>
    <td><%=qsjhtsj%></td>
    <td align="right">设计合同金额</td>
    <td><%=sjhtje%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"><font color="#FF0000"><b>*</b></font><b>是否做电子报价</b></td>
    <td width="29%"><%
	cf.selectToken(out,"N+未做&Y+已做",sfzdzbj,true);
%></td>
    <td width="29%" align="right">计划做电子报价时间</td>
    <td width="29%"><%=jhzbjsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right" bgcolor="#FFFFCC">报价级别</td>
    <td width="29%"><%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%> </td>
    <td width="29%" align="right">电子报价总额</td>
    <td width="29%"><%=dzbjze%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">电子报价版本号</td>
    <td colspan="3"><%=bjbbh%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">首次做电子报价时间</td>
    <td><%=sczbjsj%></td>
    <td align="right">最近做电子报价时间</td>
    <td><%=zjzbjsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"><font color="#FF0000"><b>*</b></font><b>家装订金标志</b></td>
    <td width="29%"><%=lfdjbz%></td>
    <td width="29%" align="right">家装订金</td>
    <td width="29%"><%=lfdj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">交家装订金时间</td>
    <td width="29%"><%=jlfdjsj%></td>
    <td width="29%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"><font color="#FF0000"><b>*</b></font><b>套餐意向订金标志</b></td>
    <td width="29%"><%=hddjbz%></td>
    <td width="29%" align="right">套餐意向订金</td>
    <td width="29%"><%=hddj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">交套餐意向订金时间</td>
    <td width="29%"><%=jhddjsj%></td>
    <td width="29%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"><font color="#FF0000"><b>*</b></font><b>设计费标志</b></td>
    <td width="29%"><%=sjfbz%></td>
    <td width="29%" align="right">设计费</td>
    <td width="29%"><%=sjf%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">交设计费时间</td>
    <td width="29%"><%=jsjfsj%></td>
    <td width="29%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"> 量房标志 </td>
    <td><%
	cf.selectToken(out,"N+未量房&Y+已量房",lfbz,true);
%>    </td>
    <td align="right"> 量房时间 </td>
    <td><%=lfsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"> 出平面图标志 </td>
    <td><%
	cf.selectToken(out,"N+未出图&Y+已出图",ctbz,true);
%>    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">计划出平面图时间</td>
    <td><%=jhctsj%></td>
    <td align="right">出平面图时间</td>
    <td><%=ctsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">出效果图标志</td>
    <td><%
	cf.selectToken(out,"N+未出图&Y+已出图",cxgtbz,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">计划出效果图时间</td>
    <td><%=jhcxgtsj%></td>
    <td align="right">出效果图时间</td>
    <td><%=cxgtsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">出施工图标志</td>
    <td><%
	cf.selectToken(out,"N+未出图&Y+已出图",csgtbz,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#CCFFCC">计划出施工图时间</td>
    <td bgcolor="#CCFFCC"><%=jhcsgtsj%></td>
    <td align="right" bgcolor="#CCFFCC">出施工图时间</td>
    <td bgcolor="#CCFFCC"><%=csgtsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#CCFFCC"> 预算审核标志 </td>
    <td bgcolor="#CCFFCC"><%
	cf.selectToken(out,"N+未申请&B+申请审核&C+受理申请&Y+审核通过&M+审核未通过&S+修改方案授权",ysshbz,true);
%>    </td>
    <td align="right" bgcolor="#CCFFCC">预算审核得分</td>
    <td bgcolor="#CCFFCC"><%=ysshdf%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"> 预算审核人 </td>
    <td><%=ysshr%> </td>
    <td align="right">预算审核时间</td>
    <td><%=ysshsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">预算审核意见</td>
    <td colspan="3"><%=ysshyj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#FFFFCC"> 信息审核标志 </td>
    <td bgcolor="#FFFFCC"><%
	cf.selectToken(out,"N+未审核&Y+已审核",shbz,true);
%>    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"> 信息审核人 </td>
    <td><%=shr%> </td>
    <td align="right">信息审核时间</td>
    <td><%=shsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      是否需回访    </td>
    <td width="29%"><%
	cf.selectToken(out,"Y+需回访&N+不需回访",sfxhf,true);
%> </td>
    <td width="29%" align="right"> 
      回访日期    </td>
    <td width="29%"><%=hfrq%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      最新回访时间    </td>
    <td width="29%"> <%=zxhfsj%> </td>
    <td width="29%" align="right"> 
      回访记录号    </td>
    <td width="29%"> <%=hfjlh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      关系客户    </td>
    <td width="29%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
    <td width="29%" align="right"> 
      所属城区    </td>
    <td width="29%"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      小区/街道    </td>
    <td width="29%"><%=xqbm%> </td>
    <td width="29%" align="right" bgcolor="#CCCCFF"> 
      楼号/门牌号    </td>
    <td width="29%"><%=louhao%> </td>
  </tr>
  <tr> 
    <td width="21%" bgcolor="#CCCCFF" align="right">热点地区</td>
    <td width="29%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where rddqbm='"+rddqbm+"'",rddqbm,true);
%> </td>
    <td width="29%" bgcolor="#CCCCFF" align="right">环线位置</td>
    <td width="29%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where hxwzbm='"+hxwzbm+"'",hxwzbm,true);
%> </td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">所属行业</td>
    <td><%
	cf.selectItem(out,"select sshybm,sshymc from dm_sshybm order by sshybm",sshybm,true);
%></td>
    <td align="right">职业</td>
    <td><%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm,true);
%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="21%" align="right"> 
      新/旧房    </td>
    <td width="29%"> <%=xjf%>  </td>
    <td width="29%" align="right"> 
      年龄区间    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="21%" align="right" bgcolor="#CCFFCC"> 
      月收入    </td>
    <td width="29%" bgcolor="#CCFFCC"><%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm where ysrbm='"+ysrbm+"'",ysrbm,true);
%> </td>
    <td width="29%" align="right"> 
      房价    </td>
    <td width="29%"> <%=fj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">计划交房时间</td>
    <td width="29%"><%=jhjfsj%></td>
    <td width="29%" align="right">预计装修时间</td>
    <td width="29%"><%=yjzxsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      装修预算    </td>
    <td width="29%"><%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm,true);
%> </td>
    <td width="29%" align="right"> 
      房屋类型    </td>
    <td width="29%"><%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      户型    </td>
    <td width="29%"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
    <td width="29%" align="right"> 
      套内建筑面积    </td>
    <td width="29%"><%=fwmj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      风格要求    </td>
    <td width="29%"><%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm,true);
%> </td>
    <td width="29%" align="right"> 
      回单是否属实    </td>
    <td width="29%"><%
	cf.selectToken(out,"0+未核实&Y+属实&N+不属实",hdsfss,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      回单标志    </td>
    <td width="29%" bgcolor="#FFFFFF"> <%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz,true);
%> </td>
    <td width="29%" align="right"> 
      回单人    </td>
    <td width="29%"><%=hdr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      回单装修地址    </td>
    <td colspan="3"><%=cgdz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"> 
      咨询店面分配时间    </td>
    <td width="29%" bgcolor="#FFFFCC"><%=zxdmfpsj%> </td>
    <td width="29%" align="right"> 
      设计师分配时间    </td>
    <td width="29%"><%=sjsfpsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right" bgcolor="#FFFFCC"> 
      失败原因    </td>
    <td width="29%"><%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm",sbyybm,true);
%> </td>
    <td width="29%" align="right"> 
      失败时间    </td>
    <td width="29%"><%=sbsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">失败原因详述</td>
    <td colspan="3"><%=sbyyxs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      咨询登记部门    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
%> </td>
    <td width="29%" align="right"> 
      签单时间    </td>
    <td width="29%"><%=qdsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      录入时间    </td>
    <td width="29%"> <%=lrsj%> </td>
    <td width="29%" align="right"> 
      信息录入人    </td>
    <td width="29%"><%=lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">报价打印授权</td>
    <td><%=bjdysq%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">报价打印授权时间</td>
    <td><%=bjdysqsj%></td>
    <td align="right">报价打印授权人</td>
    <td><%=bjdysqr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">客户服务记录号</td>
    <td width="29%"><%=khfwjlh%></td>
    <td width="29%" align="right">设计师接单记录号</td>
    <td width="29%"><%=sjsjdjlh%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">店面接单记录号</td>
    <td width="29%"><%=dmjdjlh%> </td>
    <td width="29%" align="right">是否集成客户</td>
    <td width="29%"><%cf.radioToken(out, "1+是&2+否",sfjczjz,true);%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td bgcolor="#FFFFFF" align="right">备注</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"><font color="#990033"><strong>折扣类型</strong></font></td>
    <td><%
	cf.selectToken(out,"1+全额折扣&2+单项折扣",zklx,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"><font color="#990033"><strong>合同折扣</strong></font></td>
    <td><%=spzkl%></td>
    <td align="right"><font color="#990033"><strong>增减项折扣</strong></font></td>
    <td><%=zjxzkl%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"><strong><font color="#990033">是否批准其它优惠</font></strong></td>
    <td colspan="3"><%
	cf.selectToken(out,"Y+是&N+否",sfpzqtyh,true);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"><font color="#990033"><strong>批准其它优惠内容</strong></font></td>
    <td colspan="3"><%=pzqtyhnr%> </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td colspan="4" align="center"><strong>促销活动折扣</strong></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"><font color="#0000CC"><strong>签单折扣</strong></font></td>
    <td><%=qdhdzk%></td>
    <td align="right"><strong><font color="#0000CC">管理费折扣</font></strong></td>
    <td><%=glfzk%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"><font color="#0000CC"><strong>增减项折扣</strong></font></td>
    <td><%=zjxhdzk%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<%
	if (ckjgbz.equals("Y"))
	{
		%>
		<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		 <tr bgcolor="#CCCCCC"  align="center">
			<td  width="9%">收费项目</td>
			<td  width="8%">收费计算方式</td>
			<td  width="4%">百分比</td>
			<td  width="4%">计量单位</td>
			<td  width="4%">数量</td>
			<td  width="5%">单价</td>
			<td  width="6%">折前金额</td>
			<td  width="3%">单项折扣</td>
			<td  width="3%">活动折扣</td>
			<td  width="6%">折后金额</td>
			<td  width="4%">记入签约额</td>
			<td  width="4%">记入税金</td>
			<td  width="4%">记入管理费</td>
			<td  width="4%">是否可打折</td>
			<td  width="3%">最低折扣</td>
			<td  width="5%">收费项目类型</td>
			<td  width="4%">施工队结算</td>
			<td  width="20%">备注</td>
		</tr>

		<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT sfxmmc,DECODE(bj_sfxmmx.sflx,'1','工程直接费百分比','2','固定金额(可改)','3','税金（按折扣计算折后税）','8','税金（按基数计算折后税）','4','固定金额(不可改)','5','管理费','6','主材费百分比','7','工程加主材费百分比') sflx ";
		ls_sql+=" ,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,TO_CHAR(bj_sfxmmx.cxhdzkl) cxhdzkl,bj_sfxmmx.sfje ";
		ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'2','记入','1','<font color=\"#FF0000\"><B>不记入</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','不可打','Y','可打') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(bj_sfxmmx.sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','4','间接主材费','5','管理费','6','税金','9','其它') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','否','Y','是') sfcysgdjs,bj_sfxmmx.bz";
		ls_sql+=" FROM bj_sfxmmx  ";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
		ls_sql+=" order by bj_sfxmmx.sfxmbm";

		pageObj.sql=ls_sql;
	//进行对象初始化
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数

		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDateSum();

		%>
		</table>
		<%
	}
%>
 

<%
	if (ckjgbz.equals("Y"))
	{
		%>
		<table border="1" width="50%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		 <tr bgcolor="#CCCCCC"  align="center">
			<td  width="60%">业绩系数名称</td>
			<td  width="40%">促销活动业绩系数</td>
		</tr>
		<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_cxhdyjxsbm.yjxsmc,crm_cxhdyjxs.yjxs";
		ls_sql+=" FROM crm_cxhdyjxs,jc_cxhdyjxsbm  ";
		ls_sql+=" where crm_cxhdyjxs.yjxsbm=jc_cxhdyjxsbm.yjxsbm and crm_cxhdyjxs.khbh='"+khbh+"'";
		ls_sql+=" order by crm_cxhdyjxs.yjxsbm";

		pageObj.sql=ls_sql;
	//进行对象初始化
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数

		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();

		%>
		</table>
		<%
	}
%>
 

</body>
</html>
