<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='030711'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[更换报价级别]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
String kkbbz=(String)session.getAttribute("kkbbz");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_zxkhxx_khbh=null;
	String crm_zxkhxx_khxm=null;
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
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm+"%')";
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

	String myxssl=null;
	if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
	{
		myxssl=request.getParameter("myxssl");
	}


	String sfjhddj=request.getParameter("sfjhddj");

	if (sfjhddj!=null && sfjhddj.equals("Y"))
	{
		ls_sql="SELECT distinct crm_zxkhxx.khbh as khbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(crm_zxkhxx.shbz,'N','未审核','Y','审核'),DECODE(crm_zxkhxx.sfzdzbj,'N','未做','Y','已做') sfzdzbj,crm_zxkhxx.dzbjze,crm_zxkhxx.zcbjje,bjjbmc,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.cxhdbm,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,b.dwmc as zxdm,crm_zxkhxx.sjs,ywy,sbyymc,crm_zxkhxx.lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,DECODE(crm_zxkhxx.hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') as crm_zxkhxx_hdbz,crm_zxkhxx.bz  ";
		ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm,cw_khfkjl ";
		ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
		ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
		ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.khbh=cw_khfkjl.khbh and cw_khfkjl.fklxbm='51'";
		ls_sql+=wheresql;
		ls_sql+=ordersql;
	}
	else if (sfjhddj!=null && sfjhddj.equals("N"))
	{
		ls_sql=" (";
		ls_sql+=" SELECT distinct crm_zxkhxx.khbh as khbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(crm_zxkhxx.shbz,'N','未审核','Y','审核'),DECODE(crm_zxkhxx.sfzdzbj,'N','未做','Y','已做') sfzdzbj,crm_zxkhxx.dzbjze,crm_zxkhxx.zcbjje,bjjbmc,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.cxhdbm,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,b.dwmc as zxdm,crm_zxkhxx.sjs,ywy,sbyymc,crm_zxkhxx.lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,DECODE(crm_zxkhxx.hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') as crm_zxkhxx_hdbz,crm_zxkhxx.bz  ";
		ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm,cw_khfkjl ";
		ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
		ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
		ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.khbh=cw_khfkjl.khbh ";
		ls_sql+=wheresql;

		ls_sql+=" minus ";

		ls_sql+=" SELECT distinct crm_zxkhxx.khbh as khbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(crm_zxkhxx.shbz,'N','未审核','Y','审核'),DECODE(crm_zxkhxx.sfzdzbj,'N','未做','Y','已做') sfzdzbj,crm_zxkhxx.dzbjze,crm_zxkhxx.zcbjje,bjjbmc,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.cxhdbm,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,b.dwmc as zxdm,crm_zxkhxx.sjs,ywy,sbyymc,crm_zxkhxx.lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,DECODE(crm_zxkhxx.hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') as crm_zxkhxx_hdbz,crm_zxkhxx.bz  ";
		ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm,cw_khfkjl ";
		ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
		ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
		ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.khbh=cw_khfkjl.khbh and cw_khfkjl.fklxbm='51'";
		ls_sql+=wheresql;

		ls_sql+=" ) ";

		ls_sql+=" union all ";
		
		ls_sql+=" SELECT distinct crm_zxkhxx.khbh as khbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(crm_zxkhxx.shbz,'N','未审核','Y','审核'),DECODE(crm_zxkhxx.sfzdzbj,'N','未做','Y','已做') sfzdzbj,crm_zxkhxx.dzbjze,crm_zxkhxx.zcbjje,bjjbmc,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.cxhdbm,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,b.dwmc as zxdm,crm_zxkhxx.sjs,ywy,sbyymc,crm_zxkhxx.lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,DECODE(crm_zxkhxx.hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') as crm_zxkhxx_hdbz,crm_zxkhxx.bz  ";
		ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm,cw_khfkjl ";
		ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
		ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
		ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.khbh=cw_khfkjl.khbh(+) and cw_khfkjl.fklxbm is null";
		ls_sql+=wheresql;

//		out.println(ls_sql);

//		ls_sql+=ordersql;
	}
	else
	{
		ls_sql="SELECT crm_zxkhxx.khbh as khbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(shbz,'N','未审核','Y','审核'),DECODE(sfzdzbj,'N','未做','Y','已做') sfzdzbj,dzbjze,crm_zxkhxx.zcbjje,bjjbmc,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.cxhdbm,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,b.dwmc as zxdm,sjs,ywy,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,DECODE(crm_zxkhxx.hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') as crm_zxkhxx_hdbz,crm_zxkhxx.bz  ";
		ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
		ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
		ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
		ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
		ls_sql+=wheresql;
		ls_sql+=ordersql;
	}


//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhxxGhjbList.jsp","SelectGhjbCrm_zxkhxx.jsp","","");
	if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
	{
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		pageObj.setPageRow(25);
	}
/*
//设置显示列
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_fwlxbm","crm_zxkhxx_sfxhf","crm_zxkhxx_hfrq","crm_zxkhxx_hflxbm","crm_zxkhxx_hdbz","crm_zxkhxx_zxzt","crm_zxkhxx_khlxbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"更换报价级别","检查单价是否正确"};//按钮的显示名称
	String[] buttonLink={"UpdateBjjb.jsp","CheckBjjb.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<%
if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
	<%
}
else{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>
<CENTER >
  <B><font size="3">更换报价级别</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">客户编号</td>
	<td  width="5%">咨询状态</td>
	<td  width="3%">审核标志</td>
	<td  width="3%">电子报价</td>
	<td  width="4%">电子报价总额</td>
	<td  width="3%">主材报价</td>
	<td  width="3%">报价级别</td>
	<td  width="4%">姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="4%">参加促销活动</td>
	<td  width="3%">家装标志</td>
	<td  width="9%">联系方式</td>
	<td  width="6%">咨询店面</td>
	<td  width="3%">设计师</td>
	<td  width="3%">业务员</td>
	<td  width="6%">失败原因</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">咨询登记部门</td>
	<td  width="4%">房屋类型</td>
	<td  width="3%">回单标志</td>
	<td  width="8%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">

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