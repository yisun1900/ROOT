<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="oc" scope="page" class="ceostar.common.OutCpdl"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String xsrq=null;
String xsrq2=null;

	String wheresql=" WHERE (1=1) ";
	String bkbh=null;
	String zqh=null;
	String cplb=null;
	String hplx=null;
	String pmbm=null;
	String jldm=null;
	String zzl=null;
	String jlzl=null;
	String zszl=null;
	String pszl=null;
	String zsh=null;
	String szdw=null;
	String lsj=null;
	String bqj=null;
	String wlzt=null;
	String ls="";
	String bkflbm=null;
	String plbm=null;
	String gckh=null;
	String rkrq=null;
	String yrkrq=null;
	String sxj=null;
	String rkph=null;

	xsrq=request.getParameter("xsrq");
	if (xsrq!=null)
	{
		xsrq=xsrq.trim();
		if (!(xsrq.equals("")))	wheresql+="  and xsrq>=TO_DATE('"+xsrq+"','YYYY-MM-DD')";
	}
	xsrq2=request.getParameter("xsrq2");
	if (xsrq2!=null)
	{
		xsrq2=xsrq2.trim();
		if (!(xsrq2.equals("")))	wheresql+="  and xsrq<=TO_DATE('"+xsrq2+"','YYYY-MM-DD')";
	}
	sxj=request.getParameter("sxj");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj>="+sxj+") ";
	}
	sxj=request.getParameter("sxj2");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj<="+sxj+") ";
	}

	yrkrq=request.getParameter("yrkrq");
	if (yrkrq!=null)
	{
		if (!(yrkrq.equals("")))	wheresql+="  and cp_cpxx.yrkrq>=TO_DATE('"+yrkrq+"','YYYY-MM-DD')";
	}
	yrkrq=request.getParameter("yrkrq2");
	if (yrkrq!=null)
	{
		if (!(yrkrq.equals("")))	wheresql+="  and cp_cpxx.yrkrq<=TO_DATE('"+yrkrq+"','YYYY-MM-DD')";
	}
	rkrq=request.getParameter("rkrq");
	if (rkrq!=null)
	{
		if (!(rkrq.equals("")))	wheresql+="  and cp_cpxx.rkrq>=TO_DATE('"+rkrq+"','YYYY-MM-DD')";
	}
	rkrq=request.getParameter("rkrq2");
	if (rkrq!=null)
	{
		if (!(rkrq.equals("")))	wheresql+="  and cp_cpxx.rkrq<=TO_DATE('"+rkrq+"','YYYY-MM-DD')";
	}

	rkph=request.getParameter("rkph");
	if (rkph!=null)
	{
		if (!(rkph.equals("")))	wheresql+="  and (cp_cpxx.rkph='"+rkph+"' )";
	}
	gckh=request.getParameter("gckh");
	if (gckh!=null)
	{
		if (!(gckh.equals("")))	wheresql+="  and (cp_cpxx.gckh='"+gckh+"' )";
	}
	bkflbm=request.getParameter("bkflbm");
	if (bkflbm!=null)
	{
		if (!(bkflbm.equals("")))	wheresql+="  and (v_bk.bkflbm='"+bkflbm+"')";
	}
	plbm=request.getParameter("plbm");
	if (plbm!=null)
	{
		if (!(plbm.equals("")))	wheresql+="  and (cp_cpxx.plbm='"+plbm+"')";
	}

	wlzt=request.getParameter("wlzt");
	if (wlzt!=null)
	{
		wlzt=cf.GB2Uni(wlzt);
		if (!(wlzt.equals("")))	wheresql+="  and (cp_cpxx.wlzt='"+wlzt+"')";
	}
	bkbh=request.getParameter("bkbh");
	if (bkbh!=null)
	{
		bkbh=cf.GB2Uni(bkbh);
		if (!(bkbh.equals("")))	wheresql+="  and (cp_cpxx.bkbh='"+bkbh+"')";
	}
	zqh=request.getParameter("zqh");
	if (zqh!=null)
	{
		zqh=cf.GB2Uni(zqh);
		if (!(zqh.equals("")))	wheresql+=" and  (zqh>='"+zqh+"')";
	}
	zqh=request.getParameter("zqh2");
	if (zqh!=null)
	{
		zqh=cf.GB2Uni(zqh);
		if (!(zqh.equals("")))	wheresql+=" and  (zqh<='"+zqh+"')";
	}
	cplb=request.getParameter("cplb");
	if (cplb!=null)
	{
		cplb=cf.GB2Uni(cplb);
		if (!(cplb.equals("")))	wheresql+="  and (cp_cpxx.cplb='"+cplb+"')";
	}
	hplx=request.getParameter("hplx");
	if (hplx!=null)
	{
		hplx=cf.GB2Uni(hplx);
		if (!(hplx.equals("")))	wheresql+="  and (cp_cpxx.hplx='"+hplx+"')";
	}
	pmbm=request.getParameter("pmbm");
	if (pmbm!=null)
	{
		pmbm=cf.GB2Uni(pmbm);
		if (!(pmbm.equals("")))	wheresql+="  and (cp_cpxx.pmbm='"+pmbm+"')";
	}
	jldm=request.getParameter("jldm");
	if (jldm!=null)
	{
		jldm=cf.GB2Uni(jldm);
		if (!(jldm.equals("")))	wheresql+="  and (cp_cpxx.jldm='"+jldm+"')";
	}
	zzl=request.getParameter("zzl");
	if (zzl!=null)
	{
		zzl=zzl.trim();
		if (!(zzl.equals("")))	wheresql+=" and  (zzl>="+zzl+") ";
	}
	zzl=request.getParameter("zzl2");
	if (zzl!=null)
	{
		zzl=zzl.trim();
		if (!(zzl.equals("")))	wheresql+=" and  (zzl<="+zzl+") ";
	}
	jlzl=request.getParameter("jlzl");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (jlzl>="+jlzl+") ";
	}
	jlzl=request.getParameter("jlzl2");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (jlzl<="+jlzl+") ";
	}
	zszl=request.getParameter("zszl");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (zszl>="+zszl+") ";
	}
	zszl=request.getParameter("zszl2");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (zszl<="+zszl+") ";
	}
	pszl=request.getParameter("pszl");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (pszl>="+pszl+") ";
	}
	pszl=request.getParameter("pszl2");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (pszl<="+pszl+") ";
	}
	zsh=request.getParameter("zsh");
	if (zsh!=null)
	{
		zsh=cf.GB2Uni(zsh);
		if (!(zsh.equals("")))	wheresql+="  and (zsh='"+zsh+"')";
	}
	szdw=request.getParameter("szdw");
	if (szdw!=null)
	{
		szdw=cf.GB2Uni(szdw);
		if (!(szdw.equals("")))	wheresql+="  and (cp_cpxx.szdw='"+szdw+"')";
	}
	lsj=request.getParameter("lsj");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (lsj>="+lsj+") ";
	}
	lsj=request.getParameter("lsj2");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (lsj<="+lsj+") ";
	}
	bqj=request.getParameter("bqj");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (bqj>="+bqj+") ";
	}
	bqj=request.getParameter("bqj2");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (bqj<="+bqj+") ";
	}

%>

<html>
<head>
<title>打印统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 12px'>
<%
if (yhjs.equals("00"))//00：总公司
{
	oc.printZdXsTable(wheresql,szdw,xsrq,xsrq2,"1","1",out);
}
else{
	oc.printZdXsTable(wheresql,szdw,xsrq,xsrq2,"1","0",out);
}

%>
</body>
</html>
