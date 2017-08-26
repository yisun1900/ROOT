<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";

	String sckhyxbm=null;
	sckhyxbm=request.getParameter("sckhyxbm");
	if (sckhyxbm!=null)
	{
		sckhyxbm=cf.GB2Uni(sckhyxbm);
		if (!(sckhyxbm.equals("")))	wheresql+=" and  (crm_scbkhxx.sckhyxbm='"+sckhyxbm+"')";
	}
	String yyddsj=null;
	yyddsj=request.getParameter("yyddsj");
	if (yyddsj!=null)
	{
		yyddsj=yyddsj.trim();
		if (!(yyddsj.equals("")))	wheresql+="  and (crm_scbkhxx.yyddsj>=TO_DATE('"+yyddsj+"','YYYY-MM-DD'))";
	}
	yyddsj=request.getParameter("yyddsj2");
	if (yyddsj!=null)
	{
		yyddsj=yyddsj.trim();
		if (!(yyddsj.equals("")))	wheresql+="  and (crm_scbkhxx.yyddsj<=TO_DATE('"+yyddsj+"','YYYY-MM-DD'))";
	}
	String hfjg=null;
	hfjg=request.getParameter("hfjg");
	if (hfjg!=null)
	{
		hfjg=hfjg.trim();
		if (!(hfjg.equals("")))	wheresql+=" and (crm_scbkhxx.hfjg>="+hfjg+") ";
	}
	hfjg=request.getParameter("hfjg2");
	if (hfjg!=null)
	{
		hfjg=hfjg.trim();
		if (!(hfjg.equals("")))	wheresql+=" and (crm_scbkhxx.hfjg<="+hfjg+") ";
	}



	String crm_scbkhxx_ssfgs=null;
	String crm_scbkhxx_lrr=null;
	crm_scbkhxx_ssfgs=request.getParameter("crm_scbkhxx_ssfgs");
	if (crm_scbkhxx_ssfgs!=null)
	{
		crm_scbkhxx_ssfgs=cf.GB2Uni(crm_scbkhxx_ssfgs);
		if (!(crm_scbkhxx_ssfgs.equals("")))	wheresql+=" and  (crm_scbkhxx.ssfgs='"+crm_scbkhxx_ssfgs+"')";
	}
	crm_scbkhxx_lrr=request.getParameter("crm_scbkhxx_lrr");
	if (crm_scbkhxx_lrr!=null)
	{
		crm_scbkhxx_lrr=cf.GB2Uni(crm_scbkhxx_lrr);
		if (!(crm_scbkhxx_lrr.equals("")))	wheresql+=" and  (crm_scbkhxx.lrr='"+crm_scbkhxx_lrr+"')";
	}

	
	
	String ywybm=null;
	ywybm=request.getParameter("ywybm");
	if (ywybm!=null)
	{
		ywybm=cf.GB2Uni(ywybm);
		if (!(ywybm.equals("")))	wheresql+=" and  (crm_scbkhxx.ywybm='"+ywybm+"')";
	}
	String crm_scbkhxx_ywyssxz=null;
	crm_scbkhxx_ywyssxz=request.getParameter("crm_scbkhxx_ywyssxz");
	if (crm_scbkhxx_ywyssxz!=null)
	{
		crm_scbkhxx_ywyssxz=cf.GB2Uni(crm_scbkhxx_ywyssxz);
		if (!(crm_scbkhxx_ywyssxz.equals("")))	wheresql+=" and  (crm_scbkhxx.ywyssxz='"+crm_scbkhxx_ywyssxz+"')";
	}
	String crm_scbkhxx_ywy=null;
	crm_scbkhxx_ywy=request.getParameter("crm_scbkhxx_ywy");
	if (crm_scbkhxx_ywy!=null)
	{
		crm_scbkhxx_ywy=cf.GB2Uni(crm_scbkhxx_ywy);
		if (!(crm_scbkhxx_ywy.equals("")))	wheresql+=" and  (crm_scbkhxx.ywy='"+crm_scbkhxx_ywy+"')";
	}

	
	String crm_scbkhxx_khxm=null;
	crm_scbkhxx_khxm=request.getParameter("crm_scbkhxx_khxm");
	if (crm_scbkhxx_khxm!=null)
	{
		crm_scbkhxx_khxm=cf.GB2Uni(crm_scbkhxx_khxm);
		if (!(crm_scbkhxx_khxm.equals("")))	wheresql+=" and  (crm_scbkhxx.khxm='"+crm_scbkhxx_khxm+"')";
	}
	String crm_scbkhxx_khxm2=null;
	crm_scbkhxx_khxm2=request.getParameter("crm_scbkhxx_khxm2");
	if (crm_scbkhxx_khxm2!=null)
	{
		crm_scbkhxx_khxm2=cf.GB2Uni(crm_scbkhxx_khxm2);
		if (!(crm_scbkhxx_khxm2.equals("")))	wheresql+=" and  (crm_scbkhxx.khxm like '%"+crm_scbkhxx_khxm2+"%')";
	}
	String crm_scbkhxx_fwdz=null;
	crm_scbkhxx_fwdz=request.getParameter("crm_scbkhxx_fwdz");
	if (crm_scbkhxx_fwdz!=null)
	{
		crm_scbkhxx_fwdz=cf.GB2Uni(crm_scbkhxx_fwdz);
		if (!(crm_scbkhxx_fwdz.equals("")))	wheresql+=" and  (crm_scbkhxx.fwdz='"+crm_scbkhxx_fwdz+"')";
	}
	String crm_scbkhxx_fwdz2=null;
	crm_scbkhxx_fwdz2=request.getParameter("crm_scbkhxx_fwdz2");
	if (crm_scbkhxx_fwdz2!=null)
	{
		crm_scbkhxx_fwdz2=cf.GB2Uni(crm_scbkhxx_fwdz2);
		if (!(crm_scbkhxx_fwdz2.equals("")))	wheresql+=" and  (crm_scbkhxx.fwdz like '%"+crm_scbkhxx_fwdz2+"%')";
	}

	String crm_scbkhxx_lxfs=null;
	crm_scbkhxx_lxfs=request.getParameter("crm_scbkhxx_lxfs");
	if (crm_scbkhxx_lxfs!=null)
	{
		crm_scbkhxx_lxfs=cf.GB2Uni(crm_scbkhxx_lxfs);
		if (!(crm_scbkhxx_lxfs.equals("")))	wheresql+=" and  (crm_scbkhxx.lxfs='"+crm_scbkhxx_lxfs+"')";
	}
	String crm_scbkhxx_lxfs2=null;
	crm_scbkhxx_lxfs2=request.getParameter("crm_scbkhxx_lxfs2");
	if (crm_scbkhxx_lxfs2!=null)
	{
		crm_scbkhxx_lxfs2=cf.GB2Uni(crm_scbkhxx_lxfs2);
		if (!(crm_scbkhxx_lxfs2.equals("")))	wheresql+=" and  (crm_scbkhxx.lxfs like '%"+crm_scbkhxx_lxfs2+"%')";
	}
	
	
	String crm_scbkhxx_scbkhbh=null;
	String crm_scbkhxx_zt=null;
	String crm_scbkhxx_sbyybm=null;
	String crm_scbkhxx_sbdjr=null;
	String crm_scbkhxx_sbdjsj=null;
	String crm_scbkhxx_lrsj=null;
	String crm_scbkhxx_yjr=null;
	String crm_scbkhxx_yjsj=null;
	String crm_scbkhxx_yjbm=null;
	String crm_scbkhxx_jsr=null;
	String crm_scbkhxx_jssj=null;
	String crm_scbkhxx_khbh=null;
	String crm_scbkhxx_cqbm=null;
	String crm_scbkhxx_jiedao=null;
	String crm_scbkhxx_xqbm=null;
	String crm_scbkhxx_louhao=null;
	String crm_scbkhxx_xqlx=null;
	String crm_scbkhxx_fwmj=null;
	String crm_scbkhxx_hxbm=null;
	String crm_scbkhxx_fj=null;
	String crm_scbkhxx_khzyxz=null;
	String crm_scbkhxx_yjzxsj=null;
	String crm_scbkhxx_jzdsmc=null;
	String crm_scbkhxx_zjgzsj=null;
	String crm_scbkhxx_sfxhf=null;
	String crm_scbkhxx_xchfsj=null;
	String crm_scbkhxx_sfxxq=null;
	crm_scbkhxx_scbkhbh=request.getParameter("crm_scbkhxx_scbkhbh");
	if (crm_scbkhxx_scbkhbh!=null)
	{
		crm_scbkhxx_scbkhbh=cf.GB2Uni(crm_scbkhxx_scbkhbh);
		if (!(crm_scbkhxx_scbkhbh.equals("")))	wheresql+=" and  (crm_scbkhxx.scbkhbh='"+crm_scbkhxx_scbkhbh+"')";
	}

	crm_scbkhxx_zt=request.getParameter("crm_scbkhxx_zt");
	if (crm_scbkhxx_zt!=null)
	{
		crm_scbkhxx_zt=cf.GB2Uni(crm_scbkhxx_zt);
		if (!(crm_scbkhxx_zt.equals("")))	wheresql+=" and  (crm_scbkhxx.zt='"+crm_scbkhxx_zt+"')";
	}
	crm_scbkhxx_sbyybm=request.getParameter("crm_scbkhxx_sbyybm");
	if (crm_scbkhxx_sbyybm!=null)
	{
		crm_scbkhxx_sbyybm=cf.GB2Uni(crm_scbkhxx_sbyybm);
		if (!(crm_scbkhxx_sbyybm.equals("")))	wheresql+=" and  (crm_scbkhxx.sbyybm='"+crm_scbkhxx_sbyybm+"')";
	}
	crm_scbkhxx_sbdjr=request.getParameter("crm_scbkhxx_sbdjr");
	if (crm_scbkhxx_sbdjr!=null)
	{
		crm_scbkhxx_sbdjr=cf.GB2Uni(crm_scbkhxx_sbdjr);
		if (!(crm_scbkhxx_sbdjr.equals("")))	wheresql+=" and  (crm_scbkhxx.sbdjr='"+crm_scbkhxx_sbdjr+"')";
	}
	crm_scbkhxx_sbdjsj=request.getParameter("crm_scbkhxx_sbdjsj");
	if (crm_scbkhxx_sbdjsj!=null)
	{
		crm_scbkhxx_sbdjsj=crm_scbkhxx_sbdjsj.trim();
		if (!(crm_scbkhxx_sbdjsj.equals("")))	wheresql+="  and (crm_scbkhxx.sbdjsj>=TO_DATE('"+crm_scbkhxx_sbdjsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_sbdjsj=request.getParameter("crm_scbkhxx_sbdjsj2");
	if (crm_scbkhxx_sbdjsj!=null)
	{
		crm_scbkhxx_sbdjsj=crm_scbkhxx_sbdjsj.trim();
		if (!(crm_scbkhxx_sbdjsj.equals("")))	wheresql+="  and (crm_scbkhxx.sbdjsj<=TO_DATE('"+crm_scbkhxx_sbdjsj+"','YYYY-MM-DD'))";
	}

	crm_scbkhxx_lrsj=request.getParameter("crm_scbkhxx_lrsj");
	if (crm_scbkhxx_lrsj!=null)
	{
		crm_scbkhxx_lrsj=crm_scbkhxx_lrsj.trim();
		if (!(crm_scbkhxx_lrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj>=TO_DATE('"+crm_scbkhxx_lrsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_lrsj=request.getParameter("crm_scbkhxx_lrsj2");
	if (crm_scbkhxx_lrsj!=null)
	{
		crm_scbkhxx_lrsj=crm_scbkhxx_lrsj.trim();
		if (!(crm_scbkhxx_lrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj<=TO_DATE('"+crm_scbkhxx_lrsj+"','YYYY-MM-DD'))";
	}

	crm_scbkhxx_yjr=request.getParameter("crm_scbkhxx_yjr");
	if (crm_scbkhxx_yjr!=null)
	{
		crm_scbkhxx_yjr=cf.GB2Uni(crm_scbkhxx_yjr);
		if (!(crm_scbkhxx_yjr.equals("")))	wheresql+=" and  (crm_scbkhxx.yjr='"+crm_scbkhxx_yjr+"')";
	}
	crm_scbkhxx_yjsj=request.getParameter("crm_scbkhxx_yjsj");
	if (crm_scbkhxx_yjsj!=null)
	{
		crm_scbkhxx_yjsj=crm_scbkhxx_yjsj.trim();
		if (!(crm_scbkhxx_yjsj.equals("")))	wheresql+="  and (crm_scbkhxx.yjsj=TO_DATE('"+crm_scbkhxx_yjsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_yjbm=request.getParameter("crm_scbkhxx_yjbm");
	if (crm_scbkhxx_yjbm!=null)
	{
		crm_scbkhxx_yjbm=cf.GB2Uni(crm_scbkhxx_yjbm);
		if (!(crm_scbkhxx_yjbm.equals("")))	wheresql+=" and  (crm_scbkhxx.yjbm='"+crm_scbkhxx_yjbm+"')";
	}
	crm_scbkhxx_jsr=request.getParameter("crm_scbkhxx_jsr");
	if (crm_scbkhxx_jsr!=null)
	{
		crm_scbkhxx_jsr=cf.GB2Uni(crm_scbkhxx_jsr);
		if (!(crm_scbkhxx_jsr.equals("")))	wheresql+=" and  (crm_scbkhxx.jsr='"+crm_scbkhxx_jsr+"')";
	}
	crm_scbkhxx_jssj=request.getParameter("crm_scbkhxx_jssj");
	if (crm_scbkhxx_jssj!=null)
	{
		crm_scbkhxx_jssj=crm_scbkhxx_jssj.trim();
		if (!(crm_scbkhxx_jssj.equals("")))	wheresql+="  and (crm_scbkhxx.jssj=TO_DATE('"+crm_scbkhxx_jssj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_khbh=request.getParameter("crm_scbkhxx_khbh");
	if (crm_scbkhxx_khbh!=null)
	{
		crm_scbkhxx_khbh=cf.GB2Uni(crm_scbkhxx_khbh);
		if (!(crm_scbkhxx_khbh.equals("")))	wheresql+=" and  (crm_scbkhxx.khbh='"+crm_scbkhxx_khbh+"')";
	}
	crm_scbkhxx_cqbm=request.getParameter("crm_scbkhxx_cqbm");
	if (crm_scbkhxx_cqbm!=null)
	{
		crm_scbkhxx_cqbm=cf.GB2Uni(crm_scbkhxx_cqbm);
		if (!(crm_scbkhxx_cqbm.equals("")))	wheresql+=" and  (crm_scbkhxx.cqbm='"+crm_scbkhxx_cqbm+"')";
	}
	crm_scbkhxx_jiedao=request.getParameter("crm_scbkhxx_jiedao");
	if (crm_scbkhxx_jiedao!=null)
	{
		crm_scbkhxx_jiedao=cf.GB2Uni(crm_scbkhxx_jiedao);
		if (!(crm_scbkhxx_jiedao.equals("")))	wheresql+=" and  (crm_scbkhxx.jiedao like '%"+crm_scbkhxx_jiedao+"%')";
	}
	crm_scbkhxx_xqbm=request.getParameter("crm_scbkhxx_xqbm");
	if (crm_scbkhxx_xqbm!=null)
	{
		crm_scbkhxx_xqbm=cf.GB2Uni(crm_scbkhxx_xqbm);
		if (!(crm_scbkhxx_xqbm.equals("")))	wheresql+=" and  (crm_scbkhxx.xqbm like '%"+crm_scbkhxx_xqbm+"%')";
	}
	crm_scbkhxx_louhao=request.getParameter("crm_scbkhxx_louhao");
	if (crm_scbkhxx_louhao!=null)
	{
		crm_scbkhxx_louhao=cf.GB2Uni(crm_scbkhxx_louhao);
		if (!(crm_scbkhxx_louhao.equals("")))	wheresql+=" and  (crm_scbkhxx.louhao like '%"+crm_scbkhxx_louhao+"%')";
	}

	crm_scbkhxx_xqlx=request.getParameter("crm_scbkhxx_xqlx");
	if (crm_scbkhxx_xqlx!=null)
	{
		crm_scbkhxx_xqlx=cf.GB2Uni(crm_scbkhxx_xqlx);
		if (!(crm_scbkhxx_xqlx.equals("")))	wheresql+=" and  (crm_scbkhxx.xqlx='"+crm_scbkhxx_xqlx+"')";
	}
	crm_scbkhxx_fwmj=request.getParameter("crm_scbkhxx_fwmj");
	if (crm_scbkhxx_fwmj!=null)
	{
		crm_scbkhxx_fwmj=crm_scbkhxx_fwmj.trim();
		if (!(crm_scbkhxx_fwmj.equals("")))	wheresql+=" and (crm_scbkhxx.fwmj>="+crm_scbkhxx_fwmj+") ";
	}
	crm_scbkhxx_fwmj=request.getParameter("crm_scbkhxx_fwmj2");
	if (crm_scbkhxx_fwmj!=null)
	{
		crm_scbkhxx_fwmj=crm_scbkhxx_fwmj.trim();
		if (!(crm_scbkhxx_fwmj.equals("")))	wheresql+=" and (crm_scbkhxx.fwmj<="+crm_scbkhxx_fwmj+") ";
	}
	crm_scbkhxx_hxbm=request.getParameter("crm_scbkhxx_hxbm");
	if (crm_scbkhxx_hxbm!=null)
	{
		crm_scbkhxx_hxbm=cf.GB2Uni(crm_scbkhxx_hxbm);
		if (!(crm_scbkhxx_hxbm.equals("")))	wheresql+=" and  (crm_scbkhxx.hxbm='"+crm_scbkhxx_hxbm+"')";
	}
	crm_scbkhxx_fj=request.getParameter("crm_scbkhxx_fj");
	if (crm_scbkhxx_fj!=null)
	{
		crm_scbkhxx_fj=crm_scbkhxx_fj.trim();
		if (!(crm_scbkhxx_fj.equals("")))	wheresql+=" and (crm_scbkhxx.fj>="+crm_scbkhxx_fj+") ";
	}
	crm_scbkhxx_fj=request.getParameter("crm_scbkhxx_fj2");
	if (crm_scbkhxx_fj!=null)
	{
		crm_scbkhxx_fj=crm_scbkhxx_fj.trim();
		if (!(crm_scbkhxx_fj.equals("")))	wheresql+=" and (crm_scbkhxx.fj<="+crm_scbkhxx_fj+") ";
	}
	crm_scbkhxx_khzyxz=request.getParameter("crm_scbkhxx_khzyxz");
	if (crm_scbkhxx_khzyxz!=null)
	{
		crm_scbkhxx_khzyxz=cf.GB2Uni(crm_scbkhxx_khzyxz);
		if (!(crm_scbkhxx_khzyxz.equals("")))	wheresql+=" and  (crm_scbkhxx.khzyxz='"+crm_scbkhxx_khzyxz+"')";
	}
	crm_scbkhxx_yjzxsj=request.getParameter("crm_scbkhxx_yjzxsj");
	if (crm_scbkhxx_yjzxsj!=null)
	{
		crm_scbkhxx_yjzxsj=crm_scbkhxx_yjzxsj.trim();
		if (!(crm_scbkhxx_yjzxsj.equals("")))	wheresql+="  and (crm_scbkhxx.yjzxsj>=TO_DATE('"+crm_scbkhxx_yjzxsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_yjzxsj=request.getParameter("crm_scbkhxx_yjzxsj2");
	if (crm_scbkhxx_yjzxsj!=null)
	{
		crm_scbkhxx_yjzxsj=crm_scbkhxx_yjzxsj.trim();
		if (!(crm_scbkhxx_yjzxsj.equals("")))	wheresql+="  and (crm_scbkhxx.yjzxsj<=TO_DATE('"+crm_scbkhxx_yjzxsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_jzdsmc=request.getParameter("crm_scbkhxx_jzdsmc");
	if (crm_scbkhxx_jzdsmc!=null)
	{
		crm_scbkhxx_jzdsmc=cf.GB2Uni(crm_scbkhxx_jzdsmc);
		if (!(crm_scbkhxx_jzdsmc.equals("")))	wheresql+=" and  (crm_scbkhxx.jzdsmc like '%"+crm_scbkhxx_jzdsmc+"%')";
	}
	crm_scbkhxx_zjgzsj=request.getParameter("crm_scbkhxx_zjgzsj");
	if (crm_scbkhxx_zjgzsj!=null)
	{
		crm_scbkhxx_zjgzsj=crm_scbkhxx_zjgzsj.trim();
		if (!(crm_scbkhxx_zjgzsj.equals("")))	wheresql+="  and (crm_scbkhxx.zjgzsj>=TO_DATE('"+crm_scbkhxx_zjgzsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_zjgzsj=request.getParameter("crm_scbkhxx_zjgzsj2");
	if (crm_scbkhxx_zjgzsj!=null)
	{
		crm_scbkhxx_zjgzsj=crm_scbkhxx_zjgzsj.trim();
		if (!(crm_scbkhxx_zjgzsj.equals("")))	wheresql+="  and (crm_scbkhxx.zjgzsj<=TO_DATE('"+crm_scbkhxx_zjgzsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_sfxhf=request.getParameter("crm_scbkhxx_sfxhf");
	if (crm_scbkhxx_sfxhf!=null)
	{
		crm_scbkhxx_sfxhf=cf.GB2Uni(crm_scbkhxx_sfxhf);
		if (!(crm_scbkhxx_sfxhf.equals("")))	wheresql+=" and  (crm_scbkhxx.sfxhf='"+crm_scbkhxx_sfxhf+"')";
	}
	crm_scbkhxx_xchfsj=request.getParameter("crm_scbkhxx_xchfsj");
	if (crm_scbkhxx_xchfsj!=null)
	{
		crm_scbkhxx_xchfsj=crm_scbkhxx_xchfsj.trim();
		if (!(crm_scbkhxx_xchfsj.equals("")))	wheresql+="  and (crm_scbkhxx.xchfsj>=TO_DATE('"+crm_scbkhxx_xchfsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_xchfsj=request.getParameter("crm_scbkhxx_xchfsj2");
	if (crm_scbkhxx_xchfsj!=null)
	{
		crm_scbkhxx_xchfsj=crm_scbkhxx_xchfsj.trim();
		if (!(crm_scbkhxx_xchfsj.equals("")))	wheresql+="  and (crm_scbkhxx.xchfsj<=TO_DATE('"+crm_scbkhxx_xchfsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_sfxxq=request.getParameter("crm_scbkhxx_sfxxq");
	if (crm_scbkhxx_sfxxq!=null)
	{
		crm_scbkhxx_sfxxq=cf.GB2Uni(crm_scbkhxx_sfxxq);
		if (!(crm_scbkhxx_sfxxq.equals("")))	wheresql+=" and  (crm_scbkhxx.sfxxq='"+crm_scbkhxx_sfxxq+"')";
	}

	ls_sql="SELECT 'ID:'||crm_scbkhxx.scbkhbh,crm_scbkhxx.khxm,crm_scbkhxx.fwdz,'TEL:'||crm_scbkhxx.lxfs,crm_scbkhxx.ywy,'' a,'' b,'' c,'' d,'' e";
	ls_sql+=" FROM crm_scbkhxx";
    ls_sql+=" where crm_scbkhxx.zt in('1','5','6','7')";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_scbkhxx.scbkhbh desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);//设置每页显示记录数


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">*客户编号</td>
      <td width="6%">*客户姓名</td>
      <td width="18%">*房屋地址</td>
	  <td width="12%">电话</td>
	  <td width="5%">业务员</td>
	  <td width="4%">*是否需回访</td>
	  <td width="6%">下次回访时间</td>
	  <td width="7%">*客户意向</td>
	  <td width="6%">预约到店时间</td>
      <td width="66%">*跟踪说明</td>
    </tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

</body>
</html>