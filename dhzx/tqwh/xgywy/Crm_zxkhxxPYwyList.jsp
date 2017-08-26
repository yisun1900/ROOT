<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String kkbbz=(String)session.getAttribute("kkbbz");

String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_zxkhxx_khbh=null;
	String crm_zxkhxx_xb=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_lxfs=null;
	String crm_zxkhxx_fwlxbm=null;
	String crm_zxkhxx_hxbm=null;
	String crm_zxkhxx_fwmj=null;
	String crm_zxkhxx_fgyqbm=null;
	String sjs=null;
	String crm_zxkhxx_zxysbm=null;
	String crm_zxkhxx_zxzt=null;
	String zxdm=null;
	String crm_zxkhxx_qtqk=null;
	String crm_zxkhxx_sbyybm=null;
	String crm_zxkhxx_zxhfsj=null;
	String crm_zxkhxx_sfxhf=null;
	String crm_zxkhxx_hfrq=null;
	String crm_zxkhxx_hflxbm=null;
	String crm_zxkhxx_hdbz=null;
	String crm_zxkhxx_khlxbm=null;
	String crm_zxkhxx_lrr=null;
	String crm_zxkhxx_lrsj=null;
	String crm_zxkhxx_sbsj=null;
	String ybjsgd=null;
	String ybjdz=null;

	String sfyywy=request.getParameter("sfyywy");

	if (sfyywy!=null)
	{
		if (sfyywy.equals("Y"))
		{
			wheresql+=" and  (crm_zxkhxx.ywy is not null)";
		}
		else{
			wheresql+=" and  (crm_zxkhxx.ywy is  null)";
		}
	}

	String xxlybm=null;
	xxlybm=request.getParameter("xxlybm");
	if (xxlybm!=null)
	{
		xxlybm=cf.GB2Uni(xxlybm);
		if (!(xxlybm.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh in(select khbh from  crm_khxxly where khlx='2' and xxlybm='"+xxlybm+"'))";
	}

	String crm_zxkhxx_khxm=null;
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	String crm_zxkhxx_khxm2=null;
	crm_zxkhxx_khxm2=request.getParameter("crm_zxkhxx_khxm2");
	if (crm_zxkhxx_khxm2!=null)
	{
		crm_zxkhxx_khxm2=cf.GB2Uni(crm_zxkhxx_khxm2);
		if (!(crm_zxkhxx_khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm2+"%')";
	}

	String lfbz=null;
	lfbz=request.getParameter("lfbz");
	if (lfbz!=null)
	{
		lfbz=cf.GB2Uni(lfbz);
		if (!(lfbz.equals("")))	wheresql+=" and  (crm_zxkhxx.lfbz='"+lfbz+"')";
	}
	String ctbz=null;
	ctbz=request.getParameter("ctbz");
	if (ctbz!=null)
	{
		ctbz=cf.GB2Uni(ctbz);
		if (!(ctbz.equals("")))	wheresql+=" and  (crm_zxkhxx.ctbz='"+ctbz+"')";
	}

	String sjfbz=null;
	sjfbz=request.getParameter("sjfbz");
	if (sjfbz!=null)
	{
		if (!(sjfbz.equals("")))	wheresql+=" and  (crm_zxkhxx.sjfbz='"+sjfbz+"')";
	}
	String jsjfsj=null;
	jsjfsj=request.getParameter("jsjfsj");
	if (jsjfsj!=null)
	{
		if (!(jsjfsj.equals("")))	wheresql+="  and (crm_zxkhxx.jsjfsj>=TO_DATE('"+jsjfsj+"','YYYY-MM-DD'))";
	}
	jsjfsj=request.getParameter("jsjfsj2");
	if (jsjfsj!=null)
	{
		if (!(jsjfsj.equals("")))	wheresql+="  and (crm_zxkhxx.jsjfsj<=TO_DATE('"+jsjfsj+"','YYYY-MM-DD'))";
	}
	
	
	String sbyyxs=null;
	sbyyxs=request.getParameter("sbyyxs");
	if (sbyyxs!=null)
	{
		sbyyxs=cf.GB2Uni(sbyyxs);
		if (!(sbyyxs.equals("")))	wheresql+=" and  (crm_zxkhxx.sbyyxs like '%"+sbyyxs+"%')";
	}

	String sfqd=null;
	sfqd=request.getParameter("sfqd");
	if (sfqd!=null)
	{
		
		if (sfqd.equals("1"))
		{
			wheresql+=" and  (crm_zxkhxx.zxzt not in('3','4') )";
		}
		else if (sfqd.equals("2"))//签单
		{
			wheresql+=" and  (crm_zxkhxx.zxzt in('3') )";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
		}
		else if (sfqd.equals("3"))//失败
		{
			wheresql+=" and  (crm_zxkhxx.zxzt in('4') )";
		}
	}

	String sfjczjz=null;
	sfjczjz=request.getParameter("sfjczjz");
	if (sfjczjz!=null)
	{
		if (!(sfjczjz.equals("")))	wheresql+=" and  (crm_zxkhxx.sfjczjz='"+sfjczjz+"')";
	}

	String cxhdbm=null;
	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_zxkhxx.cxhdbm='"+cxhdbm+"')";
	}


	String sfzdzbj=null;
	sfzdzbj=request.getParameter("sfzdzbj");
	if (sfzdzbj!=null)
	{
		if (!(sfzdzbj.equals("")))	wheresql+=" and  (crm_zxkhxx.sfzdzbj='"+sfzdzbj+"')";
	}
	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		if (!(bjjb.equals("")))	wheresql+=" and  (crm_zxkhxx.bjjb='"+bjjb+"')";
	}
	String jzbz=null;
	jzbz=request.getParameter("jzbz");
	if (jzbz!=null)
	{
		if (!(jzbz.equals("")))	wheresql+=" and  (crm_zxkhxx.jzbz='"+jzbz+"')";
	}

	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=cf.GB2Uni(shbz);
		if (!(shbz.equals("")))	wheresql+=" and  (crm_zxkhxx.shbz='"+shbz+"')";
	}

	String xqbm=null;
	xqbm=request.getParameter("xqbm");
	if (xqbm!=null)
	{
		xqbm=cf.GB2Uni(xqbm);
		if (!(xqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.xqbm like '%"+xqbm+"%')";
	}

	String rddqbm=null;
	rddqbm=request.getParameter("rddqbm");
	if (rddqbm!=null)
	{
		rddqbm=cf.GB2Uni(rddqbm);
		if (!(rddqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.rddqbm='"+rddqbm+"')";
	}
	String hxwzbm=null;
	hxwzbm=request.getParameter("hxwzbm");
	if (hxwzbm!=null)
	{
		hxwzbm=cf.GB2Uni(hxwzbm);
		if (!(hxwzbm.equals("")))	wheresql+=" and  (crm_zxkhxx.hxwzbm='"+hxwzbm+"')";
	}
	String ysrbm=null;
	ysrbm=request.getParameter("ysrbm");
	if (ysrbm!=null)
	{
		ysrbm=cf.GB2Uni(ysrbm);
		if (!(ysrbm.equals("")))	wheresql+=" and  (crm_zxkhxx.ysrbm='"+ysrbm+"')";
	}
	String nlqjbm=null;
	nlqjbm=request.getParameter("nlqjbm");
	if (nlqjbm!=null)
	{
		nlqjbm=cf.GB2Uni(nlqjbm);
		if (!(nlqjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.nlqjbm='"+nlqjbm+"')";
	}
	String zybm=null;
	zybm=request.getParameter("zybm");
	if (zybm!=null)
	{
		zybm=cf.GB2Uni(zybm);
		if (!(zybm.equals("")))	wheresql+=" and  (crm_zxkhxx.zybm='"+zybm+"')";
	}

	
	String sjsbh=null;
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (crm_zxkhxx.sjsbh='"+sjsbh+"')";
	}

	String yzxxbz=null;
	yzxxbz=request.getParameter("yzxxbz");
	if (yzxxbz!=null)
	{
		if (!(yzxxbz.equals("")))	wheresql+=" and  (crm_zxkhxx.yzxxbz='"+yzxxbz+"')";
	}

	String zxdmfpsj=null;
	zxdmfpsj=request.getParameter("zxdmfpsj");
	if (zxdmfpsj!=null)
	{
		if (!(zxdmfpsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxdmfpsj>=TO_DATE('"+zxdmfpsj+"','YYYY-MM-DD'))";
	}
	zxdmfpsj=request.getParameter("zxdmfpsj2");
	if (zxdmfpsj!=null)
	{
		if (!(zxdmfpsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxdmfpsj<=TO_DATE('"+zxdmfpsj+"','YYYY-MM-DD'))";
	}
	String sjsfpsj=null;
	sjsfpsj=request.getParameter("sjsfpsj");
	if (sjsfpsj!=null)
	{
		if (!(sjsfpsj.equals("")))	wheresql+="  and (crm_zxkhxx.sjsfpsj>=TO_DATE('"+sjsfpsj+"','YYYY-MM-DD'))";
	}
	sjsfpsj=request.getParameter("sjsfpsj2");
	if (sjsfpsj!=null)
	{
		if (!(sjsfpsj.equals("")))	wheresql+="  and (crm_zxkhxx.sjsfpsj<=TO_DATE('"+sjsfpsj+"','YYYY-MM-DD'))";
	}
	String jhjfsj=null;
	jhjfsj=request.getParameter("jhjfsj");
	if (jhjfsj!=null)
	{
		if (!(jhjfsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhjfsj>=TO_DATE('"+jhjfsj+"','YYYY-MM-DD'))";
	}
	jhjfsj=request.getParameter("jhjfsj2");
	if (jhjfsj!=null)
	{
		if (!(jhjfsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhjfsj<=TO_DATE('"+jhjfsj+"','YYYY-MM-DD'))";
	}
	String yjzxsj=null;
	yjzxsj=request.getParameter("yjzxsj");
	if (yjzxsj!=null)
	{
		if (!(yjzxsj.equals("")))	wheresql+="  and (crm_zxkhxx.yjzxsj>=TO_DATE('"+yjzxsj+"','YYYY-MM-DD'))";
	}
	yjzxsj=request.getParameter("yjzxsj2");
	if (yjzxsj!=null)
	{
		if (!(yjzxsj.equals("")))	wheresql+="  and (crm_zxkhxx.yjzxsj<=TO_DATE('"+yjzxsj+"','YYYY-MM-DD'))";
	}



	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}

	String lfdjbz=null;
	lfdjbz=request.getParameter("lfdjbz");
	if (lfdjbz!=null)
	{
		if (!(lfdjbz.equals("")))	wheresql+=" and  (crm_zxkhxx.lfdjbz='"+lfdjbz+"')";
	}
	String jlfdjsj=null;
	jlfdjsj=request.getParameter("jlfdjsj");
	if (jlfdjsj!=null)
	{
		if (!(jlfdjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jlfdjsj>=TO_DATE('"+jlfdjsj+"','YYYY-MM-DD'))";
	}
	jlfdjsj=request.getParameter("jlfdjsj2");
	if (jlfdjsj!=null)
	{
		if (!(jlfdjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jlfdjsj<=TO_DATE('"+jlfdjsj+"','YYYY-MM-DD'))";
	}
	String hddjbz=null;
	hddjbz=request.getParameter("hddjbz");
	if (hddjbz!=null)
	{
		if (!(hddjbz.equals("")))	wheresql+=" and  (crm_zxkhxx.hddjbz='"+hddjbz+"')";
	}
	String jhddjsj=null;
	jhddjsj=request.getParameter("jhddjsj");
	if (jhddjsj!=null)
	{
		if (!(jhddjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhddjsj>=TO_DATE('"+jhddjsj+"','YYYY-MM-DD'))";
	}
	jhddjsj=request.getParameter("jhddjsj2");
	if (jhddjsj!=null)
	{
		if (!(jhddjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhddjsj<=TO_DATE('"+jhddjsj+"','YYYY-MM-DD'))";
	}

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		if (!(dqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dqbm='"+dqbm+"'))";
	}
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String crm_zxkhxx_zxdjbm=null;
	crm_zxkhxx_zxdjbm=request.getParameter("crm_zxkhxx_zxdjbm");
	if (crm_zxkhxx_zxdjbm!=null)
	{
		if (!(crm_zxkhxx_zxdjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm='"+crm_zxkhxx_zxdjbm+"')";
	}
	ybjsgd=request.getParameter("ybjsgd");
	if (ybjsgd!=null)
	{
		ybjsgd=cf.GB2Uni(ybjsgd);
		if (!(ybjsgd.equals("")))	wheresql+=" and  (crm_zxkhxx.ybjsgd='"+ybjsgd+"')";
	}
	ybjdz=request.getParameter("ybjdz");
	if (ybjdz!=null)
	{
		ybjdz=cf.GB2Uni(ybjdz);
		if (!(ybjdz.equals("")))	wheresql+=" and  (crm_zxkhxx.ybjdz like '%"+ybjdz+"%')";
	}

	String cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.cqbm='"+cqbm+"')";
	}
	String hdr=null;
	hdr=request.getParameter("hdr");
	if (hdr!=null)
	{
		hdr=cf.GB2Uni(hdr);
		if (!(hdr.equals("")))	wheresql+=" and  (crm_zxkhxx.hdr='"+hdr+"')";
	}
	String cgdz=null;
	cgdz=request.getParameter("cgdz");
	if (cgdz!=null)
	{
		cgdz=cf.GB2Uni(cgdz);
		if (!(cgdz.equals("")))	wheresql+=" and  (crm_zxkhxx.cgdz like '%"+cgdz+"%')";
	}
	
	
	crm_zxkhxx_khbh=request.getParameter("crm_zxkhxx_khbh");
	if (crm_zxkhxx_khbh!=null)
	{
		crm_zxkhxx_khbh=cf.GB2Uni(crm_zxkhxx_khbh);
		if (!(crm_zxkhxx_khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+crm_zxkhxx_khbh+"')";
	}
	crm_zxkhxx_xb=request.getParameter("crm_zxkhxx_xb");
	if (crm_zxkhxx_xb!=null)
	{
		crm_zxkhxx_xb=cf.GB2Uni(crm_zxkhxx_xb);
		if (!(crm_zxkhxx_xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+crm_zxkhxx_xb+"')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz+"%')";
	}
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+crm_zxkhxx_lxfs+"')";
	}
	crm_zxkhxx_fwlxbm=request.getParameter("crm_zxkhxx_fwlxbm");
	if (crm_zxkhxx_fwlxbm!=null)
	{
		crm_zxkhxx_fwlxbm=cf.GB2Uni(crm_zxkhxx_fwlxbm);
		if (!(crm_zxkhxx_fwlxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.fwlxbm='"+crm_zxkhxx_fwlxbm+"')";
	}
	crm_zxkhxx_hxbm=request.getParameter("crm_zxkhxx_hxbm");
	if (crm_zxkhxx_hxbm!=null)
	{
		crm_zxkhxx_hxbm=cf.GB2Uni(crm_zxkhxx_hxbm);
		if (!(crm_zxkhxx_hxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.hxbm='"+crm_zxkhxx_hxbm+"')";
	}
	crm_zxkhxx_fwmj=request.getParameter("crm_zxkhxx_fwmj");
	if (crm_zxkhxx_fwmj!=null)
	{
		crm_zxkhxx_fwmj=crm_zxkhxx_fwmj.trim();
		if (!(crm_zxkhxx_fwmj.equals("")))	wheresql+=" and (crm_zxkhxx.fwmj="+crm_zxkhxx_fwmj+") ";
	}
	crm_zxkhxx_fgyqbm=request.getParameter("crm_zxkhxx_fgyqbm");
	if (crm_zxkhxx_fgyqbm!=null)
	{
		crm_zxkhxx_fgyqbm=cf.GB2Uni(crm_zxkhxx_fgyqbm);
		if (!(crm_zxkhxx_fgyqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.fgyqbm='"+crm_zxkhxx_fgyqbm+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	crm_zxkhxx_zxysbm=request.getParameter("crm_zxkhxx_zxysbm");
	if (crm_zxkhxx_zxysbm!=null)
	{
		crm_zxkhxx_zxysbm=cf.GB2Uni(crm_zxkhxx_zxysbm);
		if (!(crm_zxkhxx_zxysbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxysbm='"+crm_zxkhxx_zxysbm+"')";
	}
	crm_zxkhxx_zxzt=request.getParameter("crm_zxkhxx_zxzt");
	if (crm_zxkhxx_zxzt!=null)
	{
		crm_zxkhxx_zxzt=cf.GB2Uni(crm_zxkhxx_zxzt);
		if (!(crm_zxkhxx_zxzt.equals("")))	wheresql+=" and  (crm_zxkhxx.zxzt='"+crm_zxkhxx_zxzt+"')";
	}

	
	
	crm_zxkhxx_qtqk=request.getParameter("crm_zxkhxx_qtqk");
	if (crm_zxkhxx_qtqk!=null)
	{
		crm_zxkhxx_qtqk=cf.GB2Uni(crm_zxkhxx_qtqk);
		if (!(crm_zxkhxx_qtqk.equals("")))	wheresql+=" and  (crm_zxkhxx.qtqk='"+crm_zxkhxx_qtqk+"')";
	}
	crm_zxkhxx_sbyybm=request.getParameter("crm_zxkhxx_sbyybm");
	if (crm_zxkhxx_sbyybm!=null)
	{
		crm_zxkhxx_sbyybm=cf.GB2Uni(crm_zxkhxx_sbyybm);
		if (!(crm_zxkhxx_sbyybm.equals("")))	wheresql+=" and  (crm_zxkhxx.sbyybm='"+crm_zxkhxx_sbyybm+"')";
	}
	crm_zxkhxx_zxhfsj=request.getParameter("crm_zxkhxx_zxhfsj");
	if (crm_zxkhxx_zxhfsj!=null)
	{
		crm_zxkhxx_zxhfsj=crm_zxkhxx_zxhfsj.trim();
		if (!(crm_zxkhxx_zxhfsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxhfsj=TO_DATE('"+crm_zxkhxx_zxhfsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_sfxhf=request.getParameter("crm_zxkhxx_sfxhf");
	if (crm_zxkhxx_sfxhf!=null)
	{
		crm_zxkhxx_sfxhf=cf.GB2Uni(crm_zxkhxx_sfxhf);
		if (!(crm_zxkhxx_sfxhf.equals("")))	wheresql+=" and  (crm_zxkhxx.sfxhf='"+crm_zxkhxx_sfxhf+"')";
	}
	crm_zxkhxx_hfrq=request.getParameter("crm_zxkhxx_hfrq");
	if (crm_zxkhxx_hfrq!=null)
	{
		crm_zxkhxx_hfrq=crm_zxkhxx_hfrq.trim();
		if (!(crm_zxkhxx_hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq>=TO_DATE('"+crm_zxkhxx_hfrq+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_hfrq=request.getParameter("crm_zxkhxx_hfrq2");
	if (crm_zxkhxx_hfrq!=null)
	{
		crm_zxkhxx_hfrq=crm_zxkhxx_hfrq.trim();
		if (!(crm_zxkhxx_hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq<=TO_DATE('"+crm_zxkhxx_hfrq+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_hflxbm=request.getParameter("crm_zxkhxx_hflxbm");
	if (crm_zxkhxx_hflxbm!=null)
	{
		crm_zxkhxx_hflxbm=cf.GB2Uni(crm_zxkhxx_hflxbm);
		if (!(crm_zxkhxx_hflxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.hflxbm='"+crm_zxkhxx_hflxbm+"')";
	}
	crm_zxkhxx_hdbz=request.getParameter("crm_zxkhxx_hdbz");
	if (crm_zxkhxx_hdbz!=null)
	{
		crm_zxkhxx_hdbz=cf.GB2Uni(crm_zxkhxx_hdbz);
		if (!(crm_zxkhxx_hdbz.equals("")))	wheresql+=" and  (crm_zxkhxx.hdbz='"+crm_zxkhxx_hdbz+"')";
	}
	crm_zxkhxx_khlxbm=request.getParameter("crm_zxkhxx_khlxbm");
	if (crm_zxkhxx_khlxbm!=null)
	{
		crm_zxkhxx_khlxbm=cf.GB2Uni(crm_zxkhxx_khlxbm);
		if (!(crm_zxkhxx_khlxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.khlxbm='"+crm_zxkhxx_khlxbm+"')";
	}
	crm_zxkhxx_lrr=request.getParameter("crm_zxkhxx_lrr");
	if (crm_zxkhxx_lrr!=null)
	{
		crm_zxkhxx_lrr=cf.GB2Uni(crm_zxkhxx_lrr);
		if (!(crm_zxkhxx_lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+crm_zxkhxx_lrr+"')";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj2");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_sbsj=request.getParameter("crm_zxkhxx_sbsj");
	if (crm_zxkhxx_sbsj!=null)
	{
		crm_zxkhxx_sbsj=crm_zxkhxx_sbsj.trim();
		if (!(crm_zxkhxx_sbsj.equals("")))	wheresql+="  and (crm_zxkhxx.sbsj>=TO_DATE('"+crm_zxkhxx_sbsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_sbsj=request.getParameter("crm_zxkhxx_sbsj2");
	if (crm_zxkhxx_sbsj!=null)
	{
		crm_zxkhxx_sbsj=crm_zxkhxx_sbsj.trim();
		if (!(crm_zxkhxx_sbsj.equals("")))	wheresql+="  and (crm_zxkhxx.sbsj<=TO_DATE('"+crm_zxkhxx_sbsj+"','YYYY/MM/DD'))";
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


	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过'),sjs,ywy,b.dwmc as ywybm,c.dwmc as ywyssxz,a.dwmc as zxdm,lrsj ";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,sq_dwxx c ";
	ls_sql+=" where crm_zxkhxx.zxdm=a.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.ywybm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.ywyssxz=c.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.ywy is null ";
	ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5') ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
	ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhxxPYwyList.jsp","","","PYwyEditCrm_zxkhxx.jsp");


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"批量修改"};//按钮的显示名称
	String[] buttonLink={"PlGhYwyEditCrm_zxkhxx.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<CENTER >
  <B><font size="3">咨询客户--派业务员</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="7%">客户编号</td>
	<td  width="7%">姓名</td>
	<td  width="21%">房屋地址</td>
	<td  width="7%">咨询状态</td>
	<td  width="6%">设计师</td>
	<td  width="6%">业务员</td>
	<td  width="10%">业务员部门</td>
	<td  width="10%">业务员小组</td>

	<td  width="10%">咨询店面</td>
	<td  width="9%">录入时间</td>

</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 


</body>
<script  LANGUAGE="javascript">

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>