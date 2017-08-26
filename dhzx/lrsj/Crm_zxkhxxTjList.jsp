<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>




<%
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面


	String wheresql="";
	

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}

	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String zxdjbm=null;
	zxdjbm=request.getParameter("zxdjbm");
	if (zxdjbm!=null)
	{
		if (!(zxdjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm='"+zxdjbm+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+lrr+"')";
	}

	String mxxlrsj=null;
	mxxlrsj=request.getParameter("mxxlrsj");
	if (mxxlrsj!=null)
	{
		mxxlrsj=mxxlrsj.trim();
		if (!(mxxlrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj>=TO_DATE('"+mxxlrsj+"','YYYY-MM-DD'))";
	}
	mxxlrsj=request.getParameter("mxxlrsj2");
	if (mxxlrsj!=null)
	{
		mxxlrsj=mxxlrsj.trim();
		if (!(mxxlrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj<=TO_DATE('"+mxxlrsj+"','YYYY-MM-DD'))";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
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


	String mxxts=null;
	mxxts=request.getParameter("mxxts");
	if (mxxts!=null)
	{
		mxxts=mxxts.trim();
		if (!(mxxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>="+mxxts+")";
	}
	mxxts=request.getParameter("mxxts2");
	if (mxxts!=null)
	{
		mxxts=mxxts.trim();
		if (!(mxxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<="+mxxts+")";
	}

	String zxts=null;
	zxts=request.getParameter("zxts");
	if (zxts!=null)
	{
		zxts=zxts.trim();
		if (!(zxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>="+zxts+")";
	}
	zxts=request.getParameter("zxts2");
	if (zxts!=null)
	{
		zxts=zxts.trim();
		if (!(zxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<="+zxts+")";
	}


	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">咨询客户--查询</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%" rowspan="2">分公司</td>
	<td  width="12%" rowspan="2">咨询店面</td>
	<td  width="9%" colspan="2">5天</td>
	<td  width="9%" colspan="2">10天</td>
	<td  width="9%" colspan="2">20天</td>
	<td  width="9%" colspan="2">30天</td>
	<td  width="9%" colspan="2">50天</td>
	<td  width="9%" colspan="2">70天</td>
	<td  width="9%" colspan="2">大于70天</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td>毛信息签单天数</td>
	<td>咨询签单天数</td>
	<td>毛信息签单天数</td>
	<td>咨询签单天数</td>
	<td>毛信息签单天数</td>
	<td>咨询签单天数</td>
	<td>毛信息签单天数</td>
	<td>咨询签单天数</td>
	<td>毛信息签单天数</td>
	<td>咨询签单天数</td>
	<td>毛信息签单天数</td>
	<td>咨询签单天数</td>
	<td>毛信息签单天数</td>
	<td>咨询签单天数</td>
</tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getfgsbh=null;
	String fgsmc=null;
	ls_sql =" SELECT dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where sq_dwxx.dwlx='F0'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(ssfgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+ssfgs+"')";
	}

	ls_sql+=" and sq_dwxx.cxbz='N'";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");
	
		int xjkhsldm=0;
		int xjddsldm=0;
		double xjwdzgcedm=0;
		double xjqyedm=0;
		double xjjedm=0;
		double xjtdedm=0;
		double xjzjxzedm=0;

		String getdwbh=null;
		String dmmc=null;
		
		ls_sql =" SELECT dwbh,dwmc,kdsj,gdsj,cxbz ";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where sq_dwxx.dwlx='F2'";
		ls_sql+=" and sq_dwxx.ssfgs='"+getfgsbh+"'";

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (!(zxdm.equals("")))
		{
			ls_sql+=" and  sq_dwxx.dwbh='"+zxdm+"'";
		}
		ls_sql+=" and sq_dwxx.cxbz='N'";
		ls_sql+=" order by sq_dwxx.dwbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getdwbh=rs1.getString("dwbh");
			dmmc=rs1.getString("dwmc");

			int mxxsl1=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx,crm_scbkhxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<=5)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				mxxsl1=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int zxxxsl1=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<=5)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zxxxsl1=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int mxxsl2=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx,crm_scbkhxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>5)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<=10)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				mxxsl2=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int zxxxsl2=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>5)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<=10)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zxxxsl2=rs.getInt(1);
			}
			rs.close();
			ps.close();


			int mxxsl3=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx,crm_scbkhxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>10)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<=20)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				mxxsl3=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int zxxxsl3=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>10)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<=20)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zxxxsl3=rs.getInt(1);
			}
			rs.close();
			ps.close();


			int mxxsl4=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx,crm_scbkhxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>20)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<=30)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				mxxsl4=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int zxxxsl4=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>20)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<=30)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zxxxsl4=rs.getInt(1);
			}
			rs.close();
			ps.close();


			int mxxsl5=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx,crm_scbkhxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>30)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<=50)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				mxxsl5=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int zxxxsl5=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>30)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<=50)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zxxxsl5=rs.getInt(1);
			}
			rs.close();
			ps.close();


			int mxxsl6=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx,crm_scbkhxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>50)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<=70)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				mxxsl6=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int zxxxsl6=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>50)";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<=70)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zxxxsl6=rs.getInt(1);
			}
			rs.close();
			ps.close();


			int mxxsl7=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx,crm_scbkhxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>70)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				mxxsl7=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int zxxxsl7=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx";
			ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.zt='2' ";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
			ls_sql+=" and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>70)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zxxxsl7=rs.getInt(1);
			}
			rs.close();
			ps.close();

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><%=fgsmc%></td>
				<td><%=dmmc%></td>
				<td><A HREF="ViewMxx.jsp?dwbh=<%=getdwbh%>&ts1=&ts2=5" target="_balnk"><%=mxxsl1%></A></td>
				<td><A HREF="ViewZxxx.jsp?dwbh=<%=getdwbh%>&ts1=&ts2=5" target="_balnk"><%=zxxxsl1%></A></td>
				<td><A HREF="ViewMxx.jsp?dwbh=<%=getdwbh%>&ts1=5&ts2=10" target="_balnk"><%=mxxsl2%></A></td>
				<td><A HREF="ViewZxxx.jsp?dwbh=<%=getdwbh%>&ts1=5&ts2=10" target="_balnk"><%=zxxxsl2%></A></td>
				<td><A HREF="ViewMxx.jsp?dwbh=<%=getdwbh%>&ts1=10&ts2=20" target="_balnk"><%=mxxsl3%></A></td>
				<td><A HREF="ViewZxxx.jsp?dwbh=<%=getdwbh%>&ts1=10&ts2=20" target="_balnk"><%=zxxxsl3%></A></td>
				<td><A HREF="ViewMxx.jsp?dwbh=<%=getdwbh%>&ts1=20&ts2=30" target="_balnk"><%=mxxsl4%></A></td>
				<td><A HREF="ViewZxxx.jsp?dwbh=<%=getdwbh%>&ts1=20&ts2=30" target="_balnk"><%=zxxxsl4%></A></td>
				<td><A HREF="ViewMxx.jsp?dwbh=<%=getdwbh%>&ts1=30&ts2=50" target="_balnk"><%=mxxsl5%></A></td>
				<td><A HREF="ViewZxxx.jsp?dwbh=<%=getdwbh%>&ts1=30&ts2=50" target="_balnk"><%=zxxxsl5%></A></td>
				<td><A HREF="ViewMxx.jsp?dwbh=<%=getdwbh%>&ts1=50&ts2=70" target="_balnk"><%=mxxsl6%></A></td>
				<td><A HREF="ViewZxxx.jsp?dwbh=<%=getdwbh%>&ts1=50&ts2=70" target="_balnk"><%=zxxxsl6%></A></td>
				<td><A HREF="ViewMxx.jsp?dwbh=<%=getdwbh%>&ts1=70&ts2=" target="_balnk"><%=mxxsl7%></A></td>
				<td><A HREF="ViewZxxx.jsp?dwbh=<%=getdwbh%>&ts1=70&ts2=" target="_balnk"><%=zxxxsl7%></A></td>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();
	}
	rs1.close();
	ps1.close();



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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 

</body>
</html>