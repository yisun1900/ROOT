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

	String jc_mmydd_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_lxfs2=null;
	String crm_khxx_fwdz2=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_kgrq=null;
	String crm_khxx_jgrq=null;
	String crm_khxx_qyrq=null;
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

	jc_mmydd_khbh=request.getParameter("jc_mmydd_khbh");
	if (jc_mmydd_khbh!=null)
	{
		jc_mmydd_khbh=cf.GB2Uni(jc_mmydd_khbh);
		if (!(jc_mmydd_khbh.equals("")))	wheresql+=" and  (jc_mmydd.khbh='"+jc_mmydd_khbh+"')";
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
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq>=TO_DATE('"+crm_khxx_jgrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq2");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq<=TO_DATE('"+crm_khxx_jgrq+"','YYYY-MM-DD'))";
	}

	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY-MM-DD'))";
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




	String jc_mmydd_yddbh=null;
	String jc_mmydd_clzt=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;

	jc_mmydd_yddbh=request.getParameter("jc_mmydd_yddbh");
	if (jc_mmydd_yddbh!=null)
	{
		jc_mmydd_yddbh=cf.GB2Uni(jc_mmydd_yddbh);
		if (!(jc_mmydd_yddbh.equals("")))	wheresql+=" and  (jc_mmydd.yddbh='"+jc_mmydd_yddbh+"')";
	}
	jc_mmydd_clzt=request.getParameter("jc_mmydd_clzt");
	if (jc_mmydd_clzt!=null)
	{
		jc_mmydd_clzt=cf.GB2Uni(jc_mmydd_clzt);
		if (!(jc_mmydd_clzt.equals("")))	wheresql+=" and  (jc_mmydd.clzt='"+jc_mmydd_clzt+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_mmydd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_mmydd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_mmydd.xmzy='"+xmzy+"')";
	}

	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_mmydd.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_mmydd.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_mmydd.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_mmydd.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_mmydd.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_mmydd.gys like '%"+gys2+"%')";
	}


	String jc_mmydd_wjqk=null;
	String jc_mmydd_wjsgsbz=null;
	String jc_mmydd_htqdr=null;
	String jc_mmydd_lrr=null;
	String jc_mmydd_lrsj=null;
	String jc_mmydd_dwbh=null;
	String jc_mmydd_mmycyybm=null;
	String jc_mmydd_zsycyybm=null;

	jc_mmydd_wjqk=request.getParameter("jc_mmydd_wjqk");
	if (jc_mmydd_wjqk!=null)
	{
		jc_mmydd_wjqk=cf.GB2Uni(jc_mmydd_wjqk);
		if (!(jc_mmydd_wjqk.equals("")))	wheresql+=" and  (jc_mmydd.wjqk='"+jc_mmydd_wjqk+"')";
	}
	jc_mmydd_wjsgsbz=request.getParameter("jc_mmydd_wjsgsbz");
	if (jc_mmydd_wjsgsbz!=null)
	{
		jc_mmydd_wjsgsbz=cf.GB2Uni(jc_mmydd_wjsgsbz);
		if (!(jc_mmydd_wjsgsbz.equals("")))	wheresql+=" and  (jc_mmydd.wjsgsbz='"+jc_mmydd_wjsgsbz+"')";
	}
	jc_mmydd_htqdr=request.getParameter("jc_mmydd_htqdr");
	if (jc_mmydd_htqdr!=null)
	{
		jc_mmydd_htqdr=cf.GB2Uni(jc_mmydd_htqdr);
		if (!(jc_mmydd_htqdr.equals("")))	wheresql+=" and  (jc_mmydd.htqdr='"+jc_mmydd_htqdr+"')";
	}
	jc_mmydd_lrr=request.getParameter("jc_mmydd_lrr");
	if (jc_mmydd_lrr!=null)
	{
		jc_mmydd_lrr=cf.GB2Uni(jc_mmydd_lrr);
		if (!(jc_mmydd_lrr.equals("")))	wheresql+=" and  (jc_mmydd.lrr='"+jc_mmydd_lrr+"')";
	}
	jc_mmydd_lrsj=request.getParameter("jc_mmydd_lrsj");
	if (jc_mmydd_lrsj!=null)
	{
		jc_mmydd_lrsj=jc_mmydd_lrsj.trim();
		if (!(jc_mmydd_lrsj.equals("")))	wheresql+="  and (jc_mmydd.lrsj>=TO_DATE('"+jc_mmydd_lrsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_lrsj=request.getParameter("jc_mmydd_lrsj2");
	if (jc_mmydd_lrsj!=null)
	{
		jc_mmydd_lrsj=jc_mmydd_lrsj.trim();
		if (!(jc_mmydd_lrsj.equals("")))	wheresql+="  and (jc_mmydd.lrsj<=TO_DATE('"+jc_mmydd_lrsj+"','YYYY-MM-DD'))";
	}
	
	jc_mmydd_dwbh=request.getParameter("jc_mmydd_dwbh");
	if (jc_mmydd_dwbh!=null)
	{
		jc_mmydd_dwbh=cf.GB2Uni(jc_mmydd_dwbh);
		if (!(jc_mmydd_dwbh.equals("")))	wheresql+=" and  (jc_mmydd.dwbh='"+jc_mmydd_dwbh+"')";
	}
	jc_mmydd_mmycyybm=request.getParameter("jc_mmydd_mmycyybm");
	if (jc_mmydd_mmycyybm!=null)
	{
		jc_mmydd_mmycyybm=cf.GB2Uni(jc_mmydd_mmycyybm);
		if (!(jc_mmydd_mmycyybm.equals("")))	wheresql+=" and  (jc_mmydd.mmycyybm='"+jc_mmydd_mmycyybm+"')";
	}
	jc_mmydd_zsycyybm=request.getParameter("jc_mmydd_zsycyybm");
	if (jc_mmydd_zsycyybm!=null)
	{
		jc_mmydd_zsycyybm=cf.GB2Uni(jc_mmydd_zsycyybm);
		if (!(jc_mmydd_zsycyybm.equals("")))	wheresql+=" and  (jc_mmydd.zsycyybm='"+jc_mmydd_zsycyybm+"')";
	}



	String jc_mmydd_paidsj=null;
	String jc_mmydd_jhccsj=null;
	String jc_mmydd_sccsj=null;
	String jc_mmydd_htrq=null;
	String jc_mmydd_jhazsj=null;

	jc_mmydd_paidsj=request.getParameter("jc_mmydd_paidsj");
	if (jc_mmydd_paidsj!=null)
	{
		if (!(jc_mmydd_paidsj.equals("")))	wheresql+="  and (jc_mmydd.paidsj>=TO_DATE('"+jc_mmydd_paidsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_paidsj=request.getParameter("jc_mmydd_paidsj2");
	if (jc_mmydd_paidsj!=null)
	{
		if (!(jc_mmydd_paidsj.equals("")))	wheresql+="  and (jc_mmydd.paidsj<=TO_DATE('"+jc_mmydd_paidsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_jhccsj=request.getParameter("jc_mmydd_jhccsj");
	if (jc_mmydd_jhccsj!=null)
	{
		jc_mmydd_jhccsj=jc_mmydd_jhccsj.trim();
		if (!(jc_mmydd_jhccsj.equals("")))	wheresql+="  and (jc_mmydd.jhccsj>=TO_DATE('"+jc_mmydd_jhccsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_jhccsj=request.getParameter("jc_mmydd_jhccsj2");
	if (jc_mmydd_jhccsj!=null)
	{
		jc_mmydd_jhccsj=jc_mmydd_jhccsj.trim();
		if (!(jc_mmydd_jhccsj.equals("")))	wheresql+="  and (jc_mmydd.jhccsj<=TO_DATE('"+jc_mmydd_jhccsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_sccsj=request.getParameter("jc_mmydd_sccsj");
	if (jc_mmydd_sccsj!=null)
	{
		jc_mmydd_sccsj=jc_mmydd_sccsj.trim();
		if (!(jc_mmydd_sccsj.equals("")))	wheresql+="  and (jc_mmydd.sccsj>=TO_DATE('"+jc_mmydd_sccsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_sccsj=request.getParameter("jc_mmydd_sccsj2");
	if (jc_mmydd_sccsj!=null)
	{
		jc_mmydd_sccsj=jc_mmydd_sccsj.trim();
		if (!(jc_mmydd_sccsj.equals("")))	wheresql+="  and (jc_mmydd.sccsj<=TO_DATE('"+jc_mmydd_sccsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_htrq=request.getParameter("jc_mmydd_htrq");
	if (jc_mmydd_htrq!=null)
	{
		jc_mmydd_htrq=jc_mmydd_htrq.trim();
		if (!(jc_mmydd_htrq.equals("")))	wheresql+="  and (jc_mmydd.htrq>=TO_DATE('"+jc_mmydd_htrq+"','YYYY-MM-DD'))";
	}
	jc_mmydd_htrq=request.getParameter("jc_mmydd_htrq2");
	if (jc_mmydd_htrq!=null)
	{
		jc_mmydd_htrq=jc_mmydd_htrq.trim();
		if (!(jc_mmydd_htrq.equals("")))	wheresql+="  and (jc_mmydd.htrq<=TO_DATE('"+jc_mmydd_htrq+"','YYYY-MM-DD'))";
	}
	jc_mmydd_jhazsj=request.getParameter("jc_mmydd_jhazsj");
	if (jc_mmydd_jhazsj!=null)
	{
		jc_mmydd_jhazsj=jc_mmydd_jhazsj.trim();
		if (!(jc_mmydd_jhazsj.equals("")))	wheresql+="  and (jc_mmydd.jhazsj>=TO_DATE('"+jc_mmydd_jhazsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_jhazsj=request.getParameter("jc_mmydd_jhazsj2");
	if (jc_mmydd_jhazsj!=null)
	{
		jc_mmydd_jhazsj=jc_mmydd_jhazsj.trim();
		if (!(jc_mmydd_jhazsj.equals("")))	wheresql+="  and (jc_mmydd.jhazsj<=TO_DATE('"+jc_mmydd_jhazsj+"','YYYY-MM-DD'))";
	}



	String srksj=null;
	String kazsj=null;
	String aztzsj=null;
	String azjssj=null;
	String jc_mmydd_tdsj=null;
	srksj=request.getParameter("srksj");
	if (srksj!=null)
	{
		if (!(srksj.equals("")))	wheresql+="  and (jc_mmydd.srksj>=TO_DATE('"+srksj+"','YYYY-MM-DD'))";
	}
	srksj=request.getParameter("srksj2");
	if (srksj!=null)
	{
		if (!(srksj.equals("")))	wheresql+="  and (jc_mmydd.srksj<=TO_DATE('"+srksj+"','YYYY-MM-DD'))";
	}
	kazsj=request.getParameter("kazsj");
	if (kazsj!=null)
	{
		if (!(kazsj.equals("")))	wheresql+="  and (jc_mmydd.kazsj>=TO_DATE('"+kazsj+"','YYYY-MM-DD'))";
	}
	kazsj=request.getParameter("kazsj2");
	if (kazsj!=null)
	{
		if (!(kazsj.equals("")))	wheresql+="  and (jc_mmydd.kazsj<=TO_DATE('"+kazsj+"','YYYY-MM-DD'))";
	}
	aztzsj=request.getParameter("aztzsj");
	if (aztzsj!=null)
	{
		if (!(aztzsj.equals("")))	wheresql+="  and (jc_mmydd.aztzsj>=TO_DATE('"+aztzsj+"','YYYY-MM-DD'))";
	}
	aztzsj=request.getParameter("aztzsj2");
	if (aztzsj!=null)
	{
		if (!(aztzsj.equals("")))	wheresql+="  and (jc_mmydd.aztzsj<=TO_DATE('"+aztzsj+"','YYYY-MM-DD'))";
	}
	azjssj=request.getParameter("azjssj");
	if (azjssj!=null)
	{
		if (!(azjssj.equals("")))	wheresql+="  and (jc_mmydd.azjssj>=TO_DATE('"+azjssj+"','YYYY-MM-DD'))";
	}
	azjssj=request.getParameter("azjssj2");
	if (azjssj!=null)
	{
		if (!(azjssj.equals("")))	wheresql+="  and (jc_mmydd.azjssj<=TO_DATE('"+azjssj+"','YYYY-MM-DD'))";
	}

	jc_mmydd_tdsj=request.getParameter("jc_mmydd_tdsj");
	if (jc_mmydd_tdsj!=null)
	{
		if (!(jc_mmydd_tdsj.equals("")))	wheresql+="  and (jc_mmydd.tdsj>=TO_DATE('"+jc_mmydd_tdsj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_tdsj=request.getParameter("jc_mmydd_tdsj2");
	if (jc_mmydd_tdsj!=null)
	{
		if (!(jc_mmydd_tdsj.equals("")))	wheresql+="  and (jc_mmydd.tdsj<=TO_DATE('"+jc_mmydd_tdsj+"','YYYY-MM-DD'))";
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

	ls_sql="SELECT  yddbh,clztmc,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.pdgc,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,c.dwmc,ysgcjdmc,cxhdbm,jc_mmydd.sccsj,jc_mmydd.htrq,jc_mmydd.jhazsj,kazsj,aztzsj,jc_mmydd.azkssj,jc_mmydd.azjssj,jc_mmydd.tdsj,TO_CHAR(jc_mmydd.mmzkl) mmzkl,jc_mmydd.dzyy,jc_mmydd.wdzje,jc_mmydd.htje,jc_mmydd.zqzjhze,jc_mmydd.zjhze,DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') wjqk,DECODE(jc_mmydd.wjsgsbz,'Y','已送公司','N','未送公司') wjsgsbz,jc_mmydd.lrr,jc_mmydd.lrsj,jc_mmydd.khbh ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx c,jdm_mmyddzt,dm_gcjdbm  ";
    ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=c.dwbh(+) and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and jdm_mmyddzt.clzt not in('00','01','98','99')";
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
			ls_sql+=" and (jc_mmydd.clgw='"+yhmc+"' OR jc_mmydd.ztjjgw='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:家居设计师
		{
			ls_sql+=" and (jc_mmydd.jjsjs='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:项目专员
		{
			ls_sql+=" and (jc_mmydd.xmzy='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
	}
	ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmyddCxList.jsp","","","/jcjj/dygl/dymmht.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
	pageObj.setEditStr("打印");
/*
//设置显示列
	String[] disColName={"yddbh","clztmc","khxm","hth","fwdz","lxfs","xmzy","clgw","ztjjgw","pdgc","sqdj","htje","zjhze","wjqk","wjsgsbz","lrsj","lrdw"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"yddbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[9]="align='left'";

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	if (yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey={"yddbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey;//设置列参数：coluParm.key的主键
		coluParm.link="/jcjj/mmdd/ViewGcJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	}
	else{
		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey={"yddbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey;//设置列参数：coluParm.key的主键
		coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	}

/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
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
  <B><font size="3">木门预订单－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(360);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">预订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">派单工厂</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="2%">家装设计师</td>
	<td  width="4%">签约店面</td>
	<td  width="2%">工程进度</td>
    <td  width="6%">促销活动</td>
	<td  width="3%">初测日期</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">协商安装时间</td>
	<td  width="3%">通知安装时间</td>
	<td  width="3%">安装开始日期</td>
	<td  width="3%">安装结束日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="2%">折扣率</td>
	<td  width="8%">打折原因</td>
	<td  width="3%">折前合同额</td>
	<td  width="3%">合同金额</td>
	<td  width="3%">增减后总额-折前</td>
	<td  width="3%">增减后总额-折后</td>
	<td  width="3%">五金情况</td>
	<td  width="3%">自购五金件送公司</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">客户编号</td>
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