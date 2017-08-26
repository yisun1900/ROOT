<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String ckjgbz=(String)session.getAttribute("ckjgbz");


int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_xb=null;
	String crm_khxx_cqbm=null;
	String crm_khxx_xqbm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sfzhm=null;
	String crm_khxx_zybm=null;
	String crm_khxx_fj=null;
	String crm_khxx_qyxh=null;
	String crm_khxx_hxbm=null;
	String crm_khxx_czbm=null;
	String crm_khxx_fgflbm=null;
	String crm_khxx_zxjwbm=null;
	String crm_khxx_ysbm=null;
	String crm_khxx_hxmjbm=null;
	String crm_khxx_pmjj=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_jcjjqye=null;
	String crm_khxx_sfyyh=null;
	String crm_khxx_yhyy=null;
	String crm_khxx_zkl=null;
	String crm_khxx_fzxm=null;
	String crm_khxx_sffj=null;
	String crm_khxx_sfyrz=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_kgrq=null;
	String crm_khxx_sjkgrq=null;
	String crm_khxx_fkjd=null;
	String crm_khxx_skje=null;
	String crm_khxx_skrq=null;
	String crm_khxx_zkje=null;
	String crm_khxx_zkrq=null;
	String crm_khxx_sjzkrq=null;
	String crm_khxx_jgrq=null;
	String crm_khxx_sjjgrq=null;
	String crm_khxx_jhtrq=null;
	String crm_khxx_bxjzsj=null;
	String crm_khxx_zxje=null;
	String crm_khxx_jxje=null;
	String crm_khxx_wkje=null;
	String crm_khxx_jsje=null;
	String crm_khxx_sdjsje=null;
	String crm_khxx_gcjdbm=null;
	String crm_khxx_wgbz=null;
	String ybysxmbm=null;
	String zqysxmbm=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_pdlx=null;
	String crm_khxx_zpsgd=null;
	String crm_khxx_zpyy=null;
	String crm_khxx_pdclzt=null;
	String crm_khxx_pdsj=null;
	String crm_khxx_pdr=null;
	String zzsgd=null;
	String crm_khxx_sgd=null;
	String cxbz=null;
	String crm_khxx_sgbz=null;
	String crm_khxx_pdsm=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_zxhfsj=null;
	String crm_khxx_hfjlh=null;
	String crm_khxx_sfxhf=null;
	String crm_khxx_hfrq=null;
	String crm_khxx_hflxbm=null;
	String crm_khxx_ybjbz=null;
	String crm_khxx_ybjyxq=null;
	String crm_khxx_ybjdjsj=null;
	String crm_khxx_hdbz=null;
	String crm_khxx_cgdz=null;
	String crm_khxx_hdsgd=null;
	String crm_khxx_hdsgbz=null;
	String crm_khxx_hdsjs=null;
	String crm_khxx_zt=null;
	String crm_khxx_khlxbm=null;
	String crm_khxx_xxlybm=null;
	String crm_khxx_tsbz=null;
	String crm_khxx_tsjlh=null;
	String crm_khxx_bxbz=null;
	String crm_khxx_bxjlh=null;
	String crm_khxx_tdxh=null;
	String crm_khxx_lrr=null;
	String crm_khxx_lrsj=null;
	String crm_khxx_ybjbh=null;
	String crm_khxx_ybjss=null;
	String crm_khxx_hdsfss=null;
	String crm_khxx_kpbz=null;
	String crm_khxx_jlbz=null;
	String crm_khxx_zxkhbh=null;
	String crm_khxx_djbh=null;
	String crm_khxx_hfdjbz=null;
	String crm_khxx_djyy=null;
	String crm_khxx_djsj=null;
	String crm_khxx_djr=null;
	String crm_khxx_jhjdsj=null;
	String crm_khxx_sjjdsj=null;
	String crm_khxx_jdr=null;
	String crm_khxx_bz=null;

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
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}
	crm_khxx_wgbz=request.getParameter("crm_khxx_wgbz");
	if (crm_khxx_wgbz!=null)
	{
		if (crm_khxx_wgbz.equals("1"))//1+未完工&2+已完工
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3'))";
		}
		else if (crm_khxx_wgbz.equals("2"))//1+未完工&2+已完工
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

	String sfcjq=null;
	sfcjq=request.getParameter("sfcjq");
	if (sfcjq!=null)
	{
		if (!(sfcjq.equals("")))	wheresql+=" and  (crm_khxx.sfcjq='"+sfcjq+"')";
	}

	String sffby=null;
	sffby=request.getParameter("sffby");
	if (sffby!=null)
	{
		if (!(sffby.equals("")))	wheresql+=" and  (crm_khxx.sffby='"+sffby+"')";
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

	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_xb=request.getParameter("crm_khxx_xb");
	if (crm_khxx_xb!=null)
	{
		crm_khxx_xb=cf.GB2Uni(crm_khxx_xb);
		if (!(crm_khxx_xb.equals("")))	wheresql+=" and  (crm_khxx.xb='"+crm_khxx_xb+"')";
	}
	crm_khxx_cqbm=request.getParameter("crm_khxx_cqbm");
	if (crm_khxx_cqbm!=null)
	{
		crm_khxx_cqbm=cf.GB2Uni(crm_khxx_cqbm);
		if (!(crm_khxx_cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+crm_khxx_cqbm+"')";
	}
	crm_khxx_xqbm=request.getParameter("crm_khxx_xqbm");
	if (crm_khxx_xqbm!=null)
	{
		crm_khxx_xqbm=cf.GB2Uni(crm_khxx_xqbm);
		if (!(crm_khxx_xqbm.equals("")))	wheresql+=" and  (crm_khxx.xqbm='"+crm_khxx_xqbm+"')";
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
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_sfzhm=request.getParameter("crm_khxx_sfzhm");
	if (crm_khxx_sfzhm!=null)
	{
		crm_khxx_sfzhm=cf.GB2Uni(crm_khxx_sfzhm);
		if (!(crm_khxx_sfzhm.equals("")))	wheresql+=" and  (crm_khxx.sfzhm='"+crm_khxx_sfzhm+"')";
	}
	crm_khxx_zybm=request.getParameter("crm_khxx_zybm");
	if (crm_khxx_zybm!=null)
	{
		crm_khxx_zybm=cf.GB2Uni(crm_khxx_zybm);
		if (!(crm_khxx_zybm.equals("")))	wheresql+=" and  (crm_khxx.zybm='"+crm_khxx_zybm+"')";
	}
	crm_khxx_fj=request.getParameter("crm_khxx_fj");
	if (crm_khxx_fj!=null)
	{
		crm_khxx_fj=crm_khxx_fj.trim();
		if (!(crm_khxx_fj.equals("")))	wheresql+=" and (crm_khxx.fj>="+crm_khxx_fj+") ";
	}
	crm_khxx_fj=request.getParameter("crm_khxx_fj2");
	if (crm_khxx_fj!=null)
	{
		crm_khxx_fj=crm_khxx_fj.trim();
		if (!(crm_khxx_fj.equals("")))	wheresql+=" and (crm_khxx.fj<="+crm_khxx_fj+") ";
	}
	crm_khxx_qyxh=request.getParameter("crm_khxx_qyxh");
	if (crm_khxx_qyxh!=null)
	{
		crm_khxx_qyxh=crm_khxx_qyxh.trim();
		if (!(crm_khxx_qyxh.equals("")))	wheresql+=" and (crm_khxx.qyxh="+crm_khxx_qyxh+") ";
	}
	crm_khxx_hxbm=request.getParameter("crm_khxx_hxbm");
	if (crm_khxx_hxbm!=null)
	{
		crm_khxx_hxbm=cf.GB2Uni(crm_khxx_hxbm);
		if (!(crm_khxx_hxbm.equals("")))	wheresql+=" and  (crm_khxx.hxbm='"+crm_khxx_hxbm+"')";
	}
	crm_khxx_czbm=request.getParameter("crm_khxx_czbm");
	if (crm_khxx_czbm!=null)
	{
		crm_khxx_czbm=cf.GB2Uni(crm_khxx_czbm);
		if (!(crm_khxx_czbm.equals("")))	wheresql+=" and  (crm_khxx.czbm='"+crm_khxx_czbm+"')";
	}
	crm_khxx_fgflbm=request.getParameter("crm_khxx_fgflbm");
	if (crm_khxx_fgflbm!=null)
	{
		crm_khxx_fgflbm=cf.GB2Uni(crm_khxx_fgflbm);
		if (!(crm_khxx_fgflbm.equals("")))	wheresql+=" and  (crm_khxx.fgflbm='"+crm_khxx_fgflbm+"')";
	}
	crm_khxx_zxjwbm=request.getParameter("crm_khxx_zxjwbm");
	if (crm_khxx_zxjwbm!=null)
	{
		crm_khxx_zxjwbm=cf.GB2Uni(crm_khxx_zxjwbm);
		if (!(crm_khxx_zxjwbm.equals("")))	wheresql+=" and  (crm_khxx.zxjwbm='"+crm_khxx_zxjwbm+"')";
	}
	crm_khxx_ysbm=request.getParameter("crm_khxx_ysbm");
	if (crm_khxx_ysbm!=null)
	{
		crm_khxx_ysbm=cf.GB2Uni(crm_khxx_ysbm);
		if (!(crm_khxx_ysbm.equals("")))	wheresql+=" and  (crm_khxx.ysbm='"+crm_khxx_ysbm+"')";
	}
	crm_khxx_hxmjbm=request.getParameter("crm_khxx_hxmjbm");
	if (crm_khxx_hxmjbm!=null)
	{
		crm_khxx_hxmjbm=cf.GB2Uni(crm_khxx_hxmjbm);
		if (!(crm_khxx_hxmjbm.equals("")))	wheresql+=" and  (crm_khxx.hxmjbm='"+crm_khxx_hxmjbm+"')";
	}

	crm_khxx_pmjj=request.getParameter("crm_khxx_pmjj");
	if (crm_khxx_pmjj!=null)
	{
		crm_khxx_pmjj=crm_khxx_pmjj.trim();
		if (!(crm_khxx_pmjj.equals("")))	wheresql+=" and (crm_khxx.pmjj="+crm_khxx_pmjj+") ";
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
	crm_khxx_jcjjqye=request.getParameter("crm_khxx_jcjjqye");
	if (crm_khxx_jcjjqye!=null)
	{
		crm_khxx_jcjjqye=crm_khxx_jcjjqye.trim();
		if (!(crm_khxx_jcjjqye.equals("")))	wheresql+=" and  (crm_khxx.jcjjqye="+crm_khxx_jcjjqye+") ";
	}
	crm_khxx_sfyyh=request.getParameter("crm_khxx_sfyyh");
	if (crm_khxx_sfyyh!=null)
	{
		crm_khxx_sfyyh=cf.GB2Uni(crm_khxx_sfyyh);
		if (!(crm_khxx_sfyyh.equals("")))	wheresql+=" and  (crm_khxx.sfyyh='"+crm_khxx_sfyyh+"')";
	}
	crm_khxx_yhyy=request.getParameter("crm_khxx_yhyy");
	if (crm_khxx_yhyy!=null)
	{
		crm_khxx_yhyy=cf.GB2Uni(crm_khxx_yhyy);
		if (!(crm_khxx_yhyy.equals("")))	wheresql+=" and  (crm_khxx.yhyy='"+crm_khxx_yhyy+"')";
	}
	crm_khxx_zkl=request.getParameter("crm_khxx_zkl");
	if (crm_khxx_zkl!=null)
	{
		crm_khxx_zkl=crm_khxx_zkl.trim();
		if (!(crm_khxx_zkl.equals("")))	wheresql+=" and  (crm_khxx.zkl>="+crm_khxx_zkl+") ";
	}
	crm_khxx_zkl=request.getParameter("crm_khxx_zkl2");
	if (crm_khxx_zkl!=null)
	{
		crm_khxx_zkl=crm_khxx_zkl.trim();
		if (!(crm_khxx_zkl.equals("")))	wheresql+=" and  (crm_khxx.zkl<="+crm_khxx_zkl+") ";
	}
	crm_khxx_fzxm=request.getParameter("crm_khxx_fzxm");
	if (crm_khxx_fzxm!=null)
	{
		crm_khxx_fzxm=cf.GB2Uni(crm_khxx_fzxm);
		if (!(crm_khxx_fzxm.equals("")))	wheresql+=" and  (crm_khxx.fzxm='"+crm_khxx_fzxm+"')";
	}
	crm_khxx_sffj=request.getParameter("crm_khxx_sffj");
	if (crm_khxx_sffj!=null)
	{
		crm_khxx_sffj=cf.GB2Uni(crm_khxx_sffj);
		if (!(crm_khxx_sffj.equals("")))	wheresql+=" and  (crm_khxx.sffj='"+crm_khxx_sffj+"')";
	}
	crm_khxx_sfyrz=request.getParameter("crm_khxx_sfyrz");
	if (crm_khxx_sfyrz!=null)
	{
		crm_khxx_sfyrz=cf.GB2Uni(crm_khxx_sfyrz);
		if (!(crm_khxx_sfyrz.equals("")))	wheresql+=" and  (crm_khxx.sfyrz='"+crm_khxx_sfyrz+"')";
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
	crm_khxx_fkjd=request.getParameter("crm_khxx_fkjd");
	if (crm_khxx_fkjd!=null)
	{
		crm_khxx_fkjd=cf.GB2Uni(crm_khxx_fkjd);
		if (!(crm_khxx_fkjd.equals("")))	wheresql+=" and  (crm_khxx.fkjd='"+crm_khxx_fkjd+"')";
	}
	crm_khxx_skje=request.getParameter("crm_khxx_skje");
	if (crm_khxx_skje!=null)
	{
		crm_khxx_skje=crm_khxx_skje.trim();
		if (!(crm_khxx_skje.equals("")))	wheresql+=" and  (crm_khxx.skje="+crm_khxx_skje+") ";
	}
	crm_khxx_skrq=request.getParameter("crm_khxx_skrq");
	if (crm_khxx_skrq!=null)
	{
		crm_khxx_skrq=crm_khxx_skrq.trim();
		if (!(crm_khxx_skrq.equals("")))	wheresql+="  and (crm_khxx.skrq=TO_DATE('"+crm_khxx_skrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_zkje=request.getParameter("crm_khxx_zkje");
	if (crm_khxx_zkje!=null)
	{
		crm_khxx_zkje=crm_khxx_zkje.trim();
		if (!(crm_khxx_zkje.equals("")))	wheresql+=" and  (crm_khxx.zkje="+crm_khxx_zkje+") ";
	}
	crm_khxx_zkrq=request.getParameter("crm_khxx_zkrq");
	if (crm_khxx_zkrq!=null)
	{
		crm_khxx_zkrq=crm_khxx_zkrq.trim();
		if (!(crm_khxx_zkrq.equals("")))	wheresql+="  and (crm_khxx.zkrq=TO_DATE('"+crm_khxx_zkrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjzkrq=request.getParameter("crm_khxx_sjzkrq");
	if (crm_khxx_sjzkrq!=null)
	{
		crm_khxx_sjzkrq=crm_khxx_sjzkrq.trim();
		if (!(crm_khxx_sjzkrq.equals("")))	wheresql+="  and (crm_khxx.sjzkrq=TO_DATE('"+crm_khxx_sjzkrq+"','YYYY/MM/DD'))";
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
	crm_khxx_jhtrq=request.getParameter("crm_khxx_jhtrq");
	if (crm_khxx_jhtrq!=null)
	{
		crm_khxx_jhtrq=crm_khxx_jhtrq.trim();
		if (!(crm_khxx_jhtrq.equals("")))	wheresql+="  and (crm_khxx.jhtrq>=TO_DATE('"+crm_khxx_jhtrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_jhtrq=request.getParameter("crm_khxx_jhtrq2");
	if (crm_khxx_jhtrq!=null)
	{
		crm_khxx_jhtrq=crm_khxx_jhtrq.trim();
		if (!(crm_khxx_jhtrq.equals("")))	wheresql+="  and (crm_khxx.jhtrq<=TO_DATE('"+crm_khxx_jhtrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_bxjzsj=request.getParameter("crm_khxx_bxjzsj");
	if (crm_khxx_bxjzsj!=null)
	{
		crm_khxx_bxjzsj=crm_khxx_bxjzsj.trim();
		if (!(crm_khxx_bxjzsj.equals("")))	wheresql+="  and (crm_khxx.bxjzsj>=TO_DATE('"+crm_khxx_bxjzsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_bxjzsj=request.getParameter("crm_khxx_bxjzsj2");
	if (crm_khxx_bxjzsj!=null)
	{
		crm_khxx_bxjzsj=crm_khxx_bxjzsj.trim();
		if (!(crm_khxx_bxjzsj.equals("")))	wheresql+="  and (crm_khxx.bxjzsj<=TO_DATE('"+crm_khxx_bxjzsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_zxje=request.getParameter("crm_khxx_zxje");
	if (crm_khxx_zxje!=null)
	{
		crm_khxx_zxje=crm_khxx_zxje.trim();
		if (!(crm_khxx_zxje.equals("")))	wheresql+=" and  (crm_khxx.zxje="+crm_khxx_zxje+") ";
	}
	crm_khxx_jxje=request.getParameter("crm_khxx_jxje");
	if (crm_khxx_jxje!=null)
	{
		crm_khxx_jxje=crm_khxx_jxje.trim();
		if (!(crm_khxx_jxje.equals("")))	wheresql+=" and  (crm_khxx.jxje="+crm_khxx_jxje+") ";
	}
	crm_khxx_wkje=request.getParameter("crm_khxx_wkje");
	if (crm_khxx_wkje!=null)
	{
		crm_khxx_wkje=crm_khxx_wkje.trim();
		if (!(crm_khxx_wkje.equals("")))	wheresql+=" and  (crm_khxx.wkje="+crm_khxx_wkje+") ";
	}
	crm_khxx_jsje=request.getParameter("crm_khxx_jsje");
	if (crm_khxx_jsje!=null)
	{
		crm_khxx_jsje=crm_khxx_jsje.trim();
		if (!(crm_khxx_jsje.equals("")))	wheresql+=" and  (crm_khxx.jsje>="+crm_khxx_jsje+") ";
	}
	crm_khxx_jsje=request.getParameter("crm_khxx_jsje2");
	if (crm_khxx_jsje!=null)
	{
		crm_khxx_jsje=crm_khxx_jsje.trim();
		if (!(crm_khxx_jsje.equals("")))	wheresql+=" and  (crm_khxx.jsje<="+crm_khxx_jsje+") ";
	}
	crm_khxx_sdjsje=request.getParameter("crm_khxx_sdjsje");
	if (crm_khxx_sdjsje!=null)
	{
		crm_khxx_sdjsje=crm_khxx_sdjsje.trim();
		if (!(crm_khxx_sdjsje.equals("")))	wheresql+=" and  (crm_khxx.sdjsje="+crm_khxx_sdjsje+") ";
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
	crm_khxx_pdlx=request.getParameter("crm_khxx_pdlx");
	if (crm_khxx_pdlx!=null)
	{
		crm_khxx_pdlx=cf.GB2Uni(crm_khxx_pdlx);
		if (!(crm_khxx_pdlx.equals("")))	wheresql+=" and  (crm_khxx.pdlx='"+crm_khxx_pdlx+"')";
	}
	crm_khxx_zpsgd=request.getParameter("crm_khxx_zpsgd");
	if (crm_khxx_zpsgd!=null)
	{
		crm_khxx_zpsgd=cf.GB2Uni(crm_khxx_zpsgd);
		if (!(crm_khxx_zpsgd.equals("")))	wheresql+=" and  (crm_khxx.zpsgd='"+crm_khxx_zpsgd+"')";
	}
	crm_khxx_zpyy=request.getParameter("crm_khxx_zpyy");
	if (crm_khxx_zpyy!=null)
	{
		crm_khxx_zpyy=cf.GB2Uni(crm_khxx_zpyy);
		if (!(crm_khxx_zpyy.equals("")))	wheresql+=" and  (crm_khxx.zpyy='"+crm_khxx_zpyy+"')";
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
	crm_khxx_pdr=request.getParameter("crm_khxx_pdr");
	if (crm_khxx_pdr!=null)
	{
		crm_khxx_pdr=cf.GB2Uni(crm_khxx_pdr);
		if (!(crm_khxx_pdr.equals("")))	wheresql+=" and  (crm_khxx.pdr='"+crm_khxx_pdr+"')";
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
	crm_khxx_pdsm=request.getParameter("crm_khxx_pdsm");
	if (crm_khxx_pdsm!=null)
	{
		crm_khxx_pdsm=cf.GB2Uni(crm_khxx_pdsm);
		if (!(crm_khxx_pdsm.equals("")))	wheresql+=" and  (crm_khxx.pdsm='"+crm_khxx_pdsm+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_zxhfsj=request.getParameter("crm_khxx_zxhfsj");
	if (crm_khxx_zxhfsj!=null)
	{
		crm_khxx_zxhfsj=crm_khxx_zxhfsj.trim();
		if (!(crm_khxx_zxhfsj.equals("")))	wheresql+="  and (crm_khxx.zxhfsj=TO_DATE('"+crm_khxx_zxhfsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_hfjlh=request.getParameter("crm_khxx_hfjlh");
	if (crm_khxx_hfjlh!=null)
	{
		crm_khxx_hfjlh=cf.GB2Uni(crm_khxx_hfjlh);
		if (!(crm_khxx_hfjlh.equals("")))	wheresql+=" and  (crm_khxx.hfjlh='"+crm_khxx_hfjlh+"')";
	}
	crm_khxx_sfxhf=request.getParameter("crm_khxx_sfxhf");
	if (crm_khxx_sfxhf!=null)
	{
		crm_khxx_sfxhf=cf.GB2Uni(crm_khxx_sfxhf);
		if (!(crm_khxx_sfxhf.equals("")))	wheresql+=" and  (crm_khxx.sfxhf='"+crm_khxx_sfxhf+"')";
	}
	crm_khxx_hfrq=request.getParameter("crm_khxx_hfrq");
	if (crm_khxx_hfrq!=null)
	{
		crm_khxx_hfrq=crm_khxx_hfrq.trim();
		if (!(crm_khxx_hfrq.equals("")))	wheresql+="  and (crm_khxx.hfrq>=TO_DATE('"+crm_khxx_hfrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_hfrq=request.getParameter("crm_khxx_hfrq2");
	if (crm_khxx_hfrq!=null)
	{
		crm_khxx_hfrq=crm_khxx_hfrq.trim();
		if (!(crm_khxx_hfrq.equals("")))	wheresql+="  and (crm_khxx.hfrq<=TO_DATE('"+crm_khxx_hfrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_hflxbm=request.getParameter("crm_khxx_hflxbm");
	if (crm_khxx_hflxbm!=null)
	{
		crm_khxx_hflxbm=cf.GB2Uni(crm_khxx_hflxbm);
		if (!(crm_khxx_hflxbm.equals("")))	wheresql+=" and  (crm_khxx.hflxbm='"+crm_khxx_hflxbm+"')";
	}
	crm_khxx_ybjbz=request.getParameter("crm_khxx_ybjbz");
	if (crm_khxx_ybjbz!=null)
	{
		crm_khxx_ybjbz=cf.GB2Uni(crm_khxx_ybjbz);
		if (!(crm_khxx_ybjbz.equals("")))	wheresql+=" and  (crm_khxx.ybjbz='"+crm_khxx_ybjbz+"')";
	}
	crm_khxx_ybjyxq=request.getParameter("crm_khxx_ybjyxq");
	if (crm_khxx_ybjyxq!=null)
	{
		crm_khxx_ybjyxq=crm_khxx_ybjyxq.trim();
		if (!(crm_khxx_ybjyxq.equals("")))	wheresql+="  and (crm_khxx.ybjyxq>=TO_DATE('"+crm_khxx_ybjyxq+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjyxq=request.getParameter("crm_khxx_ybjyxq2");
	if (crm_khxx_ybjyxq!=null)
	{
		crm_khxx_ybjyxq=crm_khxx_ybjyxq.trim();
		if (!(crm_khxx_ybjyxq.equals("")))	wheresql+="  and (crm_khxx.ybjyxq<=TO_DATE('"+crm_khxx_ybjyxq+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjdjsj=request.getParameter("crm_khxx_ybjdjsj");
	if (crm_khxx_ybjdjsj!=null)
	{
		crm_khxx_ybjdjsj=crm_khxx_ybjdjsj.trim();
		if (!(crm_khxx_ybjdjsj.equals("")))	wheresql+="  and (crm_khxx.ybjdjsj>=TO_DATE('"+crm_khxx_ybjdjsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjdjsj=request.getParameter("crm_khxx_ybjdjsj2");
	if (crm_khxx_ybjdjsj!=null)
	{
		crm_khxx_ybjdjsj=crm_khxx_ybjdjsj.trim();
		if (!(crm_khxx_ybjdjsj.equals("")))	wheresql+="  and (crm_khxx.ybjdjsj<=TO_DATE('"+crm_khxx_ybjdjsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_hdbz=request.getParameter("crm_khxx_hdbz");
	if (crm_khxx_hdbz!=null)
	{
		crm_khxx_hdbz=cf.GB2Uni(crm_khxx_hdbz);
		if (!(crm_khxx_hdbz.equals("")))	wheresql+=" and  (crm_khxx.hdbz='"+crm_khxx_hdbz+"')";
	}
	crm_khxx_cgdz=request.getParameter("crm_khxx_cgdz");
	if (crm_khxx_cgdz!=null)
	{
		crm_khxx_cgdz=cf.GB2Uni(crm_khxx_cgdz);
		if (!(crm_khxx_cgdz.equals("")))	wheresql+=" and  (crm_khxx.cgdz='"+crm_khxx_cgdz+"')";
	}
	crm_khxx_hdsgd=request.getParameter("crm_khxx_hdsgd");
	if (crm_khxx_hdsgd!=null)
	{
		crm_khxx_hdsgd=cf.GB2Uni(crm_khxx_hdsgd);
		if (!(crm_khxx_hdsgd.equals("")))	wheresql+=" and  (crm_khxx.hdsgd='"+crm_khxx_hdsgd+"')";
	}
	crm_khxx_hdsgbz=request.getParameter("crm_khxx_hdsgbz");
	if (crm_khxx_hdsgbz!=null)
	{
		crm_khxx_hdsgbz=cf.GB2Uni(crm_khxx_hdsgbz);
		if (!(crm_khxx_hdsgbz.equals("")))	wheresql+=" and  (crm_khxx.hdsgbz='"+crm_khxx_hdsgbz+"')";
	}
	crm_khxx_hdsjs=request.getParameter("crm_khxx_hdsjs");
	if (crm_khxx_hdsjs!=null)
	{
		crm_khxx_hdsjs=cf.GB2Uni(crm_khxx_hdsjs);
		if (!(crm_khxx_hdsjs.equals("")))	wheresql+=" and  (crm_khxx.hdsjs='"+crm_khxx_hdsjs+"')";
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
	crm_khxx_xxlybm=request.getParameter("crm_khxx_xxlybm");
	if (crm_khxx_xxlybm!=null)
	{
		crm_khxx_xxlybm=cf.GB2Uni(crm_khxx_xxlybm);
		if (!(crm_khxx_xxlybm.equals("")))	wheresql+=" and  (crm_khxx.xxlybm='"+crm_khxx_xxlybm+"')";
	}
	crm_khxx_tsbz=request.getParameter("crm_khxx_tsbz");
	if (crm_khxx_tsbz!=null)
	{
		crm_khxx_tsbz=cf.GB2Uni(crm_khxx_tsbz);
		if (!(crm_khxx_tsbz.equals("")))	wheresql+=" and  (crm_khxx.tsbz='"+crm_khxx_tsbz+"')";
	}
	crm_khxx_tsjlh=request.getParameter("crm_khxx_tsjlh");
	if (crm_khxx_tsjlh!=null)
	{
		crm_khxx_tsjlh=cf.GB2Uni(crm_khxx_tsjlh);
		if (!(crm_khxx_tsjlh.equals("")))	wheresql+=" and  (crm_khxx.tsjlh='"+crm_khxx_tsjlh+"')";
	}
	crm_khxx_bxbz=request.getParameter("crm_khxx_bxbz");
	if (crm_khxx_bxbz!=null)
	{
		crm_khxx_bxbz=cf.GB2Uni(crm_khxx_bxbz);
		if (!(crm_khxx_bxbz.equals("")))	wheresql+=" and  (crm_khxx.bxbz='"+crm_khxx_bxbz+"')";
	}
	crm_khxx_bxjlh=request.getParameter("crm_khxx_bxjlh");
	if (crm_khxx_bxjlh!=null)
	{
		crm_khxx_bxjlh=cf.GB2Uni(crm_khxx_bxjlh);
		if (!(crm_khxx_bxjlh.equals("")))	wheresql+=" and  (crm_khxx.bxjlh='"+crm_khxx_bxjlh+"')";
	}
	crm_khxx_tdxh=request.getParameter("crm_khxx_tdxh");
	if (crm_khxx_tdxh!=null)
	{
		crm_khxx_tdxh=cf.GB2Uni(crm_khxx_tdxh);
		if (!(crm_khxx_tdxh.equals("")))	wheresql+=" and  (crm_khxx.tdxh='"+crm_khxx_tdxh+"')";
	}
	crm_khxx_lrr=request.getParameter("crm_khxx_lrr");
	if (crm_khxx_lrr!=null)
	{
		crm_khxx_lrr=cf.GB2Uni(crm_khxx_lrr);
		if (!(crm_khxx_lrr.equals("")))	wheresql+=" and  (crm_khxx.lrr='"+crm_khxx_lrr+"')";
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
	crm_khxx_ybjbh=request.getParameter("crm_khxx_ybjbh");
	if (crm_khxx_ybjbh!=null)
	{
		crm_khxx_ybjbh=cf.GB2Uni(crm_khxx_ybjbh);
		if (!(crm_khxx_ybjbh.equals("")))	wheresql+=" and  (crm_khxx.ybjbh='"+crm_khxx_ybjbh+"')";
	}
	crm_khxx_ybjss=request.getParameter("crm_khxx_ybjss");
	if (crm_khxx_ybjss!=null)
	{
		crm_khxx_ybjss=cf.GB2Uni(crm_khxx_ybjss);
		if (!(crm_khxx_ybjss.equals("")))	wheresql+=" and  (crm_khxx.ybjss='"+crm_khxx_ybjss+"')";
	}
	crm_khxx_hdsfss=request.getParameter("crm_khxx_hdsfss");
	if (crm_khxx_hdsfss!=null)
	{
		crm_khxx_hdsfss=cf.GB2Uni(crm_khxx_hdsfss);
		if (!(crm_khxx_hdsfss.equals("")))	wheresql+=" and  (crm_khxx.hdsfss='"+crm_khxx_hdsfss+"')";
	}
	crm_khxx_kpbz=request.getParameter("crm_khxx_kpbz");
	if (crm_khxx_kpbz!=null)
	{
		crm_khxx_kpbz=cf.GB2Uni(crm_khxx_kpbz);
		if (!(crm_khxx_kpbz.equals("")))	wheresql+=" and  (crm_khxx.kpbz='"+crm_khxx_kpbz+"')";
	}
	crm_khxx_jlbz=request.getParameter("crm_khxx_jlbz");
	if (crm_khxx_jlbz!=null)
	{
		crm_khxx_jlbz=cf.GB2Uni(crm_khxx_jlbz);
		if (!(crm_khxx_jlbz.equals("")))	wheresql+=" and  (crm_khxx.jlbz='"+crm_khxx_jlbz+"')";
	}
	crm_khxx_zxkhbh=request.getParameter("crm_khxx_zxkhbh");
	if (crm_khxx_zxkhbh!=null)
	{
		crm_khxx_zxkhbh=cf.GB2Uni(crm_khxx_zxkhbh);
		if (!(crm_khxx_zxkhbh.equals("")))	wheresql+=" and  (crm_khxx.zxkhbh='"+crm_khxx_zxkhbh+"')";
	}
	crm_khxx_djbh=request.getParameter("crm_khxx_djbh");
	if (crm_khxx_djbh!=null)
	{
		crm_khxx_djbh=cf.GB2Uni(crm_khxx_djbh);
		if (!(crm_khxx_djbh.equals("")))	wheresql+=" and  (crm_khxx.djbh='"+crm_khxx_djbh+"')";
	}
	crm_khxx_hfdjbz=request.getParameter("crm_khxx_hfdjbz");
	if (crm_khxx_hfdjbz!=null)
	{
		crm_khxx_hfdjbz=cf.GB2Uni(crm_khxx_hfdjbz);
		if (!(crm_khxx_hfdjbz.equals("")))	wheresql+=" and  (crm_khxx.hfdjbz='"+crm_khxx_hfdjbz+"')";
	}
	crm_khxx_djyy=request.getParameter("crm_khxx_djyy");
	if (crm_khxx_djyy!=null)
	{
		crm_khxx_djyy=cf.GB2Uni(crm_khxx_djyy);
		if (!(crm_khxx_djyy.equals("")))	wheresql+=" and  (crm_khxx.djyy='"+crm_khxx_djyy+"')";
	}
	crm_khxx_djsj=request.getParameter("crm_khxx_djsj");
	if (crm_khxx_djsj!=null)
	{
		crm_khxx_djsj=crm_khxx_djsj.trim();
		if (!(crm_khxx_djsj.equals("")))	wheresql+="  and (crm_khxx.djsj>=TO_DATE('"+crm_khxx_djsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_djsj=request.getParameter("crm_khxx_djsj2");
	if (crm_khxx_djsj!=null)
	{
		crm_khxx_djsj=crm_khxx_djsj.trim();
		if (!(crm_khxx_djsj.equals("")))	wheresql+="  and (crm_khxx.djsj<=TO_DATE('"+crm_khxx_djsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_djr=request.getParameter("crm_khxx_djr");
	if (crm_khxx_djr!=null)
	{
		crm_khxx_djr=cf.GB2Uni(crm_khxx_djr);
		if (!(crm_khxx_djr.equals("")))	wheresql+=" and  (crm_khxx.djr='"+crm_khxx_djr+"')";
	}
	crm_khxx_jhjdsj=request.getParameter("crm_khxx_jhjdsj");
	if (crm_khxx_jhjdsj!=null)
	{
		crm_khxx_jhjdsj=crm_khxx_jhjdsj.trim();
		if (!(crm_khxx_jhjdsj.equals("")))	wheresql+="  and (crm_khxx.jhjdsj>=TO_DATE('"+crm_khxx_jhjdsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_jhjdsj=request.getParameter("crm_khxx_jhjdsj2");
	if (crm_khxx_jhjdsj!=null)
	{
		crm_khxx_jhjdsj=crm_khxx_jhjdsj.trim();
		if (!(crm_khxx_jhjdsj.equals("")))	wheresql+="  and (crm_khxx.jhjdsj<=TO_DATE('"+crm_khxx_jhjdsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjjdsj=request.getParameter("crm_khxx_sjjdsj");
	if (crm_khxx_sjjdsj!=null)
	{
		crm_khxx_sjjdsj=crm_khxx_sjjdsj.trim();
		if (!(crm_khxx_sjjdsj.equals("")))	wheresql+="  and (crm_khxx.sjjdsj=TO_DATE('"+crm_khxx_sjjdsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_jdr=request.getParameter("crm_khxx_jdr");
	if (crm_khxx_jdr!=null)
	{
		crm_khxx_jdr=cf.GB2Uni(crm_khxx_jdr);
		if (!(crm_khxx_jdr.equals("")))	wheresql+=" and  (crm_khxx.jdr='"+crm_khxx_jdr+"')";
	}
	crm_khxx_bz=request.getParameter("crm_khxx_bz");
	if (crm_khxx_bz!=null)
	{
		crm_khxx_bz=cf.GB2Uni(crm_khxx_bz);
		if (!(crm_khxx_bz.equals("")))	wheresql+=" and  (crm_khxx.bz='"+crm_khxx_bz+"')";
	}

	String pxzd=request.getParameter("pxzd");

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.qye,NVL(crm_khxx.zjxje,0),NVL(crm_khxx.sfke,0),NVL2(jzkfkcs,jzkfkcs||'期','无收款'),jzkfksj,khlxmc,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,DECODE(NVL(tgbz,'W'),'W','正常','N','<font color=\"#00FF00\">复工</font>','Y','<font color=\"#FF0000\">已停工</font>'),ysgcjdmc,c.gcyszxmmc ybysxmbm,zkl,a.dwmc qydm,crm_khxx.qyrq,jgrq,crm_khxx.fwmj,crm_khxx.khbh";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_khlxbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+)";
    ls_sql+=" and crm_khxx.zt='2' ";
//	ls_sql+=" and crm_khxx.zqysxmbm=cw_jzqkbjtj.zqysxmbm and NVL(crm_khxx.sfke,0)*100/(crm_khxx.qye+NVL(crm_khxx.zjxje,0))<cw_jzqkbjtj.sfkl";
    ls_sql+=" and crm_khxx.khbh not in(select khbh from cw_khfkjl where fklxbm='11' and fkcs=5) ";
    ls_sql+=wheresql;
    ls_sql+=" order by "+pxzd;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxQkList.jsp","SelectQkCrm_khxx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_xb","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qye","crm_khxx_jcjjqye","crm_khxx_qyrq","crm_khxx_jsje","crm_khxx_gcjdbm","sq_dwxx_dwmc","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
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
	coluParm.link="/khxx/ViewCwxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.alignStr[10]="align='left'";
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
  <B><font size="3">家装欠款客户查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="5%">家装签约额</td>
	<td  width="4%">环保项目金额</td>
	<td  width="4%">增减项</td>
	<td  width="5%">工程实收款</td>
	<td  width="4%">收款期数</td>
	<td  width="5%">最近收款时间</td>
	<td  width="6%">客户类型</td>
	<td  width="15%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检</td>
	<td  width="3%">停工</td>
	<td  width="4%">工程进度</td>
	<td  width="5%">隐蔽工程验收</td>
	<td  width="3%">折扣率</td>
	<td  width="5%">签约店面</td>
	<td  width="5%">签约日期</td>
	<td  width="5%">合同竣工日期</td>
	<td  width="3%">房屋面积 </td>
	<td  width="3%">客户编号</td>
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