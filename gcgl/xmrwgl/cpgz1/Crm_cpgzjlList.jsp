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
	String crm_cpgzjl_khbh=null;
	String crm_cpgzjl_cpflbm=null;
	String crm_cpgzjl_cplx=null;
	String crm_cpgzjl_cpazlx=null;
	String crm_cpgzjl_ghf=null;
	String crm_cpgzjl_jgpp=null;
	String crm_cpgzjl_ghfhzsj=null;
	String crm_cpgzjl_sfxdd=null;
	String crm_cpgzjl_sfxhxgl=null;
	String crm_cpgzjl_zxsfwz=null;
	String crm_cpgzjl_cpsjs=null;
	String crm_cpgzjl_sfxfb=null;
	String crm_cpgzjl_sfyyc=null;
	String crm_cpgzjl_sfxtx=null;
	String crm_cpgzjl_txrq=null;
	String crm_cpgzjl_cpztbm=null;
	String crm_cpgzjl_lrr=null;
	String crm_cpgzjl_lrsj=null;
	String crm_cpgzjl_fbdbh=null;
	String crm_cpgzjl_ycdbh=null;
	crm_cpgzjl_khbh=request.getParameter("crm_cpgzjl_khbh");
	if (crm_cpgzjl_khbh!=null)
	{
		crm_cpgzjl_khbh=cf.GB2Uni(crm_cpgzjl_khbh);
		if (!(crm_cpgzjl_khbh.equals("")))	wheresql+=" and  (crm_cpgzjl.khbh='"+crm_cpgzjl_khbh+"')";
	}
	crm_cpgzjl_cpflbm=request.getParameter("crm_cpgzjl_cpflbm");
	if (crm_cpgzjl_cpflbm!=null)
	{
		crm_cpgzjl_cpflbm=cf.GB2Uni(crm_cpgzjl_cpflbm);
		if (!(crm_cpgzjl_cpflbm.equals("")))	wheresql+=" and  (crm_cpgzjl.cpflbm='"+crm_cpgzjl_cpflbm+"')";
	}
	crm_cpgzjl_cplx=request.getParameter("crm_cpgzjl_cplx");
	if (crm_cpgzjl_cplx!=null)
	{
		crm_cpgzjl_cplx=cf.GB2Uni(crm_cpgzjl_cplx);
		if (!(crm_cpgzjl_cplx.equals("")))	wheresql+=" and  (crm_cpgzjl.cplx='"+crm_cpgzjl_cplx+"')";
	}
	crm_cpgzjl_cpazlx=request.getParameter("crm_cpgzjl_cpazlx");
	if (crm_cpgzjl_cpazlx!=null)
	{
		crm_cpgzjl_cpazlx=cf.GB2Uni(crm_cpgzjl_cpazlx);
		if (!(crm_cpgzjl_cpazlx.equals("")))	wheresql+=" and  (crm_cpgzjl.cpazlx='"+crm_cpgzjl_cpazlx+"')";
	}
	crm_cpgzjl_ghf=request.getParameter("crm_cpgzjl_ghf");
	if (crm_cpgzjl_ghf!=null)
	{
		crm_cpgzjl_ghf=cf.GB2Uni(crm_cpgzjl_ghf);
		if (!(crm_cpgzjl_ghf.equals("")))	wheresql+=" and  (crm_cpgzjl.ghf='"+crm_cpgzjl_ghf+"')";
	}
	crm_cpgzjl_jgpp=request.getParameter("crm_cpgzjl_jgpp");
	if (crm_cpgzjl_jgpp!=null)
	{
		crm_cpgzjl_jgpp=cf.GB2Uni(crm_cpgzjl_jgpp);
		if (!(crm_cpgzjl_jgpp.equals("")))	wheresql+=" and  (crm_cpgzjl.jgpp='"+crm_cpgzjl_jgpp+"')";
	}
	crm_cpgzjl_ghfhzsj=request.getParameter("crm_cpgzjl_ghfhzsj");
	if (crm_cpgzjl_ghfhzsj!=null)
	{
		crm_cpgzjl_ghfhzsj=crm_cpgzjl_ghfhzsj.trim();
		if (!(crm_cpgzjl_ghfhzsj.equals("")))	wheresql+="  and (crm_cpgzjl.ghfhzsj=TO_DATE('"+crm_cpgzjl_ghfhzsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_sfxdd=request.getParameter("crm_cpgzjl_sfxdd");
	if (crm_cpgzjl_sfxdd!=null)
	{
		crm_cpgzjl_sfxdd=cf.GB2Uni(crm_cpgzjl_sfxdd);
		if (!(crm_cpgzjl_sfxdd.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxdd='"+crm_cpgzjl_sfxdd+"')";
	}
	crm_cpgzjl_sfxhxgl=request.getParameter("crm_cpgzjl_sfxhxgl");
	if (crm_cpgzjl_sfxhxgl!=null)
	{
		crm_cpgzjl_sfxhxgl=cf.GB2Uni(crm_cpgzjl_sfxhxgl);
		if (!(crm_cpgzjl_sfxhxgl.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxhxgl='"+crm_cpgzjl_sfxhxgl+"')";
	}
	crm_cpgzjl_zxsfwz=request.getParameter("crm_cpgzjl_zxsfwz");
	if (crm_cpgzjl_zxsfwz!=null)
	{
		crm_cpgzjl_zxsfwz=cf.GB2Uni(crm_cpgzjl_zxsfwz);
		if (!(crm_cpgzjl_zxsfwz.equals("")))	wheresql+=" and  (crm_cpgzjl.zxsfwz='"+crm_cpgzjl_zxsfwz+"')";
	}
	crm_cpgzjl_cpsjs=request.getParameter("crm_cpgzjl_cpsjs");
	if (crm_cpgzjl_cpsjs!=null)
	{
		crm_cpgzjl_cpsjs=cf.GB2Uni(crm_cpgzjl_cpsjs);
		if (!(crm_cpgzjl_cpsjs.equals("")))	wheresql+=" and  (crm_cpgzjl.cpsjs='"+crm_cpgzjl_cpsjs+"')";
	}
	crm_cpgzjl_sfxfb=request.getParameter("crm_cpgzjl_sfxfb");
	if (crm_cpgzjl_sfxfb!=null)
	{
		crm_cpgzjl_sfxfb=cf.GB2Uni(crm_cpgzjl_sfxfb);
		if (!(crm_cpgzjl_sfxfb.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxfb='"+crm_cpgzjl_sfxfb+"')";
	}
	crm_cpgzjl_sfyyc=request.getParameter("crm_cpgzjl_sfyyc");
	if (crm_cpgzjl_sfyyc!=null)
	{
		crm_cpgzjl_sfyyc=cf.GB2Uni(crm_cpgzjl_sfyyc);
		if (!(crm_cpgzjl_sfyyc.equals("")))	wheresql+=" and  (crm_cpgzjl.sfyyc='"+crm_cpgzjl_sfyyc+"')";
	}
	crm_cpgzjl_sfxtx=request.getParameter("crm_cpgzjl_sfxtx");
	if (crm_cpgzjl_sfxtx!=null)
	{
		crm_cpgzjl_sfxtx=cf.GB2Uni(crm_cpgzjl_sfxtx);
		if (!(crm_cpgzjl_sfxtx.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxtx='"+crm_cpgzjl_sfxtx+"')";
	}
	crm_cpgzjl_txrq=request.getParameter("crm_cpgzjl_txrq");
	if (crm_cpgzjl_txrq!=null)
	{
		crm_cpgzjl_txrq=crm_cpgzjl_txrq.trim();
		if (!(crm_cpgzjl_txrq.equals("")))	wheresql+="  and (crm_cpgzjl.txrq>=TO_DATE('"+crm_cpgzjl_txrq+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_txrq=request.getParameter("crm_cpgzjl_txrq2");
	if (crm_cpgzjl_txrq!=null)
	{
		crm_cpgzjl_txrq=crm_cpgzjl_txrq.trim();
		if (!(crm_cpgzjl_txrq.equals("")))	wheresql+="  and (crm_cpgzjl.txrq<=TO_DATE('"+crm_cpgzjl_txrq+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_cpztbm=request.getParameter("crm_cpgzjl_cpztbm");
	if (crm_cpgzjl_cpztbm!=null)
	{
		crm_cpgzjl_cpztbm=cf.GB2Uni(crm_cpgzjl_cpztbm);
		if (!(crm_cpgzjl_cpztbm.equals("")))	wheresql+=" and  (crm_cpgzjl.cpztbm='"+crm_cpgzjl_cpztbm+"')";
	}
	crm_cpgzjl_lrr=request.getParameter("crm_cpgzjl_lrr");
	if (crm_cpgzjl_lrr!=null)
	{
		crm_cpgzjl_lrr=cf.GB2Uni(crm_cpgzjl_lrr);
		if (!(crm_cpgzjl_lrr.equals("")))	wheresql+=" and  (crm_cpgzjl.lrr='"+crm_cpgzjl_lrr+"')";
	}
	crm_cpgzjl_lrsj=request.getParameter("crm_cpgzjl_lrsj");
	if (crm_cpgzjl_lrsj!=null)
	{
		crm_cpgzjl_lrsj=crm_cpgzjl_lrsj.trim();
		if (!(crm_cpgzjl_lrsj.equals("")))	wheresql+="  and (crm_cpgzjl.lrsj<=TO_DATE('"+crm_cpgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_lrsj=request.getParameter("crm_cpgzjl_lrsj2");
	if (crm_cpgzjl_lrsj!=null)
	{
		crm_cpgzjl_lrsj=crm_cpgzjl_lrsj.trim();
		if (!(crm_cpgzjl_lrsj.equals("")))	wheresql+="  and (crm_cpgzjl.lrsj>=TO_DATE('"+crm_cpgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_fbdbh=request.getParameter("crm_cpgzjl_fbdbh");
	if (crm_cpgzjl_fbdbh!=null)
	{
		crm_cpgzjl_fbdbh=cf.GB2Uni(crm_cpgzjl_fbdbh);
		if (!(crm_cpgzjl_fbdbh.equals("")))	wheresql+=" and  (crm_cpgzjl.fbdbh='"+crm_cpgzjl_fbdbh+"')";
	}
	crm_cpgzjl_ycdbh=request.getParameter("crm_cpgzjl_ycdbh");
	if (crm_cpgzjl_ycdbh!=null)
	{
		crm_cpgzjl_ycdbh=cf.GB2Uni(crm_cpgzjl_ycdbh);
		if (!(crm_cpgzjl_ycdbh.equals("")))	wheresql+=" and  (crm_cpgzjl.ycdbh='"+crm_cpgzjl_ycdbh+"')";
	}


	String crm_cpgzjl_zwyjcrq=null;
	String crm_cpgzjl_jhrksj=null;
	String crm_cpgzjl_jhshsj=null;
	String crm_cpgzjl_jhazsj=null;
	String crm_cpgzjl_ztfssj=null;
	String crm_cpgzjl_srksj=null;
	String crm_cpgzjl_sshsj=null;
	String crm_cpgzjl_scazsj=null;
	String crm_cpgzjl_azwcsj=null;
	crm_cpgzjl_zwyjcrq=request.getParameter("crm_cpgzjl_zwyjcrq");
	if (crm_cpgzjl_zwyjcrq!=null)
	{
		crm_cpgzjl_zwyjcrq=crm_cpgzjl_zwyjcrq.trim();
		if (!(crm_cpgzjl_zwyjcrq.equals("")))	wheresql+="  and (crm_cpgzjl.zwyjcrq>=TO_DATE('"+crm_cpgzjl_zwyjcrq+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_zwyjcrq=request.getParameter("crm_cpgzjl_zwyjcrq2");
	if (crm_cpgzjl_zwyjcrq!=null)
	{
		crm_cpgzjl_zwyjcrq=crm_cpgzjl_zwyjcrq.trim();
		if (!(crm_cpgzjl_zwyjcrq.equals("")))	wheresql+="  and (crm_cpgzjl.zwyjcrq<=TO_DATE('"+crm_cpgzjl_zwyjcrq+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_jhrksj=request.getParameter("crm_cpgzjl_jhrksj");
	if (crm_cpgzjl_jhrksj!=null)
	{
		crm_cpgzjl_jhrksj=crm_cpgzjl_jhrksj.trim();
		if (!(crm_cpgzjl_jhrksj.equals("")))	wheresql+="  and (crm_cpgzjl.jhrksj>=TO_DATE('"+crm_cpgzjl_jhrksj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_jhrksj=request.getParameter("crm_cpgzjl_jhrksj2");
	if (crm_cpgzjl_jhrksj!=null)
	{
		crm_cpgzjl_jhrksj=crm_cpgzjl_jhrksj.trim();
		if (!(crm_cpgzjl_jhrksj.equals("")))	wheresql+="  and (crm_cpgzjl.jhrksj<=TO_DATE('"+crm_cpgzjl_jhrksj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_jhshsj=request.getParameter("crm_cpgzjl_jhshsj");
	if (crm_cpgzjl_jhshsj!=null)
	{
		crm_cpgzjl_jhshsj=crm_cpgzjl_jhshsj.trim();
		if (!(crm_cpgzjl_jhshsj.equals("")))	wheresql+="  and (crm_cpgzjl.jhshsj>=TO_DATE('"+crm_cpgzjl_jhshsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_jhshsj=request.getParameter("crm_cpgzjl_jhshsj2");
	if (crm_cpgzjl_jhshsj!=null)
	{
		crm_cpgzjl_jhshsj=crm_cpgzjl_jhshsj.trim();
		if (!(crm_cpgzjl_jhshsj.equals("")))	wheresql+="  and (crm_cpgzjl.jhshsj<=TO_DATE('"+crm_cpgzjl_jhshsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_jhazsj=request.getParameter("crm_cpgzjl_jhazsj");
	if (crm_cpgzjl_jhazsj!=null)
	{
		crm_cpgzjl_jhazsj=crm_cpgzjl_jhazsj.trim();
		if (!(crm_cpgzjl_jhazsj.equals("")))	wheresql+="  and (crm_cpgzjl.jhazsj>=TO_DATE('"+crm_cpgzjl_jhazsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_jhazsj=request.getParameter("crm_cpgzjl_jhazsj2");
	if (crm_cpgzjl_jhazsj!=null)
	{
		crm_cpgzjl_jhazsj=crm_cpgzjl_jhazsj.trim();
		if (!(crm_cpgzjl_jhazsj.equals("")))	wheresql+="  and (crm_cpgzjl.jhazsj<=TO_DATE('"+crm_cpgzjl_jhazsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_ztfssj=request.getParameter("crm_cpgzjl_ztfssj");
	if (crm_cpgzjl_ztfssj!=null)
	{
		crm_cpgzjl_ztfssj=crm_cpgzjl_ztfssj.trim();
		if (!(crm_cpgzjl_ztfssj.equals("")))	wheresql+="  and (crm_cpgzjl.ztfssj>=TO_DATE('"+crm_cpgzjl_ztfssj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_ztfssj=request.getParameter("crm_cpgzjl_ztfssj2");
	if (crm_cpgzjl_ztfssj!=null)
	{
		crm_cpgzjl_ztfssj=crm_cpgzjl_ztfssj.trim();
		if (!(crm_cpgzjl_ztfssj.equals("")))	wheresql+="  and (crm_cpgzjl.ztfssj<=TO_DATE('"+crm_cpgzjl_ztfssj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_srksj=request.getParameter("crm_cpgzjl_srksj");
	if (crm_cpgzjl_srksj!=null)
	{
		crm_cpgzjl_srksj=crm_cpgzjl_srksj.trim();
		if (!(crm_cpgzjl_srksj.equals("")))	wheresql+="  and (crm_cpgzjl.srksj>=TO_DATE('"+crm_cpgzjl_srksj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_srksj=request.getParameter("crm_cpgzjl_srksj2");
	if (crm_cpgzjl_srksj!=null)
	{
		crm_cpgzjl_srksj=crm_cpgzjl_srksj.trim();
		if (!(crm_cpgzjl_srksj.equals("")))	wheresql+="  and (crm_cpgzjl.srksj<=TO_DATE('"+crm_cpgzjl_srksj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_sshsj=request.getParameter("crm_cpgzjl_sshsj");
	if (crm_cpgzjl_sshsj!=null)
	{
		crm_cpgzjl_sshsj=crm_cpgzjl_sshsj.trim();
		if (!(crm_cpgzjl_sshsj.equals("")))	wheresql+="  and (crm_cpgzjl.sshsj>=TO_DATE('"+crm_cpgzjl_sshsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_sshsj=request.getParameter("crm_cpgzjl_sshsj2");
	if (crm_cpgzjl_sshsj!=null)
	{
		crm_cpgzjl_sshsj=crm_cpgzjl_sshsj.trim();
		if (!(crm_cpgzjl_sshsj.equals("")))	wheresql+="  and (crm_cpgzjl.sshsj<=TO_DATE('"+crm_cpgzjl_sshsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_scazsj=request.getParameter("crm_cpgzjl_scazsj");
	if (crm_cpgzjl_scazsj!=null)
	{
		crm_cpgzjl_scazsj=crm_cpgzjl_scazsj.trim();
		if (!(crm_cpgzjl_scazsj.equals("")))	wheresql+="  and (crm_cpgzjl.scazsj>=TO_DATE('"+crm_cpgzjl_scazsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_scazsj=request.getParameter("crm_cpgzjl_scazsj2");
	if (crm_cpgzjl_scazsj!=null)
	{
		crm_cpgzjl_scazsj=crm_cpgzjl_scazsj.trim();
		if (!(crm_cpgzjl_scazsj.equals("")))	wheresql+="  and (crm_cpgzjl.scazsj<=TO_DATE('"+crm_cpgzjl_scazsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_azwcsj=request.getParameter("crm_cpgzjl_azwcsj");
	if (crm_cpgzjl_azwcsj!=null)
	{
		crm_cpgzjl_azwcsj=crm_cpgzjl_azwcsj.trim();
		if (!(crm_cpgzjl_azwcsj.equals("")))	wheresql+="  and (crm_cpgzjl.azwcsj>=TO_DATE('"+crm_cpgzjl_azwcsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_azwcsj=request.getParameter("crm_cpgzjl_azwcsj2");
	if (crm_cpgzjl_azwcsj!=null)
	{
		crm_cpgzjl_azwcsj=crm_cpgzjl_azwcsj.trim();
		if (!(crm_cpgzjl_azwcsj.equals("")))	wheresql+="  and (crm_cpgzjl.azwcsj<=TO_DATE('"+crm_cpgzjl_azwcsj+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT crm_cpgzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs";
	ls_sql+=" ,crm_cpgzjl.cpflbm,cpflmc,cpztmc,ztfssj, DECODE(crm_cpgzjl.cplx,'1','����Ʒ','2','��Ʒ') cplx ";
	ls_sql+=" ,DECODE(crm_cpgzjl.cpazlx,'1','ʩ����','2','��װ��') cpazlx,crm_cpgzjl.ghf,crm_cpgzjl.jgpp,crm_cpgzjl.ghfhzsj";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxdd,'Y','��','N','��') sfxdd, DECODE(crm_cpgzjl.sfxhxgl,'Y','��','N','��') sfxhxgl";
	ls_sql+=" ,DECODE(crm_cpgzjl.zxsfwz,'Y','��','N','��') zxsfwz,crm_cpgzjl.cpsjs";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxfb,'N','�޷���','Y','�ȴ�����','W','�����ɹ�','S','����ʧ��') sfxfb,crm_cpgzjl.fbdbh ";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfyyc,'N','���쳣','Y','�ȴ�����','W','�쳣����ɹ�','S','�쳣���ʧ��') sfyyc ,crm_cpgzjl.ycdbh ";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxtx,'Y','������','N','��') sfxtx,crm_cpgzjl.txrq,crm_cpgzjl.txxs,crm_cpgzjl.txnr,crm_cpgzjl.zwyjcrq ";
	ls_sql+=" ,crm_cpgzjl.jhrksj,crm_cpgzjl.jhshsj,crm_cpgzjl.jhazsj,crm_cpgzjl.lrr,crm_cpgzjl.lrsj,dwmc,crm_cpgzjl.bz";
	ls_sql+=" ,crm_cpgzjl.srksj,crm_cpgzjl.sshsj,crm_cpgzjl.scazsj,crm_cpgzjl.azwcsj";
	ls_sql+=" FROM crm_cpgzjl,crm_khxx,dm_cpflbm,dm_cpztbm,sq_dwxx  ";
    ls_sql+=" where crm_cpgzjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cpgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpgzjl.cpztbm=dm_cpztbm.cpztbm";
    ls_sql+=" and crm_cpgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_cpgzjl.cpztbm!='99'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_cpgzjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_cpgzjlList.jsp","","","EditCrm_cpgzjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"cpflmc","cpztmc","ztfssj","khbh","khxm","fwdz","hth","sjs","cplx","cpazlx","ghf","jgpp","ghfhzsj","sfxdd","sfxhxgl","zxsfwz","cpsjs","sfxfb","fbdbh","sfyyc","ycdbh","sfxtx","txrq","txxs","txnr","zwyjcrq","jhrksj","jhshsj","jhazsj","srksj","sshsj","scazsj","azwcsj","lrr","lrsj","dwmc","bz"};
	pageObj.setDisColName(disColName);
//��������
	String[] keyName={"khbh","cpflbm"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_cpgzjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh","cpflbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_cpgzjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("cpflmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[4];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from crm_cpztgzjl where "+chooseitem;
		sql[1]="delete from crm_cpazjl where "+chooseitem;
		sql[2]="delete from crm_fbdgl where "+chooseitem;
		sql[3]="delete from crm_cpgzjl where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ά��������Ʒ��Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(450);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="2%">��Ʒ״̬</td>
	<td  width="2%">״̬����ʱ��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">��Ʒ����</td>
	<td  width="2%">��Ʒ��װ����</td>
	<td  width="2%">������</td>
	<td  width="6%">�׹�Ʒ��</td>
	<td  width="2%">��������֪ʱ��</td>
	<td  width="2%">�Ƿ񽻵׺��¶���</td>
	<td  width="2%">�Ƿ����������</td>
	<td  width="2%">ѡ���Ƿ����</td>
	<td  width="2%">��Ʒ���ʦ</td>
	<td  width="2%">�Ƿ��践��</td>
	<td  width="3%">���������</td>
	<td  width="2%">�Ƿ����쳣</td>
	<td  width="3%">�쳣�����</td>
	<td  width="2%">�Ƿ�������</td>
	<td  width="2%">��������</td>
	<td  width="2%">����Сʱ</td>
	<td  width="8%">��������</td>
	<td  width="2%">����Ӧ��������</td>
	<td  width="2%">�ƻ����ʱ��</td>
	<td  width="2%">�ƻ��ͻ�ʱ��</td>
	<td  width="2%">�ƻ���װʱ��</td>
	<td  width="2%">ʵ���ʱ��</td>
	<td  width="2%">ʵ�ͻ�ʱ��</td>
	<td  width="2%">�״����Ű�װʱ��</td>
	<td  width="2%">��װ���ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="6%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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