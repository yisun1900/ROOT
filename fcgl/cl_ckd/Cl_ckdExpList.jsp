<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

  <%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
//	pageObj.setType("EXCEL",response);

	String wheresql="";
	String ckph=null;
	String dwbh=null;
	String khbh=null;
	String ckzsl=null;
	String ckzje=null;
	String ckzt=null;
	String lrr=null;
	String lrsj=null;
	String cksj=null;
	String bz=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String fgs=null;

	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	wheresql+=" and  (cl_ckd.lx='"+lx+"')";
	}
	String jsbz=null;
	jsbz=request.getParameter("jsbz");
	if (jsbz!=null)
	{
		if (!(jsbz.equals("")))	wheresql+=" and  (cl_ckd.jsbz='"+jsbz+"')";
	}
	String jsjlh=null;
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		if (!(jsjlh.equals("")))	wheresql+=" and  (cl_ckd.jsjlh='"+jsjlh+"')";
	}

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=sgd.trim();
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String psdh=null;
	psdh=request.getParameter("psdh");
	if (psdh!=null)
	{
		if (!(psdh.equals("")))	wheresql+=" and  (cl_ckd.psdh='"+psdh+"')";
	}

	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_ckd.dwbh='"+fgs+"')";
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}
	ckph=request.getParameter("ckph");
	if (ckph!=null)
	{
		ckph=cf.GB2Uni(ckph);
		if (!(ckph.equals("")))	wheresql+=" and  (cl_ckd.ckph='"+ckph+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cl_ckd.dwbh='"+dwbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cl_ckd.khbh='"+khbh+"')";
	}
	ckzsl=request.getParameter("ckzsl");
	if (ckzsl!=null)
	{
		ckzsl=ckzsl.trim();
		if (!(ckzsl.equals("")))	wheresql+=" and  (cl_ckd.ckzsl>="+ckzsl+") ";
	}
	ckzsl=request.getParameter("ckzsl2");
	if (ckzsl!=null)
	{
		ckzsl=ckzsl.trim();
		if (!(ckzsl.equals("")))	wheresql+=" and  (cl_ckd.ckzsl<="+ckzsl+") ";
	}
	ckzje=request.getParameter("ckzje");
	if (ckzje!=null)
	{
		ckzje=ckzje.trim();
		if (!(ckzje.equals("")))	wheresql+=" and  (cl_ckd.ckzje>="+ckzje+") ";
	}
	ckzje=request.getParameter("ckzje2");
	if (ckzje!=null)
	{
		ckzje=ckzje.trim();
		if (!(ckzje.equals("")))	wheresql+=" and  (cl_ckd.ckzje<="+ckzje+") ";
	}
	ckzt=request.getParameter("ckzt");
	if (ckzt!=null)
	{
		ckzt=cf.GB2Uni(ckzt);
		if (!(ckzt.equals("")))	wheresql+=" and  (cl_ckd.ckzt='"+ckzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cl_ckd.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_ckd.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_ckd.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	cksj=request.getParameter("cksj");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (cl_ckd.cksj>=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}
	cksj=request.getParameter("cksj2");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (cl_ckd.cksj<=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}

	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (cl_ckd.bz='"+bz+"')";
	}
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String getkhbh=null;
String getkhxm=null;
String gethth=null;
String getckph=null;
String getsjshsj=null;
double getckzsl=0;
double getckzje=0;
String getpsdh=null;
double getqye=0;
String getsgdmc=null;
String getckr=null;
double getyf=0;
double getqtsf=0;
double getclf=0;
String getsjcksj=null;

try {
	conn=cf.getConnection();

	int clsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM cl_clbm,cl_jgmx ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm";
    ls_sql+=" and cl_jgmx.dwbh='"+fgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		clsl = rs.getInt(1);
	}
	rs.close();
	ps.close();

%>

<table border="1" width="<%=(820+clsl*90)%>" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr align="center"> 
   <td width="40">序号</td>
	<td width="90">出库时期</td>
    <td width="90">实际送货日期</td>
    <td width="85">合同号</td>
    <td width="60">客户姓名</td>
    <td width="60">工长</td>
    <td width="80">合同造价</td>
    <td width="80">出库总额</td>
    <td width="60">车费</td>
    <td width="80">材料费合计</td>
    <td width="95">票号</td>
<%
	String getclbm=null;
	String getclmc=null;
	ls_sql="SELECT cl_clbm.clbm,clmc";
	ls_sql+=" FROM cl_clbm,cl_jgmx ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm";
    ls_sql+=" and cl_jgmx.dwbh='"+fgs+"'";
    ls_sql+=" and cl_clbm.clbm in(select distinct clbm  from cl_ckmx)";
    ls_sql+=" order by cl_clbm.paixu";
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while (rs1.next())
	{
		getclbm = rs1.getString("clbm");
		getclmc = rs1.getString("clmc");

		%>
		<td width="90"><%=getclmc%></td>
		<%
	}
	rs1.close();
	ps1.close();
%>
  </tr>

<%
	int row=0;
	ls_sql="SELECT cl_ckd.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.qye,sgdmc,cl_ckd.ckph,cl_ckd.ckr,cl_ckd.cksj sjshsj,cl_ckd.psdh";
	ls_sql+=" ,cl_ckd.yf,cl_ckd.qtsf,cl_ckd.ckzsl,cl_ckd.ckzje,cl_ckd.ckzje-cl_ckd.yf-cl_ckd.qtsf clf,cl_ckd.lrsj sjcksj";
	ls_sql+=" FROM cl_ckd,crm_khxx,sq_sgd ";
    ls_sql+=" where cl_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_ckd.cksj";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		getkhbh = cf.fillHtml(rs.getString("khbh"));
		getkhxm = cf.fillHtml(rs.getString("khxm"));
		gethth = cf.fillHtml(rs.getString("hth"));
		getqye = rs.getDouble("qye");
		getsgdmc = cf.fillHtml(rs.getString("sgdmc"));
		getckph = cf.fillHtml(rs.getString("ckph"));
		getckr = cf.fillHtml(rs.getString("ckr"));
		getsjshsj = cf.fillHtml(rs.getDate("sjshsj"));
		getyf = rs.getDouble("yf");
		getqtsf = rs.getDouble("qtsf");
		getckzsl = rs.getDouble("ckzsl");
		getckzje = rs.getDouble("ckzje");
		getclf = rs.getDouble("clf");
		getsjcksj = cf.fillHtml(rs.getDate("sjcksj"));

		row++;

		%>
		  <tr align="center"> 
			<td><%=row%></td>
			<td><%=getsjcksj%></td>
			<td><%=getsjshsj%></td>
			<td><%=gethth%></td>
			<td><%=getkhxm%></td>
			<td><%=getsgdmc%></td>
			<td><%=getqye%></td>
			<td><%=getckzje%></td>
			<td><%=getyf%></td>
			<td><%=getclf%></td>
			<td><%=getckph%></td>
		<%
			ls_sql="SELECT cl_clbm.clbm,clmc";
			ls_sql+=" FROM cl_clbm,cl_jgmx ";
			ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm";
			ls_sql+=" and cl_jgmx.dwbh='"+fgs+"'";
			ls_sql+=" and cl_clbm.clbm in(select distinct clbm  from cl_ckmx)";
			ls_sql+=" order by cl_clbm.paixu";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			while (rs1.next())
			{
				getclbm = rs1.getString("clbm");
				getclmc = rs1.getString("clmc");

				double getcksl=0;
				ls_sql="SELECT cksl";
				ls_sql+=" FROM cl_ckmx";
				ls_sql+=" where cl_ckmx.ckph='"+getckph+"' and cl_ckmx.clbm='"+getclbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if (rs2.next())
				{
					getcksl = rs2.getDouble("cksl");
				}
				rs2.close();
				ps2.close();

				%>
				<td><%=getcksl%></td>
				<%
			}
			rs1.close();
			ps1.close();

		%>			
		  </tr>
		 <%
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
		if (rs!= null) rs.close();
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close();
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close();
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