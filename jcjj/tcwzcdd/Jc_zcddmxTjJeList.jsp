<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"041522")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

<body bgcolor="#FFFFFF" >

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String jc_zcdd_ddbh=null;
	String jc_zcdd_clzt=null;



	String jc_zcdd_sfwj=null;
	jc_zcdd_sfwj=request.getParameter("jc_zcdd_sfwj");
	if (jc_zcdd_sfwj!=null)
	{
		if (jc_zcdd_sfwj.equals("Y"))
		{
			wheresql+=" and  (jc_zcdd.clzt='30')";
		}
		else{
			wheresql+=" and  jc_zcdd.clzt not in('00','02','03','05','07','30','98','99')";
		}
	}

	String jc_zcddmx_sftjcp=null;
	jc_zcddmx_sftjcp=request.getParameter("jc_zcddmx_sftjcp");
	if (jc_zcddmx_sftjcp!=null)
	{
		if (!(jc_zcddmx_sftjcp.equals("")))	wheresql+=" and  (jc_zcddmx.sftjcp='"+jc_zcddmx_sftjcp+"')";
	}

	String jc_zcdd_wjsj=null;
	jc_zcdd_wjsj=request.getParameter("jc_zcdd_wjsj");
	if (jc_zcdd_wjsj!=null)
	{
		if (!(jc_zcdd_wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj>=TO_DATE('"+jc_zcdd_wjsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_wjsj=request.getParameter("jc_zcdd_wjsj2");
	if (jc_zcdd_wjsj!=null)
	{
		if (!(jc_zcdd_wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj<=TO_DATE('"+jc_zcdd_wjsj+"','YYYY/MM/DD'))";
	}

	String crm_khxx_qye=null;
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
	String crm_khxx_qyrq=null;
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

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_zcdd.ztjjgw='"+ztjjgw+"')";
	}
	String ztjjgw2=null;
	ztjjgw2=request.getParameter("ztjjgw2");
	if (ztjjgw2!=null)
	{
		ztjjgw2=cf.GB2Uni(ztjjgw2);
		if (!(ztjjgw2.equals("")))	wheresql+=" and  (jc_zcdd.ztjjgw='"+ztjjgw2+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_zcdd.clgw='"+clgw+"')";
	}
	String clgw2=null;
	clgw2=request.getParameter("clgw2");
	if (clgw2!=null)
	{
		clgw2=cf.GB2Uni(clgw2);
		if (!(clgw2.equals("")))	wheresql+=" and  (jc_zcdd.clgw='"+clgw2+"')";
	}

	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_zcdd.xmzy='"+xmzy+"')";
	}
	String xmzy2=null;
	xmzy2=request.getParameter("xmzy2");
	if (xmzy2!=null)
	{
		xmzy2=cf.GB2Uni(xmzy2);
		if (!(xmzy2.equals("")))	wheresql+=" and  (jc_zcdd.xmzy='"+xmzy2+"')";
	}
	String jjsjs=null;
	jjsjs=request.getParameter("jjsjs");
	if (jjsjs!=null)
	{
		jjsjs=cf.GB2Uni(jjsjs);
		if (!(jjsjs.equals("")))	wheresql+=" and  (jc_zcdd.jjsjs='"+jjsjs+"')";
	}
	String jjsjs2=null;
	jjsjs2=request.getParameter("jjsjs2");
	if (jjsjs2!=null)
	{
		jjsjs2=cf.GB2Uni(jjsjs2);
		if (!(jjsjs2.equals("")))	wheresql+=" and  (jc_zcdd.jjsjs='"+jjsjs2+"')";
	}


	String zcdlbm=null;
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_zcdd.zcdlbm='"+zcdlbm+"')";
	}
	String zcxlbm=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_zcdd.zcxlbm='"+zcxlbm+"')";
	}
	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (jc_zcdd.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql+=" and  (jc_zcdd.ppbm like '%"+ppbm2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_zcdd.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zcdd.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_zcdd.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_zcdd.gys like '%"+gys2+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";


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




	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}




	String crm_khxx_sjs=null;
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	String crm_khxx_sgd=null;
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	String crm_khxx_zjxm=null;
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}



	jc_zcdd_ddbh=request.getParameter("jc_zcdd_ddbh");
	if (jc_zcdd_ddbh!=null)
	{
		jc_zcdd_ddbh=cf.GB2Uni(jc_zcdd_ddbh);
		if (!(jc_zcdd_ddbh.equals("")))	wheresql+=" and  (jc_zcdd.ddbh='"+jc_zcdd_ddbh+"')";
	}
	jc_zcdd_clzt=request.getParameter("jc_zcdd_clzt");
	if (jc_zcdd_clzt!=null)
	{
		jc_zcdd_clzt=cf.GB2Uni(jc_zcdd_clzt);
		if (!(jc_zcdd_clzt.equals("")))	wheresql+=" and  (jc_zcdd.clzt='"+jc_zcdd_clzt+"')";
	}
	
	String jc_zcdd_qhtsj=null;
	jc_zcdd_qhtsj=request.getParameter("jc_zcdd_qhtsj");
	if (jc_zcdd_qhtsj!=null)
	{
		jc_zcdd_qhtsj=jc_zcdd_qhtsj.trim();
		if (!(jc_zcdd_qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj>=TO_DATE('"+jc_zcdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_qhtsj=request.getParameter("jc_zcdd_qhtsj2");
	if (jc_zcdd_qhtsj!=null)
	{
		jc_zcdd_qhtsj=jc_zcdd_qhtsj.trim();
		if (!(jc_zcdd_qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj<=TO_DATE('"+jc_zcdd_qhtsj+"','YYYY/MM/DD'))";
	}
	

	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		if (!(bjjb.equals("")))	wheresql+=" and  (crm_khxx.bjjb='"+bjjb+"')";
	}
	
	
	
	
	
	
	String jc_zcddmx_zcbm=null;
	String jc_zcddmx_zcmc=null;
	String jc_zcddmx_zclbbm=null;
	String jc_zcddmx_xinghao=null;
	String jc_zcddmx_gg=null;
	String jc_zcddmx_zcysbm=null;
	String jc_zcddmx_zcpzwzbm=null;
	String jc_zcddmx_sfycx=null;
	String jc_zcddmx_cxkssj=null;
	String jc_zcddmx_cxjzsj=null;
	String jc_zcddmx_xzjg=null;
	String jc_zcddmx_dj=null;

	jc_zcddmx_zcbm=request.getParameter("jc_zcddmx_zcbm");
	if (jc_zcddmx_zcbm!=null)
	{
		jc_zcddmx_zcbm=cf.GB2Uni(jc_zcddmx_zcbm);
		if (!(jc_zcddmx_zcbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcbm='"+jc_zcddmx_zcbm+"')";
	}
	jc_zcddmx_zcmc=request.getParameter("jc_zcddmx_zcmc");
	if (jc_zcddmx_zcmc!=null)
	{
		jc_zcddmx_zcmc=cf.GB2Uni(jc_zcddmx_zcmc);
		if (!(jc_zcddmx_zcmc.equals("")))	wheresql+=" and  (jc_zcddmx.zcmc='"+jc_zcddmx_zcmc+"')";
	}
	jc_zcddmx_zclbbm=request.getParameter("jc_zcddmx_zclbbm");
	if (jc_zcddmx_zclbbm!=null)
	{
		jc_zcddmx_zclbbm=cf.GB2Uni(jc_zcddmx_zclbbm);
		if (!(jc_zcddmx_zclbbm.equals("")))	wheresql+=" and  (jc_zcddmx.zclbbm='"+jc_zcddmx_zclbbm+"')";
	}
	jc_zcddmx_xinghao=request.getParameter("jc_zcddmx_xinghao");
	if (jc_zcddmx_xinghao!=null)
	{
		jc_zcddmx_xinghao=cf.GB2Uni(jc_zcddmx_xinghao);
		if (!(jc_zcddmx_xinghao.equals("")))	wheresql+=" and  (jc_zcddmx.xinghao='"+jc_zcddmx_xinghao+"')";
	}
	jc_zcddmx_gg=request.getParameter("jc_zcddmx_gg");
	if (jc_zcddmx_gg!=null)
	{
		jc_zcddmx_gg=cf.GB2Uni(jc_zcddmx_gg);
		if (!(jc_zcddmx_gg.equals("")))	wheresql+=" and  (jc_zcddmx.gg='"+jc_zcddmx_gg+"')";
	}
	jc_zcddmx_zcysbm=request.getParameter("jc_zcddmx_zcysbm");
	if (jc_zcddmx_zcysbm!=null)
	{
		jc_zcddmx_zcysbm=cf.GB2Uni(jc_zcddmx_zcysbm);
		if (!(jc_zcddmx_zcysbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcysbm='"+jc_zcddmx_zcysbm+"')";
	}
	jc_zcddmx_zcpzwzbm=request.getParameter("jc_zcddmx_zcpzwzbm");
	if (jc_zcddmx_zcpzwzbm!=null)
	{
		jc_zcddmx_zcpzwzbm=cf.GB2Uni(jc_zcddmx_zcpzwzbm);
		if (!(jc_zcddmx_zcpzwzbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcpzwzbm='"+jc_zcddmx_zcpzwzbm+"')";
	}
	jc_zcddmx_sfycx=request.getParameter("jc_zcddmx_sfycx");
	if (jc_zcddmx_sfycx!=null)
	{
		jc_zcddmx_sfycx=cf.GB2Uni(jc_zcddmx_sfycx);
		if (!(jc_zcddmx_sfycx.equals("")))	wheresql+=" and  (jc_zcddmx.sfycx='"+jc_zcddmx_sfycx+"')";
	}
	jc_zcddmx_cxkssj=request.getParameter("jc_zcddmx_cxkssj");
	if (jc_zcddmx_cxkssj!=null)
	{
		jc_zcddmx_cxkssj=jc_zcddmx_cxkssj.trim();
		if (!(jc_zcddmx_cxkssj.equals("")))	wheresql+="  and (jc_zcddmx.cxkssj>=TO_DATE('"+jc_zcddmx_cxkssj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxkssj=request.getParameter("jc_zcddmx_cxkssj2");
	if (jc_zcddmx_cxkssj!=null)
	{
		jc_zcddmx_cxkssj=jc_zcddmx_cxkssj.trim();
		if (!(jc_zcddmx_cxkssj.equals("")))	wheresql+="  and (jc_zcddmx.cxkssj<=TO_DATE('"+jc_zcddmx_cxkssj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxjzsj=request.getParameter("jc_zcddmx_cxjzsj");
	if (jc_zcddmx_cxjzsj!=null)
	{
		jc_zcddmx_cxjzsj=jc_zcddmx_cxjzsj.trim();
		if (!(jc_zcddmx_cxjzsj.equals("")))	wheresql+="  and (jc_zcddmx.cxjzsj>=TO_DATE('"+jc_zcddmx_cxjzsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxjzsj=request.getParameter("jc_zcddmx_cxjzsj2");
	if (jc_zcddmx_cxjzsj!=null)
	{
		jc_zcddmx_cxjzsj=jc_zcddmx_cxjzsj.trim();
		if (!(jc_zcddmx_cxjzsj.equals("")))	wheresql+="  and (jc_zcddmx.cxjzsj<=TO_DATE('"+jc_zcddmx_cxjzsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_xzjg=request.getParameter("jc_zcddmx_xzjg");
	if (jc_zcddmx_xzjg!=null)
	{
		jc_zcddmx_xzjg=cf.GB2Uni(jc_zcddmx_xzjg);
		if (!(jc_zcddmx_xzjg.equals("")))	wheresql+=" and  (jc_zcddmx.xzjg='"+jc_zcddmx_xzjg+"')";
	}
	jc_zcddmx_dj=request.getParameter("jc_zcddmx_dj");
	if (jc_zcddmx_dj!=null)
	{
		jc_zcddmx_dj=jc_zcddmx_dj.trim();
		if (!(jc_zcddmx_dj.equals("")))	wheresql+=" and  (jc_zcddmx.dj="+jc_zcddmx_dj+") ";
	}



	String jc_zcddmx_sl=null;
	String jc_zcddmx_je=null;
	String jc_zcddmx_zjhsl=null;
	String jc_zcddmx_zjhje=null;
	jc_zcddmx_sl=request.getParameter("jc_zcddmx_sl");
	if (jc_zcddmx_sl!=null)
	{
		jc_zcddmx_sl=jc_zcddmx_sl.trim();
		if (!(jc_zcddmx_sl.equals("")))	wheresql+=" and  (jc_zcddmx.sl>="+jc_zcddmx_sl+") ";
	}
	jc_zcddmx_sl=request.getParameter("jc_zcddmx_sl2");
	if (jc_zcddmx_sl!=null)
	{
		jc_zcddmx_sl=jc_zcddmx_sl.trim();
		if (!(jc_zcddmx_sl.equals("")))	wheresql+=" and  (jc_zcddmx.sl<="+jc_zcddmx_sl+") ";
	}
	jc_zcddmx_je=request.getParameter("jc_zcddmx_je");
	if (jc_zcddmx_je!=null)
	{
		jc_zcddmx_je=jc_zcddmx_je.trim();
		if (!(jc_zcddmx_je.equals("")))	wheresql+=" and  (jc_zcddmx.je>="+jc_zcddmx_je+") ";
	}
	jc_zcddmx_je=request.getParameter("jc_zcddmx_je2");
	if (jc_zcddmx_je!=null)
	{
		jc_zcddmx_je=jc_zcddmx_je.trim();
		if (!(jc_zcddmx_je.equals("")))	wheresql+=" and  (jc_zcddmx.je<="+jc_zcddmx_je+") ";
	}
	jc_zcddmx_zjhsl=request.getParameter("jc_zcddmx_zjhsl");
	if (jc_zcddmx_zjhsl!=null)
	{
		jc_zcddmx_zjhsl=jc_zcddmx_zjhsl.trim();
		if (!(jc_zcddmx_zjhsl.equals("")))	wheresql+=" and  (jc_zcddmx.zjhsl>="+jc_zcddmx_zjhsl+") ";
	}
	jc_zcddmx_zjhsl=request.getParameter("jc_zcddmx_zjhsl2");
	if (jc_zcddmx_zjhsl!=null)
	{
		jc_zcddmx_zjhsl=jc_zcddmx_zjhsl.trim();
		if (!(jc_zcddmx_zjhsl.equals("")))	wheresql+=" and  (jc_zcddmx.zjhsl<="+jc_zcddmx_zjhsl+") ";
	}
	jc_zcddmx_zjhje=request.getParameter("jc_zcddmx_zjhje");
	if (jc_zcddmx_zjhje!=null)
	{
		jc_zcddmx_zjhje=jc_zcddmx_zjhje.trim();
		if (!(jc_zcddmx_zjhje.equals("")))	wheresql+=" and  (jc_zcddmx.zjhje>="+jc_zcddmx_zjhje+") ";
	}
	jc_zcddmx_zjhje=request.getParameter("jc_zcddmx_zjhje2");
	if (jc_zcddmx_zjhje!=null)
	{
		jc_zcddmx_zjhje=jc_zcddmx_zjhje.trim();
		if (!(jc_zcddmx_zjhje.equals("")))	wheresql+=" and  (jc_zcddmx.zjhje<="+jc_zcddmx_zjhje+") ";
	}


	String jc_zcddmx_cxhdbz=null;
	String jc_zcddmx_cxhdbl=null;
	String jc_zcddmx_cxhdje=null;
	String jc_zcddmx_lx=null;
	String jc_zcddmx_lrr=null;
	String jc_zcddmx_lrsj=null;
	String jc_zcddmx_sxbz=null;



	jc_zcddmx_cxhdbz=request.getParameter("jc_zcddmx_cxhdbz");
	if (jc_zcddmx_cxhdbz!=null)
	{
		jc_zcddmx_cxhdbz=cf.GB2Uni(jc_zcddmx_cxhdbz);
		if (!(jc_zcddmx_cxhdbz.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbz='"+jc_zcddmx_cxhdbz+"')";
	}
	jc_zcddmx_cxhdbl=request.getParameter("jc_zcddmx_cxhdbl");
	if (jc_zcddmx_cxhdbl!=null)
	{
		jc_zcddmx_cxhdbl=jc_zcddmx_cxhdbl.trim();
		if (!(jc_zcddmx_cxhdbl.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbl>="+jc_zcddmx_cxhdbl+") ";
	}
	jc_zcddmx_cxhdbl=request.getParameter("jc_zcddmx_cxhdbl2");
	if (jc_zcddmx_cxhdbl!=null)
	{
		jc_zcddmx_cxhdbl=jc_zcddmx_cxhdbl.trim();
		if (!(jc_zcddmx_cxhdbl.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbl<="+jc_zcddmx_cxhdbl+") ";
	}
	jc_zcddmx_cxhdje=request.getParameter("jc_zcddmx_cxhdje");
	if (jc_zcddmx_cxhdje!=null)
	{
		jc_zcddmx_cxhdje=jc_zcddmx_cxhdje.trim();
		if (!(jc_zcddmx_cxhdje.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdje>="+jc_zcddmx_cxhdje+") ";
	}
	jc_zcddmx_cxhdje=request.getParameter("jc_zcddmx_cxhdje2");
	if (jc_zcddmx_cxhdje!=null)
	{
		jc_zcddmx_cxhdje=jc_zcddmx_cxhdje.trim();
		if (!(jc_zcddmx_cxhdje.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdje<="+jc_zcddmx_cxhdje+") ";
	}
	jc_zcddmx_lx=request.getParameter("jc_zcddmx_lx");
	if (jc_zcddmx_lx!=null)
	{
		jc_zcddmx_lx=cf.GB2Uni(jc_zcddmx_lx);
		if (!(jc_zcddmx_lx.equals("")))	wheresql+=" and  (jc_zcddmx.lx='"+jc_zcddmx_lx+"')";
	}
	jc_zcddmx_lrr=request.getParameter("jc_zcddmx_lrr");
	if (jc_zcddmx_lrr!=null)
	{
		jc_zcddmx_lrr=cf.GB2Uni(jc_zcddmx_lrr);
		if (!(jc_zcddmx_lrr.equals("")))	wheresql+=" and  (jc_zcddmx.lrr='"+jc_zcddmx_lrr+"')";
	}
	jc_zcddmx_lrsj=request.getParameter("jc_zcddmx_lrsj");
	if (jc_zcddmx_lrsj!=null)
	{
		jc_zcddmx_lrsj=jc_zcddmx_lrsj.trim();
		if (!(jc_zcddmx_lrsj.equals("")))	wheresql+="  and (jc_zcddmx.lrsj>=TO_DATE('"+jc_zcddmx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_lrsj=request.getParameter("jc_zcddmx_lrsj2");
	if (jc_zcddmx_lrsj!=null)
	{
		jc_zcddmx_lrsj=jc_zcddmx_lrsj.trim();
		if (!(jc_zcddmx_lrsj.equals("")))	wheresql+="  and (jc_zcddmx.lrsj<=TO_DATE('"+jc_zcddmx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_sxbz=request.getParameter("jc_zcddmx_sxbz");
	if (jc_zcddmx_sxbz!=null)
	{
		jc_zcddmx_sxbz=cf.GB2Uni(jc_zcddmx_sxbz);
		if (!(jc_zcddmx_sxbz.equals("")))	wheresql+=" and  (jc_zcddmx.sxbz='"+jc_zcddmx_sxbz+"')";
	}

	String sxhtyy=null;
	sxhtyy=request.getParameter("sxhtyy");
	if (sxhtyy!=null)
	{
		sxhtyy=cf.GB2Uni(sxhtyy);
		if (!(sxhtyy.equals("")))	wheresql+=" and  (jc_zcddmx.sxhtyy='"+sxhtyy+"')";
	}
	String sxhtyy2=null;
	sxhtyy2=request.getParameter("sxhtyy2");
	if (sxhtyy2!=null)
	{
		sxhtyy2=cf.GB2Uni(sxhtyy2);
		if (!(sxhtyy2.equals("")))	wheresql+=" and  (jc_zcddmx.sxhtyy='"+sxhtyy2+"')";
	}
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

int khs=0;
int dds=0;
double htsl=0;
double htje=0;
double htycf=0;
double htqtfyje=0;
double htzj=0;
double htzjzh=0;
double htcb=0;
double cxhdje=0;

double zjhsl=0;
double zjhje=0;
double zjhzjhycf=0;
double zjhzjhqtfy=0;
double zjhzj=0;
double zjhzjzh=0;
double zjhcb=0;
double zjhcxhdje=0;

double mll=0;

try {
	conn=cf.getConnection();

	ls_sql=" select count(distinct jc_zcdd.khbh),count(distinct jc_zcddmx.ddbh)";
	ls_sql+=" ,sum(jc_zcddmx.sl),sum(jc_zcddmx.je),sum(jc_zcddmx.ycf),sum(jc_zcddmx.qtfyje)";
	ls_sql+=" ,sum(NVL(jc_zcddmx.je,0)+NVL(jc_zcddmx.ycf,0)+NVL(jc_zcddmx.qtfyje,0))";
	ls_sql+=" ,sum(NVL(jc_zcddmx.je,0)+NVL(jc_zcddmx.ycf,0)+NVL(jc_zcddmx.qtfyje,0)*jc_zcdd.zczkl/10)";
	ls_sql+=" ,sum(ROUND(jc_zcddmx.cbj*jc_zcddmx.sl,2)),sum(jc_zcddmx.cxhdje)";

	ls_sql+=" ,sum(jc_zcddmx.zjhsl),sum(jc_zcddmx.zjhje),sum(jc_zcddmx.zjhycf),sum(jc_zcddmx.zjhqtfy)";
	ls_sql+=" ,sum(NVL(jc_zcddmx.zjhje,2)+NVL(jc_zcddmx.zjhycf,2)+NVL(jc_zcddmx.zjhqtfy,2))";
	ls_sql+=" ,sum(NVL(jc_zcddmx.zjhje,2)+NVL(jc_zcddmx.zjhycf,2)+NVL(jc_zcddmx.zjhqtfy,2)*jc_zcdd.zczkl/10)";

	ls_sql+=" ,sum(ROUND(jc_zcddmx.cbj*jc_zcddmx.zjhsl,2)),sum(jc_zcddmx.zjhcxhdje) ";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zcddmx,sq_dwxx  ";
    ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khs=rs.getInt(1);
		dds=rs.getInt(2);
		htsl=rs.getDouble(3);
		htje=rs.getDouble(4);
		htycf=rs.getDouble(5);
		htqtfyje=rs.getDouble(6);
		htzj=rs.getDouble(7);
		htzjzh=rs.getDouble(8);
		htcb=rs.getDouble(9);
		cxhdje=rs.getDouble(10);

		zjhsl=rs.getDouble(11);
		zjhje=rs.getDouble(12);
		zjhzjhycf=rs.getDouble(13);
		zjhzjhqtfy=rs.getDouble(14);
		zjhzj=rs.getDouble(15);
		zjhzjzh=rs.getDouble(16);
		zjhcb=rs.getDouble(17);
		zjhcxhdje=rs.getDouble(18);
	}
	rs.close();
	ps.close();

	if (zjhcb!=0)
	{
		mll=(zjhzjzh-zjhcb)*100/zjhcb;
	}
	else{
		mll=0;
	}

	mll=cf.round(mll,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



<%
	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj4=cf.GB2Uni(request.getParameter("tj4"));
	String tj5=cf.GB2Uni(request.getParameter("tj5"));
	String tj6=cf.GB2Uni(request.getParameter("tj6"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));
	String tj4name=cf.GB2Uni(request.getParameter("tj4name"));
	String tj5name=cf.GB2Uni(request.getParameter("tj5name"));
	String tj6name=cf.GB2Uni(request.getParameter("tj6name"));

	String groupsql="";
	String selectgroupsql="";
	int groupsl=0;
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			groupsql+=","+tj1;
			selectgroupsql+=","+tj1;
			groupsl++;
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			groupsql+=","+tj2;
			selectgroupsql+=","+tj2;
			groupsl++;
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			groupsql+=","+tj3;
			selectgroupsql+=","+tj3;
			groupsl++;
		}
	}
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			groupsql+=","+tj4;
			selectgroupsql+=","+tj4;
			groupsl++;
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			groupsql+=","+tj5;
			selectgroupsql+=","+tj5;
			groupsl++;
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			groupsql+=","+tj6;
			selectgroupsql+=","+tj6;
			groupsl++;
		}
	}
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=" group by "+groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct jc_zcdd.khbh),count(distinct jc_zcddmx.ddbh),sum(jc_zcddmx.sl),sum(jc_zcddmx.je),sum(jc_zcddmx.ycf),sum(jc_zcddmx.qtfyje),sum(NVL(jc_zcddmx.je,0)+NVL(jc_zcddmx.ycf,0)+NVL(jc_zcddmx.qtfyje,0)),sum(NVL(jc_zcddmx.je,0)+NVL(jc_zcddmx.ycf,0)+NVL(jc_zcddmx.qtfyje,0)*jc_zcdd.zczkl/10),sum(ROUND(jc_zcddmx.cbj*jc_zcddmx.sl,2)),sum(jc_zcddmx.cxhdje),sum(jc_zcddmx.zjhsl),sum(jc_zcddmx.zjhje),sum(jc_zcddmx.zjhycf),sum(jc_zcddmx.zjhqtfy),sum(NVL(jc_zcddmx.zjhje,2)+NVL(jc_zcddmx.zjhycf,2)+NVL(jc_zcddmx.zjhqtfy,2)),sum(NVL(jc_zcddmx.zjhje,2)+NVL(jc_zcddmx.zjhycf,2)+NVL(jc_zcddmx.zjhqtfy,2)*jc_zcdd.zczkl/10),sum(ROUND(jc_zcddmx.zjhsl*jc_zcddmx.cbj,2))    ,DECODE(sum(ROUND(jc_zcddmx.zjhsl*jc_zcddmx.cbj,2)),0,0,ROUND(  sum(NVL(jc_zcddmx.zjhje,2)+NVL(jc_zcddmx.zjhycf,2)+NVL(jc_zcddmx.zjhqtfy,2)*jc_zcdd.zczkl/10)*100/sum(ROUND(jc_zcddmx.zjhsl*jc_zcddmx.cbj,2)) ,2 ) )||'%',sum(jc_zcddmx.zjhcxhdje) ";
	}
%>


<table class="LockHeadTable" ROWHEADNUM=1 COLHEADNUM=3 ROWHEADSTYLE="background:#CC6600; color:white;" COLHEADSTYLE="background:#CCCCCC; color:black;" FOCUSSTYLE="background-image: url(/images/bg.normal.gif);" width="230%" border="1" cellpadding="3" cellspacing="0" align="center" style="FONT-SIZE:12">

<tr bgcolor="#CCCCCC"  align="center"  >
<%

	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"8%\" >"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj3name+"</td>");
	}
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj6name+"</td>");
	}

%>

	<td  width="4%"  >客户数</td>
	<td  width="4%"  >订单数</td>
	<td  width="5%" >合同数量</td>
	<td  width="5%" >合同材料费</td>
	<td  width="5%" >合同远程费</td>
	<td  width="5%" >合同其它费用</td>
	<td  width="5%" >折前合同总额</td>
	<td  width="5%" >折后合同总额</td>
	<td  width="5%" >合同成本额</td>
	<td  width="5%" >合同计入活动金额</td>
	<td  width="5%" >增减后数量</td>
	<td  width="5%" >增减后材料费</td>
	<td  width="5%" >增减后远程费</td>
	<td  width="5%" >增减后其它费用</td>
	<td  width="5%" >折前增减后总额</td>
	<td  width="5%" >折后增减后总额</td>
	<td  width="5%" >增减后成本额</td>
	<td  width="5%" >毛利率</td>
	<td  width="5%" >增减后计入活动金额</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zcddmx,sq_dwxx,bdm_bjjbbm  ";
    ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJeJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj1,"1");//列参数对象加入Hash表
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj2,"1");//列参数对象加入Hash表
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj3,"1");//列参数对象加入Hash表
		}
	}
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj4,"1");//列参数对象加入Hash表
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj5,"1");//列参数对象加入Hash表
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj6,"1");//列参数对象加入Hash表
		}
	}
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

<tr bgcolor="#FFFFFF" align='center' >
  <td colspan="<%=groupsl%>">小 计</td>
  <td ><%=khs%></td>
  <td ><%=dds%></td>
  <td ><%=htsl%></td>
  <td ><%=htje%></td>
  <td ><%=htycf%></td>
  <td ><%=htqtfyje%></td>
  <td ><%=htzj%></td>
  <td ><%=htzjzh%></td>
  <td ><%=htcb%></td>
  <td ><%=cxhdje%></td>

  <td ><%=zjhsl%></td>
  <td ><%=zjhje%></td>
  <td ><%=zjhzjhycf%></td>
  <td ><%=zjhzjhqtfy%></td>
  <td ><%=zjhzj%></td>
  <td ><%=zjhzjzh%></td>
  <td ><%=zjhcb%></td>
  <td ><%=mll%>%</td>
  <td ><%=zjhcxhdje%></td>
</tr>
</table>


</body>
</html>




