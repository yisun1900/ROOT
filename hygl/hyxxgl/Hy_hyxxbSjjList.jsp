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
	String hy_hyxxb_hybh=null;
	String hy_hyxxb_sfzf=null;
	String hy_hyxxb_hymm=null;
	String hy_hyxxb_hyxm=null;
	String hy_hyxxb_xb=null;
	String hy_hyxxb_yzbm=null;
	String hy_hyxxb_hydz=null;
	String hy_hyxxb_sfzhm=null;
	String hy_hyxxb_dh=null;
	String hy_hyxxb_sj=null;
	String hy_hyxxb_dzxx=null;
	String hy_hyxxb_csrq=null;
	String hy_hyxxb_zydm=null;
	String hy_hyxxb_ysrdm=null;
	String hy_hyxxb_hyzk=null;
	String hy_hyxxb_jhjnr=null;
	String hy_hyxxb_arxm=null;
	String hy_hyxxb_arsr=null;
	String hy_hyxxb_jgyxbm=null;
	String hy_hyxxb_fwyxbm=null;
	String hy_hyxxb_fgyxbm=null;
	String hy_hyxxb_gyyxbm=null;
	String hy_hyxxb_zdfgbm=null;
	String hy_hyxxb_psahbm=null;
	String hy_hyxxb_bzzz=null;
	String hy_hyxxb_sztlpp=null;
	String hy_hyxxb_shop=null;
	String hy_hyxxb_hzppp=null;
	String hy_hyxxb_fzpp=null;
	String hy_hyxxb_dwbh=null;
	String hy_hyxxb_rhrq=null;
	String hy_hyxxb_yxrq=null;
	String hy_hyxxb_hykh=null;
	String hy_hyxxb_hyjb=null;
	String hy_hyxxb_fwlx=null;
	String hy_hyxxb_gmcs=null;
	String hy_hyxxb_xfzje=null;
	String hy_hyxxb_jf=null;
	String hy_hyxxb_wdhjf=null;
	String hy_hyxxb_xxlrr=null;
	hy_hyxxb_hybh=request.getParameter("hy_hyxxb_hybh");
	if (hy_hyxxb_hybh!=null)
	{
		hy_hyxxb_hybh=cf.GB2Uni(hy_hyxxb_hybh);
		if (!(hy_hyxxb_hybh.equals("")))	wheresql+=" and  (hy_hyxxb.hybh='"+hy_hyxxb_hybh+"')";
	}
	hy_hyxxb_sfzf=request.getParameter("hy_hyxxb_sfzf");
	if (hy_hyxxb_sfzf!=null)
	{
		hy_hyxxb_sfzf=cf.GB2Uni(hy_hyxxb_sfzf);
		if (!(hy_hyxxb_sfzf.equals("")))	wheresql+=" and  (hy_hyxxb.sfzf='"+hy_hyxxb_sfzf+"')";
	}
	hy_hyxxb_hymm=request.getParameter("hy_hyxxb_hymm");
	if (hy_hyxxb_hymm!=null)
	{
		hy_hyxxb_hymm=cf.GB2Uni(hy_hyxxb_hymm);
		if (!(hy_hyxxb_hymm.equals("")))	wheresql+=" and  (hy_hyxxb.hymm='"+hy_hyxxb_hymm+"')";
	}
	hy_hyxxb_hyxm=request.getParameter("hy_hyxxb_hyxm");
	if (hy_hyxxb_hyxm!=null)
	{
		hy_hyxxb_hyxm=cf.GB2Uni(hy_hyxxb_hyxm);
		if (!(hy_hyxxb_hyxm.equals("")))	wheresql+=" and  (hy_hyxxb.hyxm='"+hy_hyxxb_hyxm+"')";
	}
	hy_hyxxb_xb=request.getParameter("hy_hyxxb_xb");
	if (hy_hyxxb_xb!=null)
	{
		hy_hyxxb_xb=cf.GB2Uni(hy_hyxxb_xb);
		if (!(hy_hyxxb_xb.equals("")))	wheresql+=" and  (hy_hyxxb.xb='"+hy_hyxxb_xb+"')";
	}
	hy_hyxxb_yzbm=request.getParameter("hy_hyxxb_yzbm");
	if (hy_hyxxb_yzbm!=null)
	{
		hy_hyxxb_yzbm=cf.GB2Uni(hy_hyxxb_yzbm);
		if (!(hy_hyxxb_yzbm.equals("")))	wheresql+=" and  (hy_hyxxb.yzbm='"+hy_hyxxb_yzbm+"')";
	}
	hy_hyxxb_hydz=request.getParameter("hy_hyxxb_hydz");
	if (hy_hyxxb_hydz!=null)
	{
		hy_hyxxb_hydz=cf.GB2Uni(hy_hyxxb_hydz);
		if (!(hy_hyxxb_hydz.equals("")))	wheresql+=" and  (hy_hyxxb.hydz='"+hy_hyxxb_hydz+"')";
	}
	hy_hyxxb_sfzhm=request.getParameter("hy_hyxxb_sfzhm");
	if (hy_hyxxb_sfzhm!=null)
	{
		hy_hyxxb_sfzhm=cf.GB2Uni(hy_hyxxb_sfzhm);
		if (!(hy_hyxxb_sfzhm.equals("")))	wheresql+=" and  (hy_hyxxb.sfzhm='"+hy_hyxxb_sfzhm+"')";
	}
	hy_hyxxb_dh=request.getParameter("hy_hyxxb_dh");
	if (hy_hyxxb_dh!=null)
	{
		hy_hyxxb_dh=cf.GB2Uni(hy_hyxxb_dh);
		if (!(hy_hyxxb_dh.equals("")))	wheresql+=" and  (hy_hyxxb.dh='"+hy_hyxxb_dh+"')";
	}
	hy_hyxxb_sj=request.getParameter("hy_hyxxb_sj");
	if (hy_hyxxb_sj!=null)
	{
		hy_hyxxb_sj=cf.GB2Uni(hy_hyxxb_sj);
		if (!(hy_hyxxb_sj.equals("")))	wheresql+=" and  (hy_hyxxb.sj='"+hy_hyxxb_sj+"')";
	}
	hy_hyxxb_dzxx=request.getParameter("hy_hyxxb_dzxx");
	if (hy_hyxxb_dzxx!=null)
	{
		hy_hyxxb_dzxx=cf.GB2Uni(hy_hyxxb_dzxx);
		if (!(hy_hyxxb_dzxx.equals("")))	wheresql+=" and  (hy_hyxxb.dzxx='"+hy_hyxxb_dzxx+"')";
	}
	hy_hyxxb_csrq=request.getParameter("hy_hyxxb_csrq");
	if (hy_hyxxb_csrq!=null)
	{
		hy_hyxxb_csrq=hy_hyxxb_csrq.trim();
		if (!(hy_hyxxb_csrq.equals("")))	wheresql+="  and (hy_hyxxb.csrq>=TO_DATE('"+hy_hyxxb_csrq+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_csrq=request.getParameter("hy_hyxxb_csrq2");
	if (hy_hyxxb_csrq!=null)
	{
		hy_hyxxb_csrq=hy_hyxxb_csrq.trim();
		if (!(hy_hyxxb_csrq.equals("")))	wheresql+="  and (hy_hyxxb.csrq<=TO_DATE('"+hy_hyxxb_csrq+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_zydm=request.getParameter("hy_hyxxb_zydm");
	if (hy_hyxxb_zydm!=null)
	{
		hy_hyxxb_zydm=cf.GB2Uni(hy_hyxxb_zydm);
		if (!(hy_hyxxb_zydm.equals("")))	wheresql+=" and  (hy_hyxxb.zydm='"+hy_hyxxb_zydm+"')";
	}
	hy_hyxxb_ysrdm=request.getParameter("hy_hyxxb_ysrdm");
	if (hy_hyxxb_ysrdm!=null)
	{
		hy_hyxxb_ysrdm=cf.GB2Uni(hy_hyxxb_ysrdm);
		if (!(hy_hyxxb_ysrdm.equals("")))	wheresql+=" and  (hy_hyxxb.ysrdm='"+hy_hyxxb_ysrdm+"')";
	}
	hy_hyxxb_hyzk=request.getParameter("hy_hyxxb_hyzk");
	if (hy_hyxxb_hyzk!=null)
	{
		hy_hyxxb_hyzk=cf.GB2Uni(hy_hyxxb_hyzk);
		if (!(hy_hyxxb_hyzk.equals("")))	wheresql+=" and  (hy_hyxxb.hyzk='"+hy_hyxxb_hyzk+"')";
	}
	hy_hyxxb_jhjnr=request.getParameter("hy_hyxxb_jhjnr");
	if (hy_hyxxb_jhjnr!=null)
	{
		hy_hyxxb_jhjnr=hy_hyxxb_jhjnr.trim();
		if (!(hy_hyxxb_jhjnr.equals("")))	wheresql+="  and (hy_hyxxb.jhjnr>=TO_DATE('"+hy_hyxxb_jhjnr+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_jhjnr=request.getParameter("hy_hyxxb_jhjnr2");
	if (hy_hyxxb_jhjnr!=null)
	{
		hy_hyxxb_jhjnr=hy_hyxxb_jhjnr.trim();
		if (!(hy_hyxxb_jhjnr.equals("")))	wheresql+="  and (hy_hyxxb.jhjnr<=TO_DATE('"+hy_hyxxb_jhjnr+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_arxm=request.getParameter("hy_hyxxb_arxm");
	if (hy_hyxxb_arxm!=null)
	{
		hy_hyxxb_arxm=cf.GB2Uni(hy_hyxxb_arxm);
		if (!(hy_hyxxb_arxm.equals("")))	wheresql+=" and  (hy_hyxxb.arxm='"+hy_hyxxb_arxm+"')";
	}
	hy_hyxxb_arsr=request.getParameter("hy_hyxxb_arsr");
	if (hy_hyxxb_arsr!=null)
	{
		hy_hyxxb_arsr=hy_hyxxb_arsr.trim();
		if (!(hy_hyxxb_arsr.equals("")))	wheresql+="  and (hy_hyxxb.arsr>=TO_DATE('"+hy_hyxxb_arsr+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_arsr=request.getParameter("hy_hyxxb_arsr2");
	if (hy_hyxxb_arsr!=null)
	{
		hy_hyxxb_arsr=hy_hyxxb_arsr.trim();
		if (!(hy_hyxxb_arsr.equals("")))	wheresql+="  and (hy_hyxxb.arsr<=TO_DATE('"+hy_hyxxb_arsr+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_jgyxbm=request.getParameter("hy_hyxxb_jgyxbm");
	if (hy_hyxxb_jgyxbm!=null)
	{
		hy_hyxxb_jgyxbm=cf.GB2Uni(hy_hyxxb_jgyxbm);
		if (!(hy_hyxxb_jgyxbm.equals("")))	wheresql+=" and  (hy_hyxxb.jgyxbm='"+hy_hyxxb_jgyxbm+"')";
	}
	hy_hyxxb_fwyxbm=request.getParameter("hy_hyxxb_fwyxbm");
	if (hy_hyxxb_fwyxbm!=null)
	{
		hy_hyxxb_fwyxbm=cf.GB2Uni(hy_hyxxb_fwyxbm);
		if (!(hy_hyxxb_fwyxbm.equals("")))	wheresql+=" and  (hy_hyxxb.fwyxbm='"+hy_hyxxb_fwyxbm+"')";
	}
	hy_hyxxb_fgyxbm=request.getParameter("hy_hyxxb_fgyxbm");
	if (hy_hyxxb_fgyxbm!=null)
	{
		hy_hyxxb_fgyxbm=cf.GB2Uni(hy_hyxxb_fgyxbm);
		if (!(hy_hyxxb_fgyxbm.equals("")))	wheresql+=" and  (hy_hyxxb.fgyxbm='"+hy_hyxxb_fgyxbm+"')";
	}
	hy_hyxxb_gyyxbm=request.getParameter("hy_hyxxb_gyyxbm");
	if (hy_hyxxb_gyyxbm!=null)
	{
		hy_hyxxb_gyyxbm=cf.GB2Uni(hy_hyxxb_gyyxbm);
		if (!(hy_hyxxb_gyyxbm.equals("")))	wheresql+=" and  (hy_hyxxb.gyyxbm='"+hy_hyxxb_gyyxbm+"')";
	}
	hy_hyxxb_zdfgbm=request.getParameter("hy_hyxxb_zdfgbm");
	if (hy_hyxxb_zdfgbm!=null)
	{
		hy_hyxxb_zdfgbm=cf.GB2Uni(hy_hyxxb_zdfgbm);
		if (!(hy_hyxxb_zdfgbm.equals("")))	wheresql+=" and  (hy_hyxxb.zdfgbm='"+hy_hyxxb_zdfgbm+"')";
	}
	hy_hyxxb_psahbm=request.getParameter("hy_hyxxb_psahbm");
	if (hy_hyxxb_psahbm!=null)
	{
		hy_hyxxb_psahbm=cf.GB2Uni(hy_hyxxb_psahbm);
		if (!(hy_hyxxb_psahbm.equals("")))	wheresql+=" and  (hy_hyxxb.psahbm='"+hy_hyxxb_psahbm+"')";
	}
	hy_hyxxb_bzzz=request.getParameter("hy_hyxxb_bzzz");
	if (hy_hyxxb_bzzz!=null)
	{
		hy_hyxxb_bzzz=cf.GB2Uni(hy_hyxxb_bzzz);
		if (!(hy_hyxxb_bzzz.equals("")))	wheresql+=" and  (hy_hyxxb.bzzz='"+hy_hyxxb_bzzz+"')";
	}
	hy_hyxxb_sztlpp=request.getParameter("hy_hyxxb_sztlpp");
	if (hy_hyxxb_sztlpp!=null)
	{
		hy_hyxxb_sztlpp=cf.GB2Uni(hy_hyxxb_sztlpp);
		if (!(hy_hyxxb_sztlpp.equals("")))	wheresql+=" and  (hy_hyxxb.sztlpp='"+hy_hyxxb_sztlpp+"')";
	}
	hy_hyxxb_shop=request.getParameter("hy_hyxxb_shop");
	if (hy_hyxxb_shop!=null)
	{
		hy_hyxxb_shop=cf.GB2Uni(hy_hyxxb_shop);
		if (!(hy_hyxxb_shop.equals("")))	wheresql+=" and  (hy_hyxxb.shop='"+hy_hyxxb_shop+"')";
	}
	hy_hyxxb_hzppp=request.getParameter("hy_hyxxb_hzppp");
	if (hy_hyxxb_hzppp!=null)
	{
		hy_hyxxb_hzppp=cf.GB2Uni(hy_hyxxb_hzppp);
		if (!(hy_hyxxb_hzppp.equals("")))	wheresql+=" and  (hy_hyxxb.hzppp='"+hy_hyxxb_hzppp+"')";
	}
	hy_hyxxb_fzpp=request.getParameter("hy_hyxxb_fzpp");
	if (hy_hyxxb_fzpp!=null)
	{
		hy_hyxxb_fzpp=cf.GB2Uni(hy_hyxxb_fzpp);
		if (!(hy_hyxxb_fzpp.equals("")))	wheresql+=" and  (hy_hyxxb.fzpp='"+hy_hyxxb_fzpp+"')";
	}
	hy_hyxxb_dwbh=request.getParameter("hy_hyxxb_dwbh");
	if (hy_hyxxb_dwbh!=null)
	{
		hy_hyxxb_dwbh=cf.GB2Uni(hy_hyxxb_dwbh);
		if (!(hy_hyxxb_dwbh.equals("")))	wheresql+=" and  (hy_hyxxb.dwbh='"+hy_hyxxb_dwbh+"')";
	}
	hy_hyxxb_rhrq=request.getParameter("hy_hyxxb_rhrq");
	if (hy_hyxxb_rhrq!=null)
	{
		hy_hyxxb_rhrq=hy_hyxxb_rhrq.trim();
		if (!(hy_hyxxb_rhrq.equals("")))	wheresql+="  and (hy_hyxxb.rhrq>=TO_DATE('"+hy_hyxxb_rhrq+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_rhrq=request.getParameter("hy_hyxxb_rhrq2");
	if (hy_hyxxb_rhrq!=null)
	{
		hy_hyxxb_rhrq=hy_hyxxb_rhrq.trim();
		if (!(hy_hyxxb_rhrq.equals("")))	wheresql+="  and (hy_hyxxb.rhrq<=TO_DATE('"+hy_hyxxb_rhrq+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_yxrq=request.getParameter("hy_hyxxb_yxrq");
	if (hy_hyxxb_yxrq!=null)
	{
		hy_hyxxb_yxrq=hy_hyxxb_yxrq.trim();
		if (!(hy_hyxxb_yxrq.equals("")))	wheresql+="  and (hy_hyxxb.yxrq>=TO_DATE('"+hy_hyxxb_yxrq+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_yxrq=request.getParameter("hy_hyxxb_yxrq2");
	if (hy_hyxxb_yxrq!=null)
	{
		hy_hyxxb_yxrq=hy_hyxxb_yxrq.trim();
		if (!(hy_hyxxb_yxrq.equals("")))	wheresql+="  and (hy_hyxxb.yxrq<=TO_DATE('"+hy_hyxxb_yxrq+"','YYYY/MM/DD'))";
	}
	hy_hyxxb_hykh=request.getParameter("hy_hyxxb_hykh");
	if (hy_hyxxb_hykh!=null)
	{
		hy_hyxxb_hykh=cf.GB2Uni(hy_hyxxb_hykh);
		if (!(hy_hyxxb_hykh.equals("")))	wheresql+=" and  (hy_hyxxb.hykh='"+hy_hyxxb_hykh+"')";
	}
	hy_hyxxb_hyjb=request.getParameter("hy_hyxxb_hyjb");
	if (hy_hyxxb_hyjb!=null)
	{
		hy_hyxxb_hyjb=cf.GB2Uni(hy_hyxxb_hyjb);
		if (!(hy_hyxxb_hyjb.equals("")))	wheresql+=" and  (hy_hyxxb.hyjb='"+hy_hyxxb_hyjb+"')";
	}
	hy_hyxxb_fwlx=request.getParameter("hy_hyxxb_fwlx");
	if (hy_hyxxb_fwlx!=null)
	{
		hy_hyxxb_fwlx=cf.GB2Uni(hy_hyxxb_fwlx);
		if (!(hy_hyxxb_fwlx.equals("")))	wheresql+=" and  (hy_hyxxb.fwlx='"+hy_hyxxb_fwlx+"')";
	}
	hy_hyxxb_gmcs=request.getParameter("hy_hyxxb_gmcs");
	if (hy_hyxxb_gmcs!=null)
	{
		hy_hyxxb_gmcs=hy_hyxxb_gmcs.trim();
		if (!(hy_hyxxb_gmcs.equals("")))	wheresql+=" and (hy_hyxxb.gmcs>="+hy_hyxxb_gmcs+") ";
	}
	hy_hyxxb_gmcs=request.getParameter("hy_hyxxb_gmcs2");
	if (hy_hyxxb_gmcs!=null)
	{
		hy_hyxxb_gmcs=hy_hyxxb_gmcs.trim();
		if (!(hy_hyxxb_gmcs.equals("")))	wheresql+=" and (hy_hyxxb.gmcs<="+hy_hyxxb_gmcs+") ";
	}
	hy_hyxxb_xfzje=request.getParameter("hy_hyxxb_xfzje");
	if (hy_hyxxb_xfzje!=null)
	{
		hy_hyxxb_xfzje=hy_hyxxb_xfzje.trim();
		if (!(hy_hyxxb_xfzje.equals("")))	wheresql+=" and  (hy_hyxxb.xfzje>="+hy_hyxxb_xfzje+") ";
	}
	hy_hyxxb_xfzje=request.getParameter("hy_hyxxb_xfzje2");
	if (hy_hyxxb_xfzje!=null)
	{
		hy_hyxxb_xfzje=hy_hyxxb_xfzje.trim();
		if (!(hy_hyxxb_xfzje.equals("")))	wheresql+=" and  (hy_hyxxb.xfzje<="+hy_hyxxb_xfzje+") ";
	}
	hy_hyxxb_jf=request.getParameter("hy_hyxxb_jf");
	if (hy_hyxxb_jf!=null)
	{
		hy_hyxxb_jf=hy_hyxxb_jf.trim();
		if (!(hy_hyxxb_jf.equals("")))	wheresql+=" and (hy_hyxxb.jf>="+hy_hyxxb_jf+") ";
	}
	hy_hyxxb_jf=request.getParameter("hy_hyxxb_jf2");
	if (hy_hyxxb_jf!=null)
	{
		hy_hyxxb_jf=hy_hyxxb_jf.trim();
		if (!(hy_hyxxb_jf.equals("")))	wheresql+=" and (hy_hyxxb.jf<="+hy_hyxxb_jf+") ";
	}
	hy_hyxxb_wdhjf=request.getParameter("hy_hyxxb_wdhjf");
	if (hy_hyxxb_wdhjf!=null)
	{
		hy_hyxxb_wdhjf=hy_hyxxb_wdhjf.trim();
		if (!(hy_hyxxb_wdhjf.equals("")))	wheresql+=" and (hy_hyxxb.wdhjf>="+hy_hyxxb_wdhjf+") ";
	}
	hy_hyxxb_wdhjf=request.getParameter("hy_hyxxb_wdhjf2");
	if (hy_hyxxb_wdhjf!=null)
	{
		hy_hyxxb_wdhjf=hy_hyxxb_wdhjf.trim();
		if (!(hy_hyxxb_wdhjf.equals("")))	wheresql+=" and (hy_hyxxb.wdhjf<="+hy_hyxxb_wdhjf+") ";
	}
	hy_hyxxb_xxlrr=request.getParameter("hy_hyxxb_xxlrr");
	if (hy_hyxxb_xxlrr!=null)
	{
		hy_hyxxb_xxlrr=cf.GB2Uni(hy_hyxxb_xxlrr);
		if (!(hy_hyxxb_xxlrr.equals("")))	wheresql+=" and  (hy_hyxxb.xxlrr='"+hy_hyxxb_xxlrr+"')";
	}
	ls_sql="SELECT hy_hyxxb.hybh as hybh,hy_hyxxb.hykh as hy_hyxxb_hykh,hy_hyxxb.hyxm as hy_hyxxb_hyxm,hy_hyxxb.hydz as hy_hyxxb_hydz,xfzje,jf,hy_hyjbb.hyjb as hy_hyjbb_hyjb,sq_dwxx.dwmc as sq_dwxx_dwmc,hy_hyxxb.rhrq as hy_hyxxb_rhrq,hy_hyxxb.yxrq as hy_hyxxb_yxrq, DECODE(hy_hyxxb.fwlx,'1','基本服务','2','增值服务') as hy_hyxxb_fwlx  ";
	ls_sql+=" FROM hy_hyjbb,hy_hyxxb,sq_dwxx  ";
    ls_sql+=" where hy_hyxxb.dwbh=sq_dwxx.dwbh and HY_HYXXB.hyjb=HY_HYJBB.hyjbbh";
    ls_sql+=wheresql;
    ls_sql+=" order by hy_hyxxb.hybh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hy_hyxxbSjjList.jsp","SelectSjjHy_hyxxb.jsp","","SjjHy_hyxxb.jsp");
	pageObj.setPageRow(5000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hybh","hy_hyxxb_sfzf","hy_hyxxb_hyxm","hy_hyxxb_hydz","hy_hyxxb_dh","sq_dwxx_dwmc","hy_hyxxb_rhrq","hy_hyxxb_yxrq","hy_hyxxb_hykh","hy_hyjbb_hyjb","hy_hyxxb_fwlx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hybh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"会员升降级"};//按钮的显示名称
	String[] buttonLink={"EnterHyjb.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hybh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewHy_hyxxb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hybh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] hybh = request.getParameterValues("hybh");
	String sfzf=request.getParameter("sfzf");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hybh,"hybh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update hy_hyxxb set sfzf='"+sfzf+"' where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="7%">会员编号</td>
	<td  width="8%">水质分析卡号</td>
	<td  width="6%">会员姓名</td>
	<td  width="19%">会员地址</td>
	<td  width="8%">消费总金额</td>
	<td  width="6%">积分</td>
	<td  width="6%">会员级别</td>
	<td  width="8%">所属专卖店</td>
	<td  width="8%">入会日期</td>
	<td  width="8%">有效日期</td>
	<td  width="8%">服务类型</td>
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