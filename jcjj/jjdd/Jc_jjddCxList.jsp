<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//��ĿרԱ����
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿӹ��ʹ���
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿ����ʦ����

if (zwbm.equals("10"))//10:��ĿרԱ
{
	if (xmzyglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:�Ҿӹ���
{
	if (jjgwglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:�Ҿ����ʦ
{
	if (jjsjsglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}


int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";



	String jc_jjdd_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_lxfs2=null;
	String crm_khxx_fwdz2=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_kgrq=null;
	String cxhdbm=null;

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_jjdd_khbh=request.getParameter("jc_jjdd_khbh");
	if (jc_jjdd_khbh!=null)
	{
		jc_jjdd_khbh=cf.GB2Uni(jc_jjdd_khbh);
		if (!(jc_jjdd_khbh.equals("")))	wheresql+=" and  (jc_jjdd.khbh='"+jc_jjdd_khbh+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}


	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}


	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
	if (crm_khxx_lxfs2!=null)
	{
		crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
		if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
	}
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}


	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}

	
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+crm_khxx_kgrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq2");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+crm_khxx_kgrq+"','YYYY-MM-DD'))";
	}

	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm='"+cxhdbm+"')";
	}

	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}





	String jc_jjdd_ddbh=null;
	jc_jjdd_ddbh=request.getParameter("jc_jjdd_ddbh");
	if (jc_jjdd_ddbh!=null)
	{
		jc_jjdd_ddbh=cf.GB2Uni(jc_jjdd_ddbh);
		if (!(jc_jjdd_ddbh.equals("")))	wheresql+=" and  (jc_jjdd.ddbh='"+jc_jjdd_ddbh+"')";
	}
	String jc_jjdd_clzt=null;
	jc_jjdd_clzt=request.getParameter("jc_jjdd_clzt");
	if (jc_jjdd_clzt!=null)
	{
		jc_jjdd_clzt=cf.GB2Uni(jc_jjdd_clzt);
		if (!(jc_jjdd_clzt.equals("")))	wheresql+=" and  (jc_jjdd.clzt='"+jc_jjdd_clzt+"')";
	}



	String sfpsjs=null;
	sfpsjs=request.getParameter("sfpsjs");
	if (sfpsjs!=null)
	{
		if (!(sfpsjs.equals("")))	wheresql+=" and  (jc_jjdd.sfpsjs='"+sfpsjs+"')";
	}
	String jjsjs=null;
	jjsjs=request.getParameter("jjsjs");
	if (jjsjs!=null)
	{
		jjsjs=cf.GB2Uni(jjsjs);
		if (!(jjsjs.equals("")))	wheresql+=" and  (jc_jjdd.jjsjs='"+jjsjs+"')";
	}


	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_jjdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_jjdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_jjdd.xmzy='"+xmzy+"')";
	}


	String jctdyybm=null;
	jctdyybm=request.getParameter("jctdyybm");
	if (jctdyybm!=null)
	{
		jctdyybm=cf.GB2Uni(jctdyybm);
		if (!(jctdyybm.equals("")))	wheresql+=" and  (jc_jjdd.jctdyybm='"+jctdyybm+"')";
	}



	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_jjdd.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_jjdd.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String jjppmc=null;
	jjppmc=request.getParameter("jjppmc");
	if (jjppmc!=null)
	{
		jjppmc=cf.GB2Uni(jjppmc);
		if (!(jjppmc.equals("")))	wheresql+=" and  (jc_jjdd.jjppmc='"+jjppmc+"')";
	}
	String jjppmc2=null;
	jjppmc2=request.getParameter("jjppmc2");
	if (jjppmc2!=null)
	{
		jjppmc2=cf.GB2Uni(jjppmc2);
		if (!(jjppmc2.equals("")))	wheresql+=" and  (jc_jjdd.jjppmc like '%"+jjppmc2+"%')";
	}
	String jjgys=null;
	jjgys=request.getParameter("jjgys");
	if (jjgys!=null)
	{
		jjgys=cf.GB2Uni(jjgys);
		if (!(jjgys.equals("")))	wheresql+=" and  (jc_jjdd.jjgys='"+jjgys+"')";
	}
	String jjgys2=null;
	jjgys2=request.getParameter("jjgys2");
	if (jjgys2!=null)
	{
		jjgys2=cf.GB2Uni(jjgys2);
		if (!(jjgys2.equals("")))	wheresql+=" and  (jc_jjdd.jjgys like '%"+jjgys2+"%')";
	}

	
	String xcmgcmc=null;
	xcmgcmc=request.getParameter("xcmgcmc");
	if (xcmgcmc!=null)
	{
		xcmgcmc=cf.GB2Uni(xcmgcmc);
		if (!(xcmgcmc.equals("")))	wheresql+=" and  (jc_jjdd.xcmgcmc='"+xcmgcmc+"')";
	}
	String xcmgcmc2=null;
	xcmgcmc2=request.getParameter("xcmgcmc2");
	if (xcmgcmc2!=null)
	{
		xcmgcmc2=cf.GB2Uni(xcmgcmc2);
		if (!(xcmgcmc.equals("")))	wheresql+=" and  (jc_jjdd.xcmgcmc like '%"+xcmgcmc2+"%')";
	}
	String xcmppmc=null;
	xcmppmc=request.getParameter("xcmppmc");
	if (xcmppmc!=null)
	{
		xcmppmc=cf.GB2Uni(xcmppmc);
		if (!(xcmppmc.equals("")))	wheresql+=" and  (jc_jjdd.xcmppmc='"+xcmppmc+"')";
	}
	String xcmppmc2=null;
	xcmppmc2=request.getParameter("xcmppmc2");
	if (xcmppmc2!=null)
	{
		xcmppmc2=cf.GB2Uni(xcmppmc2);
		if (!(xcmppmc2.equals("")))	wheresql+=" and  (jc_jjdd.xcmppmc like '%"+xcmppmc2+"%')";
	}
	String xcmgys=null;
	xcmgys=request.getParameter("xcmgys");
	if (xcmgys!=null)
	{
		xcmgys=cf.GB2Uni(xcmgys);
		if (!(xcmgys.equals("")))	wheresql+=" and  (jc_jjdd.xcmgys='"+xcmgys+"')";
	}
	String xcmgys2=null;
	xcmgys2=request.getParameter("xcmgys2");
	if (xcmgys2!=null)
	{
		xcmgys2=cf.GB2Uni(xcmgys2);
		if (!(xcmgys2.equals("")))	wheresql+=" and  (jc_jjdd.xcmgys like '%"+xcmgys2+"%')";
	}




	String pgcsj=null;
	pgcsj=request.getParameter("pgcsj");
	if (pgcsj!=null)
	{
		pgcsj=cf.GB2Uni(pgcsj);
		if (!(pgcsj.equals("")))	wheresql+="  and (jc_jjdd.pgcsj>=TO_DATE('"+pgcsj+"','YYYY/MM/DD'))";
	}
	pgcsj=request.getParameter("pgcsj2");
	if (pgcsj!=null)
	{
		pgcsj=cf.GB2Uni(pgcsj);
		if (!(pgcsj.equals("")))	wheresql+="  and (jc_jjdd.pgcsj<=TO_DATE('"+pgcsj+"','YYYY/MM/DD'))";
	}
	String pdsj=null;
	pdsj=request.getParameter("pdsj");
	if (pdsj!=null)
	{
		pdsj=cf.GB2Uni(pdsj);
		if (!(pdsj.equals("")))	wheresql+="  and (jc_jjdd.pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		pdsj=cf.GB2Uni(pdsj);
		if (!(pdsj.equals("")))	wheresql+="  and (jc_jjdd.pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}



	String jc_jjdd_jhccsj=null;
	String jc_jjdd_sccsj=null;
	jc_jjdd_jhccsj=request.getParameter("jc_jjdd_jhccsj");
	if (jc_jjdd_jhccsj!=null)
	{
		jc_jjdd_jhccsj=jc_jjdd_jhccsj.trim();
		if (!(jc_jjdd_jhccsj.equals("")))	wheresql+="  and (jc_jjdd.jhccsj>=TO_DATE('"+jc_jjdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_jhccsj=request.getParameter("jc_jjdd_jhccsj2");
	if (jc_jjdd_jhccsj!=null)
	{
		jc_jjdd_jhccsj=jc_jjdd_jhccsj.trim();
		if (!(jc_jjdd_jhccsj.equals("")))	wheresql+="  and (jc_jjdd.jhccsj<=TO_DATE('"+jc_jjdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sccsj=request.getParameter("jc_jjdd_sccsj");
	if (jc_jjdd_sccsj!=null)
	{
		jc_jjdd_sccsj=jc_jjdd_sccsj.trim();
		if (!(jc_jjdd_sccsj.equals("")))	wheresql+="  and (jc_jjdd.sccsj>=TO_DATE('"+jc_jjdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sccsj=request.getParameter("jc_jjdd_sccsj2");
	if (jc_jjdd_sccsj!=null)
	{
		jc_jjdd_sccsj=jc_jjdd_sccsj.trim();
		if (!(jc_jjdd_sccsj.equals("")))	wheresql+="  and (jc_jjdd.sccsj<=TO_DATE('"+jc_jjdd_sccsj+"','YYYY/MM/DD'))";
	}



	String jc_jjdd_qhtsj=null;
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj>=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj2");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj<=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}

	String jc_jjdd_jhazrq=null;
	String jc_jjdd_sazrq=null;
	jc_jjdd_jhazrq=request.getParameter("jc_jjdd_jhazrq");
	if (jc_jjdd_jhazrq!=null)
	{
		jc_jjdd_jhazrq=jc_jjdd_jhazrq.trim();
		if (!(jc_jjdd_jhazrq.equals("")))	wheresql+="  and (jc_jjdd.jhazrq>=TO_DATE('"+jc_jjdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_jhazrq=request.getParameter("jc_jjdd_jhazrq2");
	if (jc_jjdd_jhazrq!=null)
	{
		jc_jjdd_jhazrq=jc_jjdd_jhazrq.trim();
		if (!(jc_jjdd_jhazrq.equals("")))	wheresql+="  and (jc_jjdd.jhazrq<=TO_DATE('"+jc_jjdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sazrq=request.getParameter("jc_jjdd_sazrq");
	if (jc_jjdd_sazrq!=null)
	{
		jc_jjdd_sazrq=jc_jjdd_sazrq.trim();
		if (!(jc_jjdd_sazrq.equals("")))	wheresql+="  and (jc_jjdd.sazrq>=TO_DATE('"+jc_jjdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sazrq=request.getParameter("jc_jjdd_sazrq2");
	if (jc_jjdd_sazrq!=null)
	{
		jc_jjdd_sazrq=jc_jjdd_sazrq.trim();
		if (!(jc_jjdd_sazrq.equals("")))	wheresql+="  and (jc_jjdd.sazrq<=TO_DATE('"+jc_jjdd_sazrq+"','YYYY/MM/DD'))";
	}



	String jc_jjdd_lrsj=null;
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj>=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj2");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	String jc_jjdd_tdsj=null;
	jc_jjdd_tdsj=request.getParameter("jc_jjdd_tdsj");
	if (jc_jjdd_tdsj!=null)
	{
		jc_jjdd_tdsj=jc_jjdd_tdsj.trim();
		if (!(jc_jjdd_tdsj.equals("")))	wheresql+="  and (jc_jjdd.tdsj>=TO_DATE('"+jc_jjdd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_tdsj=request.getParameter("jc_jjdd_tdsj2");
	if (jc_jjdd_tdsj!=null)
	{
		jc_jjdd_tdsj=jc_jjdd_tdsj.trim();
		if (!(jc_jjdd_tdsj.equals("")))	wheresql+="  and (jc_jjdd.tdsj<=TO_DATE('"+jc_jjdd_tdsj+"','YYYY/MM/DD'))";
	}


	String jc_jjdd_lrr=null;
	jc_jjdd_lrr=request.getParameter("jc_jjdd_lrr");
	if (jc_jjdd_lrr!=null)
	{
		jc_jjdd_lrr=cf.GB2Uni(jc_jjdd_lrr);
		if (!(jc_jjdd_lrr.equals("")))	wheresql+=" and  (jc_jjdd.lrr='"+jc_jjdd_lrr+"')";
	}
	String jc_jjdd_dwbh=request.getParameter("jc_jjdd_dwbh");
	if (jc_jjdd_dwbh!=null)
	{
		if (!(jc_jjdd_dwbh.equals("")))	wheresql+=" and  (jc_jjdd.dwbh='"+jc_jjdd_dwbh+"')";
	}


	String ycclzt=request.getParameter("ycclzt");
	if (ycclzt!=null)
	{
		ycclzt=cf.GB2Uni(ycclzt);
		if (!(ycclzt.equals("")))	wheresql+=" and  (jc_jjdd.ycclzt='"+ycclzt+"')";
	}
	String ycyybm=request.getParameter("ycyybm");
	if (ycyybm!=null)
	{
		ycyybm=cf.GB2Uni(ycyybm);
		if (!(ycyybm.equals("")))	wheresql+=" and  (jc_jjdd.ycyybm='"+ycyybm+"')";
	}
	String zsycyybm=request.getParameter("zsycyybm");
	if (zsycyybm!=null)
	{
		zsycyybm=cf.GB2Uni(zsycyybm);
		if (!(zsycyybm.equals("")))	wheresql+=" and  (jc_jjdd.zsycyybm='"+zsycyybm+"')";
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

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT jc_jjdd.ddbh,clztmc,ysgcjdmc ,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh ,crm_khxx.sjs,sq_dwxx.dwmc dm ,DECODE(jc_jjdd.sfpsjs,'1','��Ҫ','2','��') sfpsjs,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,cxhdbm,jc_jjdd.pgcsj,jc_jjdd.pdgc,jc_jjdd.pdgcmc,jc_jjdd.jjppmc,jc_jjdd.jjgys,jc_jjdd.xcmgc,jc_jjdd.xcmgcmc,jc_jjdd.xcmppmc,jc_jjdd.xcmgys,jc_jjdd.qhtsj,jc_jjdd.sccsj,jc_jjdd.jhazrq,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.tdsj,jc_jjdd.dj,TO_CHAR(jc_jjdd.jjzkl) jjzkl,jc_jjdd.dzyy,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.cpjjje,jc_jjdd.wdzje,jc_jjdd.zqjjje,jc_jjdd.zqxcmje,jc_jjdd.zqcpjjje,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.cpjjzjje,jc_jjdd.zqzjhze,jc_jjdd.zqjjzjje,jc_jjdd.zqxcmzjje,jc_jjdd.zqcpjjzjje,jc_jjdd.lrr,jc_jjdd.lrsj,jc_jjdd.khbh  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx,crm_khxx,sq_bzxx,dm_gcjdbm";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and jc_jjdd.clzt in('19','25','27','29','31','33','35')";
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";

		ls_sql+=" and (jc_jjdd.jjgys=(select gys from sq_gysbm where gysbm='"+ygbh+"') OR jc_jjdd.xcmgys=(select gys from sq_gysbm where gysbm='"+ygbh+"'))";
	}
	else{
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾������� 
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (zwbm.equals("08"))//08:�Ҿӹ���
		{
			ls_sql+=" and (jc_jjdd.clgw='"+yhmc+"' OR jc_jjdd.ztjjgw='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:�Ҿ����ʦ
		{
			ls_sql+=" and (jc_jjdd.jjsjs='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:��ĿרԱ
		{
			ls_sql+=" and (jc_jjdd.xmzy='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
		}
	}

    ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_jjddCxList.jsp","","","/jcjj/dygl/jjht.jsp");
	pageObj.setEditStr("��ӡ");
	pageObj.setPageRow(Integer.parseInt(myxssl));

/*
//������ʾ��
	String[] disColName={"ddbh","clztmc","pdgc","xcmgc","sfpsjs","hth","khxm","lxfs","sgbz","dh","fwdz","jjsjs","xmzy","clgw","ztjjgw","dj","htze","jjje","xcmje","zjhze","jjzjje","xcmzjje","lrr","lrsj","dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
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
  <B><font size="3">�Ҿ߶�������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(700);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="40px">&nbsp;</td>
	<td  width="70px">�������</td>
	<td  width="110px">����״̬</td>
	<td  width="70px">���̽���</td>
	<td  width="110px">�ͻ�����</td>
	<td  width="70px">��ͬ��</td>
	<td  width="240px">���ݵ�ַ</td>
	<td  width="80px">�೤</td>
	<td  width="200px">�೤�绰</td>
	<td  width="70px">��װ���ʦ</td>
	<td  width="150px">ǩԼ����</td>
	<td  width="50px">�����ʦ</td>
	<td  width="70px">�Ҿ����ʦ</td>
	<td  width="70px">��ĿרԱ</td>
	<td  width="70px">פ��Ҿӹ���</td>
	<td  width="70px">չ���Ҿӹ���</td>
    <td  width="200px">�����</td>
	<td  width="80px">�ɹ���ʱ��</td>
	<td  width="60px">�Ҿ߹���</td>
	<td  width="140px">�Ҿ߹���</td>
	<td  width="120px">�Ҿ�Ʒ��</td>
	<td  width="180px">�Ҿ߹�Ӧ��</td>
	<td  width="60px">�Ͳ���</td>
	<td  width="140px">�Ͳ��Ź���</td>
	<td  width="120px">�Ͳ���Ʒ��</td>
	<td  width="180px">�Ͳ��Ź�Ӧ��</td>
	<td  width="80px">ǩԼ����</td>
	<td  width="80px">��������</td>
	<td  width="80px">��ͬ��װ����</td>
	<td  width="80px">��ʼ��װʱ��</td>
	<td  width="80px">��װ�������</td>
	<td  width="80px">ȷ���˵�����</td>
	<td  width="80px">����</td>
	<td  width="60px">�ۿ���</td>
	<td  width="350px">����ԭ��</td>
	<td  width="100px"><font color="#0000CC"><strong>��ͬ�ܶ�-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>�Ҿߺ�ͬ���-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>�Ͳ��ź�ͬ���-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>��Ʒ�Ҿߺ�ͬ���-�ۺ�</strong></font></td>
	<td  width="100px"><strong>��ͬ�ܶ�-��ǰ</strong></td>
	<td  width="100px"><strong>�Ҿߺ�ͬ���-��ǰ</strong></td>
	<td  width="100px"><strong>�Ͳ��ź�ͬ���-��ǰ</strong></td>
	<td  width="100px"><strong>��Ʒ�Ҿߺ�ͬ���-��ǰ</strong></td>
	<td  width="100px"><font color="#0000CC"><strong>�������ܶ�-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>�Ҿ���������-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>�Ͳ�����������-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>��Ʒ�Ҿ���������-�ۺ�</strong></font></td>
	<td  width="100px"><strong>�������ܶ�-��ǰ</strong></td>
	<td  width="100px"><strong>�Ҿ���������-��ǰ</strong></td>
	<td  width="100px"><strong>�Ͳ�����������-��ǰ</strong></td>
	<td  width="100px"><strong>��Ʒ�Ҿ���������-��ǰ</strong></td>
	<td  width="60px">¼����</td>
	<td  width="80px">¼��ʱ��</td>
	<td  width="60px">�ͻ����</td>
</tr>

<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
