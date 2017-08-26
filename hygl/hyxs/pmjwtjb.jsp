<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%//马学中 2003.9.24 修改cp_cpxx为cp_cpxx1，原因：销售的产品在cp_cpxx1中
	String wheresql=" WHERE (1=1)";

	String[] pmbm=null;
	String[] jwbm=null;

	String cpbm=null;
	String bkbh=null;
	String plbm=null;
	String hplx=null;
	String cplb=null;
	String zqh=null;
	String zzl=null;
	String jlzl=null;
	String jldm=null;
	String bsjbbm=null;
	String zsgg=null;
	String zszl=null;
	String psgg=null;
	String pszl=null;
	String sjcbj=null;
	String cbj=null;
	String lsj=null;
	String ysj=null;
	String bqj=null;
	String zqhbm=null;
	String jgf=null;
	String dkjgf=null;
	String dksh=null;
	String qtgf=null;
	String bzdj=null;
	String scdj=null;
	String ptgmdj=null;
	String kgmdj=null;
	String bagmdj=null;
	String sjczbm=null;
	String cd=null;
	String jjl=null;
	String bqjxs=null;
	String bzjj=null;
	String scjj=null;
	String gmjj=null;
	String tjbz=null;
	String zsh=null;
	String jdbz=null;
	String wlzt=null;
	String szdw=null;
	String ckbm=null;
	String hjbm=null;
	String fkzt=null;
	String ddbh=null;
	String thxh=null;
	String dbxh=null;
	String rkrq=null;
	String rkph=null;
	String rkj=null;
	String ckrq=null;
	String ckph=null;
	String ckj=null;
	String ktbz=null;
	String zpjj=null;
	String gcddbh=null;
	String gckh=null;
	String dwbh=null;
	String fhbh=null;
	String yrkrq=null;
	String yrkph=null;
	String yckph=null;
	String ywxh=null;
	String thjlh=null;
	String shjg=null;
	String tj=null;
	String mddw=null;
	String mdck=null;
	String lscpbm=null;
	String yscbj=null;
	String gkbz=null;
	String xsrq=null;
	String xsrq2=null;
	String sxj=null;
	String jyfs=null;
	String thrq=null;
	String thj=null;
	String xsbddbh=null;
	String bkflbm=null;
	//马学中2003.9.24修改cp_cpxx为cp_cpxx1,原因：销售的产品信息在cp_cpxx1中
	bkflbm=request.getParameter("bkflbm");
	if (bkflbm!=null)
	{
		if (!(bkflbm.equals("")))	wheresql+="  and (cp_cpxx1.bkbh in(select bkbh from v_bk where bkflbm='"+bkflbm+"'))";
	}
	String bsczbm=null;
	bsczbm=request.getParameter("bsczbm");
	if (bsczbm!=null)
	{
		if (!(bsczbm.equals("")))	wheresql+="  and (cp_cpxx1.bkbh in(select bkbh from v_bk where bsczbm='"+bsczbm+"'))";
	}
	String dwdlbm=null;
	dwdlbm=request.getParameter("dwdlbm");
	if (dwdlbm!=null)
	{
		if (!(dwdlbm.equals("")))	wheresql+="  and (cp_cpxx1.szdw in(select dwbh from sq_dwxx where dwdlbm='"+dwdlbm+"'))";
	}
	String pq=null;
	pq=request.getParameter("pq");
	if (pq!=null)
	{
		if (!(pq.equals("")))	wheresql+="  and (cp_cpxx1.szdw in(select dwbh from sq_dwxx where ssdw='"+pq+"' or dwbh='"+pq+"'))";
	}

	yrkrq=request.getParameter("yrkrq");
	if (yrkrq!=null)
	{
		yrkrq=yrkrq.trim();
		if (!(yrkrq.equals("")))	wheresql+="  and (cp_cpxx1.yrkrq>=TO_DATE('"+yrkrq+"','YYYY/MM/DD'))";
	}
	yrkrq=request.getParameter("yrkrq2");
	if (yrkrq!=null)
	{
		yrkrq=yrkrq.trim();
		if (!(yrkrq.equals("")))	wheresql+="  and (cp_cpxx1.yrkrq<=TO_DATE('"+yrkrq+"','YYYY/MM/DD'))";
	}
	rkrq=request.getParameter("rkrq");
	if (rkrq!=null)
	{
		rkrq=rkrq.trim();
		if (!(rkrq.equals("")))	wheresql+="  and (cp_cpxx1.rkrq>=TO_DATE('"+rkrq+"','YYYY/MM/DD'))";
	}
	rkrq=request.getParameter("rkrq2");
	if (rkrq!=null)
	{
		rkrq=rkrq.trim();
		if (!(rkrq.equals("")))	wheresql+="  and (cp_cpxx1.rkrq<=TO_DATE('"+rkrq+"','YYYY/MM/DD'))";
	}
	
	zzl=request.getParameter("zzl");
	if (zzl!=null)
	{
		zzl=zzl.trim();
		if (!(zzl.equals("")))	wheresql+=" and  (cp_cpxx1.zzl>="+zzl+") ";
	}
	zzl=request.getParameter("zzl2");
	if (zzl!=null)
	{
		zzl=zzl.trim();
		if (!(zzl.equals("")))	wheresql+=" and  (cp_cpxx1.zzl<="+zzl+") ";
	}
	jlzl=request.getParameter("jlzl");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (cp_cpxx1.jlzl>="+jlzl+") ";
	}
	jlzl=request.getParameter("jlzl2");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (cp_cpxx1.jlzl<="+jlzl+") ";
	}

	zszl=request.getParameter("zszl");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (cp_cpxx1.zszl>="+zszl+") ";
	}
	zszl=request.getParameter("zszl2");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (cp_cpxx1.zszl<="+zszl+") ";
	}
	pszl=request.getParameter("pszl");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (cp_cpxx1.pszl>="+pszl+") ";
	}
	pszl=request.getParameter("pszl2");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (cp_cpxx1.pszl<="+pszl+") ";
	}
	zqh=request.getParameter("zqh");
	if (zqh!=null)
	{
		zqh=zqh.trim();
		if (!(zqh.equals("")))	wheresql+=" and (cp_cpxx1.zqh>="+zqh+") ";
	}
	zqh=request.getParameter("zqh2");
	if (zqh!=null)
	{
		zqh=zqh.trim();
		if (!(zqh.equals("")))	wheresql+=" and (cp_cpxx1.zqh<="+zqh+") ";
	}

	sjcbj=request.getParameter("sjcbj");
	if (sjcbj!=null)
	{
		sjcbj=sjcbj.trim();
		if (!(sjcbj.equals("")))	wheresql+=" and  (cp_cpxx1.sjcbj>="+sjcbj+") ";
	}
	sjcbj=request.getParameter("sjcbj2");
	if (sjcbj!=null)
	{
		sjcbj=sjcbj.trim();
		if (!(sjcbj.equals("")))	wheresql+=" and  (cp_cpxx1.sjcbj<="+sjcbj+") ";
	}
	cbj=request.getParameter("cbj");
	if (cbj!=null)
	{
		cbj=cbj.trim();
		if (!(cbj.equals("")))	wheresql+=" and  (cp_cpxx1.cbj>="+cbj+") ";
	}
	cbj=request.getParameter("cbj2");
	if (cbj!=null)
	{
		cbj=cbj.trim();
		if (!(cbj.equals("")))	wheresql+=" and  (cp_cpxx1.cbj<="+cbj+") ";
	}
	yscbj=request.getParameter("yscbj");
	if (yscbj!=null)
	{
		yscbj=yscbj.trim();
		if (!(yscbj.equals("")))	wheresql+=" and  (cp_cpxx1.yscbj>="+yscbj+") ";
	}
	yscbj=request.getParameter("yscbj2");
	if (yscbj!=null)
	{
		yscbj=yscbj.trim();
		if (!(yscbj.equals("")))	wheresql+=" and  (cp_cpxx1.yscbj<="+yscbj+") ";
	}
	lsj=request.getParameter("lsj");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (cp_cpxx1.lsj>="+lsj+") ";
	}
	lsj=request.getParameter("lsj2");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (cp_cpxx1.lsj<="+lsj+") ";
	}
	ysj=request.getParameter("ysj");
	if (ysj!=null)
	{
		ysj=ysj.trim();
		if (!(ysj.equals("")))	wheresql+=" and  (cp_cpxx1.ysj>="+ysj+") ";
	}
	ysj=request.getParameter("ysj2");
	if (ysj!=null)
	{
		ysj=ysj.trim();
		if (!(ysj.equals("")))	wheresql+=" and  (cp_cpxx1.ysj<="+ysj+") ";
	}
	bqj=request.getParameter("bqj");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (cp_cpxx1.bqj>="+bqj+") ";
	}
	bqj=request.getParameter("bqj2");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (cp_cpxx1.bqj<="+bqj+") ";
	}
	jgf=request.getParameter("jgf");
	if (jgf!=null)
	{
		jgf=jgf.trim();
		if (!(jgf.equals("")))	wheresql+=" and  (cp_cpxx1.jgf>="+jgf+") ";
	}
	jgf=request.getParameter("jgf2");
	if (jgf!=null)
	{
		jgf=jgf.trim();
		if (!(jgf.equals("")))	wheresql+=" and  (cp_cpxx1.jgf<="+jgf+") ";
	}
	dkjgf=request.getParameter("dkjgf");
	if (dkjgf!=null)
	{
		dkjgf=dkjgf.trim();
		if (!(dkjgf.equals("")))	wheresql+=" and  (cp_cpxx1.dkjgf>="+dkjgf+") ";
	}
	dkjgf=request.getParameter("dkjgf2");
	if (dkjgf!=null)
	{
		dkjgf=dkjgf.trim();
		if (!(dkjgf.equals("")))	wheresql+=" and  (cp_cpxx1.dkjgf<="+dkjgf+") ";
	}
	dksh=request.getParameter("dksh");
	if (dksh!=null)
	{
		dksh=dksh.trim();
		if (!(dksh.equals("")))	wheresql+=" and  (cp_cpxx1.dksh>="+dksh+") ";
	}
	dksh=request.getParameter("dksh2");
	if (dksh!=null)
	{
		dksh=dksh.trim();
		if (!(dksh.equals("")))	wheresql+=" and  (cp_cpxx1.dksh<="+dksh+") ";
	}
	qtgf=request.getParameter("qtgf");
	if (qtgf!=null)
	{
		qtgf=qtgf.trim();
		if (!(qtgf.equals("")))	wheresql+=" and  (cp_cpxx1.qtgf>="+qtgf+") ";
	}
	qtgf=request.getParameter("qtgf2");
	if (qtgf!=null)
	{
		qtgf=qtgf.trim();
		if (!(qtgf.equals("")))	wheresql+=" and  (cp_cpxx1.qtgf<="+qtgf+") ";
	}
	

	pmbm=request.getParameterValues("pmbm");
	if (pmbm!=null)
	{
		wheresql+=cf.arrayToSQL(pmbm,"cp_cpxx1.pmbm");
	}
	jwbm=request.getParameterValues("jwbm");
	if (jwbm!=null)
	{
		wheresql+=cf.arrayToSQL(jwbm,"cp_cpxx1.jwbm");
	}

	cpbm=request.getParameter("cpbm");

	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+="  and (cp_cpxx1.cpbm='"+cpbm+"')";
	}
	bkbh=request.getParameter("bkbh");
	if (bkbh!=null)
	{
		bkbh=cf.GB2Uni(bkbh);
		if (!(bkbh.equals("")))	wheresql+="  and (cp_cpxx1.bkbh='"+bkbh+"')";
	}
	plbm=request.getParameter("plbm");
	if (plbm!=null)
	{
		plbm=cf.GB2Uni(plbm);
		if (!(plbm.equals("")))	wheresql+="  and (cp_cpxx1.plbm='"+plbm+"')";
	}
	hplx=request.getParameter("hplx");
	if (hplx!=null)
	{
		hplx=cf.GB2Uni(hplx);
		if (!(hplx.equals("")))	wheresql+="  and (cp_cpxx1.hplx='"+hplx+"')";
	}
	cplb=request.getParameter("cplb");
	if (cplb!=null)
	{
		cplb=cf.GB2Uni(cplb);
		if (!(cplb.equals("")))	wheresql+="  and (cp_cpxx1.cplb='"+cplb+"')";
	}
	jldm=request.getParameter("jldm");
	if (jldm!=null)
	{
		jldm=cf.GB2Uni(jldm);
		if (!(jldm.equals("")))	wheresql+="  and (cp_cpxx1.jldm='"+jldm+"')";
	}
	bsjbbm=request.getParameter("bsjbbm");
	if (bsjbbm!=null)
	{
		bsjbbm=cf.GB2Uni(bsjbbm);
		if (!(bsjbbm.equals("")))	wheresql+="  and (cp_cpxx1.bsjbbm='"+bsjbbm+"')";
	}
	zsgg=request.getParameter("zsgg");
	if (zsgg!=null)
	{
		zsgg=cf.GB2Uni(zsgg);
		if (!(zsgg.equals("")))	wheresql+=" and  (cp_cpxx1.zsgg='"+zsgg+"')";
	}
	psgg=request.getParameter("psgg");
	if (psgg!=null)
	{
		psgg=cf.GB2Uni(psgg);
		if (!(psgg.equals("")))	wheresql+=" and  (cp_cpxx1.psgg='"+psgg+"')";
	}
	zqhbm=request.getParameter("zqhbm");
	if (zqhbm!=null)
	{
		zqhbm=cf.GB2Uni(zqhbm);
		if (!(zqhbm.equals("")))	wheresql+="  and (cp_cpxx1.zqhbm='"+zqhbm+"')";
	}
	bzdj=request.getParameter("bzdj");
	if (bzdj!=null)
	{
		bzdj=bzdj.trim();
		if (!(bzdj.equals("")))	wheresql+=" and  (cp_cpxx1.bzdj="+bzdj+") ";
	}
	scdj=request.getParameter("scdj");
	if (scdj!=null)
	{
		scdj=scdj.trim();
		if (!(scdj.equals("")))	wheresql+=" and  (cp_cpxx1.scdj="+scdj+") ";
	}
	ptgmdj=request.getParameter("ptgmdj");
	if (ptgmdj!=null)
	{
		ptgmdj=ptgmdj.trim();
		if (!(ptgmdj.equals("")))	wheresql+=" and  (cp_cpxx1.ptgmdj="+ptgmdj+") ";
	}
	kgmdj=request.getParameter("kgmdj");
	if (kgmdj!=null)
	{
		kgmdj=kgmdj.trim();
		if (!(kgmdj.equals("")))	wheresql+=" and  (cp_cpxx1.kgmdj="+kgmdj+") ";
	}
	bagmdj=request.getParameter("bagmdj");
	if (bagmdj!=null)
	{
		bagmdj=bagmdj.trim();
		if (!(bagmdj.equals("")))	wheresql+=" and  (cp_cpxx1.bagmdj="+bagmdj+") ";
	}
	sjczbm=request.getParameter("sjczbm");
	if (sjczbm!=null)
	{
		sjczbm=cf.GB2Uni(sjczbm);
		if (!(sjczbm.equals("")))	wheresql+="  and (cp_cpxx1.sjczbm='"+sjczbm+"')";
	}
	cd=request.getParameter("cd");
	if (cd!=null)
	{
		cd=cd.trim();
		if (!(cd.equals("")))	wheresql+=" and  (cp_cpxx1.cd="+cd+") ";
	}
	jjl=request.getParameter("jjl");
	if (jjl!=null)
	{
		jjl=jjl.trim();
		if (!(jjl.equals("")))	wheresql+=" and  (cp_cpxx1.jjl="+jjl+") ";
	}
	bqjxs=request.getParameter("bqjxs");
	if (bqjxs!=null)
	{
		bqjxs=bqjxs.trim();
		if (!(bqjxs.equals("")))	wheresql+=" and  (cp_cpxx1.bqjxs="+bqjxs+") ";
	}
	bzjj=request.getParameter("bzjj");
	if (bzjj!=null)
	{
		bzjj=bzjj.trim();
		if (!(bzjj.equals("")))	wheresql+=" and  (cp_cpxx1.bzjj="+bzjj+") ";
	}
	scjj=request.getParameter("scjj");
	if (scjj!=null)
	{
		scjj=scjj.trim();
		if (!(scjj.equals("")))	wheresql+=" and  (cp_cpxx1.scjj="+scjj+") ";
	}
	gmjj=request.getParameter("gmjj");
	if (gmjj!=null)
	{
		gmjj=gmjj.trim();
		if (!(gmjj.equals("")))	wheresql+=" and  (cp_cpxx1.gmjj="+gmjj+") ";
	}
	tjbz=request.getParameter("tjbz");
	if (tjbz!=null)
	{
		tjbz=cf.GB2Uni(tjbz);
		if (!(tjbz.equals("")))	wheresql+="  and (cp_cpxx1.tjbz='"+tjbz+"')";
	}
	zsh=request.getParameter("zsh");
	if (zsh!=null)
	{
		zsh=cf.GB2Uni(zsh);
		if (!(zsh.equals("")))	wheresql+="  and (cp_cpxx1.zsh='"+zsh+"')";
	}
	jdbz=request.getParameter("jdbz");
	if (jdbz!=null)
	{
		jdbz=cf.GB2Uni(jdbz);
		if (!(jdbz.equals("")))	wheresql+="  and (cp_cpxx1.jdbz='"+jdbz+"')";
	}
	wlzt=request.getParameter("wlzt");
	if (wlzt!=null)
	{
		wlzt=cf.GB2Uni(wlzt);
		if (!(wlzt.equals("")))	wheresql+="  and (cp_cpxx1.wlzt='"+wlzt+"')";
	}
	szdw=request.getParameter("szdw");
	if (szdw!=null)
	{
		szdw=cf.GB2Uni(szdw);
		if (!(szdw.equals("")))	wheresql+="  and (cp_cpxx1.szdw='"+szdw+"')";
	}
	ckbm=request.getParameter("ckbm");
	if (ckbm!=null)
	{
		ckbm=cf.GB2Uni(ckbm);
		if (!(ckbm.equals("")))	wheresql+="  and (cp_cpxx1.ckbm='"+ckbm+"')";
	}
	hjbm=request.getParameter("hjbm");
	if (hjbm!=null)
	{
		hjbm=cf.GB2Uni(hjbm);
		if (!(hjbm.equals("")))	wheresql+="  and (cp_cpxx1.hjbm='"+hjbm+"')";
	}
	fkzt=request.getParameter("fkzt");
	if (fkzt!=null)
	{
		fkzt=cf.GB2Uni(fkzt);
		if (!(fkzt.equals("")))	wheresql+="  and (cp_cpxx1.fkzt='"+fkzt+"')";
	}
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+="  and (cp_cpxx1.ddbh='"+ddbh+"')";
	}
	thxh=request.getParameter("thxh");
	if (thxh!=null)
	{
		thxh=cf.GB2Uni(thxh);
		if (!(thxh.equals("")))	wheresql+="  and (cp_cpxx1.cpbm in(select cpbm from th_cpmx where thxh='"+thxh+"'))";
	}
	dbxh=request.getParameter("dbxh");
	if (dbxh!=null)
	{
		dbxh=cf.GB2Uni(dbxh);
		if (!(dbxh.equals("")))	wheresql+="  and (cp_cpxx1.cpbm in(select cpbm from db_cpmx where dbxh='"+dbxh+"'))";
	}
	rkph=request.getParameter("rkph");
	if (rkph!=null)
	{
		rkph=cf.GB2Uni(rkph);
		if (!(rkph.equals("")))	wheresql+="  and (cp_cpxx1.cpbm in(select cpbm from cp_rkmx where rkph='"+rkph+"'))";
	}
	rkj=request.getParameter("rkj");
	if (rkj!=null)
	{
		rkj=rkj.trim();
		if (!(rkj.equals("")))	wheresql+=" and  (cp_cpxx1.rkj="+rkj+") ";
	}
	ckrq=request.getParameter("ckrq");
	if (ckrq!=null)
	{
		ckrq=ckrq.trim();
		if (!(ckrq.equals("")))	wheresql+="  and (cp_cpxx1.ckrq=TO_DATE('"+ckrq+"','YYYY/MM/DD'))";
	}
	ckph=request.getParameter("ckph");
	if (ckph!=null)
	{
		ckph=cf.GB2Uni(ckph);
		if (!(ckph.equals("")))	wheresql+="  and (cp_cpxx1.cpbm in(select cpbm from cp_ckmx where ckph='"+ckph+"'))";
	}
	ckj=request.getParameter("ckj");
	if (ckj!=null)
	{
		ckj=ckj.trim();
		if (!(ckj.equals("")))	wheresql+=" and  (cp_cpxx1.ckj="+ckj+") ";
	}
	ktbz=request.getParameter("ktbz");
	if (ktbz!=null)
	{
		ktbz=cf.GB2Uni(ktbz);
		if (!(ktbz.equals("")))	wheresql+="  and (cp_cpxx1.ktbz='"+ktbz+"')";
	}
	zpjj=request.getParameter("zpjj");
	if (zpjj!=null)
	{
		zpjj=cf.GB2Uni(zpjj);
		if (!(zpjj.equals("")))	wheresql+="  and (cp_cpxx1.zpjj='"+zpjj+"')";
	}
	gcddbh=request.getParameter("gcddbh");
	if (gcddbh!=null)
	{
		gcddbh=cf.GB2Uni(gcddbh);
		if (!(gcddbh.equals("")))	wheresql+="  and (cp_cpxx1.gcddbh='"+gcddbh+"')";
	}
	gckh=request.getParameter("gckh");
	if (gckh!=null)
	{
		gckh=cf.GB2Uni(gckh);
		if (!(gckh.equals("")))	wheresql+=" and  (cp_cpxx1.gckh='"+gckh+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+="  and (cp_cpxx1.dwbh='"+dwbh+"')";
	}
	fhbh=request.getParameter("fhbh");
	if (fhbh!=null)
	{
		fhbh=cf.GB2Uni(fhbh);
		if (!(fhbh.equals("")))	wheresql+="  and (cp_cpxx1.fhbh='"+fhbh+"')";
	}
	yrkph=request.getParameter("yrkph");
	if (yrkph!=null)
	{
		yrkph=cf.GB2Uni(yrkph);
		if (!(yrkph.equals("")))	wheresql+="  and (cp_cpxx1.yrkph='"+yrkph+"')";
	}
	yckph=request.getParameter("yckph");
	if (yckph!=null)
	{
		yckph=cf.GB2Uni(yckph);
		if (!(yckph.equals("")))	wheresql+="  and (cp_cpxx1.yckph='"+yckph+"')";
	}
	ywxh=request.getParameter("ywxh");
	if (ywxh!=null)
	{
		ywxh=cf.GB2Uni(ywxh);
		if (!(ywxh.equals("")))	wheresql+="  and (cp_cpxx1.ywxh='"+ywxh+"')";
	}
	thjlh=request.getParameter("thjlh");
	if (thjlh!=null)
	{
		thjlh=cf.GB2Uni(thjlh);
		if (!(thjlh.equals("")))	wheresql+="  and (cp_cpxx1.thjlh='"+thjlh+"')";
	}
	shjg=request.getParameter("shjg");
	if (shjg!=null)
	{
		shjg=shjg.trim();
		if (!(shjg.equals("")))	wheresql+=" and  (cp_cpxx1.shjg="+shjg+") ";
	}
	tj=request.getParameter("tj");
	if (tj!=null)
	{
		tj=tj.trim();
		if (!(tj.equals("")))	wheresql+=" and  (cp_cpxx1.tj="+tj+") ";
	}
	mddw=request.getParameter("mddw");
	if (mddw!=null)
	{
		mddw=cf.GB2Uni(mddw);
		if (!(mddw.equals("")))	wheresql+="  and (cp_cpxx1.mddw='"+mddw+"')";
	}
	mdck=request.getParameter("mdck");
	if (mdck!=null)
	{
		mdck=cf.GB2Uni(mdck);
		if (!(mdck.equals("")))	wheresql+="  and (cp_cpxx1.mdck='"+mdck+"')";
	}
	lscpbm=request.getParameter("lscpbm");
	if (lscpbm!=null)
	{
		lscpbm=cf.GB2Uni(lscpbm);
		if (!(lscpbm.equals("")))	wheresql+="  and (cp_cpxx1.lscpbm='"+lscpbm+"')";
	}
	gkbz=request.getParameter("gkbz");
	if (gkbz!=null)
	{
		gkbz=cf.GB2Uni(gkbz);
		if (!(gkbz.equals("")))	wheresql+="  and (cp_cpxx1.gkbz='"+gkbz+"')";
	}
	xsrq=request.getParameter("xsrq");
	if (xsrq!=null)
	{
		xsrq=xsrq.trim();
		if (!(xsrq.equals("")))	wheresql+="  and (cp_cpxx1.xsrq>=TO_DATE('"+xsrq+"','YYYY/MM/DD'))";
	}
	xsrq2=request.getParameter("xsrq2");
	if (xsrq2!=null)
	{
		xsrq2=xsrq2.trim();
		if (!(xsrq2.equals("")))	wheresql+="  and (cp_cpxx1.xsrq<=TO_DATE('"+xsrq2+"','YYYY/MM/DD'))";
	}
	sxj=request.getParameter("sxj");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (cp_cpxx1.sxj>="+sxj+") ";
	}
	sxj=request.getParameter("sxj2");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (cp_cpxx1.sxj<="+sxj+") ";
	}
	jyfs=request.getParameter("jyfs");
	if (jyfs!=null)
	{
		jyfs=cf.GB2Uni(jyfs);
		if (!(jyfs.equals("")))	wheresql+="  and (cp_cpxx1.jyfs='"+jyfs+"')";
	}
	thrq=request.getParameter("thrq");
	if (thrq!=null)
	{
		thrq=thrq.trim();
		if (!(thrq.equals("")))	wheresql+="  and (cp_cpxx1.thrq>=TO_DATE('"+thrq+"','YYYY/MM/DD'))";
	}
	thrq=request.getParameter("thrq2");
	if (thrq!=null)
	{
		thrq=thrq.trim();
		if (!(thrq.equals("")))	wheresql+="  and (cp_cpxx1.thrq<=TO_DATE('"+thrq+"','YYYY/MM/DD'))";
	}
	thj=request.getParameter("thj");
	if (thj!=null)
	{
		thj=thj.trim();
		if (!(thj.equals("")))	wheresql+=" and  (cp_cpxx1.thj="+thj+") ";
	}
	xsbddbh=request.getParameter("xsbddbh");
	if (xsbddbh!=null)
	{
		xsbddbh=cf.GB2Uni(xsbddbh);
		if (!(xsbddbh.equals("")))	wheresql+="  and (cp_cpxx1.xsbddbh='"+xsbddbh+"')";
	}
    //获得统计单位的名称
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	String dwmc="";
	try {
		conn=cf.getConnection();    //得到连接
		
		if (szdw!=null && !szdw.equals(""))
		{
			ls_sql="select dwmc from sq_dwxx ";
			ls_sql+=" where dwbh='"+szdw+"'";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				dwmc=rs.getString(1);
			}
			rs.close();
			ps.close();
		}
		else if (!pq.equals(""))
		{
			ls_sql="select dwmc from sq_dwxx ";
			ls_sql+=" where dwbh='"+pq+"'";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				dwmc=rs.getString(1);
			}
			rs.close();
			ps.close();
		}

	}
	catch (Exception e) {
		try{
			out.println("Exception: " + e);
			out.println("sql=" + ls_sql);
		}
		catch (Exception e1){}
	}
	finally 
	{
		try{
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn);    //释放连接
		}
		catch (Exception e){}
	}
%>


<html>
<head>
<title>打印统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center><B><%=dwmc%>销售（品名价位）统计表
  <BR>（<%=xsrq%>--<%=xsrq2%>）</B></center>
<table style='FONT-SIZE:12px' width="100%" border="1" cellspacing="0" cellpadding="1">
  <tr> 
    <td width="8%" align="center">大类</td>
    <td width="20%" align="center">产品名称</td>
    <td width="13%" align="center">价位</td>
    <td width="9%" align="center">数量</td>
    <td width="12%" align="center">零售金额</td>
    <td width="13%" align="center">标签金额</td>
    <td width="13%" align="center">实销金额</td>
    <td width="12%" align="center">备注</td>
  </tr>
<%
	int[] mark={3,3,1,2,2,2,2,0};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
   
	ls_sql="select cpdlmc,xt_plbm.plmc,jwmc,count(*),sum(lsj),sum(bqj),sum(sxj)";
	ls_sql+="  from cp_cpxx1,xt_plbm,v_bk,xt_jwbm,xt_cpdlbm ";
	ls_sql+=wheresql;
	ls_sql+=" and cp_cpxx1.plbm=xt_plbm.plbm(+) and cp_cpxx1.bkbh=v_bk.bkbh(+)";
	ls_sql+=" and xt_plbm.cpdlbm=xt_cpdlbm.cpdlbm";
	ls_sql+=" and v_bk.bkflbm!='501'";
	ls_sql+=" and cp_cpxx1.jwbm=xt_jwbm.jwbm(+)";
	ls_sql+=" group by cpdlmc,xt_plbm.plmc,jwmc,cp_cpxx1.jwbm";
	ls_sql+=" order by cpdlmc,xt_plbm.plmc,cp_cpxx1.jwbm";

//	out.println(ls_sql);
	so.addData(ls_sql);


	ls_sql="select '形象系列',xt_plbm.plmc,jwmc,count(*),sum(lsj),sum(bqj),sum(sxj)";
	ls_sql+="  from cp_cpxx1,xt_plbm,v_bk ,xt_jwbm ";
	ls_sql+=wheresql;
	ls_sql+=" and cp_cpxx1.plbm=xt_plbm.plbm(+) and cp_cpxx1.bkbh=v_bk.bkbh(+)";
	ls_sql+="  and v_bk.bkflbm='501' ";
	ls_sql+=" and cp_cpxx1.jwbm=xt_jwbm.jwbm(+)";
	ls_sql+=" group by xt_plbm.plmc,jwmc,cp_cpxx1.jwbm";
	ls_sql+=" order by xt_plbm.plmc,cp_cpxx1.jwbm";
	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark);

%>

</table>
<table width="100%" border="0" style='FONT-SIZE: 12px'>
  <tr height='30'>
    <td>&nbsp;&nbsp;&nbsp;<b>会计：</b></td>
    <td>&nbsp;&nbsp;&nbsp;<b>复核：</b></td>
    <td>&nbsp;&nbsp;&nbsp;<b>制表：</b></td>
  </tr>
  <tr height='30'>
    <td>&nbsp;&nbsp;&nbsp;<b>结算价：</b></td>
    <td>&nbsp;&nbsp;&nbsp;<b>结算率：</b></td>
    <td>&nbsp;&nbsp;&nbsp;<b></b></td>
  </tr>
</table>


</body>
</html>
