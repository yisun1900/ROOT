<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">主材统计表</font></B>
</CENTER>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String yhdlm=(String)session.getAttribute("yhdlm");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String jc_zcdd_ddbh=null;
	String jc_zcdd_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String jc_zcdd_jkxz=null;
	String jc_zcdd_jkdd=null;
	String jc_zcdd_ddshbz=null;
	String jc_zcdd_kjxsj=null;
	String jc_zcdd_xclbz=null;
	String jc_zcdd_htshsj=null;
	String jc_zcdd_ycclzt=null;
	String jc_zcdd_zsycyybm=null;
	String jc_zcdd_clzt=null;
	String jc_zcdd_lrr=null;
	String jc_zcdd_lrsj=null;
	String jc_zcdd_dwbh=null;
	String jc_zcdd_qhtsj=null;
	String jc_zcdd_jhclsj=null;
	String zcdlbm=null;


	String zczkl=null;
	zczkl=request.getParameter("zczkl");
	if (zczkl!=null)
	{
		zczkl=cf.GB2Uni(zczkl);
		if (!(zczkl.equals("")))	wheresql+=" and  (jc_zcdd.zczkl>="+zczkl+")";
	}
	zczkl=request.getParameter("zczkl2");
	if (zczkl!=null)
	{
		zczkl=cf.GB2Uni(zczkl);
		if (!(zczkl.equals("")))	wheresql+=" and  (jc_zcdd.zczkl<="+zczkl+")";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	String ddlx=null;
	ddlx=request.getParameter("ddlx");
	if (ddlx!=null)
	{
		if (!(ddlx.equals("")))	wheresql+=" and  (jc_zcdd.ddlx='"+ddlx+"')";
	}

	String zcxlbm=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_zcdd.zcxlbm='"+zcxlbm+"')";
	}


	String wjsj=null;
	wjsj=request.getParameter("wjsj");
	if (wjsj!=null)
	{
		if (!(wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj>=TO_DATE('"+wjsj+"','YYYY/MM/DD'))";
	}
	wjsj=request.getParameter("wjsj2");
	if (wjsj!=null)
	{
		if (!(wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj<=TO_DATE('"+wjsj+"','YYYY/MM/DD'))";
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

	String jc_zcdd_jhshsj=null;
	jc_zcdd_jhshsj=request.getParameter("jc_zcdd_jhshsj");
	if (jc_zcdd_jhshsj!=null)
	{
		if (!(jc_zcdd_jhshsj.equals("")))	wheresql+="  and (jc_zcdd.jhshsj>=TO_DATE('"+jc_zcdd_jhshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_jhshsj=request.getParameter("jc_zcdd_jhshsj2");
	if (jc_zcdd_jhshsj!=null)
	{
		if (!(jc_zcdd_jhshsj.equals("")))	wheresql+="  and (jc_zcdd.jhshsj<=TO_DATE('"+jc_zcdd_jhshsj+"','YYYY/MM/DD'))";
	}
	String jc_zcdd_tzshsj=null;
	jc_zcdd_tzshsj=request.getParameter("jc_zcdd_tzshsj");
	if (jc_zcdd_tzshsj!=null)
	{
		jc_zcdd_tzshsj=jc_zcdd_tzshsj.trim();
		if (!(jc_zcdd_tzshsj.equals("")))	wheresql+="  and (jc_zcdd.tzshsj>=TO_DATE('"+jc_zcdd_tzshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_tzshsj=request.getParameter("jc_zcdd_tzshsj2");
	if (jc_zcdd_tzshsj!=null)
	{
		jc_zcdd_tzshsj=jc_zcdd_tzshsj.trim();
		if (!(jc_zcdd_tzshsj.equals("")))	wheresql+="  and (jc_zcdd.tzshsj<=TO_DATE('"+jc_zcdd_tzshsj+"','YYYY/MM/DD'))";
	}
	String jc_zcdd_sshsj=null;
	jc_zcdd_sshsj=request.getParameter("jc_zcdd_sshsj");
	if (jc_zcdd_sshsj!=null)
	{
		jc_zcdd_sshsj=jc_zcdd_sshsj.trim();
		if (!(jc_zcdd_sshsj.equals("")))	wheresql+="  and (jc_zcdd.sshsj>=TO_DATE('"+jc_zcdd_sshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_sshsj=request.getParameter("jc_zcdd_sshsj2");
	if (jc_zcdd_sshsj!=null)
	{
		jc_zcdd_sshsj=jc_zcdd_sshsj.trim();
		if (!(jc_zcdd_sshsj.equals("")))	wheresql+="  and (jc_zcdd.sshsj<=TO_DATE('"+jc_zcdd_sshsj+"','YYYY/MM/DD'))";
	}



	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_zcdd.zcdlbm='"+zcdlbm+"')";
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



	jc_zcdd_ddbh=request.getParameter("jc_zcdd_ddbh");
	if (jc_zcdd_ddbh!=null)
	{
		jc_zcdd_ddbh=cf.GB2Uni(jc_zcdd_ddbh);
		if (!(jc_zcdd_ddbh.equals("")))	wheresql+=" and  (jc_zcdd.ddbh='"+jc_zcdd_ddbh+"')";
	}
	jc_zcdd_khbh=request.getParameter("jc_zcdd_khbh");
	if (jc_zcdd_khbh!=null)
	{
		jc_zcdd_khbh=cf.GB2Uni(jc_zcdd_khbh);
		if (!(jc_zcdd_khbh.equals("")))	wheresql+=" and  (jc_zcdd.khbh='"+jc_zcdd_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}

	String crm_khxx_lxfs=null;
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
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

	jc_zcdd_jkxz=request.getParameter("jc_zcdd_jkxz");
	if (jc_zcdd_jkxz!=null)
	{
		jc_zcdd_jkxz=cf.GB2Uni(jc_zcdd_jkxz);
		if (!(jc_zcdd_jkxz.equals("")))	wheresql+=" and  (jc_zcdd.jkxz='"+jc_zcdd_jkxz+"')";
	}
	jc_zcdd_jkdd=request.getParameter("jc_zcdd_jkdd");
	if (jc_zcdd_jkdd!=null)
	{
		jc_zcdd_jkdd=cf.GB2Uni(jc_zcdd_jkdd);
		if (!(jc_zcdd_jkdd.equals("")))	wheresql+=" and  (jc_zcdd.jkdd='"+jc_zcdd_jkdd+"')";
	}
	jc_zcdd_ddshbz=request.getParameter("jc_zcdd_ddshbz");
	if (jc_zcdd_ddshbz!=null)
	{
		jc_zcdd_ddshbz=cf.GB2Uni(jc_zcdd_ddshbz);
		if (!(jc_zcdd_ddshbz.equals("")))	wheresql+=" and  (jc_zcdd.ddshbz='"+jc_zcdd_ddshbz+"')";
	}
	jc_zcdd_kjxsj=request.getParameter("jc_zcdd_kjxsj");
	if (jc_zcdd_kjxsj!=null)
	{
		jc_zcdd_kjxsj=jc_zcdd_kjxsj.trim();
		if (!(jc_zcdd_kjxsj.equals("")))	wheresql+="  and (jc_zcdd.kjxsj>=TO_DATE('"+jc_zcdd_kjxsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_kjxsj=request.getParameter("jc_zcdd_kjxsj2");
	if (jc_zcdd_kjxsj!=null)
	{
		jc_zcdd_kjxsj=jc_zcdd_kjxsj.trim();
		if (!(jc_zcdd_kjxsj.equals("")))	wheresql+="  and (jc_zcdd.kjxsj<=TO_DATE('"+jc_zcdd_kjxsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_xclbz=request.getParameter("jc_zcdd_xclbz");
	if (jc_zcdd_xclbz!=null)
	{
		jc_zcdd_xclbz=cf.GB2Uni(jc_zcdd_xclbz);
		if (!(jc_zcdd_xclbz.equals("")))	wheresql+=" and  (jc_zcdd.xclbz='"+jc_zcdd_xclbz+"')";
	}
	jc_zcdd_htshsj=request.getParameter("jc_zcdd_htshsj");
	if (jc_zcdd_htshsj!=null)
	{
		jc_zcdd_htshsj=jc_zcdd_htshsj.trim();
		if (!(jc_zcdd_htshsj.equals("")))	wheresql+="  and (jc_zcdd.htshsj>=TO_DATE('"+jc_zcdd_htshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_htshsj=request.getParameter("jc_zcdd_htshsj2");
	if (jc_zcdd_htshsj!=null)
	{
		jc_zcdd_htshsj=jc_zcdd_htshsj.trim();
		if (!(jc_zcdd_htshsj.equals("")))	wheresql+="  and (jc_zcdd.htshsj<=TO_DATE('"+jc_zcdd_htshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_ycclzt=request.getParameter("jc_zcdd_ycclzt");
	if (jc_zcdd_ycclzt!=null)
	{
		jc_zcdd_ycclzt=cf.GB2Uni(jc_zcdd_ycclzt);
		if (!(jc_zcdd_ycclzt.equals("")))	wheresql+=" and  (jc_zcdd.ycclzt='"+jc_zcdd_ycclzt+"')";
	}
	jc_zcdd_zsycyybm=request.getParameter("jc_zcdd_zsycyybm");
	if (jc_zcdd_zsycyybm!=null)
	{
		jc_zcdd_zsycyybm=cf.GB2Uni(jc_zcdd_zsycyybm);
		if (!(jc_zcdd_zsycyybm.equals("")))	wheresql+=" and  (jc_zcdd.zsycyybm='"+jc_zcdd_zsycyybm+"')";
	}
	jc_zcdd_clzt=request.getParameter("jc_zcdd_clzt");
	if (jc_zcdd_clzt!=null)
	{
		jc_zcdd_clzt=cf.GB2Uni(jc_zcdd_clzt);
		if (!(jc_zcdd_clzt.equals("")))	wheresql+=" and  (jc_zcdd.clzt='"+jc_zcdd_clzt+"')";
	}
	jc_zcdd_lrr=request.getParameter("jc_zcdd_lrr");
	if (jc_zcdd_lrr!=null)
	{
		jc_zcdd_lrr=cf.GB2Uni(jc_zcdd_lrr);
		if (!(jc_zcdd_lrr.equals("")))	wheresql+=" and  (jc_zcdd.lrr='"+jc_zcdd_lrr+"')";
	}
	jc_zcdd_lrsj=request.getParameter("jc_zcdd_lrsj");
	if (jc_zcdd_lrsj!=null)
	{
		jc_zcdd_lrsj=jc_zcdd_lrsj.trim();
		if (!(jc_zcdd_lrsj.equals("")))	wheresql+="  and (jc_zcdd.lrsj>=TO_DATE('"+jc_zcdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_lrsj=request.getParameter("jc_zcdd_lrsj2");
	if (jc_zcdd_lrsj!=null)
	{
		jc_zcdd_lrsj=jc_zcdd_lrsj.trim();
		if (!(jc_zcdd_lrsj.equals("")))	wheresql+="  and (jc_zcdd.lrsj<=TO_DATE('"+jc_zcdd_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jc_zcdd_dwbh=request.getParameter("jc_zcdd_dwbh");
	if (jc_zcdd_dwbh!=null)
	{
		jc_zcdd_dwbh=cf.GB2Uni(jc_zcdd_dwbh);
		if (!(jc_zcdd_dwbh.equals("")))	wheresql+=" and  (jc_zcdd.dwbh='"+jc_zcdd_dwbh+"')";
	}

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
	jc_zcdd_jhclsj=request.getParameter("jc_zcdd_jhclsj");
	if (jc_zcdd_jhclsj!=null)
	{
		jc_zcdd_jhclsj=jc_zcdd_jhclsj.trim();
		if (!(jc_zcdd_jhclsj.equals("")))	wheresql+="  and (jc_zcdd.jhclsj>=TO_DATE('"+jc_zcdd_jhclsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_jhclsj=request.getParameter("jc_zcdd_jhclsj2");
	if (jc_zcdd_jhclsj!=null)
	{
		jc_zcdd_jhclsj=jc_zcdd_jhclsj.trim();
		if (!(jc_zcdd_jhclsj.equals("")))	wheresql+="  and (jc_zcdd.jhclsj<=TO_DATE('"+jc_zcdd_jhclsj+"','YYYY/MM/DD'))";
	}



	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));

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
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=" group by "+groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct jc_zcdd.khbh),count(distinct jc_zcdd.ddbh),sum(jc_zcdd.wdzje),sum(jc_zcdd.hkze),sum(jc_zcdd.zqzjhze),sum(jc_zcdd.zjhze),sum(jc_zcdd.htcxhdje),sum(jc_zcdd.zjxcxhdje),sum(jc_zcdd.wdzje+jc_zcdd.zqzjhze),sum(jc_zcdd.hkze+jc_zcdd.zjhze),sum(jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje)";
	}
%>

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj3name+"</td>");
	}

%>
	<td  width="5%">客户数</td>
	<td  width="5%">订单数</td>
	<td  width="7%">折前合同额</td>
	<td  width="7%">折后合同额</td>
	<td  width="7%">折前增减项金额</td>
	<td  width="7%">折后增减项金额</td>
	<td  width="7%">合同计入促销活动金额</td>
	<td  width="7%">增减项计入促销活动金额</td>
	<td  width="7%">折前总额</td>
	<td  width="7%">折后总额</td>
	<td  width="7%">计入活动总额</td>
</tr>
<%
	ls_sql=selectgroupsql;
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c,jdm_zcddzt ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";

	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

//	pageObj.alignStr[groupsl+3]="align='left'";


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
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>	
	
