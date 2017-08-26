<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}


	String ls_sql=null;
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


	ls_sql="SELECT xmdlmc,xmxlmc,bj_bjxmmx.xmbh,xmmc,TO_CHAR(bj_bjxmmx.dj),sum(sl),sum(bj_gclmx.sl*bj_bjxmmx.dj) ";
	ls_sql+=" FROM bj_bjxmmx,bdm_xmdlbm,bdm_xmxlbm,bj_gclmx,crm_khxx";
    ls_sql+=" where bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bj_bjxmmx.xmxlbm=bdm_xmxlbm.xmxlbm ";
    ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm";
    ls_sql+=" and bj_gclmx.khbh=crm_khxx.khbh and crm_khxx.jzbz='1'";
    ls_sql+=wheresql;
    ls_sql+=" group by bj_bjxmmx.xmdlbm,xmdlmc,bj_bjxmmx.xmxlbm,xmxlmc,bj_bjxmmx.xmbh,xmmc,bj_bjxmmx.dj";
    ls_sql+=" order by sum(bj_gclmx.sl*bj_bjxmmx.dj) desc,bj_bjxmmx.xmdlbm,bj_bjxmmx.xmxlbm,bj_bjxmmx.xmbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("xmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">报价项目统计</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">项目大类</td>
	<td  width="15%">项目小类</td>
    <td  width="10%" >项目编号</td>
    <td  width="25%">项目名称</td>
	<td  width="10%">单价（元）</td>
	<td  width="10%">工程量</td>
	<td  width="15%">金额（元）</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>