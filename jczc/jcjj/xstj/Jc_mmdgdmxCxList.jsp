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
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String jc_mmdgdmx_yddbh=null;
	String jc_mmdgdmx_mmdglxbm=null;
	String jc_mmdgdmx_mlx=null;
	String jc_mmdgdmx_mmxh=null;
	String jc_mmdgdmx_ysbm=null;
	String jc_mmdgdmx_czbm=null;
	String jc_mmdgdmx_azwzbm=null;
	String jc_mmdgdmx_kqfxbm=null;
	String jc_mmdgdmx_dczlbm=null;
	String jc_mmdgdmx_ctbs=null;
	String jc_mmdgdmx_dsk=null;
	String jc_mmdgdmx_sfysblm=null;
	String jc_mmdgdmx_blxhbm=null;
	String jc_mmdgdmx_sfsmjcc=null;
	String jc_mmdgdmx_sfydc=null;
	String jc_mmdgdmx_lx=null;
	String jc_mmdgdmx_sfzdjj=null;
	String jc_mmydd_clgw=null;
	String jc_mmydd_ztjjgw=null;
	String jc_mmydd_xmzy=null;
	String jc_mmydd_pdgc=null;
	String jc_mmydd_htrq=null;
	String jc_mmydd_htqdr=null;
	String jc_mmydd_tdsj=null;
	String jc_mmydd_mmcljs=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
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
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	jc_mmdgdmx_yddbh=request.getParameter("jc_mmdgdmx_yddbh");
	if (jc_mmdgdmx_yddbh!=null)
	{
		jc_mmdgdmx_yddbh=cf.GB2Uni(jc_mmdgdmx_yddbh);
		if (!(jc_mmdgdmx_yddbh.equals("")))	wheresql+=" and  (jc_mmdgdmx.yddbh='"+jc_mmdgdmx_yddbh+"')";
	}
	jc_mmdgdmx_mmdglxbm=request.getParameter("jc_mmdgdmx_mmdglxbm");
	if (jc_mmdgdmx_mmdglxbm!=null)
	{
		jc_mmdgdmx_mmdglxbm=cf.GB2Uni(jc_mmdgdmx_mmdglxbm);
		if (!(jc_mmdgdmx_mmdglxbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.mmdglxbm='"+jc_mmdgdmx_mmdglxbm+"')";
	}
	jc_mmdgdmx_mlx=request.getParameter("jc_mmdgdmx_mlx");
	if (jc_mmdgdmx_mlx!=null)
	{
		jc_mmdgdmx_mlx=cf.GB2Uni(jc_mmdgdmx_mlx);
		if (!(jc_mmdgdmx_mlx.equals("")))	wheresql+=" and  (jc_mmdgdmx.mlx='"+jc_mmdgdmx_mlx+"')";
	}
	jc_mmdgdmx_mmxh=request.getParameter("jc_mmdgdmx_mmxh");
	if (jc_mmdgdmx_mmxh!=null)
	{
		jc_mmdgdmx_mmxh=cf.GB2Uni(jc_mmdgdmx_mmxh);
		if (!(jc_mmdgdmx_mmxh.equals("")))	wheresql+=" and  (jc_mmdgdmx.mmxh='"+jc_mmdgdmx_mmxh+"')";
	}
	jc_mmdgdmx_ysbm=request.getParameter("jc_mmdgdmx_ysbm");
	if (jc_mmdgdmx_ysbm!=null)
	{
		jc_mmdgdmx_ysbm=cf.GB2Uni(jc_mmdgdmx_ysbm);
		if (!(jc_mmdgdmx_ysbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.ysbm='"+jc_mmdgdmx_ysbm+"')";
	}
	jc_mmdgdmx_czbm=request.getParameter("jc_mmdgdmx_czbm");
	if (jc_mmdgdmx_czbm!=null)
	{
		jc_mmdgdmx_czbm=cf.GB2Uni(jc_mmdgdmx_czbm);
		if (!(jc_mmdgdmx_czbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.czbm='"+jc_mmdgdmx_czbm+"')";
	}
	jc_mmdgdmx_azwzbm=request.getParameter("jc_mmdgdmx_azwzbm");
	if (jc_mmdgdmx_azwzbm!=null)
	{
		jc_mmdgdmx_azwzbm=cf.GB2Uni(jc_mmdgdmx_azwzbm);
		if (!(jc_mmdgdmx_azwzbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.azwzbm='"+jc_mmdgdmx_azwzbm+"')";
	}
	jc_mmdgdmx_kqfxbm=request.getParameter("jc_mmdgdmx_kqfxbm");
	if (jc_mmdgdmx_kqfxbm!=null)
	{
		jc_mmdgdmx_kqfxbm=cf.GB2Uni(jc_mmdgdmx_kqfxbm);
		if (!(jc_mmdgdmx_kqfxbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.kqfxbm='"+jc_mmdgdmx_kqfxbm+"')";
	}
	jc_mmdgdmx_dczlbm=request.getParameter("jc_mmdgdmx_dczlbm");
	if (jc_mmdgdmx_dczlbm!=null)
	{
		jc_mmdgdmx_dczlbm=cf.GB2Uni(jc_mmdgdmx_dczlbm);
		if (!(jc_mmdgdmx_dczlbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.dczlbm='"+jc_mmdgdmx_dczlbm+"')";
	}
	jc_mmdgdmx_ctbs=request.getParameter("jc_mmdgdmx_ctbs");
	if (jc_mmdgdmx_ctbs!=null)
	{
		jc_mmdgdmx_ctbs=cf.GB2Uni(jc_mmdgdmx_ctbs);
		if (!(jc_mmdgdmx_ctbs.equals("")))	wheresql+=" and  (jc_mmdgdmx.ctbs='"+jc_mmdgdmx_ctbs+"')";
	}
	jc_mmdgdmx_dsk=request.getParameter("jc_mmdgdmx_dsk");
	if (jc_mmdgdmx_dsk!=null)
	{
		jc_mmdgdmx_dsk=cf.GB2Uni(jc_mmdgdmx_dsk);
		if (!(jc_mmdgdmx_dsk.equals("")))	wheresql+=" and  (jc_mmdgdmx.dsk='"+jc_mmdgdmx_dsk+"')";
	}
	jc_mmdgdmx_sfysblm=request.getParameter("jc_mmdgdmx_sfysblm");
	if (jc_mmdgdmx_sfysblm!=null)
	{
		jc_mmdgdmx_sfysblm=cf.GB2Uni(jc_mmdgdmx_sfysblm);
		if (!(jc_mmdgdmx_sfysblm.equals("")))	wheresql+=" and  (jc_mmdgdmx.sfysblm='"+jc_mmdgdmx_sfysblm+"')";
	}
	jc_mmdgdmx_blxhbm=request.getParameter("jc_mmdgdmx_blxhbm");
	if (jc_mmdgdmx_blxhbm!=null)
	{
		jc_mmdgdmx_blxhbm=cf.GB2Uni(jc_mmdgdmx_blxhbm);
		if (!(jc_mmdgdmx_blxhbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.blxhbm='"+jc_mmdgdmx_blxhbm+"')";
	}
	jc_mmdgdmx_sfsmjcc=request.getParameter("jc_mmdgdmx_sfsmjcc");
	if (jc_mmdgdmx_sfsmjcc!=null)
	{
		jc_mmdgdmx_sfsmjcc=cf.GB2Uni(jc_mmdgdmx_sfsmjcc);
		if (!(jc_mmdgdmx_sfsmjcc.equals("")))	wheresql+=" and  (jc_mmdgdmx.sfsmjcc='"+jc_mmdgdmx_sfsmjcc+"')";
	}
	jc_mmdgdmx_sfydc=request.getParameter("jc_mmdgdmx_sfydc");
	if (jc_mmdgdmx_sfydc!=null)
	{
		jc_mmdgdmx_sfydc=cf.GB2Uni(jc_mmdgdmx_sfydc);
		if (!(jc_mmdgdmx_sfydc.equals("")))	wheresql+=" and  (jc_mmdgdmx.sfydc='"+jc_mmdgdmx_sfydc+"')";
	}
	jc_mmdgdmx_lx=request.getParameter("jc_mmdgdmx_lx");
	if (jc_mmdgdmx_lx!=null)
	{
		jc_mmdgdmx_lx=cf.GB2Uni(jc_mmdgdmx_lx);
		if (!(jc_mmdgdmx_lx.equals("")))	wheresql+=" and  (jc_mmdgdmx.lx='"+jc_mmdgdmx_lx+"')";
	}
	jc_mmdgdmx_sfzdjj=request.getParameter("jc_mmdgdmx_sfzdjj");
	if (jc_mmdgdmx_sfzdjj!=null)
	{
		jc_mmdgdmx_sfzdjj=cf.GB2Uni(jc_mmdgdmx_sfzdjj);
		if (!(jc_mmdgdmx_sfzdjj.equals("")))	wheresql+=" and  (jc_mmdgdmx.sfzdjj='"+jc_mmdgdmx_sfzdjj+"')";
	}
	jc_mmydd_clgw=request.getParameter("jc_mmydd_clgw");
	if (jc_mmydd_clgw!=null)
	{
		jc_mmydd_clgw=cf.GB2Uni(jc_mmydd_clgw);
		if (!(jc_mmydd_clgw.equals("")))	wheresql+=" and  (jc_mmydd.clgw='"+jc_mmydd_clgw+"')";
	}
	jc_mmydd_ztjjgw=request.getParameter("jc_mmydd_ztjjgw");
	if (jc_mmydd_ztjjgw!=null)
	{
		jc_mmydd_ztjjgw=cf.GB2Uni(jc_mmydd_ztjjgw);
		if (!(jc_mmydd_ztjjgw.equals("")))	wheresql+=" and  (jc_mmydd.ztjjgw='"+jc_mmydd_ztjjgw+"')";
	}
	jc_mmydd_xmzy=request.getParameter("jc_mmydd_xmzy");
	if (jc_mmydd_xmzy!=null)
	{
		jc_mmydd_xmzy=cf.GB2Uni(jc_mmydd_xmzy);
		if (!(jc_mmydd_xmzy.equals("")))	wheresql+=" and  (jc_mmydd.xmzy='"+jc_mmydd_xmzy+"')";
	}
	jc_mmydd_pdgc=request.getParameter("jc_mmydd_pdgc");
	if (jc_mmydd_pdgc!=null)
	{
		jc_mmydd_pdgc=cf.GB2Uni(jc_mmydd_pdgc);
		if (!(jc_mmydd_pdgc.equals("")))	wheresql+=" and  (jc_mmydd.pdgc='"+jc_mmydd_pdgc+"')";
	}
	jc_mmydd_htrq=request.getParameter("jc_mmydd_htrq");
	if (jc_mmydd_htrq!=null)
	{
		jc_mmydd_htrq=jc_mmydd_htrq.trim();
		if (!(jc_mmydd_htrq.equals("")))	wheresql+="  and (jc_mmydd.htrq>=TO_DATE('"+jc_mmydd_htrq+"','YYYY/MM/DD'))";
	}
	jc_mmydd_htrq=request.getParameter("jc_mmydd_htrq2");
	if (jc_mmydd_htrq!=null)
	{
		jc_mmydd_htrq=jc_mmydd_htrq.trim();
		if (!(jc_mmydd_htrq.equals("")))	wheresql+="  and (jc_mmydd.htrq<=TO_DATE('"+jc_mmydd_htrq+"','YYYY/MM/DD'))";
	}
	jc_mmydd_htqdr=request.getParameter("jc_mmydd_htqdr");
	if (jc_mmydd_htqdr!=null)
	{
		jc_mmydd_htqdr=cf.GB2Uni(jc_mmydd_htqdr);
		if (!(jc_mmydd_htqdr.equals("")))	wheresql+=" and  (jc_mmydd.htqdr='"+jc_mmydd_htqdr+"')";
	}
	jc_mmydd_tdsj=request.getParameter("jc_mmydd_tdsj");
	if (jc_mmydd_tdsj!=null)
	{
		jc_mmydd_tdsj=jc_mmydd_tdsj.trim();
		if (!(jc_mmydd_tdsj.equals("")))	wheresql+="  and (jc_mmydd.tdsj>=TO_DATE('"+jc_mmydd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_mmydd_tdsj=request.getParameter("jc_mmydd_tdsj2");
	if (jc_mmydd_tdsj!=null)
	{
		jc_mmydd_tdsj=jc_mmydd_tdsj.trim();
		if (!(jc_mmydd_tdsj.equals("")))	wheresql+="  and (jc_mmydd.tdsj<=TO_DATE('"+jc_mmydd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_mmydd_mmcljs=request.getParameter("jc_mmydd_mmcljs");
	if (jc_mmydd_mmcljs!=null)
	{
		jc_mmydd_mmcljs=cf.GB2Uni(jc_mmydd_mmcljs);
		if (!(jc_mmydd_mmcljs.equals("")))	wheresql+=" and  (jc_mmydd.mmcljs='"+jc_mmydd_mmcljs+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}
	if (!jgpx4.equals(""))
	{
		ordersql+=","+jgpx4;
	}
	if (!jgpx5.equals(""))
	{
		ordersql+=","+jgpx5;
	}
	if (!jgpx6.equals(""))
	{
		ordersql+=","+jgpx6;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT crm_khxx.khxm,jc_mmdgdmx.yddbh,gysmc,jc_mmydd.htrq,jc_mmydd.mmcljs ,jc_mmdglx.mmdglxmc,jdm_mlx.mlxmc,jc_mmdgdmx.mmxh,jdm_mmczbm.mmczmc,dm_czbm.czmc,jdm_azwzbm.azwzmc,jc_mmdgdmx.dbh,jc_mmdgdmx.qh,jc_mmdgdmx.mdk,jc_mmdgdmx.mdg, DECODE(jc_mmdgdmx.ctbs,'3','三边','4','四边'),jc_mmdgdmx.tjx, DECODE(jc_mmdgdmx.dsk,'1','单口','2','双口'), DECODE(jc_mmdgdmx.sfysblm,'1','是','2','否'),jc_blbj.blxh, DECODE(jc_mmdgdmx.sfsmjcc,'Y','是','N','否'), DECODE(jc_mmdgdmx.sfydc,'Y','有顶窗','N','无顶窗'), DECODE(jc_mmdgdmx.sfzdjj,'1','自动','2','人工'),TO_CHAR(jc_mmdgdmx.dj),jc_mmdgdmx.sl,jc_mmdgdmx.zjhsl,jc_mmdgdmx.zjhsl*jc_mmdgdmx.dj, DECODE(jc_mmdgdmx.lx,'1','合同项','2','增项'),jc_mmdgdmx.bz ";
	ls_sql+=" FROM jc_mmdgdmx,jc_mmydd,crm_khxx,dm_czbm,jc_blbj,jc_mmdglx,jdm_azwzbm,jdm_mlx,jdm_mmczbm,sq_gysxx  ";
	ls_sql+=" where jc_mmdgdmx.yddbh=jc_mmydd.yddbh and jc_mmydd.khbh=crm_khxx.khbh";
	ls_sql+=" and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and  jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) ";
	ls_sql+=" and jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
	ls_sql+=" and jc_mmydd.pdgc=sq_gysxx.gysbh(+)";
	ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Jc_mmdgdmxCxList.jsp","SelectCxJc_mmdgdmx.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"khxm","jc_mmdgdmx_yddbh","jc_mmdglx_mmdglxmc","jdm_mlx_mlxmc","jc_mmdgdmx_mmxh","jdm_mmczbm_mmczmc","dm_czbm_czmc","jdm_azwzbm_azwzmc","jc_mmdgdmx_kqfxbm","jc_mmdgdmx_dczlbm","jc_mmdgdmx_dbh","jc_mmdgdmx_qh","jc_mmdgdmx_mdk","jc_mmdgdmx_mdg","jc_mmdgdmx_ctbs","jc_mmdgdmx_tjx","jc_mmdgdmx_dsk","jc_mmdgdmx_sfysblm","jc_blbj_blxh","jc_mmdgdmx_sfsmjcc","jc_mmdgdmx_sfydc","jc_mmdgdmx_lx","jc_mmdgdmx_sfzdjj","jc_mmdgdmx_bzdj","jc_mmdgdmx_dj","jc_mmdgdmx_sl","jc_mmdgdmx_zjhsl","jc_mmdgdmx_bz","jc_mmydd_pdgc","jc_mmydd_htrq","jc_mmydd_mmcljs"};
	pageObj.setDisColName(disColName);
*/

//设置主键
/*
	String[] keyName={};
	pageObj.setKey(keyName);
*/
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">客户姓名</td>
	<td  width="3%">预订单编号</td>
	<td  width="3%">木门工厂</td>
	<td  width="3%">木门合同日期</td>
	<td  width="3%">木门测量技师</td>
	<td  width="3%">木门订购类型</td>
	<td  width="4%">门类型</td>
	<td  width="3%">木门型号</td>
	<td  width="4%">木门油色</td>
	<td  width="3%">木门材质</td>
	<td  width="3%">安装位置</td>
	<td  width="3%">地板厚</td>
	<td  width="3%">墙厚</td>
	<td  width="3%">门洞宽</td>
	<td  width="3%">门洞高</td>
	<td  width="3%">窗套边数</td>
	<td  width="3%">踢脚线</td>
	<td  width="3%">单双口</td>
	<td  width="3%">是否艺术玻璃门</td>
	<td  width="5%">玻璃名称</td>
	<td  width="2%">松木集成材</td>
	<td  width="3%">是否有顶窗</td>
	<td  width="2%">是否自动计价</td>
	<td  width="3%">单价</td>
	<td  width="2%">合同数量</td>
	<td  width="2%">增减后数量</td>
	<td  width="4%">金额</td>
	<td  width="2%">类型</td>
	<td  width="4%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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