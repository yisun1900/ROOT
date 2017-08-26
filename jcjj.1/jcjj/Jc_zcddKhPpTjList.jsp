<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面


	String wheresql="";


	String yjjzsj=null;
	yjjzsj=request.getParameter("yjjzsj");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj>=TO_DATE('"+yjjzsj+"','YYYY/MM/DD'))";
	}
	yjjzsj=request.getParameter("yjjzsj2");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj<=TO_DATE('"+yjjzsj+"','YYYY/MM/DD'))";
	}

	String khjssj=null;
	khjssj=request.getParameter("khjssj");
	if (khjssj!=null)
	{
		khjssj=khjssj.trim();
		if (!(khjssj.equals("")))	wheresql+="  and (crm_khxx.khjssj>=TO_DATE('"+khjssj+"','YYYY/MM/DD'))";
	}
	khjssj=request.getParameter("khjssj2");
	if (khjssj!=null)
	{
		khjssj=khjssj.trim();
		if (!(khjssj.equals("")))	wheresql+="  and (crm_khxx.khjssj<=TO_DATE('"+khjssj+"','YYYY/MM/DD'))";
	}

	String ddqrsj=null;
	ddqrsj=request.getParameter("ddqrsj");
	if (ddqrsj!=null)
	{
		ddqrsj=ddqrsj.trim();
		if (!(ddqrsj.equals("")))	wheresql+="  and (jc_zcdd.ddqrsj>=TO_DATE('"+ddqrsj+"','YYYY/MM/DD'))";
	}
	ddqrsj=request.getParameter("ddqrsj2");
	if (ddqrsj!=null)
	{
		ddqrsj=ddqrsj.trim();
		if (!(ddqrsj.equals("")))	wheresql+="  and (jc_zcdd.ddqrsj<=TO_DATE('"+ddqrsj+"','YYYY/MM/DD'))";
	}


	String qhtsj=null;
	qhtsj=request.getParameter("qhtsj");
	if (qhtsj!=null)
	{
		qhtsj=qhtsj.trim();
		if (!(qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj>=TO_DATE('"+qhtsj+"','YYYY/MM/DD'))";
	}
	qhtsj=request.getParameter("qhtsj2");
	if (qhtsj!=null)
	{
		qhtsj=qhtsj.trim();
		if (!(qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj<=TO_DATE('"+qhtsj+"','YYYY/MM/DD'))";
	}

	String dgkh=null;
	dgkh=request.getParameter("dgkh");
	if (dgkh!=null)
	{
		dgkh=cf.GB2Uni(dgkh);
		if (!(dgkh.equals("")))	wheresql+=" and  (crm_khxx.dgkh='"+dgkh+"')";
	}

	String xshth=null;
	xshth=request.getParameter("xshth");
	if (xshth!=null)
	{
		xshth=cf.GB2Uni(xshth);
		if (!(xshth.equals("")))	wheresql+=" and  (jc_zcdd.xshth='"+xshth+"')";
	}

	String sftjp=null;
	sftjp=request.getParameter("sftjp");
	if (sftjp!=null)
	{
		sftjp=cf.GB2Uni(sftjp);
		if (!(sftjp.equals("")))	wheresql+=" and  (jc_zcdd.sftjp='"+sftjp+"')";
	}

	String ddlx=null;
	ddlx=request.getParameter("ddlx");
	if (ddlx!=null)
	{
		ddlx=cf.GB2Uni(ddlx);
		if (!(ddlx.equals("")))	wheresql+=" and  (jc_zcdd.ddlx='"+ddlx+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}



	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (jc_zcdd.khbh='"+khbh+"')";
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


	String ddbh=null;
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (jc_zcdd.ddbh='"+ddbh+"')";
	}
	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (jc_zcdd.clzt='"+clzt+"')";
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
		if (!(ppbm2.equals("")))	wheresql+=" and  (jc_zcdd.ppbm='"+ppbm2+"')";
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
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zcdd.ppmc='"+ppmc2+"')";
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
		if (!(gys2.equals("")))	wheresql+=" and  (jc_zcdd.gys='"+gys2+"')";
	}

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_zcdd.ztjjgw='"+ztjjgw+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_zcdd.clgw='"+clgw+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_zcdd.xmzy='"+xmzy+"')";
	}

	String jc_zcdd_lrr=null;
	jc_zcdd_lrr=request.getParameter("jc_zcdd_lrr");
	if (jc_zcdd_lrr!=null)
	{
		jc_zcdd_lrr=cf.GB2Uni(jc_zcdd_lrr);
		if (!(jc_zcdd_lrr.equals("")))	wheresql+=" and  (jc_zcdd.lrr='"+jc_zcdd_lrr+"')";
	}
	String jc_zcdd_lrsj=null;
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




%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">品牌集成家居主材统计</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">店面</td>
	<td  width="10%">客户姓名</td>
	<td  width="8%">设计师</td>
	<td  width="7%">材料顾问</td>
	<td  width="7%">客户经理</td>
	<td  width="7%">业务经理</td>
	<td  width="10%">子品牌</td>
	<td  width="10%">合同金额</td>
	<td  width="10%">优惠金额</td>
	<td  width="10%">结算金额</td>
	<td  width="10%">提成记入金额</td>
</tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getppbm=null;
	String getkhbh=null;
	String getkhxm=null;
	String getdwbh=null;
	String getdwmc=null;
	String getsjs=null;
	String getclgw=null;
	String getzjxm=null;
	String getkhjl=null;
	double wdzje=0;
	double hkze=0;
	double cbze=0;
	double tcze=0;


	double allwdzje=0;
	double allhkze=0;
	double allcbze=0;
	double alltcze=0;

	ls_sql="SELECT sq_dwxx.dwmc,jc_zcdd.ppbm,crm_khxx.khxm,crm_khxx.sjs,jc_zcdd.clgw,crm_khxx.zjxm,crm_khxx.khjl,sum(jc_zcdd.wdzje) wdzje,sum(round(jc_zcdd.zcpclf*jc_zcdd.khfdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpkhfdbl/100,2)) hkze,sum(round(jc_zcdd.zcpclf*jc_zcdd.fdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpfdbl/100,2)+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) cbze,sum(round(jc_zcdd.zcpclf*jc_zcdd.tcjrbl/100+jc_zcdd.tjpclf*jc_zcdd.tjptcjrbl/100,2)) tcze";
	ls_sql+=" FROM jc_zcdd,crm_khxx,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";//9：集成家居主材
	ls_sql+=" and jc_zcdd.ddlx in('9','E')";//9：集成家居主材
    ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.khxm,sq_dwxx.dwmc,jc_zcdd.ppbm,crm_khxx.sjs,jc_zcdd.clgw,crm_khxx.zjxm,crm_khxx.khjl";
	ls_sql+=" order by crm_khxx.khxm,sq_dwxx.dwmc,jc_zcdd.ppbm,crm_khxx.sjs,jc_zcdd.clgw,crm_khxx.zjxm,crm_khxx.khjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getdwmc=cf.fillNull(rs.getString("dwmc"));
		getppbm=cf.fillNull(rs.getString("ppbm"));
		getkhxm=cf.fillNull(rs.getString("khxm"));
		getclgw=cf.fillNull(rs.getString("clgw"));
		getsjs=cf.fillNull(rs.getString("sjs"));
		getzjxm=cf.fillNull(rs.getString("zjxm"));
		getkhjl=cf.fillNull(rs.getString("khjl"));

		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		cbze=rs.getDouble("cbze");
		tcze=rs.getDouble("tcze");


		allwdzje+=wdzje;
		allwdzje=cf.round(allwdzje,2);
		allhkze+=hkze;
		allhkze=cf.round(allhkze,2);
		allcbze+=cbze;
		allcbze=cf.round(allcbze,2);
		alltcze+=tcze;
		alltcze=cf.round(alltcze,2);


		%>
		<tr bgcolor="#FFFFFF"  align="center" height="23">
			<td><%=getdwmc%></td>
			<td><%=getkhxm%></td>
			<td><%=getsjs%></td>
			<td><%=getclgw%></td>
			<td><%=getzjxm%></td>
			<td><%=getkhjl%></td>
			<td><%=getppbm%></td>
			<td><%=wdzje%></td>
			<td><%=hkze%></td>
			<td><%=cbze%></td>
			<td><%=tcze%></td>
		</tr>
		<%
	
	 }
	 rs.close();
	 ps.close();
	 

	%>
	<tr bgcolor="#FFFFFF"  align="center" height="23">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allwdzje%></td>
		<td><%=allhkze%></td>
		<td><%=allcbze%></td>
		<td><%=alltcze%></td>
	</tr>
	<%
}
catch (Exception e) {
	out.print("Exception:2 " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>
</html>