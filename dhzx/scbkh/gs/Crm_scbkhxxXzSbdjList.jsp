<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String crm_scbkhxx_ssfgs=null;
	String crm_scbkhxx_lrbm=null;
	String crm_scbkhxx_lrr=null;
	crm_scbkhxx_ssfgs=request.getParameter("crm_scbkhxx_ssfgs");
	if (crm_scbkhxx_ssfgs!=null)
	{
		crm_scbkhxx_ssfgs=cf.GB2Uni(crm_scbkhxx_ssfgs);
		if (!(crm_scbkhxx_ssfgs.equals("")))	wheresql+=" and  (crm_scbkhxx.ssfgs='"+crm_scbkhxx_ssfgs+"')";
	}
	crm_scbkhxx_lrbm=request.getParameter("crm_scbkhxx_lrbm");
	if (crm_scbkhxx_lrbm!=null)
	{
		crm_scbkhxx_lrbm=cf.GB2Uni(crm_scbkhxx_lrbm);
		if (!(crm_scbkhxx_lrbm.equals("")))	wheresql+=" and  (crm_scbkhxx.lrbm='"+crm_scbkhxx_lrbm+"')";
	}
	crm_scbkhxx_lrr=request.getParameter("crm_scbkhxx_lrr");
	if (crm_scbkhxx_lrr!=null)
	{
		crm_scbkhxx_lrr=cf.GB2Uni(crm_scbkhxx_lrr);
		if (!(crm_scbkhxx_lrr.equals("")))	wheresql+=" and  (crm_scbkhxx.lrr='"+crm_scbkhxx_lrr+"')";
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
	String crm_scbkhxx_qtdh=null;
	crm_scbkhxx_qtdh=request.getParameter("crm_scbkhxx_qtdh");
	if (crm_scbkhxx_qtdh!=null)
	{
		crm_scbkhxx_qtdh=cf.GB2Uni(crm_scbkhxx_qtdh);
		if (!(crm_scbkhxx_qtdh.equals("")))	wheresql+=" and  (crm_scbkhxx.qtdh='"+crm_scbkhxx_qtdh+"')";
	}
	String crm_scbkhxx_qtdh2=null;
	crm_scbkhxx_qtdh2=request.getParameter("crm_scbkhxx_qtdh2");
	if (crm_scbkhxx_qtdh2!=null)
	{
		crm_scbkhxx_qtdh2=cf.GB2Uni(crm_scbkhxx_qtdh2);
		if (!(crm_scbkhxx_qtdh2.equals("")))	wheresql+=" and  (crm_scbkhxx.qtdh like '%"+crm_scbkhxx_qtdh2+"%')";
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
		if (!(crm_scbkhxx_sbdjsj.equals("")))	wheresql+="  and (crm_scbkhxx.sbdjsj>=TO_DATE('"+crm_scbkhxx_sbdjsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_sbdjsj=request.getParameter("crm_scbkhxx_sbdjsj2");
	if (crm_scbkhxx_sbdjsj!=null)
	{
		crm_scbkhxx_sbdjsj=crm_scbkhxx_sbdjsj.trim();
		if (!(crm_scbkhxx_sbdjsj.equals("")))	wheresql+="  and (crm_scbkhxx.sbdjsj<=TO_DATE('"+crm_scbkhxx_sbdjsj+"','YYYY/MM/DD'))";
	}

	crm_scbkhxx_lrsj=request.getParameter("crm_scbkhxx_lrsj");
	if (crm_scbkhxx_lrsj!=null)
	{
		crm_scbkhxx_lrsj=crm_scbkhxx_lrsj.trim();
		if (!(crm_scbkhxx_lrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj>=TO_DATE('"+crm_scbkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_lrsj=request.getParameter("crm_scbkhxx_lrsj2");
	if (crm_scbkhxx_lrsj!=null)
	{
		crm_scbkhxx_lrsj=crm_scbkhxx_lrsj.trim();
		if (!(crm_scbkhxx_lrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj<=TO_DATE('"+crm_scbkhxx_lrsj+"','YYYY/MM/DD'))";
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
		if (!(crm_scbkhxx_yjsj.equals("")))	wheresql+="  and (crm_scbkhxx.yjsj=TO_DATE('"+crm_scbkhxx_yjsj+"','YYYY/MM/DD'))";
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
		if (!(crm_scbkhxx_jssj.equals("")))	wheresql+="  and (crm_scbkhxx.jssj=TO_DATE('"+crm_scbkhxx_jssj+"','YYYY/MM/DD'))";
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
		if (!(crm_scbkhxx_yjzxsj.equals("")))	wheresql+="  and (crm_scbkhxx.yjzxsj>=TO_DATE('"+crm_scbkhxx_yjzxsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_yjzxsj=request.getParameter("crm_scbkhxx_yjzxsj2");
	if (crm_scbkhxx_yjzxsj!=null)
	{
		crm_scbkhxx_yjzxsj=crm_scbkhxx_yjzxsj.trim();
		if (!(crm_scbkhxx_yjzxsj.equals("")))	wheresql+="  and (crm_scbkhxx.yjzxsj<=TO_DATE('"+crm_scbkhxx_yjzxsj+"','YYYY/MM/DD'))";
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
		if (!(crm_scbkhxx_zjgzsj.equals("")))	wheresql+="  and (crm_scbkhxx.zjgzsj>=TO_DATE('"+crm_scbkhxx_zjgzsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_zjgzsj=request.getParameter("crm_scbkhxx_zjgzsj2");
	if (crm_scbkhxx_zjgzsj!=null)
	{
		crm_scbkhxx_zjgzsj=crm_scbkhxx_zjgzsj.trim();
		if (!(crm_scbkhxx_zjgzsj.equals("")))	wheresql+="  and (crm_scbkhxx.zjgzsj<=TO_DATE('"+crm_scbkhxx_zjgzsj+"','YYYY/MM/DD'))";
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
		if (!(crm_scbkhxx_xchfsj.equals("")))	wheresql+="  and (crm_scbkhxx.xchfsj>=TO_DATE('"+crm_scbkhxx_xchfsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_xchfsj=request.getParameter("crm_scbkhxx_xchfsj2");
	if (crm_scbkhxx_xchfsj!=null)
	{
		crm_scbkhxx_xchfsj=crm_scbkhxx_xchfsj.trim();
		if (!(crm_scbkhxx_xchfsj.equals("")))	wheresql+="  and (crm_scbkhxx.xchfsj<=TO_DATE('"+crm_scbkhxx_xchfsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_sfxxq=request.getParameter("crm_scbkhxx_sfxxq");
	if (crm_scbkhxx_sfxxq!=null)
	{
		crm_scbkhxx_sfxxq=cf.GB2Uni(crm_scbkhxx_sfxxq);
		if (!(crm_scbkhxx_sfxxq.equals("")))	wheresql+=" and  (crm_scbkhxx.sfxxq='"+crm_scbkhxx_sfxxq+"')";
	}

	ls_sql="SELECT crm_scbkhxx.scbkhbh, DECODE(crm_scbkhxx.zt,'1','跟踪','6','准备失败','2','失败','5','准备移交','3','移交','4','已接收','7','移交过期'),crm_scbkhxx.xqlx,crm_scbkhxx.khzyxz, DECODE(crm_scbkhxx.sfxhf,'Y','需要','N','否'),crm_scbkhxx.xchfsj,crm_scbkhxx.khxm,crm_scbkhxx.fwdz,crm_scbkhxx.lxfs,crm_scbkhxx.ywy,c.dwmc ywyssxz,crm_scbkhxx.lrr,crm_scbkhxx.lrsj,b.dwmc lrbm,a.dwmc fgs,crm_scbkhxx.bz,sbyymc,crm_scbkhxx.sbyysm,crm_scbkhxx.sbdjr,crm_scbkhxx.sbdjsj,crm_scbkhxx.yjr,crm_scbkhxx.yjsj,d.dwmc yjbm,crm_scbkhxx.yjsm,crm_scbkhxx.jsr,crm_scbkhxx.jssj,crm_scbkhxx.khbh,cqmc,crm_scbkhxx.jiedao,crm_scbkhxx.xqbm,crm_scbkhxx.louhao,crm_scbkhxx.fwmj,hxmc,crm_scbkhxx.fj,crm_scbkhxx.yjzxsj,crm_scbkhxx.jzdsmc,crm_scbkhxx.zjgzsj, DECODE(crm_scbkhxx.sfxxq,'Y','是','N','否')  ";
	ls_sql+=" FROM crm_scbkhxx,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d,dm_cqbm,dm_hxbm,dm_sbyybm  ";
    ls_sql+=" where crm_scbkhxx.ssfgs=a.dwbh(+) and crm_scbkhxx.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_scbkhxx.ywyssxz=c.dwbh(+) and crm_scbkhxx.yjbm=d.dwbh(+)";
    ls_sql+=" and crm_scbkhxx.cqbm=dm_cqbm.cqbm(+) and crm_scbkhxx.hxbm=dm_hxbm.hxbm(+) and crm_scbkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
    ls_sql+=" and crm_scbkhxx.zt in('1','5','6')";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_scbkhxx.scbkhbh desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Crm_scbkhxxXzSbdjList.jsp","","","DjCrm_scbkhxx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"scbkhbh","crm_scbkhxx_khxm","crm_scbkhxx_fwdz","crm_scbkhxx_lxfs","crm_scbkhxx_ywy","crm_scbkhxx_zt","crm_scbkhxx_sbyybm","crm_scbkhxx_sbyysm","crm_scbkhxx_sbdjr","crm_scbkhxx_sbdjsj","crm_scbkhxx_lrr","crm_scbkhxx_lrsj","crm_scbkhxx_lrbm","sq_dwxx_dwmc","crm_scbkhxx_bz","crm_scbkhxx_yjr","crm_scbkhxx_yjsj","crm_scbkhxx_yjbm","crm_scbkhxx_yjsm","crm_scbkhxx_jsr","crm_scbkhxx_jssj","crm_scbkhxx_khbh","crm_scbkhxx_cqbm","crm_scbkhxx_jiedao","crm_scbkhxx_xqbm","crm_scbkhxx_louhao","crm_scbkhxx_qtdh","crm_scbkhxx_ywyssxz","crm_scbkhxx_xqlx","crm_scbkhxx_fwmj","crm_scbkhxx_hxbm","crm_scbkhxx_fj","crm_scbkhxx_khzyxz","crm_scbkhxx_yjzxsj","crm_scbkhxx_jzdsmc","crm_scbkhxx_zjgzsj","crm_scbkhxx_sfxhf","crm_scbkhxx_xchfsj","crm_scbkhxx_sfxxq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"scbkhbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("登记");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"scbkhbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_scbkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("scbkhbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] scbkhbh = request.getParameterValues("scbkhbh");
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<CENTER >
  <B><font size="3">小组－失败登记</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(550);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="60px">&nbsp;</td>
	<td  width="100px">市场部客户编号</td>
	<td  width="110px">状态</td>
	<td  width="90px">小区类型</td>
	<td  width="90px">客户资源性质</td>
	<td  width="90px">是否需回访</td>
	<td  width="110px">下次回访时间</td>
	<td  width="110px">客户姓名</td>
	<td  width="480px">房屋地址</td>
	<td  width="260px">电话</td>
	<td  width="260px">其它电话</td>
	<td  width="90px">业务员</td>
	<td  width="180px">业务员所属小组</td>
	<td  width="90px">录入人</td>
	<td  width="110px">录入时间</td>
	<td  width="170px">录入部门</td>
	<td  width="170px">所属分公司</td>
	<td  width="780px">备注</td>
	<td  width="280px">失败原因</td>
	<td  width="780px">失败原因说明</td>
	<td  width="90px">失败登记人</td>
	<td  width="110px">失败登记时间</td>
	<td  width="90px">移交人</td>
	<td  width="110px">移交时间</td>
	<td  width="170px">移交部门</td>
	<td  width="780px">移交说明</td>
	<td  width="90px">接收人</td>
	<td  width="110px">接收时间</td>
	<td  width="90px">客户编号</td>
	<td  width="130px">所属城区</td>
	<td  width="210px">街道</td>
	<td  width="210px">小区</td>
	<td  width="210px">楼号</td>

	<td  width="90px">建筑面积</td>
	<td  width="110px">户型</td>
	<td  width="90px">房价</td>
	<td  width="110px">预计装修时间</td>
	<td  width="780px">竞争对手名称</td>
	<td  width="110px">最近跟踪时间</td>

	<td  width="80px">是否新小区</td>
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