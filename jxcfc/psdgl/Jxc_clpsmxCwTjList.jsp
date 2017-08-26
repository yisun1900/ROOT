<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

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

	String zzsgd=null;
	String crm_khxx_sgd=null;
	zzsgd=request.getParameter("zzsgd");
	if (zzsgd!=null)
	{
		if (!(zzsgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+zzsgd+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
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
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}


	String yxcld=request.getParameter("yxcld");
	if (yxcld!=null)
	{
		if (yxcld.equals("1"))
		{
			wheresql+=" and  (jxc_clpsd.psdzt in('2','3','5'))";
		}
		else if (yxcld.equals("2"))
		{
			wheresql+=" and  (jxc_clpsd.psdzt in('0','1','6','7'))";
		}
		else if (yxcld.equals("3"))
		{
			wheresql+=" and  (jxc_clpsd.psdzt in('2','5'))";
		}
		else if (yxcld.equals("4"))
		{
			wheresql+=" and  (jxc_clpsd.psdzt in('3','5'))";
		}
	}

	String jxc_clpsd_psph=null;
	String jxc_clpsd_lrrq=null;
	String jxc_clpsd_psdzt=null;
	String jxc_clpsd_dysj=null;
	String shsj=null;
	String jxc_clpsd_lrr=null;
	String jxc_clpsd_shjl=null;
	String jxc_clpsd_jhshsj=null;
	String jxc_clpsd_dybz=null;

	jxc_clpsd_psph=request.getParameter("jxc_clpsd_psph");
	if (jxc_clpsd_psph!=null)
	{
		jxc_clpsd_psph=cf.GB2Uni(jxc_clpsd_psph);
		if (!(jxc_clpsd_psph.equals("")))	wheresql+=" and  (jxc_clpsmx.psph='"+jxc_clpsd_psph+"')";
	}

	jxc_clpsd_lrrq=request.getParameter("jxc_clpsd_lrrq");
	if (jxc_clpsd_lrrq!=null)
	{
		jxc_clpsd_lrrq=jxc_clpsd_lrrq.trim();
		if (!(jxc_clpsd_lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq>=TO_DATE('"+jxc_clpsd_lrrq+"','YYYY/MM/DD'))";
	}
	jxc_clpsd_lrrq=request.getParameter("jxc_clpsd_lrrq2");
	if (jxc_clpsd_lrrq!=null)
	{
		jxc_clpsd_lrrq=jxc_clpsd_lrrq.trim();
		if (!(jxc_clpsd_lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq<=TO_DATE('"+jxc_clpsd_lrrq+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_clpsd_psdzt=request.getParameter("jxc_clpsd_psdzt");
	if (jxc_clpsd_psdzt!=null)
	{
		jxc_clpsd_psdzt=cf.GB2Uni(jxc_clpsd_psdzt);
		if (!(jxc_clpsd_psdzt.equals("")))	wheresql+=" and  (jxc_clpsd.psdzt='"+jxc_clpsd_psdzt+"')";
	}
	jxc_clpsd_dysj=request.getParameter("jxc_clpsd_dysj");
	if (jxc_clpsd_dysj!=null)
	{
		jxc_clpsd_dysj=jxc_clpsd_dysj.trim();
		if (!(jxc_clpsd_dysj.equals("")))	wheresql+="  and (jxc_clpsd.dysj>=TO_DATE('"+jxc_clpsd_dysj+"','YYYY/MM/DD'))";
	}
	jxc_clpsd_dysj=request.getParameter("jxc_clpsd_dysj2");
	if (jxc_clpsd_dysj!=null)
	{
		jxc_clpsd_dysj=jxc_clpsd_dysj.trim();
		if (!(jxc_clpsd_dysj.equals("")))	wheresql+="  and (jxc_clpsd.dysj<=TO_DATE('"+jxc_clpsd_dysj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (jxc_clpsd.shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (jxc_clpsd.shsj<=TO_DATE('"+shsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_clpsd_lrr=request.getParameter("jxc_clpsd_lrr");
	if (jxc_clpsd_lrr!=null)
	{
		jxc_clpsd_lrr=cf.GB2Uni(jxc_clpsd_lrr);
		if (!(jxc_clpsd_lrr.equals("")))	wheresql+=" and  (jxc_clpsd.lrr='"+jxc_clpsd_lrr+"')";
	}
	jxc_clpsd_shjl=request.getParameter("jxc_clpsd_shjl");
	if (jxc_clpsd_shjl!=null)
	{
		jxc_clpsd_shjl=cf.GB2Uni(jxc_clpsd_shjl);
		if (!(jxc_clpsd_shjl.equals("")))	wheresql+=" and  (jxc_clpsd.shjl='"+jxc_clpsd_shjl+"')";
	}
	jxc_clpsd_jhshsj=request.getParameter("jxc_clpsd_jhshsj");
	if (jxc_clpsd_jhshsj!=null)
	{
		jxc_clpsd_jhshsj=jxc_clpsd_jhshsj.trim();
		if (!(jxc_clpsd_jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj>=TO_DATE('"+jxc_clpsd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_clpsd_jhshsj=request.getParameter("jxc_clpsd_jhshsj2");
	if (jxc_clpsd_jhshsj!=null)
	{
		jxc_clpsd_jhshsj=jxc_clpsd_jhshsj.trim();
		if (!(jxc_clpsd_jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj<=TO_DATE('"+jxc_clpsd_jhshsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_clpsd_dybz=request.getParameter("jxc_clpsd_dybz");
	if (jxc_clpsd_dybz!=null)
	{
		jxc_clpsd_dybz=cf.GB2Uni(jxc_clpsd_dybz);
		if (!(jxc_clpsd_dybz.equals("")))	wheresql+=" and  (jxc_clpsd.dybz='"+jxc_clpsd_dybz+"')";
	}


	String cldlbm=null;
	String clxlbm=null;
	String jxc_clpsmx_clbm=null;
	String jxc_clpsmx_clmc=null;
	String jxc_clpsmx_clmc2=null;
	String jxc_clpsmx_xh=null;
	String jxc_clpsmx_gg=null;
	String jxc_clpsmx_nbbm=null;
	String jxc_clpsmx_ppmc=null;
	String jxc_clpsmx_gysmc=null;
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_clpsmx.cldlbm='"+cldlbm+"')";
	}
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clpsmx.clxlbm='"+clxlbm+"')";
	}
	jxc_clpsmx_clbm=request.getParameter("jxc_clpsmx_clbm");
	if (jxc_clpsmx_clbm!=null)
	{
		jxc_clpsmx_clbm=cf.GB2Uni(jxc_clpsmx_clbm);
		if (!(jxc_clpsmx_clbm.equals("")))	wheresql+=" and  (jxc_clpsmx.clbm='"+jxc_clpsmx_clbm+"')";
	}
	jxc_clpsmx_clbm=request.getParameter("jxc_clpsmx_clbm");
	if (jxc_clpsmx_clbm!=null)
	{
		jxc_clpsmx_clbm=cf.GB2Uni(jxc_clpsmx_clbm);
		if (!(jxc_clpsmx_clbm.equals("")))	wheresql+=" and  (jxc_clpsmx.clbm='"+jxc_clpsmx_clbm+"')";
	}
	jxc_clpsmx_clmc=request.getParameter("jxc_clpsmx_clmc");
	if (jxc_clpsmx_clmc!=null)
	{
		jxc_clpsmx_clmc=cf.GB2Uni(jxc_clpsmx_clmc);
		if (!(jxc_clpsmx_clmc.equals("")))	wheresql+=" and  (jxc_clpsmx.clmc='"+jxc_clpsmx_clmc+"')";
	}
	jxc_clpsmx_clmc2=request.getParameter("jxc_clpsmx_clmc2");
	if (jxc_clpsmx_clmc2!=null)
	{
		jxc_clpsmx_clmc2=cf.GB2Uni(jxc_clpsmx_clmc2);
		if (!(jxc_clpsmx_clmc2.equals("")))	wheresql+=" and  (jxc_clpsmx.clmc like '%"+jxc_clpsmx_clmc2+"%')";
	}
	jxc_clpsmx_xh=request.getParameter("jxc_clpsmx_xh");
	if (jxc_clpsmx_xh!=null)
	{
		jxc_clpsmx_xh=cf.GB2Uni(jxc_clpsmx_xh);
		if (!(jxc_clpsmx_xh.equals("")))	wheresql+=" and  (jxc_clpsmx.xh like '%"+jxc_clpsmx_xh+"%')";
	}
	jxc_clpsmx_gg=request.getParameter("jxc_clpsmx_gg");
	if (jxc_clpsmx_gg!=null)
	{
		jxc_clpsmx_gg=cf.GB2Uni(jxc_clpsmx_gg);
		if (!(jxc_clpsmx_gg.equals("")))	wheresql+=" and  (jxc_clpsmx.gg like '%"+jxc_clpsmx_gg+"%')";
	}
	jxc_clpsmx_nbbm=request.getParameter("jxc_clpsmx_nbbm");
	if (jxc_clpsmx_nbbm!=null)
	{
		jxc_clpsmx_nbbm=cf.GB2Uni(jxc_clpsmx_nbbm);
		if (!(jxc_clpsmx_nbbm.equals("")))	wheresql+=" and  (jxc_clpsmx.nbbm='"+jxc_clpsmx_nbbm+"')";
	}
	jxc_clpsmx_ppmc=request.getParameter("jxc_clpsmx_ppmc");
	if (jxc_clpsmx_ppmc!=null)
	{
		jxc_clpsmx_ppmc=cf.GB2Uni(jxc_clpsmx_ppmc);
		if (!(jxc_clpsmx_ppmc.equals("")))	wheresql+=" and  (jxc_clpsmx.ppmc='"+jxc_clpsmx_ppmc+"')";
	}
	jxc_clpsmx_gysmc=request.getParameter("jxc_clpsmx_gysmc");
	if (jxc_clpsmx_gysmc!=null)
	{
		jxc_clpsmx_gysmc=cf.GB2Uni(jxc_clpsmx_gysmc);
		if (!(jxc_clpsmx_gysmc.equals("")))	wheresql+=" and  (jxc_clpsmx.gysmc='"+jxc_clpsmx_gysmc+"')";
	}
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

double sqpssl=0;
double pssl=0;
double cbje=0;
double psje=0;
double cksl=0;
double wcksl=0;

try {
	conn=cf.getConnection();

	ls_sql=" select sum(jxc_clpsmx.sqpssl),sum(jxc_clpsmx.pssl),sum(ROUND(jxc_clpsmx.pssl*jxc_clpsmx.cbj,2)),sum(jxc_clpsmx.psje),sum(jxc_clpsmx.cksl),sum(jxc_clpsmx.pssl)";
	ls_sql+=" FROM jxc_clpsd,jxc_clpsmx,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph(+) and jxc_clpsd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqpssl=rs.getDouble(1);
		pssl=rs.getDouble(2);
		cbje=rs.getDouble(3);
		psje=rs.getDouble(4);
		cksl=rs.getDouble(5);
		wcksl=rs.getDouble(6);
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",sum(jxc_clpsmx.sqpssl),sum(jxc_clpsmx.pssl),sum(ROUND(jxc_clpsmx.pssl*jxc_clpsmx.cbj,2)),sum(jxc_clpsmx.psje),sum(jxc_clpsmx.cksl),sum(jxc_clpsmx.pssl-jxc_clpsmx.cksl)";
	}
%>

<center>材料单明细财务统计</center>
<table class="LockHeadTable" ROWHEADNUM=1 COLHEADNUM=1 ROWHEADSTYLE="background:#CC6600; color:white;" COLHEADSTYLE="background:#CCCCCC; color:black;" FOCUSSTYLE="background-image: url(/images/bg.normal.gif);" width="100%" border="1" cellpadding="3" cellspacing="0" align="center" style="FONT-SIZE:12">

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

	<td  width="5%">开单数量</td>
	<td  width="5%">审核后数量</td>
	<td  width="8%">成本金额</td>
	<td  width="8%">工长金额</td>
	<td  width="5%">出库数量</td>
	<td  width="5%">未出库数量</td>
</tr>
<%

	ls_sql=selectgroupsql;

	ls_sql+=" FROM jxc_clpsd,jxc_clpsmx,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph(+) and jxc_clpsd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);


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
  <td ><%=sqpssl%></td>
  <td ><%=pssl%></td>
  <td ><%=cbje%></td>
  <td ><%=psje%></td>
  <td ><%=cksl%></td>
  <td ><%=wcksl%></td>
</tr>
</table>


</body>
</html>




