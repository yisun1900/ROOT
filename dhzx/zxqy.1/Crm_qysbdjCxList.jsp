<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String sbyybm=null;
	String sbkhlx=null;
	String sbsj=null;
	String sjbshjl=null;
	String sjbshr=null;
	String sjbshsj=null;
	String scbshjl=null;
	String scbshr=null;
	String scbshsj=null;
	String zgshjl=null;
	String zgshr=null;
	String zgshsj=null;
	String hfjlh=null;
	String hfr=null;
	String hfsj=null;
	String hfsbyybm=null;
	String hfsbkhlx=null;
	String hfsbsj=null;
	String clzt=null;
	String lrr=null;
	String lrsj=null;
	String lrbm=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}



	String khbh=null;
	String khxm=null;
	String fwdz=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz+"%')";
	}

	sbyybm=request.getParameter("sbyybm");
	if (sbyybm!=null)
	{
		sbyybm=cf.GB2Uni(sbyybm);
		if (!(sbyybm.equals("")))	wheresql+=" and  (crm_qysbdj.sbyybm='"+sbyybm+"')";
	}
	sbkhlx=request.getParameter("sbkhlx");
	if (sbkhlx!=null)
	{
		sbkhlx=cf.GB2Uni(sbkhlx);
		if (!(sbkhlx.equals("")))	wheresql+=" and  (crm_qysbdj.sbkhlx='"+sbkhlx+"')";
	}
	sbsj=request.getParameter("sbsj");
	if (sbsj!=null)
	{
		sbsj=sbsj.trim();
		if (!(sbsj.equals("")))	wheresql+="  and (crm_qysbdj.sbsj>=TO_DATE('"+sbsj+"','YYYY/MM/DD'))";
	}
	sbsj=request.getParameter("sbsj2");
	if (sbsj!=null)
	{
		sbsj=sbsj.trim();
		if (!(sbsj.equals("")))	wheresql+="  and (crm_qysbdj.sbsj<=TO_DATE('"+sbsj+"','YYYY/MM/DD'))";
	}
	sjbshjl=request.getParameter("sjbshjl");
	if (sjbshjl!=null)
	{
		sjbshjl=cf.GB2Uni(sjbshjl);
		if (!(sjbshjl.equals("")))	wheresql+=" and  (crm_qysbdj.sjbshjl='"+sjbshjl+"')";
	}
	sjbshr=request.getParameter("sjbshr");
	if (sjbshr!=null)
	{
		sjbshr=cf.GB2Uni(sjbshr);
		if (!(sjbshr.equals("")))	wheresql+=" and  (crm_qysbdj.sjbshr='"+sjbshr+"')";
	}
	sjbshsj=request.getParameter("sjbshsj");
	if (sjbshsj!=null)
	{
		sjbshsj=sjbshsj.trim();
		if (!(sjbshsj.equals("")))	wheresql+="  and (crm_qysbdj.sjbshsj=TO_DATE('"+sjbshsj+"','YYYY/MM/DD'))";
	}
	scbshjl=request.getParameter("scbshjl");
	if (scbshjl!=null)
	{
		scbshjl=cf.GB2Uni(scbshjl);
		if (!(scbshjl.equals("")))	wheresql+=" and  (crm_qysbdj.scbshjl='"+scbshjl+"')";
	}
	scbshr=request.getParameter("scbshr");
	if (scbshr!=null)
	{
		scbshr=cf.GB2Uni(scbshr);
		if (!(scbshr.equals("")))	wheresql+=" and  (crm_qysbdj.scbshr='"+scbshr+"')";
	}
	scbshsj=request.getParameter("scbshsj");
	if (scbshsj!=null)
	{
		scbshsj=scbshsj.trim();
		if (!(scbshsj.equals("")))	wheresql+="  and (crm_qysbdj.scbshsj=TO_DATE('"+scbshsj+"','YYYY/MM/DD'))";
	}
	zgshjl=request.getParameter("zgshjl");
	if (zgshjl!=null)
	{
		zgshjl=cf.GB2Uni(zgshjl);
		if (!(zgshjl.equals("")))	wheresql+=" and  (crm_qysbdj.zgshjl='"+zgshjl+"')";
	}
	zgshr=request.getParameter("zgshr");
	if (zgshr!=null)
	{
		zgshr=cf.GB2Uni(zgshr);
		if (!(zgshr.equals("")))	wheresql+=" and  (crm_qysbdj.zgshr='"+zgshr+"')";
	}
	zgshsj=request.getParameter("zgshsj");
	if (zgshsj!=null)
	{
		zgshsj=zgshsj.trim();
		if (!(zgshsj.equals("")))	wheresql+="  and (crm_qysbdj.zgshsj=TO_DATE('"+zgshsj+"','YYYY/MM/DD'))";
	}
	hfjlh=request.getParameter("hfjlh");
	if (hfjlh!=null)
	{
		hfjlh=cf.GB2Uni(hfjlh);
		if (!(hfjlh.equals("")))	wheresql+=" and  (crm_qysbdj.hfjlh='"+hfjlh+"')";
	}
	hfr=request.getParameter("hfr");
	if (hfr!=null)
	{
		hfr=cf.GB2Uni(hfr);
		if (!(hfr.equals("")))	wheresql+=" and  (crm_qysbdj.hfr='"+hfr+"')";
	}
	hfsj=request.getParameter("hfsj");
	if (hfsj!=null)
	{
		hfsj=hfsj.trim();
		if (!(hfsj.equals("")))	wheresql+="  and (crm_qysbdj.hfsj>=TO_DATE('"+hfsj+"','YYYY/MM/DD'))";
	}
	hfsj=request.getParameter("hfsj2");
	if (hfsj!=null)
	{
		hfsj=hfsj.trim();
		if (!(hfsj.equals("")))	wheresql+="  and (crm_qysbdj.hfsj<=TO_DATE('"+hfsj+"','YYYY/MM/DD'))";
	}
	hfsbyybm=request.getParameter("hfsbyybm");
	if (hfsbyybm!=null)
	{
		hfsbyybm=cf.GB2Uni(hfsbyybm);
		if (!(hfsbyybm.equals("")))	wheresql+=" and  (crm_qysbdj.hfsbyybm='"+hfsbyybm+"')";
	}
	hfsbkhlx=request.getParameter("hfsbkhlx");
	if (hfsbkhlx!=null)
	{
		hfsbkhlx=cf.GB2Uni(hfsbkhlx);
		if (!(hfsbkhlx.equals("")))	wheresql+=" and  (crm_qysbdj.hfsbkhlx='"+hfsbkhlx+"')";
	}
	hfsbsj=request.getParameter("hfsbsj");
	if (hfsbsj!=null)
	{
		hfsbsj=hfsbsj.trim();
		if (!(hfsbsj.equals("")))	wheresql+="  and (crm_qysbdj.hfsbsj>=TO_DATE('"+hfsbsj+"','YYYY/MM/DD'))";
	}
	hfsbsj=request.getParameter("hfsbsj2");
	if (hfsbsj!=null)
	{
		hfsbsj=hfsbsj.trim();
		if (!(hfsbsj.equals("")))	wheresql+="  and (crm_qysbdj.hfsbsj<=TO_DATE('"+hfsbsj+"','YYYY/MM/DD'))";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (crm_qysbdj.clzt='"+clzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_qysbdj.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_qysbdj.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_qysbdj.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (crm_qysbdj.lrbm='"+lrbm+"')";
	}

	
	
	String crm_qysbdj_sjbshr=null;
	String crm_qysbdj_sjhfjlh=null;
	String crm_qysbdj_sjhfr=null;
	String crm_qysbdj_sjhfsj=null;
	String crm_qysbdj_sjhfsbyybm=null;
	String crm_qysbdj_sjhfsbkhlx=null;
	String crm_qysbdj_sjhfsbsj=null;
	String crm_qysbdj_xxrsfhf=null;
	String crm_qysbdj_xxrhfjlh=null;
	String crm_qysbdj_xxrhfr=null;
	String crm_qysbdj_xxrhfsj=null;
	String crm_qysbdj_xxrhfsbyybm=null;
	String crm_qysbdj_xxrhfsbkhlx=null;
	String crm_qysbdj_xxrhfsbsj=null;
	
	crm_qysbdj_sjbshr=request.getParameter("crm_qysbdj_sjbshr");
	if (crm_qysbdj_sjbshr!=null)
	{
		crm_qysbdj_sjbshr=cf.GB2Uni(crm_qysbdj_sjbshr);
		if (!(crm_qysbdj_sjbshr.equals("")))	wheresql+=" and  (crm_qysbdj.sjbshr='"+crm_qysbdj_sjbshr+"')";
	}
	crm_qysbdj_sjhfjlh=request.getParameter("crm_qysbdj_sjhfjlh");
	if (crm_qysbdj_sjhfjlh!=null)
	{
		crm_qysbdj_sjhfjlh=cf.GB2Uni(crm_qysbdj_sjhfjlh);
		if (!(crm_qysbdj_sjhfjlh.equals("")))	wheresql+=" and  (crm_qysbdj.sjhfjlh='"+crm_qysbdj_sjhfjlh+"')";
	}
	crm_qysbdj_sjhfr=request.getParameter("crm_qysbdj_sjhfr");
	if (crm_qysbdj_sjhfr!=null)
	{
		crm_qysbdj_sjhfr=cf.GB2Uni(crm_qysbdj_sjhfr);
		if (!(crm_qysbdj_sjhfr.equals("")))	wheresql+=" and  (crm_qysbdj.sjhfr='"+crm_qysbdj_sjhfr+"')";
	}
	crm_qysbdj_sjhfsj=request.getParameter("crm_qysbdj_sjhfsj");
	if (crm_qysbdj_sjhfsj!=null)
	{
		crm_qysbdj_sjhfsj=crm_qysbdj_sjhfsj.trim();
		if (!(crm_qysbdj_sjhfsj.equals("")))	wheresql+="  and (crm_qysbdj.sjhfsj>=TO_DATE('"+crm_qysbdj_sjhfsj+"','YYYY/MM/DD'))";
	}
	crm_qysbdj_sjhfsj=request.getParameter("crm_qysbdj_sjhfsj2");
	if (crm_qysbdj_sjhfsj!=null)
	{
		crm_qysbdj_sjhfsj=crm_qysbdj_sjhfsj.trim();
		if (!(crm_qysbdj_sjhfsj.equals("")))	wheresql+="  and (crm_qysbdj.sjhfsj<=TO_DATE('"+crm_qysbdj_sjhfsj+"','YYYY/MM/DD'))";
	}
	crm_qysbdj_sjhfsbyybm=request.getParameter("crm_qysbdj_sjhfsbyybm");
	if (crm_qysbdj_sjhfsbyybm!=null)
	{
		crm_qysbdj_sjhfsbyybm=cf.GB2Uni(crm_qysbdj_sjhfsbyybm);
		if (!(crm_qysbdj_sjhfsbyybm.equals("")))	wheresql+=" and  (crm_qysbdj.sjhfsbyybm='"+crm_qysbdj_sjhfsbyybm+"')";
	}
	crm_qysbdj_sjhfsbkhlx=request.getParameter("crm_qysbdj_sjhfsbkhlx");
	if (crm_qysbdj_sjhfsbkhlx!=null)
	{
		crm_qysbdj_sjhfsbkhlx=cf.GB2Uni(crm_qysbdj_sjhfsbkhlx);
		if (!(crm_qysbdj_sjhfsbkhlx.equals("")))	wheresql+=" and  (crm_qysbdj.sjhfsbkhlx='"+crm_qysbdj_sjhfsbkhlx+"')";
	}
	crm_qysbdj_sjhfsbsj=request.getParameter("crm_qysbdj_sjhfsbsj");
	if (crm_qysbdj_sjhfsbsj!=null)
	{
		crm_qysbdj_sjhfsbsj=crm_qysbdj_sjhfsbsj.trim();
		if (!(crm_qysbdj_sjhfsbsj.equals("")))	wheresql+="  and (crm_qysbdj.sjhfsbsj>=TO_DATE('"+crm_qysbdj_sjhfsbsj+"','YYYY/MM/DD'))";
	}
	crm_qysbdj_sjhfsbsj=request.getParameter("crm_qysbdj_sjhfsbsj2");
	if (crm_qysbdj_sjhfsbsj!=null)
	{
		crm_qysbdj_sjhfsbsj=crm_qysbdj_sjhfsbsj.trim();
		if (!(crm_qysbdj_sjhfsbsj.equals("")))	wheresql+="  and (crm_qysbdj.sjhfsbsj<=TO_DATE('"+crm_qysbdj_sjhfsbsj+"','YYYY/MM/DD'))";
	}
	crm_qysbdj_xxrsfhf=request.getParameter("crm_qysbdj_xxrsfhf");
	if (crm_qysbdj_xxrsfhf!=null)
	{
		crm_qysbdj_xxrsfhf=cf.GB2Uni(crm_qysbdj_xxrsfhf);
		if (!(crm_qysbdj_xxrsfhf.equals("")))	wheresql+=" and  (crm_qysbdj.xxrsfhf='"+crm_qysbdj_xxrsfhf+"')";
	}
	crm_qysbdj_xxrhfjlh=request.getParameter("crm_qysbdj_xxrhfjlh");
	if (crm_qysbdj_xxrhfjlh!=null)
	{
		crm_qysbdj_xxrhfjlh=cf.GB2Uni(crm_qysbdj_xxrhfjlh);
		if (!(crm_qysbdj_xxrhfjlh.equals("")))	wheresql+=" and  (crm_qysbdj.xxrhfjlh='"+crm_qysbdj_xxrhfjlh+"')";
	}
	crm_qysbdj_xxrhfr=request.getParameter("crm_qysbdj_xxrhfr");
	if (crm_qysbdj_xxrhfr!=null)
	{
		crm_qysbdj_xxrhfr=cf.GB2Uni(crm_qysbdj_xxrhfr);
		if (!(crm_qysbdj_xxrhfr.equals("")))	wheresql+=" and  (crm_qysbdj.xxrhfr='"+crm_qysbdj_xxrhfr+"')";
	}
	crm_qysbdj_xxrhfsj=request.getParameter("crm_qysbdj_xxrhfsj");
	if (crm_qysbdj_xxrhfsj!=null)
	{
		crm_qysbdj_xxrhfsj=crm_qysbdj_xxrhfsj.trim();
		if (!(crm_qysbdj_xxrhfsj.equals("")))	wheresql+="  and (crm_qysbdj.xxrhfsj>=TO_DATE('"+crm_qysbdj_xxrhfsj+"','YYYY/MM/DD'))";
	}
	crm_qysbdj_xxrhfsj=request.getParameter("crm_qysbdj_xxrhfsj2");
	if (crm_qysbdj_xxrhfsj!=null)
	{
		crm_qysbdj_xxrhfsj=crm_qysbdj_xxrhfsj.trim();
		if (!(crm_qysbdj_xxrhfsj.equals("")))	wheresql+="  and (crm_qysbdj.xxrhfsj<=TO_DATE('"+crm_qysbdj_xxrhfsj+"','YYYY/MM/DD'))";
	}
	crm_qysbdj_xxrhfsbyybm=request.getParameter("crm_qysbdj_xxrhfsbyybm");
	if (crm_qysbdj_xxrhfsbyybm!=null)
	{
		crm_qysbdj_xxrhfsbyybm=cf.GB2Uni(crm_qysbdj_xxrhfsbyybm);
		if (!(crm_qysbdj_xxrhfsbyybm.equals("")))	wheresql+=" and  (crm_qysbdj.xxrhfsbyybm='"+crm_qysbdj_xxrhfsbyybm+"')";
	}
	crm_qysbdj_xxrhfsbkhlx=request.getParameter("crm_qysbdj_xxrhfsbkhlx");
	if (crm_qysbdj_xxrhfsbkhlx!=null)
	{
		crm_qysbdj_xxrhfsbkhlx=cf.GB2Uni(crm_qysbdj_xxrhfsbkhlx);
		if (!(crm_qysbdj_xxrhfsbkhlx.equals("")))	wheresql+=" and  (crm_qysbdj.xxrhfsbkhlx='"+crm_qysbdj_xxrhfsbkhlx+"')";
	}
	crm_qysbdj_xxrhfsbsj=request.getParameter("crm_qysbdj_xxrhfsbsj");
	if (crm_qysbdj_xxrhfsbsj!=null)
	{
		crm_qysbdj_xxrhfsbsj=crm_qysbdj_xxrhfsbsj.trim();
		if (!(crm_qysbdj_xxrhfsbsj.equals("")))	wheresql+="  and (crm_qysbdj.xxrhfsbsj>=TO_DATE('"+crm_qysbdj_xxrhfsbsj+"','YYYY/MM/DD'))";
	}
	crm_qysbdj_xxrhfsbsj=request.getParameter("crm_qysbdj_xxrhfsbsj2");
	if (crm_qysbdj_xxrhfsbsj!=null)
	{
		crm_qysbdj_xxrhfsbsj=crm_qysbdj_xxrhfsbsj.trim();
		if (!(crm_qysbdj_xxrhfsbsj.equals("")))	wheresql+="  and (crm_qysbdj.xxrhfsbsj<=TO_DATE('"+crm_qysbdj_xxrhfsbsj+"','YYYY/MM/DD'))";
	}
	
	
	
	
	
	
	
	ls_sql="SELECT crm_zxkhxx.khbh,DECODE(crm_qysbdj.clzt,'1','���ʦ�ύ','2','��Ʋ����','3','�г������','4','�Ӵ��������','5','�ط�'),a.dwmc zxdm,crm_qysbdj.sjs,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,c.sbyymc sbyybm,crm_qysbdj.sbkhlx,crm_qysbdj.sbyyxs,crm_qysbdj.sbsj,DECODE(crm_qysbdj.sjbshjl,'Y','ͨ��','N','δͨ��') sjbshjl,crm_qysbdj.sjbshr,crm_qysbdj.sjbshsj,crm_qysbdj.sjbshyj, DECODE(crm_qysbdj.scbshjl,'Y','ͨ��','N','δͨ��') scbshjl,crm_qysbdj.scbshr,crm_qysbdj.scbshsj,crm_qysbdj.scbshyj, DECODE(crm_qysbdj.zgshjl,'Y','ͨ��','N','δͨ��') zgshjl,crm_qysbdj.zgshr,crm_qysbdj.zgshsj,crm_qysbdj.zgshyj,crm_qysbdj.hfjlh,crm_qysbdj.hfr,crm_qysbdj.hfsj,d.sbyymc hfsbyybm,crm_qysbdj.hfsbkhlx,crm_qysbdj.hfsbyyxs,crm_qysbdj.hfsbsj,crm_qysbdj.sjhfjlh,crm_qysbdj.sjhfr,crm_qysbdj.sjhfsj,e.sbyymc sjhfsbyybm,crm_qysbdj.sjhfsbkhlx,crm_qysbdj.sjhfsbyyxs,crm_qysbdj.sjhfsbsj, DECODE(crm_qysbdj.xxrsfhf,'Y','�ط�','N','δ�ط�') xxrsfhf,crm_qysbdj.xxrhfjlh,crm_qysbdj.xxrhfr,crm_qysbdj.xxrhfsj,f.sbyymc xxrhfsbyybm,crm_qysbdj.xxrhfsbkhlx,crm_qysbdj.xxrhfsbyyxs,crm_qysbdj.xxrhfsbsj,crm_qysbdj.lrr,crm_qysbdj.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM crm_zxkhxx,crm_qysbdj,sq_dwxx a,sq_dwxx b,dm_sbyybm c,dm_sbyybm d,dm_sbyybm e,dm_sbyybm f ";
    ls_sql+=" where crm_zxkhxx.khbh=crm_qysbdj.khbh(+)";
    ls_sql+=" and crm_zxkhxx.zxdm=a.dwbh(+)";
    ls_sql+=" and crm_qysbdj.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_qysbdj.sbyybm=c.sbyybm(+)";
    ls_sql+=" and crm_qysbdj.hfsbyybm=d.sbyybm(+)";
    ls_sql+=" and crm_qysbdj.sjhfsbyybm=e.sbyybm(+)";
    ls_sql+=" and crm_qysbdj.xxrhfsbyybm=f.sbyybm(+)";
	ls_sql+=" and crm_qysbdj.lrr is not null";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_qysbdj.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_qysbdjCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


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
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">�ɵ��ͻ���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(700);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">�ͻ����</td>
	<td  width="150px">״̬</td>
	<td  width="190px">����</td>
	<td  width="90px">���ʦ</td>
	<td  width="110px">�ͻ�����</td>
	<td  width="4%">���ݵ�ַ</td>
	<td  width="2%">�ɵ�ԭ��</td>
	<td  width="2%">�ɵ��ͻ�����</td>
	<td  width="5%">�ɵ�ԭ������</td>
	<td  width="120px">�ɵ�ʱ��</td>
	<td  width="110px">��Ʋ���˽���</td>
	<td  width="90px">��Ʋ������</td>
	<td  width="120px">��Ʋ����ʱ��</td>
	<td  width="4%">��Ʋ�������</td>
	<td  width="110px">�г�����˽���</td>
	<td  width="90px">�г��������</td>
	<td  width="120px">�г������ʱ��</td>
	<td  width="4%">�г���������</td>
	<td  width="110px">�Ӵ�������˽���</td>
	<td  width="90px">�Ӵ����������</td>
	<td  width="120px">�Ӵ��������ʱ��</td>
	<td  width="4%">�Ӵ�����������</td>
	<td  width="120px">�طü�¼��</td>
	<td  width="90px">�ط���</td>
	<td  width="120px">�ط�ʱ��</td>
	<td  width="2%">�ط÷ɵ�ԭ��</td>
	<td  width="2%">�ط÷ɵ��ͻ�����</td>
	<td  width="5%">�ط÷ɵ�ԭ������</td>
	<td  width="120px">�ط÷ɵ�ʱ��</td>
	<td  width="110px">����طü�¼��</td>
	<td  width="90px">����ط���</td>
	<td  width="110px">����ط�ʱ��</td>
	<td  width="2%">����ط�ʧ��ԭ��</td>
	<td  width="2%">����ط�ʧ�ܿͻ�����</td>
	<td  width="5%">����ط�ʧ��ԭ������</td>
	<td  width="110px">����ط�ʧ��ʱ��</td>
	<td  width="110px">��Ϣ���Ƿ�ط�</td>
	<td  width="110px">��Ϣ�˻طü�¼��</td>
	<td  width="90px">��Ϣ�˻ط���</td>
	<td  width="110px">��Ϣ�˻ط�ʱ��</td>
	<td  width="2%">��Ϣ�˻ط÷ɵ�ԭ��</td>
	<td  width="2%">��Ϣ�˻ط÷ɵ��ͻ�����</td>
	<td  width="5%">��Ϣ�˻ط÷ɵ�ԭ������</td>
	<td  width="110px">��Ϣ�˻ط÷ɵ�ʱ��</td>
	<td  width="90px">¼����</td>
	<td  width="110px">¼��ʱ��</td>
	<td  width="170px">¼�벿��</td>
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