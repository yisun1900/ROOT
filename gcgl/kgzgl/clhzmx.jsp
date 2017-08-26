<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>最低领用限额审核材料汇总明细表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String wheresql="";
	String crm_khxx_qyrq=null;
	String crm_khxx_hth=null;
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_sgd=null;
	String crm_khxx_sgbz=null;

	String crm_khxx_kgrq=null;
	String crm_khxx_sjkgrq=null;
	String crm_khxx_jgrq=null;
	String crm_khxx_gcjdbm=null;
	String crm_khxx_zsbz=null;
	String crm_khxx_wgbz=null;
	String crm_khxx_zt=null;

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
	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
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
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}




	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+crm_khxx_kgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq2");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+crm_khxx_kgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq>=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq2");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq<=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq>=TO_DATE('"+crm_khxx_jgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq2");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq<=TO_DATE('"+crm_khxx_jgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_gcjdbm=request.getParameter("crm_khxx_gcjdbm");
	if (crm_khxx_gcjdbm!=null)
	{
		crm_khxx_gcjdbm=cf.GB2Uni(crm_khxx_gcjdbm);
		if (!(crm_khxx_gcjdbm.equals("")))	wheresql+=" and  (crm_khxx.gcjdbm='"+crm_khxx_gcjdbm+"')";
	}
	crm_khxx_zsbz=request.getParameter("crm_khxx_zsbz");
	if (crm_khxx_zsbz!=null)
	{
		if (crm_khxx_zsbz.equals("1"))//1+未开工&2+已开工&3+已完工
		{
			wheresql+=" and  (crm_khxx.gcjdbm='1')";
		}
		else if (crm_khxx_zsbz.equals("2"))//1+未开工&2+已开工&3+已完工
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('2','3','4'))";
		}
		else if (crm_khxx_zsbz.equals("3"))//1+未开工&2+已开工&3+已完工
		{
			wheresql+=" and  (crm_khxx.gcjdbm='5')";
		}
	}
	crm_khxx_wgbz=request.getParameter("crm_khxx_wgbz");
	if (crm_khxx_wgbz!=null)
	{
		if (crm_khxx_wgbz.equals("1"))//1+未完工&2+已完工
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wgbz.equals("2"))//1+未完工&2+已完工
		{
			wheresql+=" and  (crm_khxx.gcjdbm='5')";
		}
	}
	crm_khxx_zt=request.getParameter("crm_khxx_zt");
	if (crm_khxx_zt!=null)
	{
		crm_khxx_zt=cf.GB2Uni(crm_khxx_zt);
		if (!(crm_khxx_zt.equals("")))	wheresql+=" and  (crm_khxx.zt='"+crm_khxx_zt+"')";
	}

	String sgdlx=null;
	sgdlx=request.getParameter("sgdlx");
	if (sgdlx!=null)
	{
		sgdlx=cf.GB2Uni(sgdlx);
		if (!(sgdlx.equals("")))	wheresql+=" and  (sq_sgd.sgdlx='"+sgdlx+"')";
	}

	String kgzsj=null;
	kgzsj=request.getParameter("kgzsj");
	if (kgzsj!=null)
	{
		kgzsj=kgzsj.trim();
		if (!(kgzsj.equals("")))	wheresql+="  and (crm_khxx.kgzsj>=TO_DATE('"+kgzsj+"','YYYY/MM/DD'))";
	}
	kgzsj=request.getParameter("kgzsj2");
	if (kgzsj!=null)
	{
		kgzsj=kgzsj.trim();
		if (!(kgzsj.equals("")))	wheresql+="  and (crm_khxx.kgzsj<=TO_DATE('"+kgzsj+"','YYYY/MM/DD'))";
	}

%>

<div align="center"><b>最低领用限额审核材料汇总明细表</b></div>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr align="center"> 
    <td width="2%">序号</td>
    <td width="4%">开工证日期</td>
    <td width="6%">签约店面</td>
    <td width="4%">合同号</td>
    <td width="4%">客户姓名</td>
    <td width="3%">设计师</td>
    <td width="3%">施工队长</td>
    <td width="3%">施工队类型</td>
    <td width="3%">施工班长</td>

    <td width="4%">项目编号</td>
    <td width="11%">项目名称</td>
    <td width="3%">工程量</td>
    <td width="3%">客户报价</td>
    <td width="5%">工程金额</td>

    <td width="13%">材料名称</td>
    <td width="7%">品牌（型号规格）</td>
    <td width="4%">最低用量</td>
    <td width="3%">材料单价</td>
    <td width="5%">材料金额</td>
    <td width="10%">备注</td>
  </tr>
<%
String khbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String dwmc=null;

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

	String pxzd=request.getParameter("pxzd");
	
	double xjgcje=0;
	double xjxhl=0;
	double xjclf=0;
	int row=0;

	ls_sql="SELECT kgzsj,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属') sgdlx,sgdmc,sgbz,crm_khxx.zjxm,dwmc";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.kgzbz='Y'";
    ls_sql+=wheresql;
    ls_sql+=" order by "+pxzd;
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		kgzsj=cf.fillHtml(rs2.getDate("kgzsj"));
		khbh=cf.fillNull(rs2.getString("khbh"));
		hth=cf.fillNull(rs2.getString("hth"));
		khxm=cf.fillHtml(rs2.getString("khxm"));
		fwdz=cf.fillHtml(rs2.getString("fwdz"));
		sjs=cf.fillHtml(rs2.getString("sjs"));
		sgdlx=cf.fillHtml(rs2.getString("sgdlx"));
		sgdmc=cf.fillHtml(rs2.getString("sgdmc"));
		sgbz=cf.fillHtml(rs2.getString("sgbz"));
		zjxm=cf.fillHtml(rs2.getString("zjxm"));
		dwmc=cf.fillHtml(rs2.getString("dwmc"));


				//输出项目明细
		String xmbh=null;
		String xmmc=null;
		String xmjldw=null;
		double gcdj=0;
		double gcl=0;
		double gcje=0;

		String glmc=null;
		String pp=null;
		String xhgg=null;
		String jldwmc=null;
		double dj=0;
		double xhl=0;
		double dxclf=0;


		int khrowsl=0;
		int khxmrowsl=0;
		ls_sql="SELECT count(*),count(distinct xmbh)";
		ls_sql+=" FROM bj_khglfxb  ";
		ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and xmbh in(select xmbh from bj_gclmx where khbh='"+khbh+"')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khrowsl=rs1.getInt(1);
			khxmrowsl=rs1.getInt(2);
		}
		rs1.close();
		ps1.close();

		khrowsl+=khxmrowsl;

		double xjkhclf=0;
		double xjkhgcje=0;

		if (khrowsl>0)
		{
			ls_sql="SELECT bj_bjxmmx.xmbh,bj_bjxmmx.xmmc,jldwmc,dj,sum(bj_gclmx.sl) gcl,ROUND(sum(bj_gclmx.sl*dj),2) gcje";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,jdm_jldwbm";
			ls_sql+=" where bj_bjxmmx.khbh=bj_gclmx.khbh and  bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+)";
			ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" group by bj_bjxmmx.xmbh,bj_bjxmmx.xmmc,jldwmc,dj";
			ls_sql+=" order by bj_bjxmmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				xmbh=cf.fillNull(rs.getString("xmbh"));
				xmmc=cf.fillHtml(rs.getString("xmmc"));
				xmjldw=cf.fillHtml(rs.getString("jldwmc"));
				gcdj=rs.getDouble("dj");
				gcl=rs.getDouble("gcl");
				gcje=rs.getDouble("gcje");


				int rowsl=0;
				ls_sql="SELECT count(*) rowsl";
				ls_sql+=" FROM bj_khglfxb  ";
				ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and  bj_khglfxb.xmbh='"+xmbh+"'";//材料费
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					rowsl=rs1.getInt("rowsl");
				}
				rs1.close();
				ps1.close();

				if (rowsl>0)
				{
					xjgcje+=gcje;
					xjkhgcje+=gcje;

					double xjdxclf=0;
					ls_sql="SELECT bj_khglfxb.glbxh,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,jdm_jldwbm.jldwmc,bj_khglfxb.dj,sum(bj_khglfxb.xhl*"+gcl+") xhl,ROUND(sum(bj_khglfxb.xhl*"+gcl+"*bj_khglfxb.dj),2) clf ";
					ls_sql+=" FROM bj_khglfxb,jdm_jldwbm  ";
					ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and  bj_khglfxb.xmbh='"+xmbh+"'";//材料费
					ls_sql+=" and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
					ls_sql+=" group by bj_khglfxb.glbxh,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
					ls_sql+=" order by bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					while (rs1.next())
					{
						glmc=cf.fillNull(rs1.getString("glmc"));
						pp=rs1.getString("pp");
						xhgg=rs1.getString("xhgg");
						jldwmc=cf.fillHtml(rs1.getString("jldwmc"));

						dj=rs1.getDouble("dj");

						xhl=rs1.getDouble("xhl");
						dxclf=rs1.getDouble("clf");

						xjxhl+=xhl;
						xjclf+=dxclf;
						xjdxclf+=dxclf;
						xjkhclf+=dxclf;

						row++;

						//输出每行数据
						%> 
						  <tr bgcolor="#FFFFFF" align="center"> 
							<td><%=row%></td>
							<%
							if (khrowsl>0)
							{
								%>		
								<td rowspan="<%=(khrowsl+1)%>"><%=kgzsj%></td>
								<td rowspan="<%=(khrowsl+1)%>"><%=dwmc%></td>
								<td rowspan="<%=(khrowsl+1)%>"><%=hth%></td>
								<td rowspan="<%=(khrowsl+1)%>"><%=khxm%></td>
								<td rowspan="<%=(khrowsl+1)%>"><%=sjs%></td>
								<td rowspan="<%=(khrowsl+1)%>"><%=sgdmc%></td>
								<td rowspan="<%=(khrowsl+1)%>"><%=sgdlx%></td>
								<td rowspan="<%=(khrowsl+1)%>"><%=sgbz%></td>
								<%
								khrowsl=0;
							}

							if (rowsl>0)
							{
								%>		
								<td rowspan="<%=(rowsl+1)%>"><%=xmbh%></td>
								<td rowspan="<%=(rowsl+1)%>"><%=xmmc%></td>
								<td rowspan="<%=(rowsl+1)%>"><%=gcl%><%=xmjldw%></td>
								<td rowspan="<%=(rowsl+1)%>"><%=gcdj%></td>
								<td rowspan="<%=(rowsl+1)%>"><%=gcje%></td>
								<%
								rowsl=0;
							}
							
							%>

							<td><%=glmc%></td>
							<td><%=pp+"（"+xhgg+"）"%></td>
							<td><%=cf.formatDouble(xhl)%><%=jldwmc%></td>
							<td><%=dj%></td>
							<td><%=dxclf%></td>
							<td>&nbsp;</td>
						  </tr>
						<%
					}
					rs1.close();
					ps1.close();

					%>
					  <tr bgcolor="#FFFFFF" align="center"> 
						<td>&nbsp;</td>
						<td><B>[<%=xmbh%>]小计</B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td colspan="2"><B><%=cf.formatDouble(xjdxclf)%></B></td>
						<td>&nbsp;</td>
					  </tr>
					<%
				}


			
			}
			rs.close();
			ps.close();

			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td>&nbsp;</td>
				<td colspan="2"><B>[<%=khxm%>]小计</B></td>
				<td>&nbsp;</td>
				<td colspan="2"><B><%=cf.formatDouble(xjkhgcje)%></B></td>
				<td>&nbsp;</td>
				<td colspan="4"><B><%=cf.formatDouble(xjkhclf)%></B></td>
				<td>&nbsp;</td>
			  </tr>
			<%
		}

	}
	rs2.close();
	ps2.close();

	//输出小计
	%> 
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="2">总  计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>


	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td colspan="2"><%=cf.formatDouble(xjgcje)%></td>

	<td >&nbsp;</td>
	<td colspan="4"><%=cf.formatDouble(xjclf)%></td>
	<td>&nbsp;</td>
  </tr>
</table>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs1!= null) rs2.close(); 
		if (ps1!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>