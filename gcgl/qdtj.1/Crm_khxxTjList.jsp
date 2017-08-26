<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String wheresql="";
	String crm_khxx_khbh=null;
	String crm_khxx_cqbm=null;

	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;

	String crm_khxx_qyrq=null;
	String crm_khxx_kgrq=null;
	String crm_khxx_sjkgrq=null;

	String crm_khxx_jgrq=null;
	String crm_khxx_sjjgrq=null;

	String crm_khxx_gcjdbm=null;
	String crm_khxx_wgbz=null;
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

	String sgdlx=null;
	sgdlx=request.getParameter("sgdlx");
	if (sgdlx!=null)
	{
		sgdlx=cf.GB2Uni(sgdlx);
		if (!(sgdlx.equals("")))	wheresql+=" and  (sq_sgd.sgdlx='"+sgdlx+"')";
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

	String rzsc=null;
	rzsc=request.getParameter("rzsc");
	if (rzsc!=null)
	{
		if (!(rzsc.equals("")))	wheresql+=" and  (crm_khxx.rzsc='"+rzsc+"')";
	}

	String jzbz=null;
	jzbz=request.getParameter("jzbz");
	if (jzbz!=null)
	{
		if (!(jzbz.equals("")))	wheresql+=" and  (crm_khxx.jzbz='"+jzbz+"')";
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
	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4','6'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}
	crm_khxx_wgbz=request.getParameter("crm_khxx_wgbz");
	if (crm_khxx_wgbz!=null)
	{
		if (crm_khxx_wgbz.equals("1"))//1+未完工&2+已开工&3+已完工
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1'))";
		}
		else if (crm_khxx_wgbz.equals("2"))
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('2','3','6'))";
		}
		else if (crm_khxx_wgbz.equals("3"))
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('4','5'))";
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
		if (tgbz.equals("Y"))
		{
			wheresql+=" and  (crm_khxx.tgbz='Y')";
		}
		else if (tgbz.equals("N"))
		{
			wheresql+=" and  (crm_khxx.tgbz='N' )";
		}
		else if (tgbz.equals("W"))
		{
			wheresql+=" and  (crm_khxx.tgbz is null)";
		}
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
		if (!(crm_khxx_lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+crm_khxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_lrsj=request.getParameter("crm_khxx_lrsj2");
	if (crm_khxx_lrsj!=null)
	{
		crm_khxx_lrsj=crm_khxx_lrsj.trim();
		if (!(crm_khxx_lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj<=TO_DATE('"+crm_khxx_lrsj+"','YYYY/MM/DD'))";
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
	String orderstr=groupsql.substring(1);
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=" group by "+groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(crm_khxx.khbh),sum(wdzgce),sum(qye),sum(sjf),sum(fjje),sum(gsfje),ROUND(sum(qye)/count(crm_khxx.khbh)),sum(fwmj)";
	}
%>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj3name+"</td>");
	}

%>
	<td  width="6%">数量</td>
	<td  width="8%">未打折工程额</td>
	<td  width="8%">签约额</td>
	<td  width="8%">设计费</td>
	<td  width="8%">返卷总金额</td>
	<td  width="8%">公司承担返卷额</td>
	<td  width="8%">平均单额</td>
	<td  width="8%">房屋面积</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM crm_khxx,sq_dwxx a, sq_dwxx b,sq_dwxx c,sq_sgd,dm_gcjdbm,dm_khlxbm,dm_cqbm,dm_nlqjbm,dm_ysrbm,dm_zybm,dm_hxbm";
    ls_sql+=" where crm_khxx.fgsbh=a.dwbh(+) and crm_khxx.dwbh=b.dwbh(+) and crm_khxx.rzsc=c.dwbh(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+)";
    ls_sql+=" and crm_khxx.cqbm=dm_cqbm.cqbm(+) ";
    ls_sql+=" and crm_khxx.nlqjbm=dm_nlqjbm.nlqjbm(+) and crm_khxx.ysrbm=dm_ysrbm.ysrbm(+)";
    ls_sql+=" and crm_khxx.zybm=dm_zybm.zybm(+) and crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
	ls_sql+=" order by "+orderstr;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

//	pageObj.alignStr[groupsl+2]="align='left'";


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