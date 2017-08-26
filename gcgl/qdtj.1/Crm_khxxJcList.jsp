<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String ckjgbz=(String)session.getAttribute("ckjgbz");
String kkbbz=(String)session.getAttribute("kkbbz");


int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String mmwheresql="";
	String cgwheresql="";
	String jjwheresql="";
	String zcwheresql="";
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








	String jjsjs=null;
	jjsjs=request.getParameter("jjsjs");
	if (jjsjs!=null)
	{
		jjsjs=cf.GB2Uni(jjsjs);
		if (!(jjsjs.equals(""))){
			mmwheresql+=" and  (jc_mmydd.mmcljs='"+jjsjs+"')";
			cgwheresql+=" and  (jc_cgdd.cgsjs='"+jjsjs+"')";
			jjwheresql+=" and  (jc_jjdd.jjsjs='"+jjsjs+"')";
			zcwheresql+=" and  (jc_zcdd.jjsjs='"+jjsjs+"')";
		}
	}
	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals(""))){
			mmwheresql+=" and  (jc_mmydd.pdgcmc='"+gysmc+"')";
			cgwheresql+=" and  (jc_cgdd.pdgcmc='"+gysmc+"')";
			jjwheresql+=" and  (jc_jjdd.pdgcmc='"+gysmc+"')";
			zcwheresql+=" and  (jc_zcdd.ppbm='"+gysmc+"')";
		}
	}
	String gysmc2=null;
	gysmc2=request.getParameter("gysmc2");
	if (gysmc2!=null)
	{
		gysmc2=cf.GB2Uni(gysmc2);
		if (!(gysmc2.equals(""))){
			mmwheresql+=" and  (jc_mmydd.pdgcmc='"+gysmc2+"')";
			cgwheresql+=" and  (jc_cgdd.pdgcmc='"+gysmc2+"')";
			jjwheresql+=" and  (jc_jjdd.pdgcmc='"+gysmc2+"')";
			zcwheresql+=" and  (jc_zcdd.ppbm='"+gysmc2+"')";
		}
	}

	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals(""))){
			mmwheresql+=" and  (jc_mmydd.xmzy='"+xmzy+"')";
			cgwheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
			jjwheresql+=" and  (jc_jjdd.xmzy='"+xmzy+"')";
			zcwheresql+=" and  (jc_zcdd.xmzy='"+xmzy+"')";
		}
	}
	String jcddzt=null;
	jcddzt=request.getParameter("jcddzt");
	if (jcddzt!=null)
	{
		jcddzt=cf.GB2Uni(jcddzt);
		if (!(jcddzt.equals(""))){
			mmwheresql+=" and  (jc_mmydd.clzt='"+jcddzt+"')";
			cgwheresql+=" and  (jc_cgdd.clzt='"+jcddzt+"')";
			jjwheresql+=" and  (jc_jjdd.clzt='"+jcddzt+"')";
			zcwheresql+=" and  (jc_zcdd.clzt='"+jcddzt+"')";
		}
	}


	String sfylx=null;
	sfylx=request.getParameter("sfylx");
	if (sfylx!=null)
	{
		sfylx=cf.GB2Uni(sfylx);
		if ((sfylx.equals("Y")))
		{
			wheresql+=" and  (crm_khxx.ykhlxsj is not null)";
		}
		else if ((sfylx.equals("N"))){
			wheresql+=" and  (crm_khxx.ykhlxsj is null)";
		}
	}
	String jslxfs=null;
	jslxfs=request.getParameter("jslxfs");
	if (jslxfs!=null)
	{
		jslxfs=cf.GB2Uni(jslxfs);
		if (!(jslxfs.equals("")))	wheresql+=" and  (crm_khxx.jslxfs='"+jslxfs+"')";
	}
	String ddrq=null;
	ddrq=request.getParameter("ddrq");
	if (ddrq!=null)
	{
		if (!(ddrq.equals("")))
		{
			mmwheresql+="  and (jc_mmydd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql+="  and (jc_cgdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql+="  and (jc_jjdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql+="  and (jc_zcdd.qhtsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
		}
	}
	ddrq=request.getParameter("ddrq2");
	if (ddrq!=null)
	{
		if (!(ddrq.equals("")))
		{
			mmwheresql+="  and (jc_mmydd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql+="  and (jc_zcdd.qhtsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
		}
	}



	String jcjjcp=request.getParameter("jcjjcp");
	if (jcjjcp.equals("1"))//木门
	{
		ls_sql="SELECT pdgcmc gysmc,clgw,ztjjgw,mmcljs jjsjs,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.cxhdbm,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,ysgcjdmc,'木门' as lx,clztmc,'<A HREF=\"/jcjj/mmdd/ViewJc_mmydd.jsp?yddbh='||jc_mmydd.yddbh||'\" target=\"_blank\">'||jc_mmydd.yddbh||'</A>' ddbhlink,jc_mmydd.xmzy,crm_khxx.ykhlxsj,DECODE(crm_khxx.jslxfs,'1','电话联系','2','发短信','3','不受限制') jslxfs ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,jc_mmydd,jdm_mmyddzt";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and crm_khxx.khbh=jc_mmydd.khbh and jc_mmydd.clzt=jdm_mmyddzt.clzt";
		ls_sql+=wheresql;
		ls_sql+=mmwheresql;
		ls_sql+=" order by khbh";
	}
	else if (jcjjcp.equals("2"))//橱柜
	{
		ls_sql=" SELECT pdgcmc gysmc,clgw,ztjjgw,cgsjs jjsjs,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.cxhdbm,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,ysgcjdmc,'橱柜' as lx,clztmc,'<A HREF=\"/jcjj/cgdd/ViewJc_cgdd.jsp?ddbh='||jc_cgdd.ddbh||'\" target=\"_blank\">'||jc_cgdd.ddbh||'</A>' ddbhlink,jc_cgdd.xmzy,crm_khxx.ykhlxsj,DECODE(crm_khxx.jslxfs,'1','电话联系','2','发短信','3','不受限制') jslxfs  ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,jc_cgdd,jdm_cgddzt";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and crm_khxx.khbh=jc_cgdd.khbh and jc_cgdd.clzt=jdm_cgddzt.clzt";
		ls_sql+=wheresql;
		ls_sql+=cgwheresql;
		ls_sql+=" order by khbh";
	}
	else if (jcjjcp.equals("3"))//家具
	{
		ls_sql=" SELECT pdgcmc gysmc,clgw,ztjjgw,jjsjs,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.cxhdbm,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,ysgcjdmc,'家具' as lx,clztmc,'<A HREF=\"/jcjj/jjdd/ViewJc_jjdd.jsp?ddbh='||jc_jjdd.ddbh||'\" target=\"_blank\">'||jc_jjdd.ddbh||'</A>' ddbhlink,jc_jjdd.xmzy,crm_khxx.ykhlxsj,DECODE(crm_khxx.jslxfs,'1','电话联系','2','发短信','3','不受限制') jslxfs  ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,jc_jjdd,jdm_jjddzt";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and crm_khxx.khbh=jc_jjdd.khbh and jc_jjdd.clzt=jdm_jjddzt.clzt";
		ls_sql+=wheresql;
		ls_sql+=jjwheresql;
		ls_sql+=" order by khbh";
	}
	else if (jcjjcp.equals("4"))//主材
	{
		ls_sql=" SELECT ppbm gysmc,clgw,ztjjgw,jjsjs,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.cxhdbm,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,ysgcjdmc,'主材' as lx,clztmc,'<A HREF=\"/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh='||jc_zcdd.ddbh||'\" target=\"_blank\">'||jc_zcdd.ddbh||'</A>' ddbhlink,jc_zcdd.xmzy,crm_khxx.ykhlxsj,DECODE(crm_khxx.jslxfs,'1','电话联系','2','发短信','3','不受限制') jslxfs  ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,jc_zcdd,jdm_zcddzt";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.clzt=jdm_zcddzt.clzt";
		ls_sql+=wheresql;
		ls_sql+=zcwheresql;
		ls_sql+=" order by khbh";
	}
	else{
		ls_sql="SELECT pdgcmc gysmc,clgw,ztjjgw,mmcljs jjsjs,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.cxhdbm,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,ysgcjdmc,'木门' as lx,clztmc,'<A HREF=\"/jcjj/mmdd/ViewJc_mmydd.jsp?yddbh='||jc_mmydd.yddbh||'\" target=\"_blank\">'||jc_mmydd.yddbh||'</A>' ddbhlink,jc_mmydd.xmzy,crm_khxx.ykhlxsj,DECODE(crm_khxx.jslxfs,'1','电话联系','2','发短信','3','不受限制') jslxfs ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,jc_mmydd,jdm_mmyddzt";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and crm_khxx.khbh=jc_mmydd.khbh and jc_mmydd.clzt=jdm_mmyddzt.clzt";
		ls_sql+=wheresql;
		ls_sql+=mmwheresql;

		ls_sql+=" union ";

		ls_sql+=" SELECT pdgcmc gysmc,clgw,ztjjgw,cgsjs jjsjs,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.cxhdbm,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,ysgcjdmc,'橱柜' as lx,clztmc,'<A HREF=\"/jcjj/cgdd/ViewJc_cgdd.jsp?ddbh='||jc_cgdd.ddbh||'\" target=\"_blank\">'||jc_cgdd.ddbh||'</A>' ddbhlink,jc_cgdd.xmzy,crm_khxx.ykhlxsj,DECODE(crm_khxx.jslxfs,'1','电话联系','2','发短信','3','不受限制') jslxfs  ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,jc_cgdd,jdm_cgddzt";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and crm_khxx.khbh=jc_cgdd.khbh and jc_cgdd.clzt=jdm_cgddzt.clzt";
		ls_sql+=wheresql;
		ls_sql+=cgwheresql;

		ls_sql+=" union ";

		ls_sql+=" SELECT pdgcmc gysmc,clgw,ztjjgw,jjsjs,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.cxhdbm,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,ysgcjdmc,'家具' as lx,clztmc,'<A HREF=\"/jcjj/jjdd/ViewJc_jjdd.jsp?ddbh='||jc_jjdd.ddbh||'\" target=\"_blank\">'||jc_jjdd.ddbh||'</A>' ddbhlink,jc_jjdd.xmzy,crm_khxx.ykhlxsj,DECODE(crm_khxx.jslxfs,'1','电话联系','2','发短信','3','不受限制') jslxfs  ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,jc_jjdd,jdm_jjddzt";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and crm_khxx.khbh=jc_jjdd.khbh and jc_jjdd.clzt=jdm_jjddzt.clzt";
		ls_sql+=wheresql;
		ls_sql+=jjwheresql;

		ls_sql+=" union ";

		ls_sql+=" SELECT ppbm gysmc,clgw,ztjjgw,jjsjs,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.cxhdbm,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,ysgcjdmc,'主材' as lx,clztmc,'<A HREF=\"/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh='||jc_zcdd.ddbh||'\" target=\"_blank\">'||jc_zcdd.ddbh||'</A>' ddbhlink,jc_zcdd.xmzy,crm_khxx.ykhlxsj,DECODE(crm_khxx.jslxfs,'1','电话联系','2','发短信','3','不受限制') jslxfs  ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,jc_zcdd,jdm_zcddzt";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.clzt=jdm_zcddzt.clzt";
		ls_sql+=wheresql;
		ls_sql+=zcwheresql;

		ls_sql+=" order by khbh";
	}
//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxJcList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"lx","ddbhlink","clztmc","gysmc","xmzy","clgw","ztjjgw","jjsjs","khxm","hth","ykhlxsj","jslxfs","fwdz","cxhdbm","sjs","sgd","zjxm","qydm","ysgcjdmc","qyrq"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.alignStr[12]="align='left'";

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("ykhlxsj","1");//列参数对象加入Hash表
	spanColHash.put("jslxfs","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("cxhdbm","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	spanColHash.put("qydm","1");//列参数对象加入Hash表
	spanColHash.put("qyrq","1");//列参数对象加入Hash表
	spanColHash.put("ysgcjdmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<%
if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
	<%
}
else{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">类型</td>
	<td  width="4%">订单编号</td>
	<td  width="6%">订单状态</td>
	<td  width="8%">工厂/品牌</td>
	<td  width="3%">项目专员</td>
	<td  width="3%">驻店家居顾问</td>
	<td  width="3%">展厅家居顾问</td>
	<td  width="3%">家居设计师</td>
	<td  width="3%">客户姓名</td>
	<td  width="5%">合同号</td>
	<td  width="6%">与客户联系时间</td>
	<td  width="5%">客户接受联系方式</td>
	<td  width="16%">房屋地址</td>
	<td  width="5%">参加促销活动</td>
	<td  width="4%">设计师</td>
	<td  width="3%">施工队</td>
	<td  width="3%">工程担当</td>
	<td  width="7%">签约店面</td>
	<td  width="5%">工程进度</td>
	<td  width="5%">签约日期</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>