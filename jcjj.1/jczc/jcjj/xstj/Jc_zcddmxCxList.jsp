<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
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

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}
	if (!jgpx4.equals(""))
	{
		ordersql+=","+jgpx4;
	}
	if (!jgpx5.equals(""))
	{
		ordersql+=","+jgpx5;
	}
	if (!jgpx6.equals(""))
	{
		ordersql+=","+jgpx6;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	
	ls_sql="SELECT crm_khxx.khxm,jc_zcddmx.ddbh,jc_zcddmx.zcmc,jc_zcddmx.zcdlbm,jc_zcddmx.zcxlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,jc_zcddmx.zcysbm,jc_zcddmx.jldwbm,jc_zcddmx.lsj,jc_zcddmx.yhj, DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���'),jc_zcddmx.cxj,jc_zcddmx.cxkssj,jc_zcddmx.cxjzsj, DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������'),jc_zcddmx.dj,jc_zcddmx.sl,jc_zcddmx.je,jc_zcddmx.ycf, DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�'),jc_zcddmx.qtfyje,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,jc_zcddmx.zjhycf,jc_zcddmx.zjhqtfy,jc_zcddmx.zcpzwzbm, DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�'),jc_zcddmx.cxhdbl,jc_zcddmx.cxhdje, DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����'),jc_zcddmx.lrr,jc_zcddmx.lrsj, DECODE(jc_zcddmx.sxbz,'1','����д','2','��д'),jc_zcddmx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zcddmx,sq_dwxx  ";
    ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;

//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Jc_zcddmxCxList.jsp","SelectCxJc_zcddmx.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"khxm","jc_zcddmx_ddbh","jc_zcddmx_zcmc","jc_zcddmx_zcdlbm","jc_zcddmx_zcxlbm","jc_zcddmx_dwbh","jc_zcddmx_zclbbm","jc_zcddmx_xinghao","jc_zcddmx_gg","jc_zcddmx_zcysbm","jc_zcddmx_jldwbm","jc_zcddmx_lsj","jc_zcddmx_yhj","jc_zcddmx_sfycx","jc_zcddmx_cxj","jc_zcddmx_cxkssj","jc_zcddmx_cxjzsj","jc_zcddmx_xzjg","jc_zcddmx_dj","jc_zcddmx_sl","jc_zcddmx_je","jc_zcddmx_ycf","jc_zcddmx_qtfy","jc_zcddmx_qtfyje","jc_zcddmx_zjhsl","jc_zcddmx_zjhje","jc_zcddmx_zjhycf","jc_zcddmx_zjhqtfy","jc_zcddmx_zcpzwzbm","jc_zcddmx_cxhdbz","jc_zcddmx_cxhdbl","jc_zcddmx_cxhdje","jc_zcddmx_lx","jc_zcddmx_lrr","jc_zcddmx_lrsj","jc_zcddmx_sxbz","jc_zcddmx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
/*
	String[] keyName={};
	pageObj.setKey(keyName);
*/
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">�������</td>
	<td  width="2%">��������</td>
	<td  width="2%">���Ĵ���</td>
	<td  width="2%">����С��</td>
	<td  width="2%">����Ʒ��</td>
	<td  width="2%">�������ϵ��</td>
	<td  width="2%">�����ͺ�</td>
	<td  width="2%">���Ĺ��</td>
	<td  width="2%">������ɫ</td>
	<td  width="2%">���ļ�����λ</td>
	<td  width="2%">�г����</td>
	<td  width="2%">�����޼�</td>
	<td  width="2%">�����Ƿ��д���</td>
	<td  width="2%">������</td>
	<td  width="2%">����ʼʱ��</td>
	<td  width="2%">��������ʱ��</td>
	<td  width="2%">ѡ��۸�</td>
	<td  width="2%">ʵ������</td>
	<td  width="2%">��ͬ����</td>
	<td  width="2%">���Ϸ�</td>
	<td  width="2%">Զ�̷�</td>
	<td  width="2%">��������</td>
	<td  width="2%">�����ѽ��</td>
	<td  width="2%">����������</td>
	<td  width="2%">��������Ϸ�</td>
	<td  width="2%">������Զ�̷�</td>
	<td  width="2%">��������������</td>
	<td  width="2%">������װλ��</td>
	<td  width="2%">�Ƿ�μӴ����</td>
	<td  width="2%">������������</td>
	<td  width="2%">�����������</td>
	<td  width="2%">����</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">��д��־</td>
	<td  width="2%">��ע</td>
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