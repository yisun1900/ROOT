<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>


<%
	String wheresql="";
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_pmjj=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_jcjjqye=null;
	String crm_khxx_sfyyh=null;
	String crm_khxx_yhyy=null;
	String crm_khxx_zkl=null;
	String crm_khxx_fzxm=null;
	String crm_khxx_sffj=null;
	String crm_khxx_sfyrz=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_kgrq=null;
	String crm_khxx_sjkgrq=null;
	String crm_khxx_fkjd=null;
	String crm_khxx_skje=null;
	String crm_khxx_skrq=null;
	String crm_khxx_zkje=null;
	String crm_khxx_zkrq=null;
	String crm_khxx_sjzkrq=null;
	String crm_khxx_jgrq=null;
	String crm_khxx_sjjgrq=null;
	String crm_khxx_jhtrq=null;
	String crm_khxx_bxjzsj=null;
	String crm_khxx_zxje=null;
	String crm_khxx_jxje=null;
	String crm_khxx_wkje=null;
	String crm_khxx_jsje=null;
	String crm_khxx_sdjsje=null;
	String crm_khxx_gcjdbm=null;
	String crm_khxx_wgbz=null;
	String ybysxmbm=null;
	String zqysxmbm=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_pdlx=null;
	String crm_khxx_zpsgd=null;
	String crm_khxx_zpyy=null;
	String crm_khxx_pdclzt=null;
	String crm_khxx_pdsj=null;
	String crm_khxx_pdr=null;
	String zzsgd=null;
	String crm_khxx_sgd=null;
	String cxbz=null;
	String crm_khxx_sgbz=null;
	String crm_khxx_pdsm=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_zxhfsj=null;
	String crm_khxx_hfjlh=null;
	String crm_khxx_sfxhf=null;
	String crm_khxx_hfrq=null;
	String crm_khxx_hflxbm=null;
	String crm_khxx_ybjbz=null;
	String crm_khxx_ybjyxq=null;
	String crm_khxx_ybjdjsj=null;
	String crm_khxx_hdbz=null;
	String crm_khxx_cgdz=null;
	String crm_khxx_hdsgd=null;
	String crm_khxx_hdsgbz=null;
	String crm_khxx_hdsjs=null;
	String crm_khxx_zt=null;
	String crm_khxx_khlxbm=null;
	String crm_khxx_xxlybm=null;
	String crm_khxx_tsbz=null;
	String crm_khxx_tsjlh=null;
	String crm_khxx_bxbz=null;
	String crm_khxx_bxjlh=null;
	String crm_khxx_tdxh=null;
	String crm_khxx_ybjbh=null;
	String crm_khxx_ybjss=null;
	String crm_khxx_hdsfss=null;
	String crm_khxx_kpbz=null;
	String crm_khxx_jlbz=null;
	String crm_khxx_zxkhbh=null;
	String crm_khxx_djbh=null;



	String crm_khxx_fwmj=null;
	crm_khxx_fwmj=request.getParameter("crm_khxx_fwmj");
	if (crm_khxx_fwmj!=null)
	{
		if (!(crm_khxx_fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj>="+crm_khxx_fwmj+") ";
	}
	crm_khxx_fwmj=request.getParameter("crm_khxx_fwmj2");
	if (crm_khxx_fwmj!=null)
	{
		if (!(crm_khxx_fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj<="+crm_khxx_fwmj+") ";
	}


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	

	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}

	crm_khxx_pmjj=request.getParameter("crm_khxx_pmjj");
	if (crm_khxx_pmjj!=null)
	{
		crm_khxx_pmjj=crm_khxx_pmjj.trim();
		if (!(crm_khxx_pmjj.equals("")))	wheresql+=" and (crm_khxx.pmjj="+crm_khxx_pmjj+") ";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+crm_khxx_qye+") ";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye2");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+crm_khxx_qye+") ";
	}
	crm_khxx_jcjjqye=request.getParameter("crm_khxx_jcjjqye");
	if (crm_khxx_jcjjqye!=null)
	{
		crm_khxx_jcjjqye=crm_khxx_jcjjqye.trim();
		if (!(crm_khxx_jcjjqye.equals("")))	wheresql+=" and  (crm_khxx.jcjjqye="+crm_khxx_jcjjqye+") ";
	}
	crm_khxx_sfyyh=request.getParameter("crm_khxx_sfyyh");
	if (crm_khxx_sfyyh!=null)
	{
		crm_khxx_sfyyh=cf.GB2Uni(crm_khxx_sfyyh);
		if (!(crm_khxx_sfyyh.equals("")))	wheresql+=" and  (crm_khxx.sfyyh='"+crm_khxx_sfyyh+"')";
	}
	crm_khxx_yhyy=request.getParameter("crm_khxx_yhyy");
	if (crm_khxx_yhyy!=null)
	{
		crm_khxx_yhyy=cf.GB2Uni(crm_khxx_yhyy);
		if (!(crm_khxx_yhyy.equals("")))	wheresql+=" and  (crm_khxx.yhyy='"+crm_khxx_yhyy+"')";
	}
	crm_khxx_zkl=request.getParameter("crm_khxx_zkl");
	if (crm_khxx_zkl!=null)
	{
		crm_khxx_zkl=crm_khxx_zkl.trim();
		if (!(crm_khxx_zkl.equals("")))	wheresql+=" and  (crm_khxx.zkl>="+crm_khxx_zkl+") ";
	}
	crm_khxx_zkl=request.getParameter("crm_khxx_zkl2");
	if (crm_khxx_zkl!=null)
	{
		crm_khxx_zkl=crm_khxx_zkl.trim();
		if (!(crm_khxx_zkl.equals("")))	wheresql+=" and  (crm_khxx.zkl<="+crm_khxx_zkl+") ";
	}
	crm_khxx_fzxm=request.getParameter("crm_khxx_fzxm");
	if (crm_khxx_fzxm!=null)
	{
		crm_khxx_fzxm=cf.GB2Uni(crm_khxx_fzxm);
		if (!(crm_khxx_fzxm.equals("")))	wheresql+=" and  (crm_khxx.fzxm='"+crm_khxx_fzxm+"')";
	}
	crm_khxx_sffj=request.getParameter("crm_khxx_sffj");
	if (crm_khxx_sffj!=null)
	{
		crm_khxx_sffj=cf.GB2Uni(crm_khxx_sffj);
		if (!(crm_khxx_sffj.equals("")))	wheresql+=" and  (crm_khxx.sffj='"+crm_khxx_sffj+"')";
	}
	crm_khxx_sfyrz=request.getParameter("crm_khxx_sfyrz");
	if (crm_khxx_sfyrz!=null)
	{
		crm_khxx_sfyrz=cf.GB2Uni(crm_khxx_sfyrz);
		if (!(crm_khxx_sfyrz.equals("")))	wheresql+=" and  (crm_khxx.sfyrz='"+crm_khxx_sfyrz+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+crm_khxx_kgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq2");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+crm_khxx_kgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq>=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq2");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq<=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_fkjd=request.getParameter("crm_khxx_fkjd");
	if (crm_khxx_fkjd!=null)
	{
		crm_khxx_fkjd=cf.GB2Uni(crm_khxx_fkjd);
		if (!(crm_khxx_fkjd.equals("")))	wheresql+=" and  (crm_khxx.fkjd='"+crm_khxx_fkjd+"')";
	}
	crm_khxx_skje=request.getParameter("crm_khxx_skje");
	if (crm_khxx_skje!=null)
	{
		crm_khxx_skje=crm_khxx_skje.trim();
		if (!(crm_khxx_skje.equals("")))	wheresql+=" and  (crm_khxx.skje="+crm_khxx_skje+") ";
	}
	crm_khxx_skrq=request.getParameter("crm_khxx_skrq");
	if (crm_khxx_skrq!=null)
	{
		crm_khxx_skrq=crm_khxx_skrq.trim();
		if (!(crm_khxx_skrq.equals("")))	wheresql+="  and (crm_khxx.skrq=TO_DATE('"+crm_khxx_skrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_zkje=request.getParameter("crm_khxx_zkje");
	if (crm_khxx_zkje!=null)
	{
		crm_khxx_zkje=crm_khxx_zkje.trim();
		if (!(crm_khxx_zkje.equals("")))	wheresql+=" and  (crm_khxx.zkje="+crm_khxx_zkje+") ";
	}





	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	crm_khxx_zpsgd=request.getParameter("crm_khxx_zpsgd");
	if (crm_khxx_zpsgd!=null)
	{
		crm_khxx_zpsgd=cf.GB2Uni(crm_khxx_zpsgd);
		if (!(crm_khxx_zpsgd.equals("")))	wheresql+=" and  (crm_khxx.zpsgd='"+crm_khxx_zpsgd+"')";
	}
	crm_khxx_zpyy=request.getParameter("crm_khxx_zpyy");
	if (crm_khxx_zpyy!=null)
	{
		crm_khxx_zpyy=cf.GB2Uni(crm_khxx_zpyy);
		if (!(crm_khxx_zpyy.equals("")))	wheresql+=" and  (crm_khxx.zpyy='"+crm_khxx_zpyy+"')";
	}
	crm_khxx_pdclzt=request.getParameter("crm_khxx_pdclzt");
	if (crm_khxx_pdclzt!=null)
	{
		crm_khxx_pdclzt=cf.GB2Uni(crm_khxx_pdclzt);
		if (!(crm_khxx_pdclzt.equals("")))	wheresql+=" and  (crm_khxx.pdclzt='"+crm_khxx_pdclzt+"')";
	}

	zzsgd=request.getParameter("zzsgd");
	if (zzsgd!=null)
	{
		if (!(zzsgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+zzsgd+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	cxbz=request.getParameter("cxbz");
	if (cxbz!=null)
	{
		if (!(cxbz.equals("")))	wheresql+=" and  (sq_sgd.cxbz='"+cxbz+"')";
	}
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}



	crm_khxx_zt=request.getParameter("crm_khxx_zt");
	if (crm_khxx_zt!=null)
	{
		crm_khxx_zt=cf.GB2Uni(crm_khxx_zt);
		if (!(crm_khxx_zt.equals("")))	wheresql+=" and  (crm_khxx.zt='"+crm_khxx_zt+"')";
	}






	String bj_bjxmmx_xmbh=null;
	String bj_bjxmmx_xmmc=null;
	String bj_bjxmmx_jgwzbm=null;
	String bj_bjxmmx_bjjb=null;
	String bj_bjxmmx_dqbm=null;
	String[] bj_bjxmmx_xmdlbm=null;
	String[] bj_bjxmmx_xmxlbm=null;
	String bj_bjxmmx_smbm=null;
	bj_bjxmmx_xmbh=request.getParameter("bj_bjxmmx_xmbh");
	if (bj_bjxmmx_xmbh!=null)
	{
		bj_bjxmmx_xmbh=cf.GB2Uni(bj_bjxmmx_xmbh);
		if (!(bj_bjxmmx_xmbh.equals("")))	wheresql+=" and  (bj_bjxmmx.xmbh='"+bj_bjxmmx_xmbh+"')";
	}
	bj_bjxmmx_xmmc=request.getParameter("bj_bjxmmx_xmmc");
	if (bj_bjxmmx_xmmc!=null)
	{
		bj_bjxmmx_xmmc=cf.GB2Uni(bj_bjxmmx_xmmc);
		if (!(bj_bjxmmx_xmmc.equals("")))	wheresql+=" and  (bj_bjxmmx.xmmc='"+bj_bjxmmx_xmmc+"')";
	}
	bj_bjxmmx_jgwzbm=request.getParameter("bj_bjxmmx_jgwzbm");
	if (bj_bjxmmx_jgwzbm!=null)
	{
		bj_bjxmmx_jgwzbm=cf.GB2Uni(bj_bjxmmx_jgwzbm);
		if (!(bj_bjxmmx_jgwzbm.equals("")))	wheresql+=" and  (bj_bjxmmx.jgwzbm='"+bj_bjxmmx_jgwzbm+"')";
	}
	bj_bjxmmx_bjjb=request.getParameter("bj_bjxmmx_bjjb");
	if (bj_bjxmmx_bjjb!=null)
	{
		bj_bjxmmx_bjjb=cf.GB2Uni(bj_bjxmmx_bjjb);
		if (!(bj_bjxmmx_bjjb.equals("")))	wheresql+=" and  (bj_bjxmmx.bjjb='"+bj_bjxmmx_bjjb+"')";
	}

	bj_bjxmmx_dqbm=request.getParameter("bj_bjxmmx_dqbm");
	if (!(bj_bjxmmx_dqbm.equals("")))	wheresql+=" and  (bj_bjxmmx.dqbm='"+bj_bjxmmx_dqbm+"')";

	bj_bjxmmx_xmdlbm=request.getParameterValues("bj_bjxmmx_xmdlbm");
	if (bj_bjxmmx_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_bjxmmx_xmdlbm,"bj_bjxmmx.xmdlbm");
	}
	bj_bjxmmx_xmxlbm=request.getParameterValues("bj_bjxmmx_xmxlbm");
	if (bj_bjxmmx_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_bjxmmx_xmxlbm,"bj_bjxmmx.xmxlbm");
	}
	bj_bjxmmx_smbm=request.getParameter("bj_bjxmmx_smbm");
	if (bj_bjxmmx_smbm!=null)
	{
		bj_bjxmmx_smbm=cf.GB2Uni(bj_bjxmmx_smbm);
		if (!(bj_bjxmmx_smbm.equals("")))	wheresql+=" and  (bj_bjxmmx.smbm='"+bj_bjxmmx_smbm+"')";
	}

%>


<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=1;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allxhl=0;
double allclf=0;
double xjxhl=0;
double xjclf=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String dqbm=null;

double clfbfb=0;//电子报价中无工料分析，默认材料费百分比


try {
	conn=cf.getConnection();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='clfbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clfbfb=rs.getDouble("csz");
	}
	else{
		out.println("错误！在表sq_xtcsb中无默认材料费百分比");
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>用料统计</b> </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="5%" >序号</td>
    <td  width="9%" >分类</td>
    <td  width="19%" >工料名称</td>
    <td  width="10%" >品牌</td>
    <td  width="10%" >型号规格</td>
    <td  width="10%" >工程量</td>
    <td  width="8%" >单位</td>
    <td  width="8%" >材料单价</td>
    <td  width="10%" >消耗量</td>
    <td  width="11%" >材料费</td>
  </tr>

<%
	int i=0;


	//输出项目明细

		String glflbm=null;
		String glflmc=null;
		String glbxh=null;
		String glmc=null;
		String jldwbm=null;
		String xhgg=null;
		String pp=null;
		double cldj=0;
		double xhl=0;


		double clf=0;

		xjxhl=0;
		xjclf=0;

		ls_sql="SELECT bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj,sum(bj_khglfxb.xhl*bj_gclmx.sl) xhl,sum(bj_khglfxb.xhl*bj_gclmx.sl*bj_khglfxb.dj) clf ";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb,bj_gclmx,crm_khxx  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.cljldwbm(+)";
		ls_sql+=" and bj_gclmx.khbh=crm_khxx.khbh and crm_khxx.jzbz='1'";
		ls_sql+=wheresql;
		ls_sql+=" and bj_khglfxb.glflbm='1'";
		ls_sql+=" and bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm and bj_gclmx.xmbh=bj_khglfxb.xmbh ";
		ls_sql+=" group by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
		ls_sql+=" order by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			glflbm=cf.fillNull(rs1.getString("glflbm"));
			glflmc=cf.fillHtml(rs1.getString("glflmc"));
			glmc=cf.fillNull(rs1.getString("glmc"));
			jldwbm=cf.fillNull(rs1.getString("jldwbm"));
			jldwmc=cf.fillHtml(rs1.getString("jldwmc"));

			xhgg=rs1.getString("xhgg");
			pp=rs1.getString("pp");
			cldj=rs1.getDouble("dj");
			xhl=rs1.getDouble("xhl");
			clf=rs1.getDouble("clf");

			sl=0;
			ls_sql="SELECT sum(bj_gclmx.sl)";
			ls_sql+=" FROM bj_khglfxb,bj_gclmx  ";
			ls_sql+=" where bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm ";
			ls_sql+=" and bj_khglfxb.glflbm='"+glflbm+"'  and bj_khglfxb.glmc='"+glmc+"' ";
			ls_sql+=" and bj_khglfxb.jldwbm='"+jldwbm+"'  and bj_khglfxb.dj="+cldj;
			if (xhgg==null && pp==null)
			{
				ls_sql+=" and bj_khglfxb.xhgg is null  and bj_khglfxb.pp is null ";
			}
			else if (xhgg==null && pp!=null)
			{
				ls_sql+=" and bj_khglfxb.xhgg is null  and bj_khglfxb.pp='"+pp+"' ";
			}
			else if (xhgg!=null && pp==null)
			{
				ls_sql+=" and bj_khglfxb.xhgg='"+xhgg+"' and bj_khglfxb.pp is null ";
			}
			else{
				ls_sql+=" and bj_khglfxb.xhgg='"+xhgg+"'  and bj_khglfxb.pp='"+pp+"' ";
			}
	//		out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sl=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			allsl+=sl;
			allxhl+=xhl;
			allclf+=clf;
			xjxhl+=xhl;
			xjclf+=clf;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=glflmc%></td>
				<td><%=glmc%></td>
				<td><%=cf.fillHtml(pp)%></td>
				<td><%=cf.fillHtml(xhgg)%></td>
				<td ><%=cf.formatDouble(sl)%></td>
				<td><%=jldwmc%></td>
				<td><%=cldj%></td>
				<td><%=cf.formatDouble(xhl)%></td>
				<td><%=cf.formatDouble(clf)%></td>
			  </tr>
			<%
			row++;
		}
		rs1.close();
		ps1.close();

	//输出小计
	%> 
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>小  计</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjxhl,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
	  </tr>
	<%

		xjxhl=0;
		xjclf=0;

		ls_sql="SELECT bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj,sum(bj_khglfxb.xhl*bj_gclmx.sl) xhl,sum(bj_khglfxb.xhl*bj_gclmx.sl*bj_khglfxb.dj) clf ";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb,bj_gclmx,crm_khxx  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.cljldwbm(+)";
		ls_sql+=" and bj_gclmx.khbh=crm_khxx.khbh and crm_khxx.jzbz='1'";
		ls_sql+=wheresql;
		ls_sql+=" and bj_khglfxb.glflbm='2'";
		ls_sql+=" and bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm and bj_gclmx.xmbh=bj_khglfxb.xmbh ";
		ls_sql+=" group by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
		ls_sql+=" order by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			glflbm=cf.fillNull(rs1.getString("glflbm"));
			glflmc=cf.fillHtml(rs1.getString("glflmc"));
			glmc=cf.fillNull(rs1.getString("glmc"));
			jldwbm=cf.fillNull(rs1.getString("jldwbm"));
			jldwmc=cf.fillHtml(rs1.getString("jldwmc"));

			xhgg=rs1.getString("xhgg");
			pp=rs1.getString("pp");
			cldj=rs1.getDouble("dj");
			xhl=rs1.getDouble("xhl");
			clf=rs1.getDouble("clf");

			sl=0;
			ls_sql="SELECT sum(bj_gclmx.sl)";
			ls_sql+=" FROM bj_khglfxb,bj_gclmx  ";
			ls_sql+=" where bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm ";
			ls_sql+=" and bj_khglfxb.glflbm='"+glflbm+"'  and bj_khglfxb.glmc='"+glmc+"' ";
			ls_sql+=" and bj_khglfxb.jldwbm='"+jldwbm+"'  and bj_khglfxb.dj="+cldj;
			if (xhgg==null && pp==null)
			{
				ls_sql+=" and bj_khglfxb.xhgg is null  and bj_khglfxb.pp is null ";
			}
			else if (xhgg==null && pp!=null)
			{
				ls_sql+=" and bj_khglfxb.xhgg is null  and bj_khglfxb.pp='"+pp+"' ";
			}
			else if (xhgg!=null && pp==null)
			{
				ls_sql+=" and bj_khglfxb.xhgg='"+xhgg+"' and bj_khglfxb.pp is null ";
			}
			else{
				ls_sql+=" and bj_khglfxb.xhgg='"+xhgg+"'  and bj_khglfxb.pp='"+pp+"' ";
			}
	//		out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sl=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			allsl+=sl;
			allxhl+=xhl;
			allclf+=clf;
			xjxhl+=xhl;
			xjclf+=clf;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=glflmc%></td>
				<td><%=glmc%></td>
				<td><%=cf.fillHtml(pp)%></td>
				<td><%=cf.fillHtml(xhgg)%></td>
				<td ><%=cf.formatDouble(sl)%></td>
				<td><%=jldwmc%></td>
				<td><%=cldj%></td>
				<td><%=cf.formatDouble(xhl)%></td>
				<td><%=cf.formatDouble(clf)%></td>
			  </tr>
			<%
			row++;
		}
		rs1.close();
		ps1.close();

	//输出小计
	%> 
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>小  计</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjxhl,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
	  </tr>
	<%

		xjxhl=0;
		xjclf=0;

		ls_sql="SELECT bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj,sum(bj_khglfxb.xhl*bj_gclmx.sl) xhl,sum(bj_khglfxb.xhl*bj_gclmx.sl*bj_khglfxb.dj) clf ";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb,bj_gclmx,crm_khxx  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.cljldwbm(+)";
		ls_sql+=" and bj_gclmx.khbh=crm_khxx.khbh and crm_khxx.jzbz='1'";
		ls_sql+=wheresql;
		ls_sql+=" and bj_khglfxb.glflbm='3'";
		ls_sql+=" and bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm and bj_gclmx.xmbh=bj_khglfxb.xmbh ";
		ls_sql+=" group by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
		ls_sql+=" order by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			glflbm=cf.fillNull(rs1.getString("glflbm"));
			glflmc=cf.fillHtml(rs1.getString("glflmc"));
			glmc=cf.fillNull(rs1.getString("glmc"));
			jldwbm=cf.fillNull(rs1.getString("jldwbm"));
			jldwmc=cf.fillHtml(rs1.getString("jldwmc"));

			xhgg=rs1.getString("xhgg");
			pp=rs1.getString("pp");
			cldj=rs1.getDouble("dj");
			xhl=rs1.getDouble("xhl");
			clf=rs1.getDouble("clf");

			sl=0;
			ls_sql="SELECT sum(bj_gclmx.sl)";
			ls_sql+=" FROM bj_khglfxb,bj_gclmx  ";
			ls_sql+=" where bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm ";
			ls_sql+=" and bj_khglfxb.glflbm='"+glflbm+"'  and bj_khglfxb.glmc='"+glmc+"' ";
			ls_sql+=" and bj_khglfxb.jldwbm='"+jldwbm+"'  and bj_khglfxb.dj="+cldj;
			if (xhgg==null && pp==null)
			{
				ls_sql+=" and bj_khglfxb.xhgg is null  and bj_khglfxb.pp is null ";
			}
			else if (xhgg==null && pp!=null)
			{
				ls_sql+=" and bj_khglfxb.xhgg is null  and bj_khglfxb.pp='"+pp+"' ";
			}
			else if (xhgg!=null && pp==null)
			{
				ls_sql+=" and bj_khglfxb.xhgg='"+xhgg+"' and bj_khglfxb.pp is null ";
			}
			else{
				ls_sql+=" and bj_khglfxb.xhgg='"+xhgg+"'  and bj_khglfxb.pp='"+pp+"' ";
			}
	//		out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sl=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			allsl+=sl;
			allxhl+=xhl;
			allclf+=clf;
			xjxhl+=xhl;
			xjclf+=clf;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=glflmc%></td>
				<td><%=glmc%></td>
				<td><%=cf.fillHtml(pp)%></td>
				<td><%=cf.fillHtml(xhgg)%></td>
				<td ><%=cf.formatDouble(sl)%></td>
				<td><%=jldwmc%></td>
				<td><%=cldj%></td>
				<td><%=cf.formatDouble(xhl)%></td>
				<td><%=cf.formatDouble(clf)%></td>
			  </tr>
			<%
			row++;
		}
		rs1.close();
		ps1.close();

	//输出小计
	%> 
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>小  计</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjxhl,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
	  </tr>

	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="10"><B>无工料明细报价项目（计算比率：<%=clfbfb%>%）</B></td>
	  </tr>
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td >序号</td>
		<td>项目编号</td>
		<td>项目名称</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >工程量</td>
		<td >单位</td>
		<td >工程单价（元）</td>
		<td >工程金额（元）</td>
		<td >材料费</td>
	  </tr>
	<%


	//输出无工料


	row=1;
	xjqye=0;
	xjsl=0;
	xjclf=0;
	ls_sql="SELECT bj_bjxmmx.xh,bj_bjxmmx.dqbm,trim(bj_bjxmmx.xmbh)||DECODE(bj_bjxmmx.bjlx,'1','','2','增') xmbh,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,crm_khxx  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
    ls_sql+=" and bj_gclmx.khbh=crm_khxx.khbh and crm_khxx.jzbz='1'";
    ls_sql+=wheresql;
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_bjxmmx.dqbm not in(select dqbm from bj_khglfxb,crm_khxx where bj_khglfxb.khbh=crm_khxx.khbh "+wheresql+") ";
	ls_sql+=" group by bj_bjxmmx.xh,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.dj";
	ls_sql+=" order by bj_bjxmmx.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=cf.fillHtml(rs.getString("xh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillHtml(rs.getString("xmbh"));
		xmmc=cf.fillHtml(rs.getString("xmmc"));

		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		qye=rs.getDouble("je");


		clf=clfbfb*qye/100;
		xjsl+=sl;
		xjqye+=qye;
		xjclf+=clf;

		allclf+=clf;
		allsl+=sl;
		allqye+=qye;

		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=xmbh%></td>
			<td ><%=xmmc%></td>
			<td colspan='2'>&nbsp;</td>
			<td ><%=cf.formatDouble(sl)%></td>
			<td ><%=jldwmc%></td>
			<td ><%=dj%></td>
			<td ><%=cf.formatDouble(qye,"#########.##")%></td>
			<td><%=cf.formatDouble(clf)%></td>
		  </tr>
		<%

		row++;
	}
	rs.close();
	ps.close();


	//输出小计
	%> 
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>小  计</B></td>
		<td ><%=cf.formatDouble(xjsl,"#########.##")%></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjqye,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
	  </tr>
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>总  计</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(allclf,"#########.##")%></td>
	  </tr>
	
</table>
<br>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>