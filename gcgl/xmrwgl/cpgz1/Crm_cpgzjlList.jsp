<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
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
	ls_sql+=" ,crm_cpgzjl.cpflbm,cpflmc,cpztmc,ztfssj, DECODE(crm_cpgzjl.cplx,'1','定制品','2','成品') cplx ";
	ls_sql+=" ,DECODE(crm_cpgzjl.cpazlx,'1','施工类','2','安装类') cpazlx,crm_cpgzjl.ghf,crm_cpgzjl.jgpp,crm_cpgzjl.ghfhzsj";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxdd,'Y','是','N','否') sfxdd, DECODE(crm_cpgzjl.sfxhxgl,'Y','是','N','否') sfxhxgl";
	ls_sql+=" ,DECODE(crm_cpgzjl.zxsfwz,'Y','是','N','否') zxsfwz,crm_cpgzjl.cpsjs";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxfb,'N','无返补','Y','等待返补','W','返补成功','S','返补失败') sfxfb,crm_cpgzjl.fbdbh ";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfyyc,'N','无异常','Y','等待处理','W','异常解决成功','S','异常解决失败') sfyyc ,crm_cpgzjl.ycdbh ";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxtx,'Y','需提醒','N','否') sfxtx,crm_cpgzjl.txrq,crm_cpgzjl.txxs,crm_cpgzjl.txnr,crm_cpgzjl.zwyjcrq ";
	ls_sql+=" ,crm_cpgzjl.jhrksj,crm_cpgzjl.jhshsj,crm_cpgzjl.jhazsj,crm_cpgzjl.lrr,crm_cpgzjl.lrsj,dwmc,crm_cpgzjl.bz";
	ls_sql+=" ,crm_cpgzjl.srksj,crm_cpgzjl.sshsj,crm_cpgzjl.scazsj,crm_cpgzjl.azwcsj";
	ls_sql+=" FROM crm_cpgzjl,crm_khxx,dm_cpflbm,dm_cpztbm,sq_dwxx  ";
    ls_sql+=" where crm_cpgzjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cpgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpgzjl.cpztbm=dm_cpztbm.cpztbm";
    ls_sql+=" and crm_cpgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_cpgzjl.cpztbm!='99'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
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
//进行对象初始化
	pageObj.initPage("Crm_cpgzjlList.jsp","","","EditCrm_cpgzjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"cpflmc","cpztmc","ztfssj","khbh","khxm","fwdz","hth","sjs","cplx","cpazlx","ghf","jgpp","ghfhzsj","sfxdd","sfxhxgl","zxsfwz","cpsjs","sfxfb","fbdbh","sfyyc","ycdbh","sfxtx","txrq","txxs","txnr","zwyjcrq","jhrksj","jhshsj","jhazsj","srksj","sshsj","scazsj","azwcsj","lrr","lrsj","dwmc","bz"};
	pageObj.setDisColName(disColName);
//设置主键
	String[] keyName={"khbh","cpflbm"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_cpgzjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh","cpflbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_cpgzjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("cpflmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[4];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
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
  <B><font size="3">维护－－产品信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(450);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">产品分类</td>
	<td  width="2%">产品状态</td>
	<td  width="2%">状态发生时间</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">合同号</td>
	<td  width="2%">设计师</td>
	<td  width="2%">产品类型</td>
	<td  width="2%">产品安装类型</td>
	<td  width="2%">供货方</td>
	<td  width="6%">甲供品牌</td>
	<td  width="2%">供货方获知时间</td>
	<td  width="2%">是否交底后新订单</td>
	<td  width="2%">是否需后续管理</td>
	<td  width="2%">选型是否完成</td>
	<td  width="2%">产品设计师</td>
	<td  width="2%">是否需返补</td>
	<td  width="3%">返补单编号</td>
	<td  width="2%">是否有异常</td>
	<td  width="3%">异常单编号</td>
	<td  width="2%">是否需提醒</td>
	<td  width="2%">提醒日期</td>
	<td  width="2%">提醒小时</td>
	<td  width="8%">提醒内容</td>
	<td  width="2%">最晚应进场日期</td>
	<td  width="2%">计划入库时间</td>
	<td  width="2%">计划送货时间</td>
	<td  width="2%">计划安装时间</td>
	<td  width="2%">实入库时间</td>
	<td  width="2%">实送货时间</td>
	<td  width="2%">首次上门安装时间</td>
	<td  width="2%">安装完成时间</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="6%">备注</td>
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