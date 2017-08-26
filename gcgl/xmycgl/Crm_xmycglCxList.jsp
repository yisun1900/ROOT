<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String gj=null;
	gj=request.getParameter("gj");
	if (gj!=null)
	{
		gj=cf.GB2Uni(gj);
		if (!(gj.equals("")))	wheresql+=" and  (crm_khxx.gj='"+gj+"')";
	}
	String dd=null;
	dd=request.getParameter("dd");
	if (dd!=null)
	{
		dd=cf.GB2Uni(dd);
		if (!(dd.equals("")))	wheresql+=" and  (crm_khxx.dd='"+dd+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	
	
	String crm_xmycgl_djbh=null;
	String crm_xmycgl_cxwtsj=null;
	String crm_xmycgl_dsr=null;
	String crm_xmycgl_zt=null;
	String crm_xmycgl_lrr=null;
	String crm_xmycgl_lrsj=null;
	String crm_xmycgl_jjfazdr=null;
	String crm_xmycgl_jjfazdsj=null;
	String crm_xmycgl_jjfashr=null;
	String crm_xmycgl_jjfashsj=null;
	String crm_xmycgl_clqklrr=null;
	String crm_xmycgl_clqklrsj=null;
	String crm_xmycgl_wtsfjj=null;
	String crm_xmycgl_tgsqr=null;
	String crm_xmycgl_tgsqsj=null;
	String crm_xmycgl_tgshr=null;
	String crm_xmycgl_tgshsj=null;
	String crm_xmycgl_tgshjg=null;
	String crm_xmycgl_tgyybm=null;
	String crm_xmycgl_tgkssj=null;
	String crm_xmycgl_gjfgsj=null;
	String crm_xmycgl_tglrr=null;
	String crm_xmycgl_tglrsj=null;
	String crm_xmycgl_sjfgsj=null;
	String crm_xmycgl_fglrr=null;
	String crm_xmycgl_fglrsj=null;
	crm_xmycgl_djbh=request.getParameter("crm_xmycgl_djbh");
	if (crm_xmycgl_djbh!=null)
	{
		crm_xmycgl_djbh=cf.GB2Uni(crm_xmycgl_djbh);
		if (!(crm_xmycgl_djbh.equals("")))	wheresql+=" and  (crm_xmycgl.djbh='"+crm_xmycgl_djbh+"')";
	}
	crm_xmycgl_cxwtsj=request.getParameter("crm_xmycgl_cxwtsj");
	if (crm_xmycgl_cxwtsj!=null)
	{
		crm_xmycgl_cxwtsj=crm_xmycgl_cxwtsj.trim();
		if (!(crm_xmycgl_cxwtsj.equals("")))	wheresql+="  and (crm_xmycgl.cxwtsj>=TO_DATE('"+crm_xmycgl_cxwtsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_cxwtsj=request.getParameter("crm_xmycgl_cxwtsj2");
	if (crm_xmycgl_cxwtsj!=null)
	{
		crm_xmycgl_cxwtsj=crm_xmycgl_cxwtsj.trim();
		if (!(crm_xmycgl_cxwtsj.equals("")))	wheresql+="  and (crm_xmycgl.cxwtsj<=TO_DATE('"+crm_xmycgl_cxwtsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_dsr=request.getParameter("crm_xmycgl_dsr");
	if (crm_xmycgl_dsr!=null)
	{
		crm_xmycgl_dsr=cf.GB2Uni(crm_xmycgl_dsr);
		if (!(crm_xmycgl_dsr.equals("")))	wheresql+=" and  (crm_xmycgl.dsr='"+crm_xmycgl_dsr+"')";
	}
	crm_xmycgl_zt=request.getParameter("crm_xmycgl_zt");
	if (crm_xmycgl_zt!=null)
	{
		crm_xmycgl_zt=cf.GB2Uni(crm_xmycgl_zt);
		if (!(crm_xmycgl_zt.equals("")))	wheresql+=" and  (crm_xmycgl.zt='"+crm_xmycgl_zt+"')";
	}
	crm_xmycgl_lrr=request.getParameter("crm_xmycgl_lrr");
	if (crm_xmycgl_lrr!=null)
	{
		crm_xmycgl_lrr=cf.GB2Uni(crm_xmycgl_lrr);
		if (!(crm_xmycgl_lrr.equals("")))	wheresql+=" and  (crm_xmycgl.lrr='"+crm_xmycgl_lrr+"')";
	}
	crm_xmycgl_lrsj=request.getParameter("crm_xmycgl_lrsj");
	if (crm_xmycgl_lrsj!=null)
	{
		crm_xmycgl_lrsj=crm_xmycgl_lrsj.trim();
		if (!(crm_xmycgl_lrsj.equals("")))	wheresql+="  and (crm_xmycgl.lrsj>=TO_DATE('"+crm_xmycgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_lrsj=request.getParameter("crm_xmycgl_lrsj2");
	if (crm_xmycgl_lrsj!=null)
	{
		crm_xmycgl_lrsj=crm_xmycgl_lrsj.trim();
		if (!(crm_xmycgl_lrsj.equals("")))	wheresql+="  and (crm_xmycgl.lrsj<=TO_DATE('"+crm_xmycgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfazdr=request.getParameter("crm_xmycgl_jjfazdr");
	if (crm_xmycgl_jjfazdr!=null)
	{
		crm_xmycgl_jjfazdr=cf.GB2Uni(crm_xmycgl_jjfazdr);
		if (!(crm_xmycgl_jjfazdr.equals("")))	wheresql+=" and  (crm_xmycgl.jjfazdr='"+crm_xmycgl_jjfazdr+"')";
	}
	crm_xmycgl_jjfazdsj=request.getParameter("crm_xmycgl_jjfazdsj");
	if (crm_xmycgl_jjfazdsj!=null)
	{
		crm_xmycgl_jjfazdsj=crm_xmycgl_jjfazdsj.trim();
		if (!(crm_xmycgl_jjfazdsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfazdsj>=TO_DATE('"+crm_xmycgl_jjfazdsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfazdsj=request.getParameter("crm_xmycgl_jjfazdsj2");
	if (crm_xmycgl_jjfazdsj!=null)
	{
		crm_xmycgl_jjfazdsj=crm_xmycgl_jjfazdsj.trim();
		if (!(crm_xmycgl_jjfazdsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfazdsj<=TO_DATE('"+crm_xmycgl_jjfazdsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfashr=request.getParameter("crm_xmycgl_jjfashr");
	if (crm_xmycgl_jjfashr!=null)
	{
		crm_xmycgl_jjfashr=cf.GB2Uni(crm_xmycgl_jjfashr);
		if (!(crm_xmycgl_jjfashr.equals("")))	wheresql+=" and  (crm_xmycgl.jjfashr='"+crm_xmycgl_jjfashr+"')";
	}
	crm_xmycgl_jjfashsj=request.getParameter("crm_xmycgl_jjfashsj");
	if (crm_xmycgl_jjfashsj!=null)
	{
		crm_xmycgl_jjfashsj=crm_xmycgl_jjfashsj.trim();
		if (!(crm_xmycgl_jjfashsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfashsj>=TO_DATE('"+crm_xmycgl_jjfashsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfashsj=request.getParameter("crm_xmycgl_jjfashsj2");
	if (crm_xmycgl_jjfashsj!=null)
	{
		crm_xmycgl_jjfashsj=crm_xmycgl_jjfashsj.trim();
		if (!(crm_xmycgl_jjfashsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfashsj<=TO_DATE('"+crm_xmycgl_jjfashsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_clqklrr=request.getParameter("crm_xmycgl_clqklrr");
	if (crm_xmycgl_clqklrr!=null)
	{
		crm_xmycgl_clqklrr=cf.GB2Uni(crm_xmycgl_clqklrr);
		if (!(crm_xmycgl_clqklrr.equals("")))	wheresql+=" and  (crm_xmycgl.clqklrr='"+crm_xmycgl_clqklrr+"')";
	}
	crm_xmycgl_clqklrsj=request.getParameter("crm_xmycgl_clqklrsj");
	if (crm_xmycgl_clqklrsj!=null)
	{
		crm_xmycgl_clqklrsj=crm_xmycgl_clqklrsj.trim();
		if (!(crm_xmycgl_clqklrsj.equals("")))	wheresql+="  and (crm_xmycgl.clqklrsj>=TO_DATE('"+crm_xmycgl_clqklrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_clqklrsj=request.getParameter("crm_xmycgl_clqklrsj2");
	if (crm_xmycgl_clqklrsj!=null)
	{
		crm_xmycgl_clqklrsj=crm_xmycgl_clqklrsj.trim();
		if (!(crm_xmycgl_clqklrsj.equals("")))	wheresql+="  and (crm_xmycgl.clqklrsj<=TO_DATE('"+crm_xmycgl_clqklrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_wtsfjj=request.getParameter("crm_xmycgl_wtsfjj");
	if (crm_xmycgl_wtsfjj!=null)
	{
		crm_xmycgl_wtsfjj=cf.GB2Uni(crm_xmycgl_wtsfjj);
		if (!(crm_xmycgl_wtsfjj.equals("")))	wheresql+=" and  (crm_xmycgl.wtsfjj='"+crm_xmycgl_wtsfjj+"')";
	}
	crm_xmycgl_tgsqr=request.getParameter("crm_xmycgl_tgsqr");
	if (crm_xmycgl_tgsqr!=null)
	{
		crm_xmycgl_tgsqr=cf.GB2Uni(crm_xmycgl_tgsqr);
		if (!(crm_xmycgl_tgsqr.equals("")))	wheresql+=" and  (crm_xmycgl.tgsqr='"+crm_xmycgl_tgsqr+"')";
	}
	crm_xmycgl_tgsqsj=request.getParameter("crm_xmycgl_tgsqsj");
	if (crm_xmycgl_tgsqsj!=null)
	{
		crm_xmycgl_tgsqsj=crm_xmycgl_tgsqsj.trim();
		if (!(crm_xmycgl_tgsqsj.equals("")))	wheresql+="  and (crm_xmycgl.tgsqsj>=TO_DATE('"+crm_xmycgl_tgsqsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgsqsj=request.getParameter("crm_xmycgl_tgsqsj2");
	if (crm_xmycgl_tgsqsj!=null)
	{
		crm_xmycgl_tgsqsj=crm_xmycgl_tgsqsj.trim();
		if (!(crm_xmycgl_tgsqsj.equals("")))	wheresql+="  and (crm_xmycgl.tgsqsj<=TO_DATE('"+crm_xmycgl_tgsqsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgshr=request.getParameter("crm_xmycgl_tgshr");
	if (crm_xmycgl_tgshr!=null)
	{
		crm_xmycgl_tgshr=cf.GB2Uni(crm_xmycgl_tgshr);
		if (!(crm_xmycgl_tgshr.equals("")))	wheresql+=" and  (crm_xmycgl.tgshr='"+crm_xmycgl_tgshr+"')";
	}
	crm_xmycgl_tgshsj=request.getParameter("crm_xmycgl_tgshsj");
	if (crm_xmycgl_tgshsj!=null)
	{
		crm_xmycgl_tgshsj=crm_xmycgl_tgshsj.trim();
		if (!(crm_xmycgl_tgshsj.equals("")))	wheresql+="  and (crm_xmycgl.tgshsj>=TO_DATE('"+crm_xmycgl_tgshsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgshsj=request.getParameter("crm_xmycgl_tgshsj2");
	if (crm_xmycgl_tgshsj!=null)
	{
		crm_xmycgl_tgshsj=crm_xmycgl_tgshsj.trim();
		if (!(crm_xmycgl_tgshsj.equals("")))	wheresql+="  and (crm_xmycgl.tgshsj<=TO_DATE('"+crm_xmycgl_tgshsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgshjg=request.getParameter("crm_xmycgl_tgshjg");
	if (crm_xmycgl_tgshjg!=null)
	{
		crm_xmycgl_tgshjg=cf.GB2Uni(crm_xmycgl_tgshjg);
		if (!(crm_xmycgl_tgshjg.equals("")))	wheresql+=" and  (crm_xmycgl.tgshjg='"+crm_xmycgl_tgshjg+"')";
	}
	crm_xmycgl_tgyybm=request.getParameter("crm_xmycgl_tgyybm");
	if (crm_xmycgl_tgyybm!=null)
	{
		crm_xmycgl_tgyybm=cf.GB2Uni(crm_xmycgl_tgyybm);
		if (!(crm_xmycgl_tgyybm.equals("")))	wheresql+=" and  (crm_xmycgl.tgyybm='"+crm_xmycgl_tgyybm+"')";
	}
	crm_xmycgl_tgkssj=request.getParameter("crm_xmycgl_tgkssj");
	if (crm_xmycgl_tgkssj!=null)
	{
		crm_xmycgl_tgkssj=crm_xmycgl_tgkssj.trim();
		if (!(crm_xmycgl_tgkssj.equals("")))	wheresql+="  and (crm_xmycgl.tgkssj>=TO_DATE('"+crm_xmycgl_tgkssj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgkssj=request.getParameter("crm_xmycgl_tgkssj2");
	if (crm_xmycgl_tgkssj!=null)
	{
		crm_xmycgl_tgkssj=crm_xmycgl_tgkssj.trim();
		if (!(crm_xmycgl_tgkssj.equals("")))	wheresql+="  and (crm_xmycgl.tgkssj<=TO_DATE('"+crm_xmycgl_tgkssj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_gjfgsj=request.getParameter("crm_xmycgl_gjfgsj");
	if (crm_xmycgl_gjfgsj!=null)
	{
		crm_xmycgl_gjfgsj=crm_xmycgl_gjfgsj.trim();
		if (!(crm_xmycgl_gjfgsj.equals("")))	wheresql+="  and (crm_xmycgl.gjfgsj>=TO_DATE('"+crm_xmycgl_gjfgsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_gjfgsj=request.getParameter("crm_xmycgl_gjfgsj2");
	if (crm_xmycgl_gjfgsj!=null)
	{
		crm_xmycgl_gjfgsj=crm_xmycgl_gjfgsj.trim();
		if (!(crm_xmycgl_gjfgsj.equals("")))	wheresql+="  and (crm_xmycgl.gjfgsj<=TO_DATE('"+crm_xmycgl_gjfgsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tglrr=request.getParameter("crm_xmycgl_tglrr");
	if (crm_xmycgl_tglrr!=null)
	{
		crm_xmycgl_tglrr=cf.GB2Uni(crm_xmycgl_tglrr);
		if (!(crm_xmycgl_tglrr.equals("")))	wheresql+=" and  (crm_xmycgl.tglrr='"+crm_xmycgl_tglrr+"')";
	}
	crm_xmycgl_tglrsj=request.getParameter("crm_xmycgl_tglrsj");
	if (crm_xmycgl_tglrsj!=null)
	{
		crm_xmycgl_tglrsj=crm_xmycgl_tglrsj.trim();
		if (!(crm_xmycgl_tglrsj.equals("")))	wheresql+="  and (crm_xmycgl.tglrsj>=TO_DATE('"+crm_xmycgl_tglrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tglrsj=request.getParameter("crm_xmycgl_tglrsj2");
	if (crm_xmycgl_tglrsj!=null)
	{
		crm_xmycgl_tglrsj=crm_xmycgl_tglrsj.trim();
		if (!(crm_xmycgl_tglrsj.equals("")))	wheresql+="  and (crm_xmycgl.tglrsj<=TO_DATE('"+crm_xmycgl_tglrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_sjfgsj=request.getParameter("crm_xmycgl_sjfgsj");
	if (crm_xmycgl_sjfgsj!=null)
	{
		crm_xmycgl_sjfgsj=crm_xmycgl_sjfgsj.trim();
		if (!(crm_xmycgl_sjfgsj.equals("")))	wheresql+="  and (crm_xmycgl.sjfgsj>=TO_DATE('"+crm_xmycgl_sjfgsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_sjfgsj=request.getParameter("crm_xmycgl_sjfgsj2");
	if (crm_xmycgl_sjfgsj!=null)
	{
		crm_xmycgl_sjfgsj=crm_xmycgl_sjfgsj.trim();
		if (!(crm_xmycgl_sjfgsj.equals("")))	wheresql+="  and (crm_xmycgl.sjfgsj<=TO_DATE('"+crm_xmycgl_sjfgsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_fglrr=request.getParameter("crm_xmycgl_fglrr");
	if (crm_xmycgl_fglrr!=null)
	{
		crm_xmycgl_fglrr=cf.GB2Uni(crm_xmycgl_fglrr);
		if (!(crm_xmycgl_fglrr.equals("")))	wheresql+=" and  (crm_xmycgl.fglrr='"+crm_xmycgl_fglrr+"')";
	}
	crm_xmycgl_fglrsj=request.getParameter("crm_xmycgl_fglrsj");
	if (crm_xmycgl_fglrsj!=null)
	{
		crm_xmycgl_fglrsj=crm_xmycgl_fglrsj.trim();
		if (!(crm_xmycgl_fglrsj.equals("")))	wheresql+="  and (crm_xmycgl.fglrsj>=TO_DATE('"+crm_xmycgl_fglrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_fglrsj=request.getParameter("crm_xmycgl_fglrsj2");
	if (crm_xmycgl_fglrsj!=null)
	{
		crm_xmycgl_fglrsj=crm_xmycgl_fglrsj.trim();
		if (!(crm_xmycgl_fglrsj.equals("")))	wheresql+="  and (crm_xmycgl.fglrsj<=TO_DATE('"+crm_xmycgl_fglrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_xmycgl.djbh, DECODE(crm_xmycgl.zt,'1','录入','2','制订方案','3','方案审核','4','已处理'), DECODE(crm_xmycgl.wtsfjj,'Y','解决','N','未解决'),crm_xmycgl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_xmycgl.cxwtsj,crm_xmycgl.dsr,ycflmc,crm_xmycgl.cxwt,crm_xmycgl.jjfazdr,crm_xmycgl.jjfazdsj,crm_xmycgl.jjfa,crm_xmycgl.jjfashr,crm_xmycgl.jjfashsj,crm_xmycgl.clqklrr,crm_xmycgl.clqklrsj,crm_xmycgl.clsj,crm_xmycgl.sjclqk,crm_xmycgl.khyyts,crm_xmycgl.khzrbl,crm_xmycgl.fkhyyts,crm_xmycgl.fkhzrbl,crm_xmycgl.lrr,crm_xmycgl.lrsj,dwmc,crm_xmycgl.bz  ";
	ls_sql+=" FROM crm_khxx,crm_xmycgl,sq_dwxx,dm_ycflbm  ";
    ls_sql+=" where crm_xmycgl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_xmycgl.lrbm=sq_dwxx.dwbh(+)";
     ls_sql+=" and crm_xmycgl.ycflbm=dm_ycflbm.ycflbm(+)";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
//    ls_sql+=wheresql;
    ls_sql+=" order by crm_xmycgl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_xmycglCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"djbh","crm_xmycgl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_xmycgl_cxwtsj","crm_xmycgl_dsr","crm_xmycgl_cxwt","crm_xmycgl_jjfazdr","crm_xmycgl_jjfazdsj","crm_xmycgl_jjfa","crm_xmycgl_jjfashr","crm_xmycgl_jjfashsj","crm_xmycgl_clqklrr","crm_xmycgl_clqklrsj","crm_xmycgl_wtsfjj","crm_xmycgl_sjclqk","crm_xmycgl_tgsqr","crm_xmycgl_tgsqsj","crm_xmycgl_tgsqyy","crm_xmycgl_tgshr","crm_xmycgl_tgshsj","crm_xmycgl_tgshjg","crm_xmycgl_tgshsm","crm_xmycgl_tgyybm","crm_xmycgl_tgkssj","crm_xmycgl_gjfgsj","crm_xmycgl_tglrr","crm_xmycgl_tglrsj","crm_xmycgl_sjfgsj","crm_xmycgl_fglrr","crm_xmycgl_fglrsj","crm_xmycgl_fgsm","crm_xmycgl_zt","crm_xmycgl_lrr","crm_xmycgl_lrsj","crm_xmycgl_lrbm","crm_xmycgl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"djbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_xmycgl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("djbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

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
  <B><font size="3">项目异常登记－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(500);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="80px">登记编号</td>
	<td  width="110px">状态</td>
	<td  width="90px">问题是否解决</td>
	<td  width="70px">客户编号</td>
	<td  width="90px">客户姓名</td>
	<td  width="350px">房屋地址</td>
	<td  width="80px">合同号</td>
	<td  width="90px">设计师</td>
	<td  width="100px">出现问题时间</td>
	<td  width="90px">当事人</td>
	<td  width="90px">异常分类</td>
	<td  width="2000px">出现问题</td>
	<td  width="90px">解决方案制订人</td>
	<td  width="100px">解决方案制订时间</td>
	<td  width="730px">解决方案</td>
	<td  width="90px">解决方案审核人</td>
	<td  width="100px">解决方案审核时间</td>
	<td  width="90px">处理情况录入人</td>
	<td  width="100px">处理情况录入时间</td>
	<td  width="100px">处理时间</td>
	<td  width="730px">实际处理情况</td>

	<td  width="100px">客户原因影响天数</td>
	<td  width="100px">客户责任比例</td>
	<td  width="100px">非客户原因影响天数</td>
	<td  width="100px">非客户责任比例</td>
	
	<td  width="90px">录入人</td>
	<td  width="100px">录入时间</td>
	<td  width="210px">录入部门</td>
	<td  width="600px">备注</td>
</tr>
<%
	pageObj.displayDate();
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