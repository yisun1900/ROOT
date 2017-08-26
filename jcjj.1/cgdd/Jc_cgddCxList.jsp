<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String zwbm=(String)session.getAttribute("zwbm");//08:家居顾问;10:项目专员;12:家居设计师;18:木门测量师
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//项目专员过滤
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//家居顾问过滤
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//家居设计师过滤

if (zwbm.equals("10"))//10:项目专员
{
	if (xmzyglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:家居顾问
{
	if (jjgwglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:家居设计师
{
	if (jjsjsglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}


int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String jc_cgdd_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_lxfs2=null;
	String crm_khxx_fwdz2=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_kgrq=null;
	String cxhdbm=null;

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_cgdd_khbh=request.getParameter("jc_cgdd_khbh");
	if (jc_cgdd_khbh!=null)
	{
		jc_cgdd_khbh=cf.GB2Uni(jc_cgdd_khbh);
		if (!(jc_cgdd_khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+jc_cgdd_khbh+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}


	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}


	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
	if (crm_khxx_lxfs2!=null)
	{
		crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
		if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
	}
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}


	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}

	
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+crm_khxx_kgrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq2");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+crm_khxx_kgrq+"','YYYY-MM-DD'))";
	}

	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm='"+cxhdbm+"')";
	}

	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}



	String jc_cgdd_ddbh=null;
	String jc_cgdd_clzt=null;
	jc_cgdd_ddbh=request.getParameter("jc_cgdd_ddbh");
	if (jc_cgdd_ddbh!=null)
	{
		jc_cgdd_ddbh=cf.GB2Uni(jc_cgdd_ddbh);
		if (!(jc_cgdd_ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+jc_cgdd_ddbh+"')";
	}
	jc_cgdd_clzt=request.getParameter("jc_cgdd_clzt");
	if (jc_cgdd_clzt!=null)
	{
		jc_cgdd_clzt=cf.GB2Uni(jc_cgdd_clzt);
		if (!(jc_cgdd_clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+jc_cgdd_clzt+"')";
	}


	String sfpsjs=null;
	sfpsjs=request.getParameter("sfpsjs");
	if (sfpsjs!=null)
	{
		sfpsjs=cf.GB2Uni(sfpsjs);
		if (!(sfpsjs.equals("")))	wheresql+=" and  (jc_cgdd.sfpsjs='"+sfpsjs+"')";
	}
	String cgsjs=null;
	cgsjs=request.getParameter("cgsjs");
	if (cgsjs!=null)
	{
		cgsjs=cf.GB2Uni(cgsjs);
		if (!(cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs='"+cgsjs+"')";
	}


	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
	}

	String jctdyybm=null;
	jctdyybm=request.getParameter("jctdyybm");
	if (jctdyybm!=null)
	{
		jctdyybm=cf.GB2Uni(jctdyybm);
		if (!(jctdyybm.equals("")))	wheresql+=" and  (jc_cgdd.jctdyybm='"+jctdyybm+"')";
	}


	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_cgdd.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_cgdd.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_cgdd.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_cgdd.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_cgdd.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_cgdd.gys like '%"+gys2+"%')";
	}


	String pgcsj=null;
	pgcsj=request.getParameter("pgcsj");
	if (pgcsj!=null)
	{
		pgcsj=cf.GB2Uni(pgcsj);
		if (!(pgcsj.equals("")))	wheresql+="  and (jc_cgdd.pgcsj>=TO_DATE('"+pgcsj+"','YYYY/MM/DD'))";
	}
	pgcsj=request.getParameter("pgcsj2");
	if (pgcsj!=null)
	{
		pgcsj=cf.GB2Uni(pgcsj);
		if (!(pgcsj.equals("")))	wheresql+="  and (jc_cgdd.pgcsj<=TO_DATE('"+pgcsj+"','YYYY/MM/DD'))";
	}

	String pdsj=null;
	pdsj=request.getParameter("pdsj");
	if (pdsj!=null)
	{
		pdsj=cf.GB2Uni(pdsj);
		if (!(pdsj.equals("")))	wheresql+="  and (jc_cgdd.pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		pdsj=cf.GB2Uni(pdsj);
		if (!(pdsj.equals("")))	wheresql+="  and (jc_cgdd.pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}


	String jc_cgdd_jhccsj=null;
	String jc_cgdd_sccsj=null;
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj>=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj2");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj<=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}

	jc_cgdd_sccsj=request.getParameter("jc_cgdd_sccsj");
	if (jc_cgdd_sccsj!=null)
	{
		jc_cgdd_sccsj=jc_cgdd_sccsj.trim();
		if (!(jc_cgdd_sccsj.equals("")))	wheresql+="  and (jc_cgdd.sccsj>=TO_DATE('"+jc_cgdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sccsj=request.getParameter("jc_cgdd_sccsj2");
	if (jc_cgdd_sccsj!=null)
	{
		jc_cgdd_sccsj=jc_cgdd_sccsj.trim();
		if (!(jc_cgdd_sccsj.equals("")))	wheresql+="  and (jc_cgdd.sccsj<=TO_DATE('"+jc_cgdd_sccsj+"','YYYY/MM/DD'))";
	}



	String jc_cgdd_jhfcsj=null;
	String jc_cgdd_sfcsj=null;
	jc_cgdd_jhfcsj=request.getParameter("jc_cgdd_jhfcsj");
	if (jc_cgdd_jhfcsj!=null)
	{
		jc_cgdd_jhfcsj=jc_cgdd_jhfcsj.trim();
		if (!(jc_cgdd_jhfcsj.equals("")))	wheresql+="  and (jc_cgdd.jhfcsj>=TO_DATE('"+jc_cgdd_jhfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhfcsj=request.getParameter("jc_cgdd_jhfcsj2");
	if (jc_cgdd_jhfcsj!=null)
	{
		jc_cgdd_jhfcsj=jc_cgdd_jhfcsj.trim();
		if (!(jc_cgdd_jhfcsj.equals("")))	wheresql+="  and (jc_cgdd.jhfcsj<=TO_DATE('"+jc_cgdd_jhfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sfcsj=request.getParameter("jc_cgdd_sfcsj");
	if (jc_cgdd_sfcsj!=null)
	{
		jc_cgdd_sfcsj=jc_cgdd_sfcsj.trim();
		if (!(jc_cgdd_sfcsj.equals("")))	wheresql+="  and (jc_cgdd.sfcsj>=TO_DATE('"+jc_cgdd_sfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sfcsj=request.getParameter("jc_cgdd_sfcsj2");
	if (jc_cgdd_sfcsj!=null)
	{
		jc_cgdd_sfcsj=jc_cgdd_sfcsj.trim();
		if (!(jc_cgdd_sfcsj.equals("")))	wheresql+="  and (jc_cgdd.sfcsj<=TO_DATE('"+jc_cgdd_sfcsj+"','YYYY/MM/DD'))";
	}



	String jc_cgdd_qhtsj=null;
	jc_cgdd_qhtsj=request.getParameter("jc_cgdd_qhtsj");
	if (jc_cgdd_qhtsj!=null)
	{
		jc_cgdd_qhtsj=jc_cgdd_qhtsj.trim();
		if (!(jc_cgdd_qhtsj.equals("")))	wheresql+="  and (jc_cgdd.qhtsj>=TO_DATE('"+jc_cgdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_qhtsj=request.getParameter("jc_cgdd_qhtsj2");
	if (jc_cgdd_qhtsj!=null)
	{
		jc_cgdd_qhtsj=jc_cgdd_qhtsj.trim();
		if (!(jc_cgdd_qhtsj.equals("")))	wheresql+="  and (jc_cgdd.qhtsj<=TO_DATE('"+jc_cgdd_qhtsj+"','YYYY/MM/DD'))";
	}


	String jc_cgdd_jhazrq=null;
	String jc_cgdd_sazrq=null;
	jc_cgdd_jhazrq=request.getParameter("jc_cgdd_jhazrq");
	if (jc_cgdd_jhazrq!=null)
	{
		jc_cgdd_jhazrq=jc_cgdd_jhazrq.trim();
		if (!(jc_cgdd_jhazrq.equals("")))	wheresql+="  and (jc_cgdd.jhazrq>=TO_DATE('"+jc_cgdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhazrq=request.getParameter("jc_cgdd_jhazrq2");
	if (jc_cgdd_jhazrq!=null)
	{
		jc_cgdd_jhazrq=jc_cgdd_jhazrq.trim();
		if (!(jc_cgdd_jhazrq.equals("")))	wheresql+="  and (jc_cgdd.jhazrq<=TO_DATE('"+jc_cgdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sazrq=request.getParameter("jc_cgdd_sazrq");
	if (jc_cgdd_sazrq!=null)
	{
		jc_cgdd_sazrq=jc_cgdd_sazrq.trim();
		if (!(jc_cgdd_sazrq.equals("")))	wheresql+="  and (jc_cgdd.sazrq>=TO_DATE('"+jc_cgdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sazrq=request.getParameter("jc_cgdd_sazrq2");
	if (jc_cgdd_sazrq!=null)
	{
		jc_cgdd_sazrq=jc_cgdd_sazrq.trim();
		if (!(jc_cgdd_sazrq.equals("")))	wheresql+="  and (jc_cgdd.sazrq<=TO_DATE('"+jc_cgdd_sazrq+"','YYYY/MM/DD'))";
	}


	String jc_cgdd_lrsj=null;
	jc_cgdd_lrsj=request.getParameter("jc_cgdd_lrsj");
	if (jc_cgdd_lrsj!=null)
	{
		jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
		if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj>=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_lrsj=request.getParameter("jc_cgdd_lrsj2");
	if (jc_cgdd_lrsj!=null)
	{
		jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
		if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
	}
	String jc_cgdd_tdsj=null;
	jc_cgdd_tdsj=request.getParameter("jc_cgdd_tdsj");
	if (jc_cgdd_tdsj!=null)
	{
		if (!(jc_cgdd_tdsj.equals("")))	wheresql+="  and (jc_cgdd.tdsj>=TO_DATE('"+jc_cgdd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_tdsj=request.getParameter("jc_cgdd_tdsj2");
	if (jc_cgdd_tdsj!=null)
	{
		if (!(jc_cgdd_tdsj.equals("")))	wheresql+="  and (jc_cgdd.tdsj<=TO_DATE('"+jc_cgdd_tdsj+"','YYYY/MM/DD'))";
	}


	String jc_cgdd_dwbh=null;
	String jc_cgdd_lrr=null;
	jc_cgdd_lrr=request.getParameter("jc_cgdd_lrr");
	if (jc_cgdd_lrr!=null)
	{
		jc_cgdd_lrr=cf.GB2Uni(jc_cgdd_lrr);
		if (!(jc_cgdd_lrr.equals("")))	wheresql+=" and  (jc_cgdd.lrr='"+jc_cgdd_lrr+"')";
	}
	jc_cgdd_dwbh=request.getParameter("jc_cgdd_dwbh");
	if (jc_cgdd_dwbh!=null)
	{
		jc_cgdd_dwbh=cf.GB2Uni(jc_cgdd_dwbh);
		if (!(jc_cgdd_dwbh.equals("")))	wheresql+=" and  (jc_cgdd.dwbh='"+jc_cgdd_dwbh+"')";
	}


	String sdks=request.getParameter("sdks");
	if (sdks!=null)
	{
		sdks=cf.GB2Uni(sdks);
		if (!(sdks.equals("")))	wheresql+=" and  (jc_cgdd.sdks='"+sdks+"')";
	}
	String cghs=request.getParameter("cghs");
	if (cghs!=null)
	{
		cghs=cf.GB2Uni(cghs);
		if (!(cghs.equals("")))	wheresql+=" and  (jc_cgdd.cghs='"+cghs+"')";
	}
	String xtbc=request.getParameter("xtbc");
	if (xtbc!=null)
	{
		xtbc=cf.GB2Uni(xtbc);
		if (!(xtbc.equals("")))	wheresql+=" and  (jc_cgdd.xtbc='"+xtbc+"')";
	}
	String tmpp=request.getParameter("tmpp");
	if (tmpp!=null)
	{
		tmpp=cf.GB2Uni(tmpp);
		if (!(tmpp.equals("")))	wheresql+=" and  (jc_cgdd.tmpp='"+tmpp+"')";
	}
	String tmhs=request.getParameter("tmhs");
	if (tmhs!=null)
	{
		tmhs=cf.GB2Uni(tmhs);
		if (!(tmhs.equals("")))	wheresql+=" and  (jc_cgdd.tmhs='"+tmhs+"')";
	}
	String blcz=request.getParameter("blcz");
	if (blcz!=null)
	{
		blcz=cf.GB2Uni(blcz);
		if (!(blcz.equals("")))	wheresql+=" and  (jc_cgdd.blcz='"+blcz+"')";
	}
	String jiaolian=request.getParameter("jiaolian");
	if (jiaolian!=null)
	{
		jiaolian=cf.GB2Uni(jiaolian);
		if (!(jiaolian.equals("")))	wheresql+=" and  (jc_cgdd.jiaolian='"+jiaolian+"')";
	}


	String ycclzt=request.getParameter("ycclzt");
	if (ycclzt!=null)
	{
		ycclzt=cf.GB2Uni(ycclzt);
		if (!(ycclzt.equals("")))	wheresql+=" and  (jc_cgdd.ycclzt='"+ycclzt+"')";
	}
	String ycyybm=request.getParameter("ycyybm");
	if (ycyybm!=null)
	{
		ycyybm=cf.GB2Uni(ycyybm);
		if (!(ycyybm.equals("")))	wheresql+=" and  (jc_cgdd.ycyybm='"+ycyybm+"')";
	}
	String zsycyybm=request.getParameter("zsycyybm");
	if (zsycyybm!=null)
	{
		zsycyybm=cf.GB2Uni(zsycyybm);
		if (!(zsycyybm.equals("")))	wheresql+=" and  (jc_cgdd.zsycyybm='"+zsycyybm+"')";
	}


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

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT jc_cgdd.ddbh,clztmc,ysgcjdmc,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh,crm_khxx.sjs,DECODE(jc_cgdd.sfpsjs,'1','是','2','否') sfpsjs, jc_cgdd.cgsjs,sq_dwxx.dwmc dm,cxhdbm,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.tdsj,jc_cgdd.pgcsj,jc_cgdd.pdgc,jc_cgdd.pdgcmc,jc_cgdd.gys,jc_cgdd.ppmc,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,jc_cgdd.dj,TO_CHAR(jc_cgdd.cgzkl) cgzkl,TO_CHAR(jc_cgdd.tmzkl) tmzkl,TO_CHAR(jc_cgdd.wjzkl) wjzkl,TO_CHAR(jc_cgdd.dqzkl) dqzkl,jc_cgdd.dzyy,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.wdzje,jc_cgdd.zqgtbfje,jc_cgdd.zqtmbfje,jc_cgdd.zqwjhtze,jc_cgdd.zqdqhtze   ,jc_cgdd.zjhze,jc_cgdd.gtzjje,jc_cgdd.tmzjje,jc_cgdd.wjzjje,jc_cgdd.dqzjje ,jc_cgdd.zqzjhze,jc_cgdd.zqgtzjje,jc_cgdd.zqtmzjje,jc_cgdd.zqwjzjje,jc_cgdd.zqdqzjje  ,jc_cgdd.lrr,jc_cgdd.lrsj,jc_cgdd.khbh ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx,crm_khxx,dm_gcjdbm,sq_bzxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)  ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
	ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and jc_cgdd.clzt in('19','21','22','23','25','27','29','30','31','33','35')";
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
	}
	else{
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面 
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (zwbm.equals("08"))//08:家居顾问
		{
			ls_sql+=" and (jc_cgdd.clgw='"+yhmc+"' OR jc_cgdd.ztjjgw='"+yhmc+"' OR jc_cgdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:家居设计师
		{
			ls_sql+=" and (jc_cgdd.cgsjs='"+yhmc+"' OR jc_cgdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:项目专员
		{
			ls_sql+=" and (jc_cgdd.xmzy='"+yhmc+"' OR jc_cgdd.lrr='"+yhmc+"')";
		}
	}

	ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgddCxList.jsp","","ExpImp.jsp","/jcjj/dygl/cght.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
	pageObj.setEditStr("打印");
	pageObj.setViewStr("导出");



//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	if (yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
		coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	}
	else{
		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey;//设置列参数：coluParm.key的主键
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
		coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	}
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">橱柜订单－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(700);
%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="110px">&nbsp;</td>
	<td  width="70px">订单编号</td>
	<td  width="120px">处理状态</td>
	<td  width="90px">工程进度</td>
	<td  width="100px">客户姓名</td>
	<td  width="70px">合同号</td>
	<td  width="310px">房屋地址</td>
	<td  width="120px">班长</td>
	<td  width="290px">班长电话</td>
	<td  width="80px">家装设计师</td>
	<td  width="70px">需派设计师 </td>
	<td  width="70px">家居设计师</td>
	<td  width="160px">签约店面</td>
    <td  width="290px">促销活动</td>
	<td  width="70px">项目专员</td>
	<td  width="70px">驻店家居顾问</td>
	<td  width="70px">展厅家居顾问</td>
	<td  width="90px">初测日期</td>
	<td  width="90px">复测日期</td>
	<td  width="90px">签约日期</td>
	<td  width="90px">合同安装日期</td>
	<td  width="90px">安装开始日期</td>
	<td  width="90px">安装完成日期</td>
	<td  width="90px">确认退单日期</td>
	<td  width="90px">派工厂时间</td>
    <td  width="70px">所派工厂编号</td>
    <td  width="220px">工厂名称</td>
    <td  width="220px">供应商</td>
    <td  width="220px">品牌</td>
    <td  width="180px">橱柜款式</td>
    <td  width="180px">箱体板材</td>
    <td  width="180px">橱柜花色</td>
    <td  width="180px">台面品牌</td>
    <td  width="180px">台面花色</td>
    <td  width="180px">玻璃材质</td>
    <td  width="180px">铰链</td>
	<td  width="80px">收取定金</td>
	<td  width="80px">柜体折扣率</td>
	<td  width="80px">台面折扣率</td>
	<td  width="80px">五金折扣率</td>
	<td  width="80px">电器折扣率</td>
	<td  width="400px">打折原因</td>
	<td  width="120px"><font color="#000099"><strong>合同总额</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>柜体合同金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>台面合同金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>五金合同金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>电器合同金额-折后</strong></font></td>
	<td  width="120px"><strong>未打折合同额</strong></td>
	<td  width="120px"><strong>柜体合同金额-折前</strong></td>
	<td  width="120px"><strong>台面合同金额-折前</strong></td>
	<td  width="120px"><strong>五金合同金额-折前</strong></td>
	<td  width="120px"><strong>电器合同金额-折前</strong></td>
	<td  width="120px"><font color="#000099"><strong>增减后总额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>柜体增减后金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>台面增减后金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>五金增减后金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>电器增减后金额-折后</strong></font></td>
	<td  width="120px"><strong>增减后总额-折前</strong></td>
	<td  width="120px"><strong>柜体增减后金额-折前</strong></td>
	<td  width="120px"><strong>台面增减后金额-折前</strong></td>
	<td  width="120px"><strong>五金增减后金额-折前</strong></td>
	<td  width="120px"><strong>电器增减后金额-折前</strong></td>
	<td  width="70px">录入人</td>
	<td  width="90px">录入时间</td>
	<td  width="60px">客户编号</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>