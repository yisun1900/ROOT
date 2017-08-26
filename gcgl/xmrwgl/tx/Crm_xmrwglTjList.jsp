<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF" >

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String crm_xmrwgl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_xmrwgl_rwbm=null;
	String crm_xmrwgl_rwmc=null;
	String crm_xmrwgl_rwflbm=null;
	String crm_xmrwgl_zdjkrw=null;
	String crm_xmrwgl_bjlb=null;
	String crm_xmrwgl_sqtxts=null;
	String crm_xmrwgl_shtxts=null;
	String crm_xmrwgl_sfyxhxgq=null;
	String crm_xmrwgl_sfyxfc=null;
	String crm_xmrwgl_sfxys=null;
	String crm_xmrwgl_sfwlcb=null;
	String crm_xmrwgl_zyrwbm=null;
	String crm_xmrwgl_rwxh=null;
	String crm_xmrwgl_zrr=null;
	String crm_xmrwgl_jddf=null;
	String crm_xmrwgl_jhkssj=null;
	String crm_xmrwgl_jhjssj=null;
	String crm_xmrwgl_jhgzr=null;
	String crm_xmrwgl_jdsyts=null;
	String crm_xmrwgl_sjkssj=null;
	String crm_xmrwgl_sjjssj=null;
	String crm_xmrwgl_sjgzr=null;
	String crm_xmrwgl_ysr=null;
	String crm_xmrwgl_yssj=null;
	String crm_xmrwgl_ysjl=null;
	String crm_xmrwgl_sfyq=null;
	String crm_xmrwgl_yqts=null;
	String crm_xmrwgl_yqzrf=null;
	String crm_xmrwgl_sfybgd=null;
	String crm_xmrwgl_yjzgwcsj=null;
	String crm_xmrwgl_zgsfwc=null;
	String crm_xmrwgl_zgwcsj=null;
	String crm_xmrwgl_sfyfbd=null;
	String crm_xmrwgl_fbsfwc=null;
	String crm_xmrwgl_lrr=null;
	String crm_xmrwgl_lrsj=null;
	String crm_xmrwgl_lrbm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	crm_xmrwgl_khbh=request.getParameter("crm_xmrwgl_khbh");
	if (crm_xmrwgl_khbh!=null)
	{
		crm_xmrwgl_khbh=cf.GB2Uni(crm_xmrwgl_khbh);
		if (!(crm_xmrwgl_khbh.equals("")))	wheresql+=" and  (crm_xmrwgl.khbh='"+crm_xmrwgl_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_xmrwgl_rwbm=request.getParameter("crm_xmrwgl_rwbm");
	if (crm_xmrwgl_rwbm!=null)
	{
		crm_xmrwgl_rwbm=cf.GB2Uni(crm_xmrwgl_rwbm);
		if (!(crm_xmrwgl_rwbm.equals("")))	wheresql+=" and  (crm_xmrwgl.rwbm='"+crm_xmrwgl_rwbm+"')";
	}
	crm_xmrwgl_rwmc=request.getParameter("crm_xmrwgl_rwmc");
	if (crm_xmrwgl_rwmc!=null)
	{
		crm_xmrwgl_rwmc=cf.GB2Uni(crm_xmrwgl_rwmc);
		if (!(crm_xmrwgl_rwmc.equals("")))	wheresql+=" and  (crm_xmrwgl.rwmc='"+crm_xmrwgl_rwmc+"')";
	}
	crm_xmrwgl_rwflbm=request.getParameter("crm_xmrwgl_rwflbm");
	if (crm_xmrwgl_rwflbm!=null)
	{
		crm_xmrwgl_rwflbm=cf.GB2Uni(crm_xmrwgl_rwflbm);
		if (!(crm_xmrwgl_rwflbm.equals("")))	wheresql+=" and  (crm_xmrwgl.rwflbm='"+crm_xmrwgl_rwflbm+"')";
	}
	crm_xmrwgl_zdjkrw=request.getParameter("crm_xmrwgl_zdjkrw");
	if (crm_xmrwgl_zdjkrw!=null)
	{
		crm_xmrwgl_zdjkrw=cf.GB2Uni(crm_xmrwgl_zdjkrw);
		if (!(crm_xmrwgl_zdjkrw.equals("")))	wheresql+=" and  (crm_xmrwgl.zdjkrw='"+crm_xmrwgl_zdjkrw+"')";
	}
	crm_xmrwgl_bjlb=request.getParameter("crm_xmrwgl_bjlb");
	if (crm_xmrwgl_bjlb!=null)
	{
		crm_xmrwgl_bjlb=cf.GB2Uni(crm_xmrwgl_bjlb);
		if (!(crm_xmrwgl_bjlb.equals("")))	wheresql+=" and  (crm_xmrwgl.bjlb='"+crm_xmrwgl_bjlb+"')";
	}
	crm_xmrwgl_sqtxts=request.getParameter("crm_xmrwgl_sqtxts");
	if (crm_xmrwgl_sqtxts!=null)
	{
		crm_xmrwgl_sqtxts=crm_xmrwgl_sqtxts.trim();
		if (!(crm_xmrwgl_sqtxts.equals("")))	wheresql+=" and (crm_xmrwgl.sqtxts>="+crm_xmrwgl_sqtxts+") ";
	}
	crm_xmrwgl_sqtxts=request.getParameter("crm_xmrwgl_sqtxts2");
	if (crm_xmrwgl_sqtxts!=null)
	{
		crm_xmrwgl_sqtxts=crm_xmrwgl_sqtxts.trim();
		if (!(crm_xmrwgl_sqtxts.equals("")))	wheresql+=" and (crm_xmrwgl.sqtxts<="+crm_xmrwgl_sqtxts+") ";
	}
	crm_xmrwgl_shtxts=request.getParameter("crm_xmrwgl_shtxts");
	if (crm_xmrwgl_shtxts!=null)
	{
		crm_xmrwgl_shtxts=crm_xmrwgl_shtxts.trim();
		if (!(crm_xmrwgl_shtxts.equals("")))	wheresql+=" and (crm_xmrwgl.shtxts>="+crm_xmrwgl_shtxts+") ";
	}
	crm_xmrwgl_shtxts=request.getParameter("crm_xmrwgl_shtxts2");
	if (crm_xmrwgl_shtxts!=null)
	{
		crm_xmrwgl_shtxts=crm_xmrwgl_shtxts.trim();
		if (!(crm_xmrwgl_shtxts.equals("")))	wheresql+=" and (crm_xmrwgl.shtxts<="+crm_xmrwgl_shtxts+") ";
	}
	crm_xmrwgl_sfyxhxgq=request.getParameter("crm_xmrwgl_sfyxhxgq");
	if (crm_xmrwgl_sfyxhxgq!=null)
	{
		crm_xmrwgl_sfyxhxgq=cf.GB2Uni(crm_xmrwgl_sfyxhxgq);
		if (!(crm_xmrwgl_sfyxhxgq.equals("")))	wheresql+=" and  (crm_xmrwgl.sfyxhxgq='"+crm_xmrwgl_sfyxhxgq+"')";
	}
	crm_xmrwgl_sfyxfc=request.getParameter("crm_xmrwgl_sfyxfc");
	if (crm_xmrwgl_sfyxfc!=null)
	{
		crm_xmrwgl_sfyxfc=cf.GB2Uni(crm_xmrwgl_sfyxfc);
		if (!(crm_xmrwgl_sfyxfc.equals("")))	wheresql+=" and  (crm_xmrwgl.sfyxfc='"+crm_xmrwgl_sfyxfc+"')";
	}
	crm_xmrwgl_sfxys=request.getParameter("crm_xmrwgl_sfxys");
	if (crm_xmrwgl_sfxys!=null)
	{
		crm_xmrwgl_sfxys=cf.GB2Uni(crm_xmrwgl_sfxys);
		if (!(crm_xmrwgl_sfxys.equals("")))	wheresql+=" and  (crm_xmrwgl.sfxys='"+crm_xmrwgl_sfxys+"')";
	}
	crm_xmrwgl_sfwlcb=request.getParameter("crm_xmrwgl_sfwlcb");
	if (crm_xmrwgl_sfwlcb!=null)
	{
		crm_xmrwgl_sfwlcb=cf.GB2Uni(crm_xmrwgl_sfwlcb);
		if (!(crm_xmrwgl_sfwlcb.equals("")))	wheresql+=" and  (crm_xmrwgl.sfwlcb='"+crm_xmrwgl_sfwlcb+"')";
	}
	crm_xmrwgl_zyrwbm=request.getParameter("crm_xmrwgl_zyrwbm");
	if (crm_xmrwgl_zyrwbm!=null)
	{
		crm_xmrwgl_zyrwbm=cf.GB2Uni(crm_xmrwgl_zyrwbm);
		if (!(crm_xmrwgl_zyrwbm.equals("")))	wheresql+=" and  (crm_xmrwgl.zyrwbm='"+crm_xmrwgl_zyrwbm+"')";
	}
	crm_xmrwgl_rwxh=request.getParameter("crm_xmrwgl_rwxh");
	if (crm_xmrwgl_rwxh!=null)
	{
		crm_xmrwgl_rwxh=crm_xmrwgl_rwxh.trim();
		if (!(crm_xmrwgl_rwxh.equals("")))	wheresql+=" and (crm_xmrwgl.rwxh="+crm_xmrwgl_rwxh+") ";
	}
	crm_xmrwgl_zrr=request.getParameter("crm_xmrwgl_zrr");
	if (crm_xmrwgl_zrr!=null)
	{
		crm_xmrwgl_zrr=cf.GB2Uni(crm_xmrwgl_zrr);
		if (!(crm_xmrwgl_zrr.equals("")))	wheresql+=" and  (crm_xmrwgl.zrr='"+crm_xmrwgl_zrr+"')";
	}
	crm_xmrwgl_jddf=request.getParameter("crm_xmrwgl_jddf");
	if (crm_xmrwgl_jddf!=null)
	{
		crm_xmrwgl_jddf=crm_xmrwgl_jddf.trim();
		if (!(crm_xmrwgl_jddf.equals("")))	wheresql+=" and (crm_xmrwgl.jddf="+crm_xmrwgl_jddf+") ";
	}
	crm_xmrwgl_jhkssj=request.getParameter("crm_xmrwgl_jhkssj");
	if (crm_xmrwgl_jhkssj!=null)
	{
		crm_xmrwgl_jhkssj=crm_xmrwgl_jhkssj.trim();
		if (!(crm_xmrwgl_jhkssj.equals("")))	wheresql+="  and (crm_xmrwgl.jhkssj>=TO_DATE('"+crm_xmrwgl_jhkssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_jhkssj=request.getParameter("crm_xmrwgl_jhkssj2");
	if (crm_xmrwgl_jhkssj!=null)
	{
		crm_xmrwgl_jhkssj=crm_xmrwgl_jhkssj.trim();
		if (!(crm_xmrwgl_jhkssj.equals("")))	wheresql+="  and (crm_xmrwgl.jhkssj<=TO_DATE('"+crm_xmrwgl_jhkssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_jhjssj=request.getParameter("crm_xmrwgl_jhjssj");
	if (crm_xmrwgl_jhjssj!=null)
	{
		crm_xmrwgl_jhjssj=crm_xmrwgl_jhjssj.trim();
		if (!(crm_xmrwgl_jhjssj.equals("")))	wheresql+="  and (crm_xmrwgl.jhjssj>=TO_DATE('"+crm_xmrwgl_jhjssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_jhjssj=request.getParameter("crm_xmrwgl_jhjssj2");
	if (crm_xmrwgl_jhjssj!=null)
	{
		crm_xmrwgl_jhjssj=crm_xmrwgl_jhjssj.trim();
		if (!(crm_xmrwgl_jhjssj.equals("")))	wheresql+="  and (crm_xmrwgl.jhjssj<=TO_DATE('"+crm_xmrwgl_jhjssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_jhgzr=request.getParameter("crm_xmrwgl_jhgzr");
	if (crm_xmrwgl_jhgzr!=null)
	{
		crm_xmrwgl_jhgzr=crm_xmrwgl_jhgzr.trim();
		if (!(crm_xmrwgl_jhgzr.equals("")))	wheresql+=" and (crm_xmrwgl.jhgzr>="+crm_xmrwgl_jhgzr+") ";
	}
	crm_xmrwgl_jhgzr=request.getParameter("crm_xmrwgl_jhgzr2");
	if (crm_xmrwgl_jhgzr!=null)
	{
		crm_xmrwgl_jhgzr=crm_xmrwgl_jhgzr.trim();
		if (!(crm_xmrwgl_jhgzr.equals("")))	wheresql+=" and (crm_xmrwgl.jhgzr<="+crm_xmrwgl_jhgzr+") ";
	}
	crm_xmrwgl_jdsyts=request.getParameter("crm_xmrwgl_jdsyts");
	if (crm_xmrwgl_jdsyts!=null)
	{
		crm_xmrwgl_jdsyts=crm_xmrwgl_jdsyts.trim();
		if (!(crm_xmrwgl_jdsyts.equals("")))	wheresql+=" and (crm_xmrwgl.jdsyts>="+crm_xmrwgl_jdsyts+") ";
	}
	crm_xmrwgl_jdsyts=request.getParameter("crm_xmrwgl_jdsyts2");
	if (crm_xmrwgl_jdsyts!=null)
	{
		crm_xmrwgl_jdsyts=crm_xmrwgl_jdsyts.trim();
		if (!(crm_xmrwgl_jdsyts.equals("")))	wheresql+=" and (crm_xmrwgl.jdsyts<="+crm_xmrwgl_jdsyts+") ";
	}
	crm_xmrwgl_sjkssj=request.getParameter("crm_xmrwgl_sjkssj");
	if (crm_xmrwgl_sjkssj!=null)
	{
		crm_xmrwgl_sjkssj=crm_xmrwgl_sjkssj.trim();
		if (!(crm_xmrwgl_sjkssj.equals("")))	wheresql+="  and (crm_xmrwgl.sjkssj>=TO_DATE('"+crm_xmrwgl_sjkssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_sjkssj=request.getParameter("crm_xmrwgl_sjkssj2");
	if (crm_xmrwgl_sjkssj!=null)
	{
		crm_xmrwgl_sjkssj=crm_xmrwgl_sjkssj.trim();
		if (!(crm_xmrwgl_sjkssj.equals("")))	wheresql+="  and (crm_xmrwgl.sjkssj<=TO_DATE('"+crm_xmrwgl_sjkssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_sjjssj=request.getParameter("crm_xmrwgl_sjjssj");
	if (crm_xmrwgl_sjjssj!=null)
	{
		crm_xmrwgl_sjjssj=crm_xmrwgl_sjjssj.trim();
		if (!(crm_xmrwgl_sjjssj.equals("")))	wheresql+="  and (crm_xmrwgl.sjjssj>=TO_DATE('"+crm_xmrwgl_sjjssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_sjjssj=request.getParameter("crm_xmrwgl_sjjssj2");
	if (crm_xmrwgl_sjjssj!=null)
	{
		crm_xmrwgl_sjjssj=crm_xmrwgl_sjjssj.trim();
		if (!(crm_xmrwgl_sjjssj.equals("")))	wheresql+="  and (crm_xmrwgl.sjjssj<=TO_DATE('"+crm_xmrwgl_sjjssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_sjgzr=request.getParameter("crm_xmrwgl_sjgzr");
	if (crm_xmrwgl_sjgzr!=null)
	{
		crm_xmrwgl_sjgzr=crm_xmrwgl_sjgzr.trim();
		if (!(crm_xmrwgl_sjgzr.equals("")))	wheresql+=" and (crm_xmrwgl.sjgzr>="+crm_xmrwgl_sjgzr+") ";
	}
	crm_xmrwgl_sjgzr=request.getParameter("crm_xmrwgl_sjgzr2");
	if (crm_xmrwgl_sjgzr!=null)
	{
		crm_xmrwgl_sjgzr=crm_xmrwgl_sjgzr.trim();
		if (!(crm_xmrwgl_sjgzr.equals("")))	wheresql+=" and (crm_xmrwgl.sjgzr<="+crm_xmrwgl_sjgzr+") ";
	}
	crm_xmrwgl_ysr=request.getParameter("crm_xmrwgl_ysr");
	if (crm_xmrwgl_ysr!=null)
	{
		crm_xmrwgl_ysr=cf.GB2Uni(crm_xmrwgl_ysr);
		if (!(crm_xmrwgl_ysr.equals("")))	wheresql+=" and  (crm_xmrwgl.ysr='"+crm_xmrwgl_ysr+"')";
	}
	crm_xmrwgl_yssj=request.getParameter("crm_xmrwgl_yssj");
	if (crm_xmrwgl_yssj!=null)
	{
		crm_xmrwgl_yssj=crm_xmrwgl_yssj.trim();
		if (!(crm_xmrwgl_yssj.equals("")))	wheresql+="  and (crm_xmrwgl.yssj>=TO_DATE('"+crm_xmrwgl_yssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_yssj=request.getParameter("crm_xmrwgl_yssj2");
	if (crm_xmrwgl_yssj!=null)
	{
		crm_xmrwgl_yssj=crm_xmrwgl_yssj.trim();
		if (!(crm_xmrwgl_yssj.equals("")))	wheresql+="  and (crm_xmrwgl.yssj<=TO_DATE('"+crm_xmrwgl_yssj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_ysjl=request.getParameter("crm_xmrwgl_ysjl");
	if (crm_xmrwgl_ysjl!=null)
	{
		crm_xmrwgl_ysjl=cf.GB2Uni(crm_xmrwgl_ysjl);
		if (!(crm_xmrwgl_ysjl.equals("")))	wheresql+=" and  (crm_xmrwgl.ysjl='"+crm_xmrwgl_ysjl+"')";
	}
	crm_xmrwgl_sfyq=request.getParameter("crm_xmrwgl_sfyq");
	if (crm_xmrwgl_sfyq!=null)
	{
		crm_xmrwgl_sfyq=cf.GB2Uni(crm_xmrwgl_sfyq);
		if (!(crm_xmrwgl_sfyq.equals("")))	wheresql+=" and  (crm_xmrwgl.sfyq='"+crm_xmrwgl_sfyq+"')";
	}
	crm_xmrwgl_yqts=request.getParameter("crm_xmrwgl_yqts");
	if (crm_xmrwgl_yqts!=null)
	{
		crm_xmrwgl_yqts=crm_xmrwgl_yqts.trim();
		if (!(crm_xmrwgl_yqts.equals("")))	wheresql+=" and (crm_xmrwgl.yqts>="+crm_xmrwgl_yqts+") ";
	}
	crm_xmrwgl_yqts=request.getParameter("crm_xmrwgl_yqts2");
	if (crm_xmrwgl_yqts!=null)
	{
		crm_xmrwgl_yqts=crm_xmrwgl_yqts.trim();
		if (!(crm_xmrwgl_yqts.equals("")))	wheresql+=" and (crm_xmrwgl.yqts<="+crm_xmrwgl_yqts+") ";
	}
	crm_xmrwgl_yqzrf=request.getParameter("crm_xmrwgl_yqzrf");
	if (crm_xmrwgl_yqzrf!=null)
	{
		crm_xmrwgl_yqzrf=cf.GB2Uni(crm_xmrwgl_yqzrf);
		if (!(crm_xmrwgl_yqzrf.equals("")))	wheresql+=" and  (crm_xmrwgl.yqzrf='"+crm_xmrwgl_yqzrf+"')";
	}
	crm_xmrwgl_sfybgd=request.getParameter("crm_xmrwgl_sfybgd");
	if (crm_xmrwgl_sfybgd!=null)
	{
		crm_xmrwgl_sfybgd=cf.GB2Uni(crm_xmrwgl_sfybgd);
		if (!(crm_xmrwgl_sfybgd.equals("")))	wheresql+=" and  (crm_xmrwgl.sfybgd='"+crm_xmrwgl_sfybgd+"')";
	}
	crm_xmrwgl_yjzgwcsj=request.getParameter("crm_xmrwgl_yjzgwcsj");
	if (crm_xmrwgl_yjzgwcsj!=null)
	{
		crm_xmrwgl_yjzgwcsj=crm_xmrwgl_yjzgwcsj.trim();
		if (!(crm_xmrwgl_yjzgwcsj.equals("")))	wheresql+="  and (crm_xmrwgl.yjzgwcsj>=TO_DATE('"+crm_xmrwgl_yjzgwcsj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_yjzgwcsj=request.getParameter("crm_xmrwgl_yjzgwcsj2");
	if (crm_xmrwgl_yjzgwcsj!=null)
	{
		crm_xmrwgl_yjzgwcsj=crm_xmrwgl_yjzgwcsj.trim();
		if (!(crm_xmrwgl_yjzgwcsj.equals("")))	wheresql+="  and (crm_xmrwgl.yjzgwcsj<=TO_DATE('"+crm_xmrwgl_yjzgwcsj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_zgsfwc=request.getParameter("crm_xmrwgl_zgsfwc");
	if (crm_xmrwgl_zgsfwc!=null)
	{
		crm_xmrwgl_zgsfwc=cf.GB2Uni(crm_xmrwgl_zgsfwc);
		if (!(crm_xmrwgl_zgsfwc.equals("")))	wheresql+=" and  (crm_xmrwgl.zgsfwc='"+crm_xmrwgl_zgsfwc+"')";
	}
	crm_xmrwgl_zgwcsj=request.getParameter("crm_xmrwgl_zgwcsj");
	if (crm_xmrwgl_zgwcsj!=null)
	{
		crm_xmrwgl_zgwcsj=crm_xmrwgl_zgwcsj.trim();
		if (!(crm_xmrwgl_zgwcsj.equals("")))	wheresql+="  and (crm_xmrwgl.zgwcsj>=TO_DATE('"+crm_xmrwgl_zgwcsj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_zgwcsj=request.getParameter("crm_xmrwgl_zgwcsj2");
	if (crm_xmrwgl_zgwcsj!=null)
	{
		crm_xmrwgl_zgwcsj=crm_xmrwgl_zgwcsj.trim();
		if (!(crm_xmrwgl_zgwcsj.equals("")))	wheresql+="  and (crm_xmrwgl.zgwcsj<=TO_DATE('"+crm_xmrwgl_zgwcsj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_sfyfbd=request.getParameter("crm_xmrwgl_sfyfbd");
	if (crm_xmrwgl_sfyfbd!=null)
	{
		crm_xmrwgl_sfyfbd=cf.GB2Uni(crm_xmrwgl_sfyfbd);
		if (!(crm_xmrwgl_sfyfbd.equals("")))	wheresql+=" and  (crm_xmrwgl.sfyfbd='"+crm_xmrwgl_sfyfbd+"')";
	}
	crm_xmrwgl_fbsfwc=request.getParameter("crm_xmrwgl_fbsfwc");
	if (crm_xmrwgl_fbsfwc!=null)
	{
		crm_xmrwgl_fbsfwc=cf.GB2Uni(crm_xmrwgl_fbsfwc);
		if (!(crm_xmrwgl_fbsfwc.equals("")))	wheresql+=" and  (crm_xmrwgl.fbsfwc='"+crm_xmrwgl_fbsfwc+"')";
	}
	crm_xmrwgl_lrr=request.getParameter("crm_xmrwgl_lrr");
	if (crm_xmrwgl_lrr!=null)
	{
		crm_xmrwgl_lrr=cf.GB2Uni(crm_xmrwgl_lrr);
		if (!(crm_xmrwgl_lrr.equals("")))	wheresql+=" and  (crm_xmrwgl.lrr='"+crm_xmrwgl_lrr+"')";
	}
	crm_xmrwgl_lrsj=request.getParameter("crm_xmrwgl_lrsj");
	if (crm_xmrwgl_lrsj!=null)
	{
		crm_xmrwgl_lrsj=crm_xmrwgl_lrsj.trim();
		if (!(crm_xmrwgl_lrsj.equals("")))	wheresql+="  and (crm_xmrwgl.lrsj>=TO_DATE('"+crm_xmrwgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_lrsj=request.getParameter("crm_xmrwgl_lrsj2");
	if (crm_xmrwgl_lrsj!=null)
	{
		crm_xmrwgl_lrsj=crm_xmrwgl_lrsj.trim();
		if (!(crm_xmrwgl_lrsj.equals("")))	wheresql+="  and (crm_xmrwgl.lrsj<=TO_DATE('"+crm_xmrwgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmrwgl_lrbm=request.getParameter("crm_xmrwgl_lrbm");
	if (crm_xmrwgl_lrbm!=null)
	{
		crm_xmrwgl_lrbm=cf.GB2Uni(crm_xmrwgl_lrbm);
		if (!(crm_xmrwgl_lrbm.equals("")))	wheresql+=" and  (crm_xmrwgl.lrbm='"+crm_xmrwgl_lrbm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct crm_xmrwgl.khbh),sum(crm_xmrwgl.jddf)";
	}
%>



<table  width="100%" border="1" cellpadding="3" cellspacing="0" align="center" style="FONT-SIZE:12">

<tr bgcolor="#CCCCCC"  align="center"  >
<%

	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"8%\" >"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj3name+"</td>");
	}
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj6name+"</td>");
	}

%>

	<td  width="8%"  >客户数</td>
	<td  width="8%"  >任务得分</td>
</tr>
<%
	ls_sql=selectgroupsql;
	ls_sql+=" FROM crm_khxx,crm_xmrwgl,dm_rwflbm  ";
    ls_sql+=" where crm_xmrwgl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_xmrwgl.rwflbm=dm_rwflbm.rwflbm(+)";

    //提醒条件
	ls_sql+=" and ((crm_xmrwgl.zgsfwc='N')";//整改是否完成,Y：完成；N：未完成
    ls_sql+=" OR  (crm_xmrwgl.sfyfbd='Y' and crm_xmrwgl.fbsfwc='N')";//返补是否完成,Y：完成；N：否;是否有返补单,Y：有；N：无
    ls_sql+=" OR  (crm_xmrwgl.bjlb='1' and (SYSDATE-crm_xmrwgl.jhkssj) < crm_xmrwgl.sqtxts )";//报警类别,1：事前报警；2：事后提醒；3：事前事后都提醒；9：一般记录
    ls_sql+=" OR  (crm_xmrwgl.bjlb='2' and (SYSDATE-crm_xmrwgl.sjjssj) > crm_xmrwgl.shtxts )";//报警类别,1：事前报警；2：事后提醒；3：事前事后都提醒；9：一般记录
    ls_sql+=" OR  (crm_xmrwgl.bjlb='3' and (((SYSDATE-crm_xmrwgl.jhkssj) < crm_xmrwgl.sqtxts) OR ((SYSDATE-crm_xmrwgl.sjjssj) > crm_xmrwgl.shtxts)) )";//报警类别,1：事前报警；2：事后提醒；3：事前事后都提醒；9：一般记录
    ls_sql+=" ) ";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);


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

	pageObj.displayDateSum();
%> 

</table>


</body>
</html>




