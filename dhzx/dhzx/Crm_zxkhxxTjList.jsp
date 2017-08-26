<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">咨询客户统计</font></B>
</CENTER>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String crm_zxkhxx_khbh=null;
	String crm_zxkhxx_xb=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_lxfs=null;
	String crm_zxkhxx_fwlxbm=null;
	String crm_zxkhxx_hxbm=null;
	String crm_zxkhxx_fwmj=null;
	String crm_zxkhxx_fgyqbm=null;
	String sjs=null;
	String crm_zxkhxx_zxysbm=null;
	String crm_zxkhxx_zxzt=null;
	String zxdm=null;
	String crm_zxkhxx_qtqk=null;
	String crm_zxkhxx_sbyybm=null;
	String crm_zxkhxx_zxhfsj=null;
	String crm_zxkhxx_sfxhf=null;
	String crm_zxkhxx_hfrq=null;
	String crm_zxkhxx_hflxbm=null;
	String crm_zxkhxx_hdbz=null;
	String crm_zxkhxx_khlxbm=null;
	String crm_zxkhxx_lrr=null;
	String crm_zxkhxx_lrsj=null;
	String crm_zxkhxx_sbsj=null;
	String ybjsgd=null;
	String ybjdz=null;

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}
	String xxlysm=null;
	xxlysm=request.getParameter("xxlysm");
	if (xxlysm!=null)
	{
		xxlysm=cf.GB2Uni(xxlysm);
		if (!(xxlysm.equals("")))	wheresql+=" and  (crm_zxkhxx.xxlysm like '%"+xxlysm+"%')";
	}

	String sfyywy=request.getParameter("sfyywy");

	if (sfyywy!=null)
	{
		if (sfyywy.equals("Y"))
		{
			wheresql+=" and  (crm_zxkhxx.ywy is not null)";
		}
		else{
			wheresql+=" and  (crm_zxkhxx.ywy is  null)";
		}
	}

	String xxlybm=null;
	xxlybm=request.getParameter("xxlybm");
	if (xxlybm!=null)
	{
		xxlybm=cf.GB2Uni(xxlybm);
		if (!(xxlybm.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh in(select khbh from  crm_khxxly where khlx='2' and xxlybm='"+xxlybm+"'))";
	}

	String crm_zxkhxx_khxm=null;
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	String crm_zxkhxx_khxm2=null;
	crm_zxkhxx_khxm2=request.getParameter("crm_zxkhxx_khxm2");
	if (crm_zxkhxx_khxm2!=null)
	{
		crm_zxkhxx_khxm2=cf.GB2Uni(crm_zxkhxx_khxm2);
		if (!(crm_zxkhxx_khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm2+"%')";
	}

	String lfdjbz=null;
	lfdjbz=request.getParameter("lfdjbz");
	if (lfdjbz!=null)
	{
		if (!(lfdjbz.equals("")))	wheresql+=" and  (crm_zxkhxx.lfdjbz='"+lfdjbz+"')";
	}
	String jlfdjsj=null;
	jlfdjsj=request.getParameter("jlfdjsj");
	if (jlfdjsj!=null)
	{
		if (!(jlfdjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jlfdjsj>=TO_DATE('"+jlfdjsj+"','YYYY-MM-DD'))";
	}
	jlfdjsj=request.getParameter("jlfdjsj2");
	if (jlfdjsj!=null)
	{
		if (!(jlfdjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jlfdjsj<=TO_DATE('"+jlfdjsj+"','YYYY-MM-DD'))";
	}
	String hddjbz=null;
	hddjbz=request.getParameter("hddjbz");
	if (hddjbz!=null)
	{
		if (!(hddjbz.equals("")))	wheresql+=" and  (crm_zxkhxx.hddjbz='"+hddjbz+"')";
	}
	String jhddjsj=null;
	jhddjsj=request.getParameter("jhddjsj");
	if (jhddjsj!=null)
	{
		if (!(jhddjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhddjsj>=TO_DATE('"+jhddjsj+"','YYYY-MM-DD'))";
	}
	jhddjsj=request.getParameter("jhddjsj2");
	if (jhddjsj!=null)
	{
		if (!(jhddjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhddjsj<=TO_DATE('"+jhddjsj+"','YYYY-MM-DD'))";
	}


	String cxhdbm=null;
	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_zxkhxx.cxhdbm='"+cxhdbm+"')";
	}


	String sfzdzbj=null;
	sfzdzbj=request.getParameter("sfzdzbj");
	if (sfzdzbj!=null)
	{
		if (!(sfzdzbj.equals("")))	wheresql+=" and  (crm_zxkhxx.sfzdzbj='"+sfzdzbj+"')";
	}
	String jzbz=null;
	jzbz=request.getParameter("jzbz");
	if (jzbz!=null)
	{
		if (!(jzbz.equals("")))	wheresql+=" and  (crm_zxkhxx.jzbz='"+jzbz+"')";
	}

	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=cf.GB2Uni(shbz);
		if (!(shbz.equals("")))	wheresql+=" and  (crm_zxkhxx.shbz='"+shbz+"')";
	}

	String xqbm=null;
	xqbm=request.getParameter("xqbm");
	if (xqbm!=null)
	{
		xqbm=cf.GB2Uni(xqbm);
		if (!(xqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.xqbm like '%"+xqbm+"%')";
	}

	String rddqbm=null;
	rddqbm=request.getParameter("rddqbm");
	if (rddqbm!=null)
	{
		rddqbm=cf.GB2Uni(rddqbm);
		if (!(rddqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.rddqbm='"+rddqbm+"')";
	}
	String hxwzbm=null;
	hxwzbm=request.getParameter("hxwzbm");
	if (hxwzbm!=null)
	{
		hxwzbm=cf.GB2Uni(hxwzbm);
		if (!(hxwzbm.equals("")))	wheresql+=" and  (crm_zxkhxx.hxwzbm='"+hxwzbm+"')";
	}
	String ysrbm=null;
	ysrbm=request.getParameter("ysrbm");
	if (ysrbm!=null)
	{
		ysrbm=cf.GB2Uni(ysrbm);
		if (!(ysrbm.equals("")))	wheresql+=" and  (crm_zxkhxx.ysrbm='"+ysrbm+"')";
	}
	String nlqjbm=null;
	nlqjbm=request.getParameter("nlqjbm");
	if (nlqjbm!=null)
	{
		nlqjbm=cf.GB2Uni(nlqjbm);
		if (!(nlqjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.nlqjbm='"+nlqjbm+"')";
	}
	String zybm=null;
	zybm=request.getParameter("zybm");
	if (zybm!=null)
	{
		zybm=cf.GB2Uni(zybm);
		if (!(zybm.equals("")))	wheresql+=" and  (crm_zxkhxx.zybm='"+zybm+"')";
	}

	
	String sjsbh=null;
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (crm_zxkhxx.sjsbh='"+sjsbh+"')";
	}

	String yzxxbz=null;
	yzxxbz=request.getParameter("yzxxbz");
	if (yzxxbz!=null)
	{
		if (!(yzxxbz.equals("")))	wheresql+=" and  (crm_zxkhxx.yzxxbz='"+yzxxbz+"')";
	}

	String zxdmfpsj=null;
	zxdmfpsj=request.getParameter("zxdmfpsj");
	if (zxdmfpsj!=null)
	{
		if (!(zxdmfpsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxdmfpsj>=TO_DATE('"+zxdmfpsj+"','YYYY-MM-DD'))";
	}
	zxdmfpsj=request.getParameter("zxdmfpsj2");
	if (zxdmfpsj!=null)
	{
		if (!(zxdmfpsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxdmfpsj<=TO_DATE('"+zxdmfpsj+"','YYYY-MM-DD'))";
	}
	String sjsfpsj=null;
	sjsfpsj=request.getParameter("sjsfpsj");
	if (sjsfpsj!=null)
	{
		if (!(sjsfpsj.equals("")))	wheresql+="  and (crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjsfpsj+"','YYYY-MM-DD'))";
	}
	sjsfpsj=request.getParameter("sjsfpsj2");
	if (sjsfpsj!=null)
	{
		if (!(sjsfpsj.equals("")))	wheresql+="  and (crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjsfpsj+"','YYYY-MM-DD'))";
	}
	String jhjfsj=null;
	jhjfsj=request.getParameter("jhjfsj");
	if (jhjfsj!=null)
	{
		if (!(jhjfsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhjfsj>=TO_DATE('"+jhjfsj+"','YYYY-MM-DD'))";
	}
	jhjfsj=request.getParameter("jhjfsj2");
	if (jhjfsj!=null)
	{
		if (!(jhjfsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhjfsj<=TO_DATE('"+jhjfsj+"','YYYY-MM-DD'))";
	}
	String yjzxsj=null;
	yjzxsj=request.getParameter("yjzxsj");
	if (yjzxsj!=null)
	{
		if (!(yjzxsj.equals("")))	wheresql+="  and (crm_zxkhxx.yjzxsj>=TO_DATE('"+yjzxsj+"','YYYY-MM-DD'))";
	}
	yjzxsj=request.getParameter("yjzxsj2");
	if (yjzxsj!=null)
	{
		if (!(yjzxsj.equals("")))	wheresql+="  and (crm_zxkhxx.yjzxsj<=TO_DATE('"+yjzxsj+"','YYYY-MM-DD'))";
	}



	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		if (!(dqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dqbm='"+dqbm+"'))";
	}
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String crm_zxkhxx_zxdjbm=null;
	crm_zxkhxx_zxdjbm=request.getParameter("crm_zxkhxx_zxdjbm");
	if (crm_zxkhxx_zxdjbm!=null)
	{
		if (!(crm_zxkhxx_zxdjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm='"+crm_zxkhxx_zxdjbm+"')";
	}
	ybjsgd=request.getParameter("ybjsgd");
	if (ybjsgd!=null)
	{
		ybjsgd=cf.GB2Uni(ybjsgd);
		if (!(ybjsgd.equals("")))	wheresql+=" and  (crm_zxkhxx.ybjsgd='"+ybjsgd+"')";
	}
	ybjdz=request.getParameter("ybjdz");
	if (ybjdz!=null)
	{
		ybjdz=cf.GB2Uni(ybjdz);
		if (!(ybjdz.equals("")))	wheresql+=" and  (crm_zxkhxx.ybjdz like '%"+ybjdz+"%')";
	}

	String cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.cqbm='"+cqbm+"')";
	}
	String hdr=null;
	hdr=request.getParameter("hdr");
	if (hdr!=null)
	{
		hdr=cf.GB2Uni(hdr);
		if (!(hdr.equals("")))	wheresql+=" and  (crm_zxkhxx.hdr='"+hdr+"')";
	}
	String cgdz=null;
	cgdz=request.getParameter("cgdz");
	if (cgdz!=null)
	{
		cgdz=cf.GB2Uni(cgdz);
		if (!(cgdz.equals("")))	wheresql+=" and  (crm_zxkhxx.cgdz like '%"+cgdz+"%')";
	}
	
	
	crm_zxkhxx_khbh=request.getParameter("crm_zxkhxx_khbh");
	if (crm_zxkhxx_khbh!=null)
	{
		crm_zxkhxx_khbh=cf.GB2Uni(crm_zxkhxx_khbh);
		if (!(crm_zxkhxx_khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+crm_zxkhxx_khbh+"')";
	}
	crm_zxkhxx_xb=request.getParameter("crm_zxkhxx_xb");
	if (crm_zxkhxx_xb!=null)
	{
		crm_zxkhxx_xb=cf.GB2Uni(crm_zxkhxx_xb);
		if (!(crm_zxkhxx_xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+crm_zxkhxx_xb+"')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz+"%')";
	}
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+crm_zxkhxx_lxfs+"')";
	}
	crm_zxkhxx_fwlxbm=request.getParameter("crm_zxkhxx_fwlxbm");
	if (crm_zxkhxx_fwlxbm!=null)
	{
		crm_zxkhxx_fwlxbm=cf.GB2Uni(crm_zxkhxx_fwlxbm);
		if (!(crm_zxkhxx_fwlxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.fwlxbm='"+crm_zxkhxx_fwlxbm+"')";
	}
	crm_zxkhxx_hxbm=request.getParameter("crm_zxkhxx_hxbm");
	if (crm_zxkhxx_hxbm!=null)
	{
		crm_zxkhxx_hxbm=cf.GB2Uni(crm_zxkhxx_hxbm);
		if (!(crm_zxkhxx_hxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.hxbm='"+crm_zxkhxx_hxbm+"')";
	}
	crm_zxkhxx_fwmj=request.getParameter("crm_zxkhxx_fwmj");
	if (crm_zxkhxx_fwmj!=null)
	{
		crm_zxkhxx_fwmj=crm_zxkhxx_fwmj.trim();
		if (!(crm_zxkhxx_fwmj.equals("")))	wheresql+=" and (crm_zxkhxx.fwmj="+crm_zxkhxx_fwmj+") ";
	}
	crm_zxkhxx_fgyqbm=request.getParameter("crm_zxkhxx_fgyqbm");
	if (crm_zxkhxx_fgyqbm!=null)
	{
		crm_zxkhxx_fgyqbm=cf.GB2Uni(crm_zxkhxx_fgyqbm);
		if (!(crm_zxkhxx_fgyqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.fgyqbm='"+crm_zxkhxx_fgyqbm+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	crm_zxkhxx_zxysbm=request.getParameter("crm_zxkhxx_zxysbm");
	if (crm_zxkhxx_zxysbm!=null)
	{
		crm_zxkhxx_zxysbm=cf.GB2Uni(crm_zxkhxx_zxysbm);
		if (!(crm_zxkhxx_zxysbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxysbm='"+crm_zxkhxx_zxysbm+"')";
	}
	crm_zxkhxx_zxzt=request.getParameter("crm_zxkhxx_zxzt");
	if (crm_zxkhxx_zxzt!=null)
	{
		crm_zxkhxx_zxzt=cf.GB2Uni(crm_zxkhxx_zxzt);
		if (!(crm_zxkhxx_zxzt.equals("")))	wheresql+=" and  (crm_zxkhxx.zxzt='"+crm_zxkhxx_zxzt+"')";
	}

	
	
	crm_zxkhxx_qtqk=request.getParameter("crm_zxkhxx_qtqk");
	if (crm_zxkhxx_qtqk!=null)
	{
		crm_zxkhxx_qtqk=cf.GB2Uni(crm_zxkhxx_qtqk);
		if (!(crm_zxkhxx_qtqk.equals("")))	wheresql+=" and  (crm_zxkhxx.qtqk='"+crm_zxkhxx_qtqk+"')";
	}
	crm_zxkhxx_sbyybm=request.getParameter("crm_zxkhxx_sbyybm");
	if (crm_zxkhxx_sbyybm!=null)
	{
		crm_zxkhxx_sbyybm=cf.GB2Uni(crm_zxkhxx_sbyybm);
		if (!(crm_zxkhxx_sbyybm.equals("")))	wheresql+=" and  (crm_zxkhxx.sbyybm='"+crm_zxkhxx_sbyybm+"')";
	}
	crm_zxkhxx_zxhfsj=request.getParameter("crm_zxkhxx_zxhfsj");
	if (crm_zxkhxx_zxhfsj!=null)
	{
		crm_zxkhxx_zxhfsj=crm_zxkhxx_zxhfsj.trim();
		if (!(crm_zxkhxx_zxhfsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxhfsj=TO_DATE('"+crm_zxkhxx_zxhfsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_sfxhf=request.getParameter("crm_zxkhxx_sfxhf");
	if (crm_zxkhxx_sfxhf!=null)
	{
		crm_zxkhxx_sfxhf=cf.GB2Uni(crm_zxkhxx_sfxhf);
		if (!(crm_zxkhxx_sfxhf.equals("")))	wheresql+=" and  (crm_zxkhxx.sfxhf='"+crm_zxkhxx_sfxhf+"')";
	}
	crm_zxkhxx_hfrq=request.getParameter("crm_zxkhxx_hfrq");
	if (crm_zxkhxx_hfrq!=null)
	{
		crm_zxkhxx_hfrq=crm_zxkhxx_hfrq.trim();
		if (!(crm_zxkhxx_hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq>=TO_DATE('"+crm_zxkhxx_hfrq+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_hfrq=request.getParameter("crm_zxkhxx_hfrq2");
	if (crm_zxkhxx_hfrq!=null)
	{
		crm_zxkhxx_hfrq=crm_zxkhxx_hfrq.trim();
		if (!(crm_zxkhxx_hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq<=TO_DATE('"+crm_zxkhxx_hfrq+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_hflxbm=request.getParameter("crm_zxkhxx_hflxbm");
	if (crm_zxkhxx_hflxbm!=null)
	{
		crm_zxkhxx_hflxbm=cf.GB2Uni(crm_zxkhxx_hflxbm);
		if (!(crm_zxkhxx_hflxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.hflxbm='"+crm_zxkhxx_hflxbm+"')";
	}
	crm_zxkhxx_hdbz=request.getParameter("crm_zxkhxx_hdbz");
	if (crm_zxkhxx_hdbz!=null)
	{
		crm_zxkhxx_hdbz=cf.GB2Uni(crm_zxkhxx_hdbz);
		if (!(crm_zxkhxx_hdbz.equals("")))	wheresql+=" and  (crm_zxkhxx.hdbz='"+crm_zxkhxx_hdbz+"')";
	}
	crm_zxkhxx_khlxbm=request.getParameter("crm_zxkhxx_khlxbm");
	if (crm_zxkhxx_khlxbm!=null)
	{
		crm_zxkhxx_khlxbm=cf.GB2Uni(crm_zxkhxx_khlxbm);
		if (!(crm_zxkhxx_khlxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.khlxbm='"+crm_zxkhxx_khlxbm+"')";
	}
	crm_zxkhxx_lrr=request.getParameter("crm_zxkhxx_lrr");
	if (crm_zxkhxx_lrr!=null)
	{
		crm_zxkhxx_lrr=cf.GB2Uni(crm_zxkhxx_lrr);
		if (!(crm_zxkhxx_lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+crm_zxkhxx_lrr+"')";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj2");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_sbsj=request.getParameter("crm_zxkhxx_sbsj");
	if (crm_zxkhxx_sbsj!=null)
	{
		crm_zxkhxx_sbsj=crm_zxkhxx_sbsj.trim();
		if (!(crm_zxkhxx_sbsj.equals("")))	wheresql+="  and (crm_zxkhxx.sbsj>=TO_DATE('"+crm_zxkhxx_sbsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_sbsj=request.getParameter("crm_zxkhxx_sbsj2");
	if (crm_zxkhxx_sbsj!=null)
	{
		crm_zxkhxx_sbsj=crm_zxkhxx_sbsj.trim();
		if (!(crm_zxkhxx_sbsj.equals("")))	wheresql+="  and (crm_zxkhxx.sbsj<=TO_DATE('"+crm_zxkhxx_sbsj+"','YYYY/MM/DD'))";
	}

	String jhctsj=null;
	jhctsj=request.getParameter("jhctsj");
	if (jhctsj!=null)
	{
		jhctsj=jhctsj.trim();
		if (!(jhctsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhctsj>=TO_DATE('"+jhctsj+"','YYYY-MM-DD'))";
	}
	jhctsj=request.getParameter("jhctsj2");
	if (jhctsj!=null)
	{
		jhctsj=jhctsj.trim();
		if (!(jhctsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhctsj<=TO_DATE('"+jhctsj+"','YYYY-MM-DD'))";
	}
	String jhcxgtsj=null;
	jhcxgtsj=request.getParameter("jhcxgtsj");
	if (jhcxgtsj!=null)
	{
		jhcxgtsj=jhcxgtsj.trim();
		if (!(jhcxgtsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhcxgtsj>=TO_DATE('"+jhcxgtsj+"','YYYY-MM-DD'))";
	}
	jhcxgtsj=request.getParameter("jhcxgtsj2");
	if (jhcxgtsj!=null)
	{
		jhcxgtsj=jhcxgtsj.trim();
		if (!(jhcxgtsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhcxgtsj<=TO_DATE('"+jhcxgtsj+"','YYYY-MM-DD'))";
	}
	String jhcsgtsj=null;
	jhcsgtsj=request.getParameter("jhcsgtsj");
	if (jhcsgtsj!=null)
	{
		jhcsgtsj=jhcsgtsj.trim();
		if (!(jhcsgtsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhcsgtsj>=TO_DATE('"+jhcsgtsj+"','YYYY-MM-DD'))";
	}
	jhcsgtsj=request.getParameter("jhcsgtsj2");
	if (jhcsgtsj!=null)
	{
		jhcsgtsj=jhcsgtsj.trim();
		if (!(jhcsgtsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhcsgtsj<=TO_DATE('"+jhcsgtsj+"','YYYY-MM-DD'))";
	}
	String jhzbjsj=null;
	jhzbjsj=request.getParameter("jhzbjsj");
	if (jhzbjsj!=null)
	{
		jhzbjsj=jhzbjsj.trim();
		if (!(jhzbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhzbjsj>=TO_DATE('"+jhzbjsj+"','YYYY-MM-DD'))";
	}
	jhzbjsj=request.getParameter("jhzbjsj2");
	if (jhzbjsj!=null)
	{
		jhzbjsj=jhzbjsj.trim();
		if (!(jhzbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhzbjsj<=TO_DATE('"+jhzbjsj+"','YYYY-MM-DD'))";
	}
	String sczbjsj=null;
	sczbjsj=request.getParameter("sczbjsj");
	if (sczbjsj!=null)
	{
		sczbjsj=sczbjsj.trim();
		if (!(sczbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.sczbjsj>=TO_DATE('"+sczbjsj+"','YYYY-MM-DD'))";
	}
	sczbjsj=request.getParameter("sczbjsj2");
	if (sczbjsj!=null)
	{
		sczbjsj=sczbjsj.trim();
		if (!(sczbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.sczbjsj<=TO_DATE('"+sczbjsj+"','YYYY-MM-DD'))";
	}
	String khzyxz=null;
	khzyxz=request.getParameter("khzyxz");
	if (khzyxz!=null)
	{
		khzyxz=cf.GB2Uni(khzyxz);
		if (!(khzyxz.equals("")))	wheresql+=" and  (crm_zxkhxx.khzyxz='"+khzyxz+"')";
	}

	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));

	String groupsql="";
	String selectgroupsql="";
	int groupsl=0;
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			groupsql+=","+tj1;
			selectgroupsql+=","+tj1;
			groupsl++;
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			groupsql+=","+tj2;
			selectgroupsql+=","+tj2;
			groupsl++;
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			groupsql+=","+tj3;
			selectgroupsql+=","+tj3;
			groupsl++;
		}
	}
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(crm_zxkhxx.khbh)";
	}
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"20%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"20%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"20%\">"+tj3name+"</td>");
	}

%>
	<td  width="10%">数量</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_nlqjbm,dm_ysrbm,dm_zybm,dm_sbyybm,dm_cqbm,dm_rddqbm,dm_hxwzbm ";
    ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+)";
	ls_sql+=" and crm_zxkhxx.nlqjbm=dm_nlqjbm.nlqjbm(+) and crm_zxkhxx.ysrbm=dm_ysrbm.ysrbm(+)";
	ls_sql+=" and crm_zxkhxx.zybm=dm_zybm.zybm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.cqbm=dm_cqbm.cqbm(+) ";
	ls_sql+=" and crm_zxkhxx.rddqbm=dm_rddqbm.rddqbm(+) and crm_zxkhxx.hxwzbm=dm_hxwzbm.hxwzbm(+)";
    ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=wheresql;
	ls_sql+=" group by "+groupsql;
	ls_sql+=" order by "+groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

//	pageObj.alignStr[groupsl+1]="align='left'";


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj1,"1");//列参数对象加入Hash表
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj2,"1");//列参数对象加入Hash表
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj3,"1");//列参数对象加入Hash表
		}
	}
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>