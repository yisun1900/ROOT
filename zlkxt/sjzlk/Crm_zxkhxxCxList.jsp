<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"100201")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String kkbbz=(String)session.getAttribute("kkbbz");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_zxkhxx_fwlxbm=null;
	String crm_zxkhxx_fwmj=null;
	String crm_zxkhxx_fgyqbm=null;
	String sjs=null;
	String crm_zxkhxx_zxysbm=null;
	String crm_zxkhxx_zxzt=null;
	String zxdm=null;
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

	String crm_zxkhxx_khbh=null;
	crm_zxkhxx_khbh=request.getParameter("crm_zxkhxx_khbh");
	if (crm_zxkhxx_khbh!=null)
	{
		crm_zxkhxx_khbh=cf.GB2Uni(crm_zxkhxx_khbh);
		if (!(crm_zxkhxx_khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+crm_zxkhxx_khbh+"')";
	}
	String crm_zxkhxx_xb=null;
	crm_zxkhxx_xb=request.getParameter("crm_zxkhxx_xb");
	if (crm_zxkhxx_xb!=null)
	{
		crm_zxkhxx_xb=cf.GB2Uni(crm_zxkhxx_xb);
		if (!(crm_zxkhxx_xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+crm_zxkhxx_xb+"')";
	}

	
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}
	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}
	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}

	
	String zklx=null;
	zklx=request.getParameter("zklx");
	if (zklx!=null)
	{
		if (!(zklx.equals("")))	wheresql+=" and  (crm_zxkhxx.zklx='"+zklx+"')";
	}

	String ysshbz=null;
	ysshbz=request.getParameter("ysshbz");
	if (ysshbz!=null)
	{
		ysshbz=cf.GB2Uni(ysshbz);
		if (!(ysshbz.equals("")))	wheresql+=" and  (crm_zxkhxx.ysshbz='"+ysshbz+"')";
	}

	String qsjhtbz=null;
	qsjhtbz=request.getParameter("qsjhtbz");
	if (qsjhtbz!=null)
	{
		qsjhtbz=cf.GB2Uni(qsjhtbz);
		if (!(qsjhtbz.equals("")))	wheresql+=" and  (crm_zxkhxx.qsjhtbz='"+qsjhtbz+"')";
	}
	String qsjhtsj=null;
	qsjhtsj=request.getParameter("qsjhtsj");
	if (qsjhtsj!=null)
	{
		if (!(qsjhtsj.equals("")))	wheresql+="  and (crm_zxkhxx.qsjhtsj>=TO_DATE('"+qsjhtsj+"','YYYY-MM-DD'))";
	}
	qsjhtsj=request.getParameter("qsjhtsj2");
	if (qsjhtsj!=null)
	{
		if (!(qsjhtsj.equals("")))	wheresql+="  and (crm_zxkhxx.qsjhtsj<=TO_DATE('"+qsjhtsj+"','YYYY-MM-DD'))";
	}

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

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}
	String xxlysm=null;
	xxlysm=request.getParameter("xxlysm");
	if (xxlysm!=null)
	{
		xxlysm=cf.GB2Uni(xxlysm);
		if (!(xxlysm.equals("")))	wheresql+=" and  (crm_zxkhxx.xxlysm like '%"+xxlysm+"%')";
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
			wheresql+=" and  (crm_zxkhxx.zxzt in('0','1','5') )";
		}
		else if (sfqd.equals("2"))//ǩ��
		{
			wheresql+=" and  (crm_zxkhxx.zxzt in('3') )";//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		}
		else if (sfqd.equals("3"))//ʧ��
		{
			wheresql+=" and  (crm_zxkhxx.zxzt in('2','4') )";
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
	
	
	crm_zxkhxx_fwlxbm=request.getParameter("crm_zxkhxx_fwlxbm");
	if (crm_zxkhxx_fwlxbm!=null)
	{
		crm_zxkhxx_fwlxbm=cf.GB2Uni(crm_zxkhxx_fwlxbm);
		if (!(crm_zxkhxx_fwlxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.fwlxbm='"+crm_zxkhxx_fwlxbm+"')";
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
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+crm_zxkhxx_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
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

	String jhctsj=null;
	jhctsj=request.getParameter("jhctsj");
	if (jhctsj!=null)
	{
		jhctsj=jhctsj.trim();
		if (!(jhctsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhctsj>=TO_DATE('"+jhctsj+"','YYYY-MM-DD'))";
	}
	jhctsj=request.getParameter("jhctsj2");
	if (jhctsj!=null)
	{
		jhctsj=jhctsj.trim();
		if (!(jhctsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhctsj<=TO_DATE('"+jhctsj+"','YYYY-MM-DD'))";
	}
	String jhcxgtsj=null;
	jhcxgtsj=request.getParameter("jhcxgtsj");
	if (jhcxgtsj!=null)
	{
		jhcxgtsj=jhcxgtsj.trim();
		if (!(jhcxgtsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhcxgtsj>=TO_DATE('"+jhcxgtsj+"','YYYY-MM-DD'))";
	}
	jhcxgtsj=request.getParameter("jhcxgtsj2");
	if (jhcxgtsj!=null)
	{
		jhcxgtsj=jhcxgtsj.trim();
		if (!(jhcxgtsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhcxgtsj<=TO_DATE('"+jhcxgtsj+"','YYYY-MM-DD'))";
	}
	String jhcsgtsj=null;
	jhcsgtsj=request.getParameter("jhcsgtsj");
	if (jhcsgtsj!=null)
	{
		jhcsgtsj=jhcsgtsj.trim();
		if (!(jhcsgtsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhcsgtsj>=TO_DATE('"+jhcsgtsj+"','YYYY-MM-DD'))";
	}
	jhcsgtsj=request.getParameter("jhcsgtsj2");
	if (jhcsgtsj!=null)
	{
		jhcsgtsj=jhcsgtsj.trim();
		if (!(jhcsgtsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhcsgtsj<=TO_DATE('"+jhcsgtsj+"','YYYY-MM-DD'))";
	}
	String jhzbjsj=null;
	jhzbjsj=request.getParameter("jhzbjsj");
	if (jhzbjsj!=null)
	{
		jhzbjsj=jhzbjsj.trim();
		if (!(jhzbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhzbjsj>=TO_DATE('"+jhzbjsj+"','YYYY-MM-DD'))";
	}
	jhzbjsj=request.getParameter("jhzbjsj2");
	if (jhzbjsj!=null)
	{
		jhzbjsj=jhzbjsj.trim();
		if (!(jhzbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhzbjsj<=TO_DATE('"+jhzbjsj+"','YYYY-MM-DD'))";
	}
	String sczbjsj=null;
	sczbjsj=request.getParameter("sczbjsj");
	if (sczbjsj!=null)
	{
		sczbjsj=sczbjsj.trim();
		if (!(sczbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.sczbjsj>=TO_DATE('"+sczbjsj+"','YYYY-MM-DD'))";
	}
	sczbjsj=request.getParameter("sczbjsj2");
	if (sczbjsj!=null)
	{
		sczbjsj=sczbjsj.trim();
		if (!(sczbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.sczbjsj<=TO_DATE('"+sczbjsj+"','YYYY-MM-DD'))";
	}
	String khzyxz=null;
	khzyxz=request.getParameter("khzyxz");
	if (khzyxz!=null)
	{
		khzyxz=cf.GB2Uni(khzyxz);
		if (!(khzyxz.equals("")))	wheresql+=" and  (crm_zxkhxx.khzyxz='"+khzyxz+"')";
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
	if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
	{
		myxssl=request.getParameter("myxssl");
	}


	ls_sql="SELECT '��ͼֽ' sc,crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,sjs,khjl,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�ɵ����δͨ��','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��'),DECODE(shbz,'N','δ���','Y','���'),DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��'),zjzbjsj,dzbjze,bjjbmc,qsjhtsj,sjhtje,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,sjf,jsjfsj,lfsj,ctsj,cxgtsj,csgtsj,DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ'),b.dwmc as zxdm,ywy,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc,xxlysm";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
	ls_sql+=ordersql;

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zxkhxxCxList.jsp","","","");

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/zlkxt/loadWj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<%
if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
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
  <B><font size="3">�ϴ����ͼֽ</font></B>
</CENTER>

<div style="height:100%;width:100%;overflow:auto;">

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350,2,2);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">��ѯ״̬</td>
	<td  width="2%">��Ϣ���</td>
	<td  width="2%">Ԥ�����</td>
	<td  width="3%">������ʱ��</td>
	<td  width="3%">���ӱ����ܶ�</td>
	<td  width="2%">���ۼ���</td>
	<td  width="3%">ǩ��ƺ�ͬʱ��</td>
	<td  width="3%">��ƺ�ͬ���</td>
	<td  width="2%">��������</td>
	<td  width="3%">����������ʱ��</td>
	<td  width="5%">�μӴ����</td>
	<td  width="2%">�����</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="3%">ʵ����Ʒ�</td>
	<td  width="3%">����Ʒ�ʱ��</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">��ƽ��ͼʱ��</td>
	<td  width="3%">��Ч��ͼʱ��</td>
	<td  width="3%">��ʩ��ͼʱ��</td>
	<td  width="2%">��װ��־</td>
	<td  width="4%">��ѯ����</td>
	<td  width="2%">ҵ��Ա</td>
	<td  width="5%">ʧ��ԭ��</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">��ѯ�Ǽǲ���</td>
	<td  width="3%">��������</td>
	<td  width="4%">��Ϣ��Դ˵��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</div>

</body>
<script  LANGUAGE="javascript">

function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>