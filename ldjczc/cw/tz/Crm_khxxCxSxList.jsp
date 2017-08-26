<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<CENTER >
  <B><font size="3">客户台账查询</font></B>
</CENTER>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面



	String wheresql="";
	String crm_khxx_khbh=null;
	String crm_khxx_cqbm=null;

	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;

	String crm_khxx_qyrq=null;
	String crm_khxx_kgrq=null;
	String crm_khxx_sjkgrq=null;
	String jhwgsj=null;

	String crm_khxx_jgrq=null;
	String crm_khxx_sjjgrq=null;

	String crm_khxx_gcjdbm=null;
	String ybysxmbm=null;
	String zqysxmbm=null;
	String crm_khxx_dwbh=null;

	String crm_khxx_pdclzt=null;
	String crm_khxx_pdsj=null;
	String zzsgd=null;
	String crm_khxx_sgd=null;
	String cxbz=null;
	String crm_khxx_sgbz=null;

	String crm_khxx_zjxm=null;

	String crm_khxx_hdbz=null;

	String crm_khxx_zt=null;
	String crm_khxx_khlxbm=null;
	String crm_khxx_lrsj=null;
	
	
	String sfyywy=request.getParameter("sfyywy");
	if(sfyywy!=null)
	{
		if (sfyywy.equals("Y"))
		{
			wheresql+=" and (crm_khxx.ywy is not null)";
		}
		else{
			wheresql+=" and (crm_khxx.ywy is null)";
		}
	}


	String gdjsjd=null;
	gdjsjd=request.getParameter("gdjsjd");
	if (gdjsjd!=null)
	{
		gdjsjd=cf.GB2Uni(gdjsjd);
		if (!(gdjsjd.equals("")))	wheresql+=" and  (crm_khxx.gdjsjd='"+gdjsjd+"')";
	}

	
	String khjsbz=null;
	khjsbz=request.getParameter("khjsbz");
	if (khjsbz!=null)
	{
		khjsbz=cf.GB2Uni(khjsbz);
		if (khjsbz.equals("N"))
		{
			wheresql+=" and  (crm_khxx.khjsbz in('N','3'))";
		}
		else {
			wheresql+=" and  (crm_khxx.khjsbz not in('N','3'))";
		}
	}
	
	String zzbz=null;
	zzbz=request.getParameter("zzbz");
	if (zzbz!=null)
	{
		zzbz=cf.GB2Uni(zzbz);
		if (!(zzbz.equals("")))	wheresql+=" and  (bdm_bjjbbm.zzbz='"+zzbz+"')";
	}
	
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (bdm_bjjbbm.lx='"+lx+"')";
	}
	
	String jzwkqs=null;
	jzwkqs=request.getParameter("jzwkqs");
	if (jzwkqs!=null)
	{
		jzwkqs=cf.GB2Uni(jzwkqs);
		if (!(jzwkqs.equals("")))	wheresql+=" and  (crm_khxx.jzwkqs='"+jzwkqs+"')";
	}
	
	String ysy=null;
	ysy=request.getParameter("ysy");
	if (ysy!=null)
	{
		ysy=cf.GB2Uni(ysy);
		if (!(ysy.equals("")))	wheresql+=" and  (crm_khxx.ysy='"+ysy+"')";
	}

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_khxx.khjl='"+khjl+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (crm_khxx.clgw='"+clgw+"')";
	}

	String sgdlx=null;
	sgdlx=request.getParameter("sgdlx");
	if (sgdlx!=null)
	{
		sgdlx=cf.GB2Uni(sgdlx);
		if (!(sgdlx.equals("")))	wheresql+=" and  (sq_sgd.sgdlx='"+sgdlx+"')";
	}
	String smhtbh=null;
	smhtbh=request.getParameter("smhtbh");
	if (smhtbh!=null)
	{
		smhtbh=cf.GB2Uni(smhtbh);
		if (!(smhtbh.equals("")))	wheresql+=" and  (crm_khxx.smhtbh='"+smhtbh+"')";
	}

	String crm_khxx_khxm=null;
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	String crm_khxx_khxm2=null;
	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	String crm_khxx_fwdz=null;
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	String crm_khxx_fwdz2=null;
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}
	String crm_khxx_lxfs=null;
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	String crm_khxx_lxfs2=null;
	crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
	if (crm_khxx_lxfs2!=null)
	{
		crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
		if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
	}


	String sfysbx=null;
	sfysbx=request.getParameter("sfysbx");
	if (sfysbx!=null)
	{
		if (!(sfysbx.equals("")))	wheresql+=" and  (crm_khxx.sfysbx='"+sfysbx+"')";
	}
	String bxkssj=null;
	bxkssj=request.getParameter("bxkssj");
	if (bxkssj!=null)
	{
		if (!(bxkssj.equals("")))	wheresql+="  and (crm_khxx.bxkssj>=TO_DATE('"+bxkssj+"','YYYY/MM/DD'))";
	}
	bxkssj=request.getParameter("bxkssj2");
	if (bxkssj!=null)
	{
		if (!(bxkssj.equals("")))	wheresql+="  and (crm_khxx.bxkssj<=TO_DATE('"+bxkssj+"','YYYY/MM/DD'))";
	}

	String bxjzsj=null;
	bxjzsj=request.getParameter("bxjzsj");
	if (bxjzsj!=null)
	{
		if (!(bxjzsj.equals("")))	wheresql+="  and (crm_khxx.bxjzsj>=TO_DATE('"+bxjzsj+"','YYYY/MM/DD'))";
	}
	bxjzsj=request.getParameter("bxjzsj2");
	if (bxjzsj!=null)
	{
		if (!(bxjzsj.equals("")))	wheresql+="  and (crm_khxx.bxjzsj<=TO_DATE('"+bxjzsj+"','YYYY/MM/DD'))";
	}


	String sffj=null;
	sffj=request.getParameter("sffj");
	if (sffj!=null)
	{
		if (!(sffj.equals("")))	wheresql+=" and  (crm_khxx.sffj='"+sffj+"')";
	}

	String sfyrz=null;
	sfyrz=request.getParameter("sfyrz");
	if (sfyrz!=null)
	{
		if (!(sfyrz.equals("")))	wheresql+=" and  (crm_khxx.sfyrz='"+sfyrz+"')";
	}
	
	String xjf=null;
	xjf=request.getParameter("xjf");
	if (xjf!=null)
	{
		xjf=cf.GB2Uni(xjf);
		if (!(xjf.equals("")))	wheresql+=" and  (crm_khxx.xjf='"+xjf+"')";
	}
	String fwmj=null;
	fwmj=request.getParameter("fwmj");
	if (fwmj!=null)
	{
		fwmj=cf.GB2Uni(fwmj);
		if (!(fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj='"+fwmj+"')";
	}
	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		bjjb=cf.GB2Uni(bjjb);
		if (!(bjjb.equals("")))	wheresql+=" and  (crm_khxx.bjjb='"+bjjb+"')";
	}

	String rzsc=null;
	rzsc=request.getParameter("rzsc");
	if (rzsc!=null)
	{
		if (!(rzsc.equals("")))	wheresql+=" and  (crm_khxx.rzsc='"+rzsc+"')";
	}

	String sftd=null;
	sftd=request.getParameter("sftd");
	if (sftd!=null)
	{
		if (sftd.equals("1"))	
		{
			wheresql+=" and  (crm_khxx.zt='3')";
		}
		else if (sftd.equals("2"))	
		{
			wheresql+=" and  (crm_khxx.zt!='3')";
		}
	}

	String dalqbz=null;
	dalqbz=request.getParameter("dalqbz");
	if (dalqbz!=null)
	{
		if (!(dalqbz.equals("")))	wheresql+=" and  (crm_khxx.dalqbz='"+dalqbz+"')";
	}
	String cxhdbm=null;
	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm='"+cxhdbm+"')";
	}

	String xqbm=null;
	xqbm=request.getParameter("xqbm");
	if (xqbm!=null)
	{
		xqbm=cf.GB2Uni(xqbm);
		if (!(xqbm.equals("")))	wheresql+=" and  (crm_khxx.xqbm like '%"+xqbm+"%')";
	}
	String sfzhm=null;
	sfzhm=request.getParameter("sfzhm");
	if (sfzhm!=null)
	{
		sfzhm=cf.GB2Uni(sfzhm);
		if (!(sfzhm.equals("")))	wheresql+=" and  (crm_khxx.sfzhm='"+sfzhm+"')";
	}

	String sffk=null;
	sffk=request.getParameter("sffk");
	if (sffk!=null)
	{
		if (!(sffk.equals("")))	wheresql+=" and  (crm_khxx.sffk='"+sffk+"')";
	}
	String djkh=null;
	djkh=request.getParameter("djkh");
	if (djkh!=null)
	{
		djkh=cf.GB2Uni(djkh);
		if (!(djkh.equals("")))	wheresql+=" and  (crm_khxx.djkh='"+djkh+"')";
	}
	String fkrq=null;
	fkrq=request.getParameter("fkrq");
	if (fkrq!=null)
	{
		if (!(fkrq.equals("")))	wheresql+="  and (crm_khxx.fkrq>=TO_DATE('"+fkrq+"','YYYY/MM/DD'))";
	}
	fkrq=request.getParameter("fkrq2");
	if (fkrq!=null)
	{
		if (!(fkrq.equals("")))	wheresql+="  and (crm_khxx.fkrq<=TO_DATE('"+fkrq+"','YYYY/MM/DD'))";
	}



	String tsbz=null;
	tsbz=request.getParameter("tsbz");
	if (tsbz!=null)
	{
		if (!(tsbz.equals("")))	wheresql+=" and  (crm_khxx.tsbz='"+tsbz+"')";
	}
	String bxbz=null;
	bxbz=request.getParameter("bxbz");
	if (bxbz!=null)
	{
		if (!(bxbz.equals("")))	wheresql+=" and  (crm_khxx.bxbz='"+bxbz+"')";
	}

	String gcsfyq=null;
	gcsfyq=request.getParameter("gcsfyq");
	if (gcsfyq!=null)
	{
		gcsfyq=cf.GB2Uni(gcsfyq);
		if (!(gcsfyq.equals("")))	wheresql+=" and  (crm_khxx.gcsfyq='"+gcsfyq+"')";
	}
	String yqts=null;
	yqts=request.getParameter("yqts");
	if (yqts!=null)
	{
		if (!(yqts.equals("")))	wheresql+=" and  (crm_khxx.yqts>="+yqts+")";
	}
	yqts=request.getParameter("yqts2");
	if (yqts!=null)
	{
		if (!(yqts.equals("")))	wheresql+=" and  (crm_khxx.yqts<="+yqts+")";
	}
	String gcyqyybm=null;
	gcyqyybm=request.getParameter("gcyqyybm");
	if (gcyqyybm!=null)
	{
		gcyqyybm=cf.GB2Uni(gcyqyybm);
		if (!(gcyqyybm.equals("")))	wheresql+=" and  (crm_khxx.khbh in(select khbh from crm_gcyqyymx where gcyqyybm='"+gcyqyybm+"'))";
	}
	String yyyqts=null;
	yyyqts=request.getParameter("yyyqts");
	if (yyyqts!=null)
	{
		if (!(yyyqts.equals("")))	wheresql+=" and  (crm_gcyqyymx.yqts>="+yyyqts+")";
	}
	yyyqts=request.getParameter("yyyqts2");
	if (yyyqts!=null)
	{
		if (!(yyyqts.equals("")))	wheresql+=" and  (crm_gcyqyymx.yqts<="+yyyqts+")";
	}


	String rddqbm=null;
	rddqbm=request.getParameter("rddqbm");
	if (rddqbm!=null)
	{
		rddqbm=cf.GB2Uni(rddqbm);
		if (!(rddqbm.equals("")))	wheresql+=" and  (crm_khxx.rddqbm='"+rddqbm+"')";
	}
	String hxwzbm=null;
	hxwzbm=request.getParameter("hxwzbm");
	if (hxwzbm!=null)
	{
		hxwzbm=cf.GB2Uni(hxwzbm);
		if (!(hxwzbm.equals("")))	wheresql+=" and  (crm_khxx.hxwzbm='"+hxwzbm+"')";
	}
	String ysrbm=null;
	ysrbm=request.getParameter("ysrbm");
	if (ysrbm!=null)
	{
		ysrbm=cf.GB2Uni(ysrbm);
		if (!(ysrbm.equals("")))	wheresql+=" and  (crm_khxx.ysrbm='"+ysrbm+"')";
	}
	String nlqjbm=null;
	nlqjbm=request.getParameter("nlqjbm");
	if (nlqjbm!=null)
	{
		nlqjbm=cf.GB2Uni(nlqjbm);
		if (!(nlqjbm.equals("")))	wheresql+=" and  (crm_khxx.nlqjbm='"+nlqjbm+"')";
	}
	String zybm=null;
	zybm=request.getParameter("zybm");
	if (zybm!=null)
	{
		zybm=cf.GB2Uni(zybm);
		if (!(zybm.equals("")))	wheresql+=" and  (crm_khxx.zybm='"+zybm+"')";
	}

	String sjwjrq=null;
	sjwjrq=request.getParameter("sjwjrq");
	if (sjwjrq!=null)
	{
		if (!(sjwjrq.equals("")))	wheresql+="  and (crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY/MM/DD'))";
	}
	sjwjrq=request.getParameter("sjwjrq2");
	if (sjwjrq!=null)
	{
		if (!(sjwjrq.equals("")))	wheresql+="  and (crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq+"','YYYY/MM/DD'))";
	}

	String yqdwgrq=null;
	yqdwgrq=request.getParameter("yqdwgrq");
	if (yqdwgrq!=null)
	{
		if (!(yqdwgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq+((crm_khxx.jgrq-crm_khxx.kgrq)+NVL(crm_khxx.hzts,0))>=TO_DATE('"+yqdwgrq+"','YYYY/MM/DD'))";
	}
	yqdwgrq=request.getParameter("yqdwgrq2");
	if (yqdwgrq!=null)
	{
		if (!(yqdwgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq+((crm_khxx.jgrq-crm_khxx.kgrq)+NVL(crm_khxx.hzts,0))<=TO_DATE('"+yqdwgrq+"','YYYY/MM/DD'))";
	}




	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('2','3','6'))";
		}
		else if (crm_khxx_wjbz.equals("3"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','6'))";
		}
		else if (crm_khxx_wjbz.equals("4"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('4'))";
		}
		else if (crm_khxx_wjbz.equals("5"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('4','5'))";
		}
		else if (crm_khxx_wjbz.equals("6"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('2','3','4','6'))";
		}
		else if (crm_khxx_wjbz.equals("7"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4','6'))";
		}
		else if (crm_khxx_wjbz.equals("8"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}



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


	String kgzbz=null;
	kgzbz=request.getParameter("kgzbz");
	if (kgzbz!=null)
	{
		if (!(kgzbz.equals("")))	wheresql+=" and  (crm_khxx.kgzbz='"+kgzbz+"')";
	}


	
	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
	}

	String tgbz=null;
	tgbz=request.getParameter("tgbz");
	if (tgbz!=null)
	{
		if (tgbz.equals("W"))
		{
			wheresql+=" and  (crm_khxx.tgbz is null)";
		}
		if (tgbz.equals(""))
		{
		}
		else 
		{
			wheresql+=" and  (crm_khxx.tgbz='"+tgbz+"' )";
		}
	}

	String ywybm=null;
	ywybm=request.getParameter("ywybm");
	if (ywybm!=null)
	{
		if (!(ywybm.equals("")))	wheresql+=" and  (crm_khxx.ywybm='"+ywybm+"')";
	}

	String ywyssxz=null;
	ywyssxz=request.getParameter("ywyssxz");
	if (ywyssxz!=null)
	{
		if (!(ywyssxz.equals("")))	wheresql+=" and  (crm_khxx.ywyssxz='"+ywyssxz+"')";
	}

	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_khxx.ywy='"+ywy+"')";
	}

	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	String sjsbh=null;
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (crm_khxx.sjsbh='"+sjsbh+"')";
	}

	crm_khxx_cqbm=request.getParameter("crm_khxx_cqbm");
	if (crm_khxx_cqbm!=null)
	{
		crm_khxx_cqbm=cf.GB2Uni(crm_khxx_cqbm);
		if (!(crm_khxx_cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+crm_khxx_cqbm+"')";
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



	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq>=TO_DATE('"+crm_khxx_jgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq2");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq<=TO_DATE('"+crm_khxx_jgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjjgrq=request.getParameter("crm_khxx_sjjgrq");
	if (crm_khxx_sjjgrq!=null)
	{
		crm_khxx_sjjgrq=crm_khxx_sjjgrq.trim();
		if (!(crm_khxx_sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq>=TO_DATE('"+crm_khxx_sjjgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjjgrq=request.getParameter("crm_khxx_sjjgrq2");
	if (crm_khxx_sjjgrq!=null)
	{
		crm_khxx_sjjgrq=crm_khxx_sjjgrq.trim();
		if (!(crm_khxx_sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq<=TO_DATE('"+crm_khxx_sjjgrq+"','YYYY/MM/DD'))";
	}









	crm_khxx_gcjdbm=request.getParameter("crm_khxx_gcjdbm");
	if (crm_khxx_gcjdbm!=null)
	{
		crm_khxx_gcjdbm=cf.GB2Uni(crm_khxx_gcjdbm);
		if (!(crm_khxx_gcjdbm.equals("")))	wheresql+=" and  (crm_khxx.gcjdbm='"+crm_khxx_gcjdbm+"')";
	}
	ybysxmbm=request.getParameter("ybysxmbm");
	if (ybysxmbm!=null)
	{
		ybysxmbm=cf.GB2Uni(ybysxmbm);
		if (!(ybysxmbm.equals("")))	wheresql+=" and  (crm_khxx.ybysxmbm='"+ybysxmbm+"')";
	}
	zqysxmbm=request.getParameter("zqysxmbm");
	if (zqysxmbm!=null)
	{
		zqysxmbm=cf.GB2Uni(zqysxmbm);
		if (!(zqysxmbm.equals("")))	wheresql+=" and  (crm_khxx.zqysxmbm='"+zqysxmbm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}



	crm_khxx_pdclzt=request.getParameter("crm_khxx_pdclzt");
	if (crm_khxx_pdclzt!=null)
	{
		crm_khxx_pdclzt=cf.GB2Uni(crm_khxx_pdclzt);
		if (!(crm_khxx_pdclzt.equals("")))	wheresql+=" and  (crm_khxx.pdclzt='"+crm_khxx_pdclzt+"')";
	}
	crm_khxx_pdsj=request.getParameter("crm_khxx_pdsj");
	if (crm_khxx_pdsj!=null)
	{
		crm_khxx_pdsj=crm_khxx_pdsj.trim();
		if (!(crm_khxx_pdsj.equals("")))	wheresql+="  and (crm_khxx.pdsj>=TO_DATE('"+crm_khxx_pdsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_pdsj=request.getParameter("crm_khxx_pdsj2");
	if (crm_khxx_pdsj!=null)
	{
		crm_khxx_pdsj=crm_khxx_pdsj.trim();
		if (!(crm_khxx_pdsj.equals("")))	wheresql+="  and (crm_khxx.pdsj<=TO_DATE('"+crm_khxx_pdsj+"','YYYY/MM/DD'))";
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





	crm_khxx_hdbz=request.getParameter("crm_khxx_hdbz");
	if (crm_khxx_hdbz!=null)
	{
		crm_khxx_hdbz=cf.GB2Uni(crm_khxx_hdbz);
		if (!(crm_khxx_hdbz.equals("")))	wheresql+=" and  (crm_khxx.hdbz='"+crm_khxx_hdbz+"')";
	}




	crm_khxx_zt=request.getParameter("crm_khxx_zt");
	if (crm_khxx_zt!=null)
	{
		crm_khxx_zt=cf.GB2Uni(crm_khxx_zt);
		if (!(crm_khxx_zt.equals("")))	wheresql+=" and  (crm_khxx.zt='"+crm_khxx_zt+"')";
	}
	crm_khxx_khlxbm=request.getParameter("crm_khxx_khlxbm");
	if (crm_khxx_khlxbm!=null)
	{
		crm_khxx_khlxbm=cf.GB2Uni(crm_khxx_khlxbm);
		if (!(crm_khxx_khlxbm.equals("")))	wheresql+=" and  (crm_khxx.khlxbm='"+crm_khxx_khlxbm+"')";
	}


	crm_khxx_lrsj=request.getParameter("crm_khxx_lrsj");
	if (crm_khxx_lrsj!=null)
	{
		crm_khxx_lrsj=crm_khxx_lrsj.trim();
		if (!(crm_khxx_lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+crm_khxx_lrsj+"','YYYY-MM-DD'))";
	}
	crm_khxx_lrsj=request.getParameter("crm_khxx_lrsj2");
	if (crm_khxx_lrsj!=null)
	{
		crm_khxx_lrsj=crm_khxx_lrsj.trim();
		if (!(crm_khxx_lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj<=TO_DATE('"+crm_khxx_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String yjjzsj=null;
	yjjzsj=request.getParameter("yjjzsj");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj>=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	}
	yjjzsj=request.getParameter("yjjzsj2");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj<=TO_DATE('"+yjjzsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String tdyjjzsj=null;
	tdyjjzsj=request.getParameter("tdyjjzsj");
	if (tdyjjzsj!=null)
	{
		tdyjjzsj=tdyjjzsj.trim();
		if (!(tdyjjzsj.equals("")))	wheresql+="  and (crm_khxx.tdyjjzsj>=TO_DATE('"+tdyjjzsj+"','YYYY-MM-DD'))";
	}
	tdyjjzsj=request.getParameter("tdyjjzsj2");
	if (tdyjjzsj!=null)
	{
		tdyjjzsj=tdyjjzsj.trim();
		if (!(tdyjjzsj.equals("")))	wheresql+="  and (crm_khxx.tdyjjzsj<=TO_DATE('"+tdyjjzsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String khxxglsj=request.getParameter("khxxglsj");

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}


	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}


	String myxssl=null;
	myxssl=request.getParameter("myxssl");

%>


<table border="1" width="280%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%" rowspan="2" >部门</td>
	<td  width="2%" rowspan="2">经办人</td>
	<td  width="2%" rowspan="2">序号</td>
	<td  width="4%" rowspan="2">签约日期</td>
	<td  width="4%" rowspan="2">合同号</td>
	<td  width="3%" rowspan="2">合作方</td>
	<td  width="10%" rowspan="2">项目名称</td>
	<td  width="9%" rowspan="2">联系方式</td>

	<td  width="2%" rowspan="2">营业担当</td>
	<td  width="2%" rowspan="2">设计担当</td>
	<td  width="2%" rowspan="2">面积（㎡）</td>

	<td colspan="3">签订额</td>
	<td colspan="3">结算额</td>
	<td colspan="3">毛利</td>
	<td colspan="3">施工周期</td>

	<td  width="3%" rowspan="2">套餐类别</td>
	<td  width="3%" rowspan="2">回单情况</td>
	<td  width="6%" rowspan="2">身份证号</td>
</tr>



<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">人辅</td>
	<td  width="4%">主材</td>
	<td  width="4%">合同额</td>
	<td  width="4%">人辅</td>
	<td  width="4%">主材</td>
	<td  width="4%">结算额</td>
	<td  width="3%">人辅毛利</td>
	<td  width="3%">主材毛利</td>
	<td  width="3%">总毛利</td>
	<td  width="4%">开工日</td>
	<td  width="4%">竣工日</td>
	<td  width="2%">合计</td>
</tr>


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double qye_xj=0;
	double sgcbj_xj=0;

	double gcjsje_xj=0;
	double jscb_xj=0;


	//客户基本信息
	String khbh=null;
	String khxm=null;
	String hth=null;
	String fwdz=null;
//	String sfzhm=null;
	String lxfs=null;
	String sjs=null;
	String getkhjl=null;
	String getywy=null;
//	String fwmj=null;


	String zjxm=null;
	String sgdmc=null;
	String ysgcjdmc=null;
	String bjjbmc=null;
	String dwmc=null;
	String getqyrq=null;
	String getyjjzsj=null;
	String gettdyjjzsj=null;
	String zjxxh=null;
	String kgrq=null;
	String jgrq=null;
	String sjkgrq=null;
	String sjjgrq=null;
	int sjgq=0;
	String hdlxmc=null;
	String jjwjbz="";
	String getkhjsbz=null;

	//合同额
	double wdzgce=0;
	double qye=0;

	//增减项
	double zqljzjx=0;
	double zhljzjx=0;

	double zchtje_xj=0;
	double zchtjezx_xj=0;
	double zchtcb_xj=0;
	double zchtcbzx_xj=0;

	String bgcolorStr=null;
	int row=0;

	ls_sql="SELECT khjsbz,jjwjbz,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sfzhm,crm_khxx.lxfs,sjs,zjxm,sgdmc,khjl,ywy,fwmj,ysgcjdmc,bjjbmc,qyrq,yjjzsj,tdyjjzsj,dwmc,zjxxh,kgrq,jgrq,sjkgrq,sjjgrq,sjjgrq-sjkgrq sjgq";
	ls_sql+=" ,wdzgce,qye,zqljzjx,zhljzjx,hdlxmc";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm,bdm_bjjbbm,dm_hdlxbm";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+)  and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" and crm_khxx.hdbz=dm_hdlxbm.hdlxbm(+) ";
	ls_sql+="and crm_khxx.zt not in ('4','6')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
	ls_sql+=ordersql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		//客户基本信息
		getkhjsbz=cf.fillHtml(rs1.getString("khjsbz"));
		jjwjbz=cf.fillHtml(rs1.getString("jjwjbz"));
		khbh=rs1.getString("khbh");
		khxm=rs1.getString("khxm");
		hth=cf.fillHtml(rs1.getString("hth"));
		fwdz=rs1.getString("fwdz");
		sfzhm=cf.fillHtml(rs1.getString("sfzhm"));
		lxfs=cf.fillHtml(rs1.getString("lxfs"));
		getkhjl=cf.fillHtml(rs1.getString("khjl"));
		getywy=cf.fillHtml(rs1.getString("ywy"));
		sjs=cf.fillHtml(rs1.getString("sjs"));
		getqyrq=cf.fillHtml(rs1.getDate("qyrq"));
		fwmj=cf.fillHtml(rs1.getString("fwmj"));


		zjxm=cf.fillHtml(rs1.getString("zjxm"));
		sgdmc=cf.fillHtml(rs1.getString("sgdmc"));
		ysgcjdmc=cf.fillHtml(rs1.getString("ysgcjdmc"));
		bjjbmc=cf.fillHtml(rs1.getString("bjjbmc"));
		getyjjzsj=cf.fillHtml(rs1.getDate("yjjzsj"));
		gettdyjjzsj=cf.fillHtml(rs1.getDate("tdyjjzsj"));
		dwmc=cf.fillHtml(rs1.getString("dwmc"));
		zjxxh=cf.fillNull(rs1.getString("zjxxh"));
		kgrq=cf.fillHtml(rs1.getDate("kgrq"));
		jgrq=cf.fillHtml(rs1.getDate("jgrq"));
		sjkgrq=cf.fillHtml(rs1.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs1.getDate("sjjgrq"));
		sjgq=rs1.getInt("sjgq");
		hdlxmc=cf.fillHtml(rs1.getString("hdlxmc"));

		//合同额
		wdzgce=rs1.getDouble("wdzgce");
		qye=rs1.getDouble("qye");
		zqljzjx=rs1.getDouble("zqljzjx");
		zhljzjx=rs1.getDouble("zhljzjx");

		row++;

		if (row>Integer.parseInt(myxssl))
		{
			break;
		}

		String fjtcbz="";//价格审核
		ls_sql="select fjtcbz";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
		}
		rs.close();
		ps.close();

		double sgcbj=0;//合同人辅成本价
		double zxsgcbj=0;//最新人辅成本价
		ls_sql=" SELECT  sgcbj,zxsgcbj";
		ls_sql+=" FROM crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sgcbj=rs.getDouble("sgcbj");
			zxsgcbj=rs.getDouble("zxsgcbj");
		}
		rs.close();
		ps.close();

		//主材
		double allzcje=0;
		double allzccb=0;
		ls_sql="SELECT  sum(je+ycf+qtfyje),sum(cbj*sl)";
		ls_sql+=" FROM bj_khzcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			allzcje=rs.getDouble(1);
			allzccb=rs.getDouble(2);
		}
		rs.close();
		ps.close();


		//主材其它费金额
		double zcqtfje=0;
		ls_sql="SELECT sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zcqtfje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		//主材其它费成本
		double zcqtfcb=0;
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
		ls_sql+=" and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zcqtfcb+=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
		ls_sql+=" and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zcqtfcb+=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double zchtje=0;//合同主材销售额
		double zchtcb=0;//合同主材成本
		zchtje=cf.round(allzcje+zcqtfje,2);
		zchtcb=cf.round(allzccb+zcqtfcb,2);


		double gcjsje=0;//人辅结算额
		double zchtjezx=0;//结算主材销售额
		double zchtcbzx=0;//结算主材成本
		if (getkhjsbz.equals("Y"))//客户结算
		{
			//主材
			allzcje=0;
			allzccb=0;
			ls_sql="SELECT  sum(je+ycf+qtfyje),sum(cbj*sl)";
			ls_sql+=" FROM bj_khzcmxnew";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				allzcje=rs.getDouble(1);
				allzccb=rs.getDouble(2);
			}
			rs.close();
			ps.close();


			if (!zjxxh.equals(""))
			{
				//主材其它费金额
				zcqtfje=0;
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"'";
				ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					zcqtfje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//主材其它费成本
				zcqtfcb=0;
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"'";
				ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
				ls_sql+=" and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zcqtfcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"'";
				ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
				ls_sql+=" and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zcqtfcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else{
				//主材其它费金额
				zcqtfje=0;
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					zcqtfje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//主材其它费成本
				zcqtfcb=0;
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
				ls_sql+=" and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zcqtfcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
				ls_sql+=" and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zcqtfcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}

			zchtjezx=cf.round(allzcje+zcqtfje,2);
			zchtcbzx=cf.round(allzccb+zcqtfcb,2);
			gcjsje=cf.round(qye+zchtje,2);
		}
	
		
		double mll=0;//最新人辅成本价
		if (qye!=0)
		{
			mll=(qye-sgcbj)*100/qye;
		}
		mll=cf.round(mll,2);

		double zchtml=0;//主材合同毛利
		if (zchtje!=0)
		{
			zchtml=cf.round((zchtje-zchtcb)*100/zchtje,2);
		}

		double khhtml=0;//客户合同毛利
		if (!fjtcbz.equals("Y"))//价格未审核，主材成本不正确
		{
			zchtje=0;
			zchtcb=0;

			zchtjezx=0;
			zchtcbzx=0;

			zchtml=0;

			khhtml=mll;
		}
		else{
			if ((qye+zchtje)!=0)
			{
				khhtml=((qye+zchtje)-(sgcbj+zchtcb))*100/(qye+zchtje);
			}
			khhtml=cf.round(khhtml,2);
		}



		qye_xj+=qye;
		gcjsje_xj+=gcjsje;

		sgcbj_xj+=sgcbj;
		jscb_xj+=zxsgcbj;


		zchtje_xj+=zchtje;
		zchtjezx_xj+=zchtjezx;

		zchtcb_xj+=zchtcb;
		zchtcbzx_xj+=zchtcbzx;

	
		if (row%2==1)
		{
		   bgcolorStr="#FFFFFF";
		}
		else{
		   bgcolorStr="#E8E8FF";
		}

		%>
		<tr bgcolor="<%=bgcolorStr%>"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td><%=dwmc%></td>
			<td><%=getkhjl%></td>
			<td><%=row%></td>
			<td><%=getqyrq%></td>
			<td><%=hth%></td>
			<td><A HREF="/khxx/ViewMllCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=lxfs%></td>

			<td><%=getywy%></td>
			<td><%=sjs%></td>
			<td><%=fwmj%></td>

			<td><%=qye%></td>
			<td><%=zchtje%></td>
			<td><%=cf.round(qye+zchtje,2)%></td>

			<td><%=gcjsje%></td>
			<td><%=zchtjezx%></td>
			<td><%=cf.round(gcjsje+zchtjezx,2)%></td>

			<td><%=mll%>%</td>
			<td><%=zchtml%>%</td>
			<td><%=khhtml%>%</td>

			<td><%=sjkgrq%></td>
			<td><%=sjjgrq%></td>
			<td><%=sjgq%></td>
			
			<td><%=bjjbmc%></td>
			<td><%=hdlxmc%></td>
			<td><%=sfzhm%></td>

		</tr>
		<%
	}
	rs1.close();
	ps1.close();



	double mll=0;//最新人辅成本价
	if (qye_xj!=0)
	{
		mll=(qye_xj-sgcbj_xj)*100/qye_xj;
	}
	mll=cf.round(mll,2);

	double zchtml=0;//主材合同毛利
	if (zchtje_xj!=0)
	{
		zchtml=cf.round((zchtje_xj-zchtcb_xj)*100/zchtje_xj,2);
	}

	double khhtml=0;//客户合同毛利
	if ((qye_xj+zchtje_xj)!=0)
	{
		khhtml=((qye_xj+zchtje_xj)-(sgcbj_xj+zchtcb_xj))*100/(qye_xj+zchtje_xj);
	}
	khhtml=cf.round(khhtml,2);

%>
<tr bgcolor="<%=bgcolorStr%>"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2">小 计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>

	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>

	<td><%=cf.formatDouble(qye_xj)%></td>
	<td><%=cf.formatDouble(zchtje_xj)%></td>
	<td><%=cf.formatDouble(qye_xj+zchtje_xj)%></td>

	<td><%=cf.formatDouble(gcjsje_xj)%></td>
	<td><%=cf.formatDouble(zchtjezx_xj)%></td>
	<td><%=cf.formatDouble(gcjsje_xj+zchtjezx_xj)%></td>


	<td><%=mll%>%</td>
	<td><%=zchtml%>%</td>
	<td><%=khhtml%>%</td>

	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>

</tr>
</table>
</body>
</html>

<script>
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}</script> 

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

