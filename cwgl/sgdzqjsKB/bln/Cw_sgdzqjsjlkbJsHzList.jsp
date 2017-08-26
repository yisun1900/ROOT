<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		pageObj.setType("EXCEL",response);
	}

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权


	String wheresql="";

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
	
	String sgd=null;
	String sgbz=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.sgd='"+sgd+"')";
	}
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.sgbz='"+sgbz+"')";
	}
	
	
	String gdjsjd=null;
	gdjsjd=request.getParameter("gdjsjd");
	if (gdjsjd!=null)
	{
		gdjsjd=cf.GB2Uni(gdjsjd);
		if (!(gdjsjd.equals("")))	wheresql+=" and  (crm_khxx.gdjsjd='"+gdjsjd+"')";
	}

	String cw_sgdzqjsjlkb_jsjlh=null;
	String cw_sgdzqjsjlkb_jsrq=null;
	String cw_sgdzqjsjlkb_jsbl=null;
	String cw_sgdzqjsjlkb_lrr=null;
	String cw_sgdzqjsjlkb_lrsj=null;
	cw_sgdzqjsjlkb_jsjlh=request.getParameter("cw_sgdzqjsjlkb_jsjlh");
	if (cw_sgdzqjsjlkb_jsjlh!=null)
	{
		cw_sgdzqjsjlkb_jsjlh=cf.GB2Uni(cw_sgdzqjsjlkb_jsjlh);
		if (!(cw_sgdzqjsjlkb_jsjlh.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsjlh='"+cw_sgdzqjsjlkb_jsjlh+"')";
	}
	cw_sgdzqjsjlkb_jsrq=request.getParameter("cw_sgdzqjsjlkb_jsrq");
	if (cw_sgdzqjsjlkb_jsrq!=null)
	{
		cw_sgdzqjsjlkb_jsrq=cw_sgdzqjsjlkb_jsrq.trim();
		if (!(cw_sgdzqjsjlkb_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.jsrq>=TO_DATE('"+cw_sgdzqjsjlkb_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_jsrq=request.getParameter("cw_sgdzqjsjlkb_jsrq2");
	if (cw_sgdzqjsjlkb_jsrq!=null)
	{
		cw_sgdzqjsjlkb_jsrq=cw_sgdzqjsjlkb_jsrq.trim();
		if (!(cw_sgdzqjsjlkb_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.jsrq<=TO_DATE('"+cw_sgdzqjsjlkb_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_jsbl=request.getParameter("cw_sgdzqjsjlkb_jsbl");
	if (cw_sgdzqjsjlkb_jsbl!=null)
	{
		cw_sgdzqjsjlkb_jsbl=cw_sgdzqjsjlkb_jsbl.trim();
		if (!(cw_sgdzqjsjlkb_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsbl>="+cw_sgdzqjsjlkb_jsbl+") ";
	}
	cw_sgdzqjsjlkb_jsbl=request.getParameter("cw_sgdzqjsjlkb_jsbl");
	if (cw_sgdzqjsjlkb_jsbl!=null)
	{
		cw_sgdzqjsjlkb_jsbl=cw_sgdzqjsjlkb_jsbl.trim();
		if (!(cw_sgdzqjsjlkb_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsbl<="+cw_sgdzqjsjlkb_jsbl+") ";
	}
	cw_sgdzqjsjlkb_lrsj=request.getParameter("cw_sgdzqjsjlkb_lrsj");
	if (cw_sgdzqjsjlkb_lrsj!=null)
	{
		cw_sgdzqjsjlkb_lrsj=cw_sgdzqjsjlkb_lrsj.trim();
		if (!(cw_sgdzqjsjlkb_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.lrsj>=TO_DATE('"+cw_sgdzqjsjlkb_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_lrsj=request.getParameter("cw_sgdzqjsjlkb_lrsj2");
	if (cw_sgdzqjsjlkb_lrsj!=null)
	{
		cw_sgdzqjsjlkb_lrsj=cw_sgdzqjsjlkb_lrsj.trim();
		if (!(cw_sgdzqjsjlkb_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.lrsj<=TO_DATE('"+cw_sgdzqjsjlkb_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_lrr=request.getParameter("cw_sgdzqjsjlkb_lrr");
	if (cw_sgdzqjsjlkb_lrr!=null)
	{
		cw_sgdzqjsjlkb_lrr=cf.GB2Uni(cw_sgdzqjsjlkb_lrr);
		if (!(cw_sgdzqjsjlkb_lrr.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.lrr='"+cw_sgdzqjsjlkb_lrr+"')";
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">松下亿达松下亿达家装开工工程拨款明细</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"   style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="8%">合同号</td>
	<td  width="5%">施工队</td>
	<td  width="6%">客户姓名</td>
	<td  width="7%">开工日期</td>
	<td  width="7%">竣工日期</td>
	<td  width="4%">工期天数</td>
	<td  width="8%">家装合同额</td>
	<td  width="8%">增减项合计</td>
	<td  width="8%">实际工程额</td>
	<td  width="8%">家装工程中期款金额</td>
	<td  width="8%">拨付中期款的50%*0.88</td>
	<td  width="8%">实际拨款</td>
	<td  width="7%">备注</td>
	<td  width="7%">领款人签字</td>
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

	String getsgd=null;
	String getsgdmc=null;

	double zjwdzgce=0;
	double zjzjxje=0;
	double zjgcze=0;
	double zjjskjs=0;
	double zjjsje=0;

	int row=0;
	ls_sql="SELECT distinct cw_sgdzqjsjlkb.sgd,sgdmc";
	ls_sql+=" FROM crm_khxx,cw_sgdzqjsjlkb,sq_sgd  ";
    ls_sql+=" where cw_sgdzqjsjlkb.khbh=crm_khxx.khbh(+) and cw_sgdzqjsjlkb.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lx='2'";//2:松下亿达中期结算

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
	ls_sql+=" order by cw_sgdzqjsjlkb.sgd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsgd=cf.fillHtml(rs.getString("sgd"));
		getsgdmc=cf.fillHtml(rs.getString("sgdmc"));
		
		String getkhbh=null;
		String gethth=null;
		String getkhxm=null;
		String getkgrq=null;
		String getjgrq=null;
		String getgqts=null;
		double getwdzgce=0;
		double getzjxje=0;
		double zqzjxsuijin=0;
		double zqzjxguanlif=0;
		double getjskjs=0;
		double getjsje=0;

		double xjwdzgce=0;
		double xjzjxje=0;
		double xjgcze=0;
		double xjjskjs=0;
		double xjjsje=0;
		ls_sql="SELECT cw_sgdzqjsjlkb.khbh,crm_khxx.zqzjxsuijin,crm_khxx.zqzjxguanlif,crm_khxx.hth,crm_khxx.khxm,crm_khxx.kgrq,crm_khxx.jgrq,crm_khxx.gqts,crm_khxx.wdzgce,crm_khxx.zjxje,cw_sgdzqjsjlkb.jskjs,cw_sgdzqjsjlkb.jsje";
		ls_sql+=" FROM crm_khxx,cw_sgdzqjsjlkb  ";
		ls_sql+=" where cw_sgdzqjsjlkb.khbh=crm_khxx.khbh(+) ";
		ls_sql+=" and cw_sgdzqjsjlkb.sgd='"+getsgd+"'";
	    ls_sql+=" and cw_sgdzqjsjlkb.lx='2'";//2:松下亿达中期结算

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		ls_sql+=wheresql;
		ls_sql+=" order by cw_sgdzqjsjlkb.sgd,cw_sgdzqjsjlkb.jsrq desc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getkhbh=cf.fillNull(rs1.getString("khbh"));
			gethth=cf.fillHtml(rs1.getString("hth"));
			getkhxm=cf.fillHtml(rs1.getString("khxm"));
			getkgrq=cf.fillHtml(rs1.getDate("kgrq"));
			getjgrq=cf.fillHtml(rs1.getDate("jgrq"));
			getgqts=cf.fillHtml(rs1.getString("gqts"));
			getwdzgce=rs1.getDouble("wdzgce");
			getzjxje=rs1.getDouble("zjxje");
			zqzjxsuijin=rs1.getDouble("zqzjxsuijin");
			zqzjxguanlif=rs1.getDouble("zqzjxguanlif");
			getjskjs=rs1.getDouble("jskjs");
			getjsje=rs1.getDouble("jsje");

			double zjxrzf=0;
			double zjxdjjje=0;
			ls_sql=" select zjxrzf,zjxdjjje";
			ls_sql+=" from crm_khqye";
			ls_sql+=" where  khbh='"+getkhbh+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				zjxrzf=rs2.getDouble("zjxrzf");
				zjxdjjje=rs2.getDouble("zjxdjjje");
			}
			rs2.close();
			ps2.close();

			getzjxje=getzjxje+zqzjxsuijin+zqzjxguanlif+zjxrzf+zjxdjjje;
			getzjxje=cf.round(getzjxje,2);
			
			double gcze=getwdzgce+getzjxje;
			gcze=cf.round(gcze,2);

			xjwdzgce+=getwdzgce;
			xjzjxje+=getzjxje;
			xjjskjs+=getjskjs;
			xjjsje+=getjsje;
			xjgcze+=gcze;

			xjwdzgce=cf.round(xjwdzgce,2);
			xjzjxje=cf.round(xjzjxje,2);
			xjjskjs=cf.round(xjjskjs,2);
			xjjsje=cf.round(xjjsje,2);
			xjgcze=cf.round(xjgcze,2);

			zjwdzgce+=getwdzgce;
			zjzjxje+=getzjxje;
			zjjskjs+=getjskjs;
			zjjsje+=getjsje;
			zjgcze+=gcze;

			zjwdzgce=cf.round(zjwdzgce,2);
			zjzjxje=cf.round(zjzjxje,2);
			zjjskjs=cf.round(zjjskjs,2);
			zjjsje=cf.round(zjjsje,2);
			zjgcze=cf.round(zjgcze,2);

			row++;

			%>
			<tr align="center">
				<td><%=row%></td>
				<td><%=gethth%></td>
				<td><%=getsgdmc%></td>
				<td><%=getkhxm%></td>
				<td><%=getkgrq%></td>
				<td><%=getjgrq%></td>
				<td><%=getgqts%></td>
				<td><%=getwdzgce%></td>
				<td><%=getzjxje%></td>
				<td><%=gcze%></td>
				<td><%=getjskjs%></td>
				<td><%=getjsje%></td>
				<td><%=getjsje%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();

		%>
		<tr align="center">
			<td colspan="3">【<%=getsgdmc%>】汇总</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=xjwdzgce%></td>
			<td><%=xjzjxje%></td>
			<td><%=xjgcze%></td>
			<td><%=xjjskjs%></td>
			<td><%=xjjsje%></td>
			<td><%=xjjsje%></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	
	%>
	<tr align="center">
		<td colspan="3">总 计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=zjwdzgce%></td>
		<td><%=zjzjxje%></td>
		<td><%=zjgcze%></td>
		<td><%=zjjskjs%></td>
		<td><%=zjjsje%></td>
		<td><%=zjjsje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%
	

}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</table>

</body>
</html>