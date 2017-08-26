<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String jc_zcdd_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String jc_zcddmx_ddbh=null;
	String jc_zcdd_clgw=null;
	String jc_zcdd_ztjjgw=null;
	String jc_zcdd_xmzy=null;
	String jc_zcdd_jjsjs=null;
	String jc_zcdd_qhtsj=null;
	String jc_zcddmx_zcmc=null;
	String jc_zcddmx_zcdlbm=null;
	String jc_zcddmx_zcxlbm=null;
	String jc_zcddmx_dwbh=null;
	String jc_zcddmx_zclbbm=null;
	String jc_zcddmx_xinghao=null;
	String jc_zcddmx_gg=null;
	String jc_zcddmx_zcysbm=null;
	String jc_zcddmx_sfycx=null;
	String jc_zcddmx_cxkssj=null;
	String jc_zcddmx_cxjzsj=null;
	String jc_zcddmx_xzjg=null;
	String jc_zcddmx_dj=null;
	String jc_zcddmx_sl=null;
	String jc_zcddmx_je=null;
	String jc_zcddmx_zjhsl=null;
	String jc_zcddmx_zjhje=null;
	String jc_zcddmx_zjhycf=null;
	String jc_zcddmx_zcpzwzbm=null;
	String jc_zcddmx_cxhdbz=null;
	String jc_zcddmx_cxhdbl=null;
	String jc_zcddmx_cxhdje=null;
	String jc_zcddmx_lx=null;
	String jc_zcddmx_lrr=null;
	String jc_zcddmx_lrsj=null;
	String jc_zcddmx_sxbz=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	
	jc_zcdd_khbh=request.getParameter("jc_zcdd_khbh");
	if (jc_zcdd_khbh!=null)
	{
		jc_zcdd_khbh=cf.GB2Uni(jc_zcdd_khbh);
		if (!(jc_zcdd_khbh.equals("")))	wheresql+=" and  (jc_zcdd.khbh='"+jc_zcdd_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
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
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
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
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	jc_zcddmx_ddbh=request.getParameter("jc_zcddmx_ddbh");
	if (jc_zcddmx_ddbh!=null)
	{
		jc_zcddmx_ddbh=cf.GB2Uni(jc_zcddmx_ddbh);
		if (!(jc_zcddmx_ddbh.equals("")))	wheresql+=" and  (jc_zcddmx.ddbh='"+jc_zcddmx_ddbh+"')";
	}
	jc_zcdd_clgw=request.getParameter("jc_zcdd_clgw");
	if (jc_zcdd_clgw!=null)
	{
		jc_zcdd_clgw=cf.GB2Uni(jc_zcdd_clgw);
		if (!(jc_zcdd_clgw.equals("")))	wheresql+=" and  (jc_zcdd.clgw='"+jc_zcdd_clgw+"')";
	}
	jc_zcdd_ztjjgw=request.getParameter("jc_zcdd_ztjjgw");
	if (jc_zcdd_ztjjgw!=null)
	{
		jc_zcdd_ztjjgw=cf.GB2Uni(jc_zcdd_ztjjgw);
		if (!(jc_zcdd_ztjjgw.equals("")))	wheresql+=" and  (jc_zcdd.ztjjgw='"+jc_zcdd_ztjjgw+"')";
	}
	jc_zcdd_xmzy=request.getParameter("jc_zcdd_xmzy");
	if (jc_zcdd_xmzy!=null)
	{
		jc_zcdd_xmzy=cf.GB2Uni(jc_zcdd_xmzy);
		if (!(jc_zcdd_xmzy.equals("")))	wheresql+=" and  (jc_zcdd.xmzy='"+jc_zcdd_xmzy+"')";
	}
	jc_zcdd_jjsjs=request.getParameter("jc_zcdd_jjsjs");
	if (jc_zcdd_jjsjs!=null)
	{
		jc_zcdd_jjsjs=cf.GB2Uni(jc_zcdd_jjsjs);
		if (!(jc_zcdd_jjsjs.equals("")))	wheresql+=" and  (jc_zcdd.jjsjs='"+jc_zcdd_jjsjs+"')";
	}
	jc_zcdd_qhtsj=request.getParameter("jc_zcdd_qhtsj");
	if (jc_zcdd_qhtsj!=null)
	{
		jc_zcdd_qhtsj=jc_zcdd_qhtsj.trim();
		if (!(jc_zcdd_qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj>=TO_DATE('"+jc_zcdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_qhtsj=request.getParameter("jc_zcdd_qhtsj2");
	if (jc_zcdd_qhtsj!=null)
	{
		jc_zcdd_qhtsj=jc_zcdd_qhtsj.trim();
		if (!(jc_zcdd_qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj<=TO_DATE('"+jc_zcdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_zcmc=request.getParameter("jc_zcddmx_zcmc");
	if (jc_zcddmx_zcmc!=null)
	{
		jc_zcddmx_zcmc=cf.GB2Uni(jc_zcddmx_zcmc);
		if (!(jc_zcddmx_zcmc.equals("")))	wheresql+=" and  (jc_zcddmx.zcmc='"+jc_zcddmx_zcmc+"')";
	}
	jc_zcddmx_zcdlbm=request.getParameter("jc_zcddmx_zcdlbm");
	if (jc_zcddmx_zcdlbm!=null)
	{
		jc_zcddmx_zcdlbm=cf.GB2Uni(jc_zcddmx_zcdlbm);
		if (!(jc_zcddmx_zcdlbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcdlbm='"+jc_zcddmx_zcdlbm+"')";
	}
	jc_zcddmx_zcxlbm=request.getParameter("jc_zcddmx_zcxlbm");
	if (jc_zcddmx_zcxlbm!=null)
	{
		jc_zcddmx_zcxlbm=cf.GB2Uni(jc_zcddmx_zcxlbm);
		if (!(jc_zcddmx_zcxlbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcxlbm='"+jc_zcddmx_zcxlbm+"')";
	}
	jc_zcddmx_dwbh=request.getParameter("jc_zcddmx_dwbh");
	if (jc_zcddmx_dwbh!=null)
	{
		jc_zcddmx_dwbh=cf.GB2Uni(jc_zcddmx_dwbh);
		if (!(jc_zcddmx_dwbh.equals("")))	wheresql+=" and  (jc_zcddmx.dwbh='"+jc_zcddmx_dwbh+"')";
	}
	jc_zcddmx_zclbbm=request.getParameter("jc_zcddmx_zclbbm");
	if (jc_zcddmx_zclbbm!=null)
	{
		jc_zcddmx_zclbbm=cf.GB2Uni(jc_zcddmx_zclbbm);
		if (!(jc_zcddmx_zclbbm.equals("")))	wheresql+=" and  (jc_zcddmx.zclbbm='"+jc_zcddmx_zclbbm+"')";
	}
	jc_zcddmx_xinghao=request.getParameter("jc_zcddmx_xinghao");
	if (jc_zcddmx_xinghao!=null)
	{
		jc_zcddmx_xinghao=cf.GB2Uni(jc_zcddmx_xinghao);
		if (!(jc_zcddmx_xinghao.equals("")))	wheresql+=" and  (jc_zcddmx.xinghao='"+jc_zcddmx_xinghao+"')";
	}
	jc_zcddmx_gg=request.getParameter("jc_zcddmx_gg");
	if (jc_zcddmx_gg!=null)
	{
		jc_zcddmx_gg=cf.GB2Uni(jc_zcddmx_gg);
		if (!(jc_zcddmx_gg.equals("")))	wheresql+=" and  (jc_zcddmx.gg='"+jc_zcddmx_gg+"')";
	}
	jc_zcddmx_zcysbm=request.getParameter("jc_zcddmx_zcysbm");
	if (jc_zcddmx_zcysbm!=null)
	{
		jc_zcddmx_zcysbm=cf.GB2Uni(jc_zcddmx_zcysbm);
		if (!(jc_zcddmx_zcysbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcysbm='"+jc_zcddmx_zcysbm+"')";
	}
	jc_zcddmx_sfycx=request.getParameter("jc_zcddmx_sfycx");
	if (jc_zcddmx_sfycx!=null)
	{
		jc_zcddmx_sfycx=cf.GB2Uni(jc_zcddmx_sfycx);
		if (!(jc_zcddmx_sfycx.equals("")))	wheresql+=" and  (jc_zcddmx.sfycx='"+jc_zcddmx_sfycx+"')";
	}
	jc_zcddmx_cxkssj=request.getParameter("jc_zcddmx_cxkssj");
	if (jc_zcddmx_cxkssj!=null)
	{
		jc_zcddmx_cxkssj=jc_zcddmx_cxkssj.trim();
		if (!(jc_zcddmx_cxkssj.equals("")))	wheresql+="  and (jc_zcddmx.cxkssj>=TO_DATE('"+jc_zcddmx_cxkssj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxkssj=request.getParameter("jc_zcddmx_cxkssj2");
	if (jc_zcddmx_cxkssj!=null)
	{
		jc_zcddmx_cxkssj=jc_zcddmx_cxkssj.trim();
		if (!(jc_zcddmx_cxkssj.equals("")))	wheresql+="  and (jc_zcddmx.cxkssj<=TO_DATE('"+jc_zcddmx_cxkssj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxjzsj=request.getParameter("jc_zcddmx_cxjzsj");
	if (jc_zcddmx_cxjzsj!=null)
	{
		jc_zcddmx_cxjzsj=jc_zcddmx_cxjzsj.trim();
		if (!(jc_zcddmx_cxjzsj.equals("")))	wheresql+="  and (jc_zcddmx.cxjzsj>=TO_DATE('"+jc_zcddmx_cxjzsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxjzsj=request.getParameter("jc_zcddmx_cxjzsj2");
	if (jc_zcddmx_cxjzsj!=null)
	{
		jc_zcddmx_cxjzsj=jc_zcddmx_cxjzsj.trim();
		if (!(jc_zcddmx_cxjzsj.equals("")))	wheresql+="  and (jc_zcddmx.cxjzsj<=TO_DATE('"+jc_zcddmx_cxjzsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_xzjg=request.getParameter("jc_zcddmx_xzjg");
	if (jc_zcddmx_xzjg!=null)
	{
		jc_zcddmx_xzjg=cf.GB2Uni(jc_zcddmx_xzjg);
		if (!(jc_zcddmx_xzjg.equals("")))	wheresql+=" and  (jc_zcddmx.xzjg='"+jc_zcddmx_xzjg+"')";
	}
	jc_zcddmx_dj=request.getParameter("jc_zcddmx_dj");
	if (jc_zcddmx_dj!=null)
	{
		jc_zcddmx_dj=jc_zcddmx_dj.trim();
		if (!(jc_zcddmx_dj.equals("")))	wheresql+=" and  (jc_zcddmx.dj="+jc_zcddmx_dj+") ";
	}
	jc_zcddmx_sl=request.getParameter("jc_zcddmx_sl");
	if (jc_zcddmx_sl!=null)
	{
		jc_zcddmx_sl=jc_zcddmx_sl.trim();
		if (!(jc_zcddmx_sl.equals("")))	wheresql+=" and  (jc_zcddmx.sl>="+jc_zcddmx_sl+") ";
	}
	jc_zcddmx_sl=request.getParameter("jc_zcddmx_sl2");
	if (jc_zcddmx_sl!=null)
	{
		jc_zcddmx_sl=jc_zcddmx_sl.trim();
		if (!(jc_zcddmx_sl.equals("")))	wheresql+=" and  (jc_zcddmx.sl<="+jc_zcddmx_sl+") ";
	}
	jc_zcddmx_je=request.getParameter("jc_zcddmx_je");
	if (jc_zcddmx_je!=null)
	{
		jc_zcddmx_je=jc_zcddmx_je.trim();
		if (!(jc_zcddmx_je.equals("")))	wheresql+=" and  (jc_zcddmx.je>="+jc_zcddmx_je+") ";
	}
	jc_zcddmx_je=request.getParameter("jc_zcddmx_je2");
	if (jc_zcddmx_je!=null)
	{
		jc_zcddmx_je=jc_zcddmx_je.trim();
		if (!(jc_zcddmx_je.equals("")))	wheresql+=" and  (jc_zcddmx.je<="+jc_zcddmx_je+") ";
	}
	jc_zcddmx_zjhsl=request.getParameter("jc_zcddmx_zjhsl");
	if (jc_zcddmx_zjhsl!=null)
	{
		jc_zcddmx_zjhsl=jc_zcddmx_zjhsl.trim();
		if (!(jc_zcddmx_zjhsl.equals("")))	wheresql+=" and  (jc_zcddmx.zjhsl>="+jc_zcddmx_zjhsl+") ";
	}
	jc_zcddmx_zjhsl=request.getParameter("jc_zcddmx_zjhsl2");
	if (jc_zcddmx_zjhsl!=null)
	{
		jc_zcddmx_zjhsl=jc_zcddmx_zjhsl.trim();
		if (!(jc_zcddmx_zjhsl.equals("")))	wheresql+=" and  (jc_zcddmx.zjhsl<="+jc_zcddmx_zjhsl+") ";
	}
	jc_zcddmx_zjhje=request.getParameter("jc_zcddmx_zjhje");
	if (jc_zcddmx_zjhje!=null)
	{
		jc_zcddmx_zjhje=jc_zcddmx_zjhje.trim();
		if (!(jc_zcddmx_zjhje.equals("")))	wheresql+=" and  (jc_zcddmx.zjhje>="+jc_zcddmx_zjhje+") ";
	}
	jc_zcddmx_zjhje=request.getParameter("jc_zcddmx_zjhje2");
	if (jc_zcddmx_zjhje!=null)
	{
		jc_zcddmx_zjhje=jc_zcddmx_zjhje.trim();
		if (!(jc_zcddmx_zjhje.equals("")))	wheresql+=" and  (jc_zcddmx.zjhje<="+jc_zcddmx_zjhje+") ";
	}
	jc_zcddmx_zjhycf=request.getParameter("jc_zcddmx_zjhycf");
	if (jc_zcddmx_zjhycf!=null)
	{
		jc_zcddmx_zjhycf=jc_zcddmx_zjhycf.trim();
		if (!(jc_zcddmx_zjhycf.equals("")))	wheresql+=" and  (jc_zcddmx.zjhycf="+jc_zcddmx_zjhycf+") ";
	}
	jc_zcddmx_zcpzwzbm=request.getParameter("jc_zcddmx_zcpzwzbm");
	if (jc_zcddmx_zcpzwzbm!=null)
	{
		jc_zcddmx_zcpzwzbm=cf.GB2Uni(jc_zcddmx_zcpzwzbm);
		if (!(jc_zcddmx_zcpzwzbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcpzwzbm='"+jc_zcddmx_zcpzwzbm+"')";
	}
	jc_zcddmx_cxhdbz=request.getParameter("jc_zcddmx_cxhdbz");
	if (jc_zcddmx_cxhdbz!=null)
	{
		jc_zcddmx_cxhdbz=cf.GB2Uni(jc_zcddmx_cxhdbz);
		if (!(jc_zcddmx_cxhdbz.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbz='"+jc_zcddmx_cxhdbz+"')";
	}
	jc_zcddmx_cxhdbl=request.getParameter("jc_zcddmx_cxhdbl");
	if (jc_zcddmx_cxhdbl!=null)
	{
		jc_zcddmx_cxhdbl=jc_zcddmx_cxhdbl.trim();
		if (!(jc_zcddmx_cxhdbl.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbl>="+jc_zcddmx_cxhdbl+") ";
	}
	jc_zcddmx_cxhdbl=request.getParameter("jc_zcddmx_cxhdbl2");
	if (jc_zcddmx_cxhdbl!=null)
	{
		jc_zcddmx_cxhdbl=jc_zcddmx_cxhdbl.trim();
		if (!(jc_zcddmx_cxhdbl.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbl<="+jc_zcddmx_cxhdbl+") ";
	}
	jc_zcddmx_cxhdje=request.getParameter("jc_zcddmx_cxhdje");
	if (jc_zcddmx_cxhdje!=null)
	{
		jc_zcddmx_cxhdje=jc_zcddmx_cxhdje.trim();
		if (!(jc_zcddmx_cxhdje.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdje>="+jc_zcddmx_cxhdje+") ";
	}
	jc_zcddmx_cxhdje=request.getParameter("jc_zcddmx_cxhdje2");
	if (jc_zcddmx_cxhdje!=null)
	{
		jc_zcddmx_cxhdje=jc_zcddmx_cxhdje.trim();
		if (!(jc_zcddmx_cxhdje.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdje<="+jc_zcddmx_cxhdje+") ";
	}
	jc_zcddmx_lx=request.getParameter("jc_zcddmx_lx");
	if (jc_zcddmx_lx!=null)
	{
		jc_zcddmx_lx=cf.GB2Uni(jc_zcddmx_lx);
		if (!(jc_zcddmx_lx.equals("")))	wheresql+=" and  (jc_zcddmx.lx='"+jc_zcddmx_lx+"')";
	}
	jc_zcddmx_lrr=request.getParameter("jc_zcddmx_lrr");
	if (jc_zcddmx_lrr!=null)
	{
		jc_zcddmx_lrr=cf.GB2Uni(jc_zcddmx_lrr);
		if (!(jc_zcddmx_lrr.equals("")))	wheresql+=" and  (jc_zcddmx.lrr='"+jc_zcddmx_lrr+"')";
	}
	jc_zcddmx_lrsj=request.getParameter("jc_zcddmx_lrsj");
	if (jc_zcddmx_lrsj!=null)
	{
		jc_zcddmx_lrsj=jc_zcddmx_lrsj.trim();
		if (!(jc_zcddmx_lrsj.equals("")))	wheresql+="  and (jc_zcddmx.lrsj>=TO_DATE('"+jc_zcddmx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_lrsj=request.getParameter("jc_zcddmx_lrsj2");
	if (jc_zcddmx_lrsj!=null)
	{
		jc_zcddmx_lrsj=jc_zcddmx_lrsj.trim();
		if (!(jc_zcddmx_lrsj.equals("")))	wheresql+="  and (jc_zcddmx.lrsj<=TO_DATE('"+jc_zcddmx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_sxbz=request.getParameter("jc_zcddmx_sxbz");
	if (jc_zcddmx_sxbz!=null)
	{
		jc_zcddmx_sxbz=cf.GB2Uni(jc_zcddmx_sxbz);
		if (!(jc_zcddmx_sxbz.equals("")))	wheresql+=" and  (jc_zcddmx.sxbz='"+jc_zcddmx_sxbz+"')";
	}

%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

int khs=0;
int dds=0;
double htsl=0;
double htje=0;
double zjhsl=0;
double zjhje=0;
double cxhdje=0;

try {
	conn=cf.getConnection();

	ls_sql=" select count(distinct jc_zcdd.khbh),count(distinct jc_zcddmx.ddbh),sum(jc_zcddmx.sl),sum(jc_zcddmx.je),sum(jc_zcddmx.zjhsl),sum(jc_zcddmx.zjhje),sum(jc_zcddmx.cxhdje),'<img src=\"/images/ColuGif.gif\" width=\"'||sum(jc_zcddmx.zjhje)/300||'\" height=\"14\">'";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zcddmx,sq_dwxx  ";
    ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khs=rs.getInt(1);
		dds=rs.getInt(2);
		htsl=rs.getDouble(3);
		htje=rs.getDouble(4);
		zjhsl=rs.getDouble(5);
		zjhje=rs.getDouble(6);
		cxhdje=rs.getDouble(7);
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



<%
	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj4=cf.GB2Uni(request.getParameter("tj4"));
	String tj5=cf.GB2Uni(request.getParameter("tj5"));
	String tj6=cf.GB2Uni(request.getParameter("tj6"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));
	String tj4name=cf.GB2Uni(request.getParameter("tj4name"));
	String tj5name=cf.GB2Uni(request.getParameter("tj5name"));
	String tj6name=cf.GB2Uni(request.getParameter("tj6name"));

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
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			groupsql+=","+tj4;
			selectgroupsql+=","+tj4;
			groupsl++;
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			groupsql+=","+tj5;
			selectgroupsql+=","+tj5;
			groupsl++;
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			groupsql+=","+tj6;
			selectgroupsql+=","+tj6;
			groupsl++;
		}
	}
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=" group by "+groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct jc_zcdd.khbh),count(distinct jc_zcddmx.ddbh),sum(jc_zcddmx.sl),sum(jc_zcddmx.je),sum(jc_zcddmx.zjhsl),sum(jc_zcddmx.zjhje),sum(jc_zcddmx.cxhdje),'<img src=\"/images/ColuGif.gif\" width=\"'||ROUND(sum(jc_zcddmx.zjhje)*100/"+zjhje+",2)||'\" height=\"14\">'||ROUND(sum(jc_zcddmx.zjhje)*100/"+zjhje+",2)||'%'";
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
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj6name+"</td>");
	}

%>
	<td  width="6%">客户数</td>
	<td  width="6%">订单数</td>
	<td  width="8%">合同数量</td>
	<td  width="10%">合同材料费</td>
	<td  width="8%">增减后数量</td>
	<td  width="10%">增减后材料费</td>
	<td  width="10%">计入促销活动金额</td>
	<td  width="20%">材料费所占比率</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zcddmx,sq_dwxx  ";
    ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

	pageObj.alignStr[groupsl+7]="align='left'";


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
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj4,"1");//列参数对象加入Hash表
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj5,"1");//列参数对象加入Hash表
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj6,"1");//列参数对象加入Hash表
		}
	}
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

<tr bgcolor="#FFFFFF" align='center'>
  <td colspan="<%=groupsl%>">小 计</td>
  <td ><%=khs%></td>
  <td ><%=dds%></td>
  <td ><%=htsl%></td>
  <td ><%=htje%></td>
  <td ><%=zjhsl%></td>
  <td ><%=zjhje%></td>
  <td ><%=cxhdje%></td>
  <td align='left'><img src="/images/ColuGif.gif" width="100" height="14"></td>
</tr>
</table>

</body>
</html>