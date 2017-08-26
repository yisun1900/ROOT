<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String dqmc=null;;
String bjjbmc=null;

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

    ls_sql=" select dqmc from dm_dqbm where dqbm='"+dqbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqmc=cf.fillNull(rs.getString("dqmc"));
	}
	rs.close();
	ps.close();

    ls_sql=" select bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
	}
	rs.close();
	ps.close();

	int xssl=Integer.parseInt(request.getParameter("xssl"));

	int curPage=0;//当前需要显示的页序号
	String pageStr=request.getParameter("curPage");//获取当前页号
	if (pageStr==null)//判断是否需要初始化，若第一次进入此页，则需要初始化
	{
		curPage=1;
		String wheresql="";
		String bj_jzglfxb_glbxh=null;

		String bj_jzglfxb_xmbh=null;
		String bj_jzglfxb_xmmc=null;
		String bj_jzglfxb_xmdlbm=null;
		String bj_jzglfxb_xmxlbm=null;
		String bj_jzglfxb_glflbm=null;
		String glfxclmc=null;
		String bj_jzglfxb_pp=null;
		String xh=null;
		String gg=null;
		String bj_jzglfxb_jldwbm=null;
		String xhl=null;
		String bj_jzglfxb_dj=null;
		String bj_jzglfxb_lrr=null;
		String bj_jzglfxb_lrsj=null;

		wheresql+=" and  (bj_jzglfxb.bjbbh='"+bjbbh+"')";
		wheresql+=" and  (bj_jzglfxb.dqbm='"+dqbm+"')";
		wheresql+=" and (bj_jzglfxb.bjjbbm='"+bjjbbm+"') ";

		
		String glfxclbm=null;
		glfxclbm=request.getParameter("glfxclbm");
		if (glfxclbm!=null)
		{
			if (!(glfxclbm.equals("")))	wheresql+=" and (bj_jzglfxb.glfxclbm='"+glfxclbm+"') ";
		}



		bj_jzglfxb_glbxh=request.getParameter("bj_jzglfxb_glbxh");
		if (bj_jzglfxb_glbxh!=null)
		{
			bj_jzglfxb_glbxh=bj_jzglfxb_glbxh.trim();
			if (!(bj_jzglfxb_glbxh.equals("")))	wheresql+=" and (bj_jzglfxb.glbxh="+bj_jzglfxb_glbxh+") ";
		}

		bj_jzglfxb_xmbh=request.getParameter("bj_jzglfxb_xmbh");
		if (bj_jzglfxb_xmbh!=null)
		{
			bj_jzglfxb_xmbh=cf.GB2Uni(bj_jzglfxb_xmbh);
			if (!(bj_jzglfxb_xmbh.equals("")))	wheresql+=" and  (bj_jzglfxb.xmbh='"+bj_jzglfxb_xmbh+"')";
		}
		bj_jzglfxb_xmmc=request.getParameter("bj_jzglfxb_xmmc");
		if (bj_jzglfxb_xmmc!=null)
		{
			bj_jzglfxb_xmmc=cf.GB2Uni(bj_jzglfxb_xmmc);
			if (!(bj_jzglfxb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc='"+bj_jzglfxb_xmmc+"')";
		}
		bj_jzglfxb_xmdlbm=request.getParameter("bj_jzglfxb_xmdlbm");
		if (bj_jzglfxb_xmdlbm!=null)
		{
			bj_jzglfxb_xmdlbm=cf.GB2Uni(bj_jzglfxb_xmdlbm);
			if (!(bj_jzglfxb_xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmdlbm='"+bj_jzglfxb_xmdlbm+"')";
		}
		bj_jzglfxb_xmxlbm=request.getParameter("bj_jzglfxb_xmxlbm");
		if (bj_jzglfxb_xmxlbm!=null)
		{
			bj_jzglfxb_xmxlbm=cf.GB2Uni(bj_jzglfxb_xmxlbm);
			if (!(bj_jzglfxb_xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmxlbm='"+bj_jzglfxb_xmxlbm+"')";
		}
		bj_jzglfxb_glflbm=request.getParameter("bj_jzglfxb_glflbm");
		if (bj_jzglfxb_glflbm!=null)
		{
			bj_jzglfxb_glflbm=cf.GB2Uni(bj_jzglfxb_glflbm);
			if (!(bj_jzglfxb_glflbm.equals("")))	wheresql+=" and  (bj_jzglfxb.glflbm='"+bj_jzglfxb_glflbm+"')";
		}
		glfxclmc=request.getParameter("glfxclmc");
		if (glfxclmc!=null)
		{
			glfxclmc=cf.GB2Uni(glfxclmc);
			if (!(glfxclmc.equals("")))	wheresql+=" and  (bj_jzglfxb.glfxclmc='"+glfxclmc+"')";
		}
		bj_jzglfxb_pp=request.getParameter("bj_jzglfxb_pp");
		if (bj_jzglfxb_pp!=null)
		{
			bj_jzglfxb_pp=cf.GB2Uni(bj_jzglfxb_pp);
			if (!(bj_jzglfxb_pp.equals("")))	wheresql+=" and  (bj_jzglfxb.pp='"+bj_jzglfxb_pp+"')";
		}
		xh=request.getParameter("xh");
		if (xh!=null)
		{
			xh=cf.GB2Uni(xh);
			if (!(xh.equals("")))	wheresql+=" and  (bj_jzglfxb.xh='"+xh+"')";
		}
		gg=request.getParameter("gg");
		if (gg!=null)
		{
			gg=cf.GB2Uni(gg);
			if (!(gg.equals("")))	wheresql+=" and  (bj_jzglfxb.gg='"+gg+"')";
		}
		bj_jzglfxb_jldwbm=request.getParameter("bj_jzglfxb_jldwbm");
		if (bj_jzglfxb_jldwbm!=null)
		{
			bj_jzglfxb_jldwbm=cf.GB2Uni(bj_jzglfxb_jldwbm);
			if (!(bj_jzglfxb_jldwbm.equals("")))	wheresql+=" and  (bj_jzglfxb.jldwbm='"+bj_jzglfxb_jldwbm+"')";
		}

		bj_jzglfxb_dj=request.getParameter("bj_jzglfxb_dj");
		if (bj_jzglfxb_dj!=null)
		{
			bj_jzglfxb_dj=bj_jzglfxb_dj.trim();
			if (!(bj_jzglfxb_dj.equals("")))	wheresql+=" and  (bj_jzglfxb.dj="+bj_jzglfxb_dj+") ";
		}
		bj_jzglfxb_lrr=request.getParameter("bj_jzglfxb_lrr");
		if (bj_jzglfxb_lrr!=null)
		{
			bj_jzglfxb_lrr=cf.GB2Uni(bj_jzglfxb_lrr);
			if (!(bj_jzglfxb_lrr.equals("")))	wheresql+=" and  (bj_jzglfxb.lrr='"+bj_jzglfxb_lrr+"')";
		}
		bj_jzglfxb_lrsj=request.getParameter("bj_jzglfxb_lrsj");
		if (bj_jzglfxb_lrsj!=null)
		{
			bj_jzglfxb_lrsj=bj_jzglfxb_lrsj.trim();
			if (!(bj_jzglfxb_lrsj.equals("")))	wheresql+="  and (bj_jzglfxb.lrsj=TO_DATE('"+bj_jzglfxb_lrsj+"','YYYY/MM/DD'))";
		}


		session.setAttribute("glfxSQL",wheresql);

		String count=null;
		ls_sql="SELECT count(distinct bj_jzbjb.xmbh)";
		ls_sql+=" FROM bj_jzglfxb,bj_jzbjb";
		ls_sql+=" where bj_jzglfxb.dqbm=bj_jzbjb.dqbm(+) and bj_jzglfxb.xmbh=bj_jzbjb.xmbh(+)";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getString(1);
		}
		rs.close();
		ps.close();

		session.setAttribute("glfxRecCount",count);

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
<CENTER > <B><font size="3"> 家装工料分析表（报价版本号：<%=bjbbh%>）（地区：<%=dqmc%>）（报价级别：<%=bjjbmc%>） </font></B></CENTER>
<table border="1" width="330%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr bgcolor="#FFFFFF">
  <td colspan="27">
  目前第<%=curPage%>页

<%
	String glfxRecCount=(String)session.getAttribute("glfxRecCount");
	int allsl=Integer.parseInt(glfxRecCount);

	for (int i=0;i< allsl*1.0/xssl ;i++ )
	{
		%>
		&nbsp;&nbsp;
		<a href="Bj_jzglfxbCxList.jsp?curPage=<%=(i+1)%>&xssl=<%=xssl%>&bjbbh=<%=bjbbh%>&dqbm=<%=dqbm%>&bjjbbm=<%=bjjbbm%>">第<%=(i+1)%>页</a>
		<%
		if (i%10==0 && i>8)
		{
			out.println("<BR>");
		}
	}

%>
  </td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">序号</td>
	<td  width="4%">项目大类</td>
	<td  width="4%">项目小类</td>
	<td  width="4%">项目编号</td>
	<td  width="8%">项目名称</td>
	<td  width="2%">工料分类</td>
	<td  width="2%">工料序号</td>
	<td  width="2%">需到物流领料</td>
	<td  width="2%">类型</td>
	<td  width="3%">材料编码</td>
	<td  width="6%">材料名称</td>
	<td  width="17%">备注</td>
	<td  width="2%">甲醛释放量</td>
	<td  width="2%">苯释放量</td>
	<td  width="2%">TVOC释放量</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">数量</td>
	<td  width="2%">单价</td>
	<td  width="3%">金额</td>
	<td  width="3%">小计</td>
	<td  width="4%">合计（基价）</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
</tr>
<%

	String xmdlmc=null;
	String xmxlmc=null;
	String xmbh=null;
	String xmmc=null;

	String glflbm=null;
	String glflmc=null;

	String glbxh=null;
	String glfxclmc=null;
	String jldwmc=null;
	String lrr=null;
	String lrsj=null;
	double xhl=0;
	double dj=0;
	double je=0;
	String glfxclbm=null;
	String wlllbz=null;
	String lx=null;
	String bz=null;
	double jqsfl=0;
	double bsfl=0;
	double tvocsfl=0;

	int xmjsq=0;
	int gljsq=0;

	ls_sql="SELECT distinct bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,xmdlmc,xmxlmc,bj_jzbjb.xmbh,bj_jzbjb.xmmc";
	ls_sql+=" FROM bj_jzglfxb,bj_jzbjb,bdm_xmdlbm,bdm_xmxlbm  ";
    ls_sql+=" where bj_jzglfxb.xmbh=bj_jzbjb.xmbh and bj_jzglfxb.bjjbbm=bj_jzbjb.bjjbbm ";
    ls_sql+=" and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+)";
	ls_sql+=" and bj_jzglfxb.dqbm='"+dqbm+"' and bj_jzbjb.dqbm='"+dqbm+"'";
    ls_sql+=(String)session.getAttribute("glfxSQL");;
    ls_sql+=" order by bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmjsq++;

		if (xmjsq <= (curPage-1)*xssl)
		{
			continue;
		}
		if (xmjsq > curPage*xssl)
		{
			break;
		}
		
		xmdlmc=cf.fillNull(rs.getString("xmdlmc"));
		xmxlmc=cf.fillNull(rs.getString("xmxlmc"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));


		//合计（基价）
		double hjje=0;
		int hjsl=0;
		int hjjsq=0;
		ls_sql="SELECT ROUND(sum(bj_jzglfxb.xhl*bj_jzglfxb.dj),2),count(bj_jzglfxb.glbxh)";
		ls_sql+=" FROM bj_jzglfxb  ";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			hjje=rs1.getDouble(1);
			hjsl=rs1.getInt(2);
		}
		rs1.close();
		ps1.close();

		hjjsq=hjsl;

		ls_sql="SELECT glflbm,glflmc";
		ls_sql+=" FROM bdm_glflbm";
		ls_sql+=" order by glflbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			glflbm=cf.fillNull(rs1.getString("glflbm"));
			glflmc=cf.fillNull(rs1.getString("glflmc"));

			double xjje=0;
			int xjsl=0;
			int xjjsq=0;
			ls_sql="SELECT ROUND(sum(bj_jzglfxb.xhl*bj_jzglfxb.dj),2),count(*)";
			ls_sql+=" FROM bj_jzglfxb  ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and glflbm='"+glflbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				xjje=rs2.getDouble(1);
				xjsl=rs2.getInt(2);
			}
			rs2.close();
			ps2.close();


			xjjsq=xjsl;

			ls_sql="SELECT bj_jzglfxb.glbxh,bj_jzglfxb.glfxclbm,DECODE(bj_jzglfxb.wlllbz,'Y','需要','N','否') wlllbz,DECODE(bj_jzglfxb.lx,'1','打印','2','不打印') lx,bj_jzglfxb.glfxclmc,bj_jzglfxb.jldwbm,bj_jzglfxb.xhl,bj_jzglfxb.dj,ROUND(bj_jzglfxb.xhl*bj_jzglfxb.dj,2) je,bj_jzglfxb.bz,bj_jzglfxb.lrr,bj_jzglfxb.lrsj,bj_jzglfxb.jqsfl,bj_jzglfxb.bsfl,bj_jzglfxb.tvocsfl   ";
			ls_sql+=" FROM bj_jzglfxb  ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and glflbm='"+glflbm+"'";
			ls_sql+=" order by bj_jzglfxb.glbxh";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				glbxh=cf.fillNull(rs2.getString("glbxh"));
				glfxclbm=cf.fillHtml(rs2.getString("glfxclbm"));
				wlllbz=cf.fillHtml(rs2.getString("wlllbz"));
				lx=cf.fillHtml(rs2.getString("lx"));
				glfxclmc=cf.fillNull(rs2.getString("glfxclmc"));
				jldwmc=cf.fillNull(rs2.getString("jldwbm"));
				xhl=rs2.getDouble("xhl");
				dj=rs2.getDouble("dj");
				je=rs2.getDouble("je");

				bz=cf.fillHtml(rs2.getString("bz"));
				lrr=cf.fillNull(rs2.getString("lrr"));
				lrsj=cf.fillNull(rs2.getDate("lrsj"));

				jqsfl=rs2.getDouble("jqsfl");
				bsfl=rs2.getDouble("bsfl");
				tvocsfl=rs2.getDouble("tvocsfl");

				gljsq++;

				if (hjjsq==hjsl)//开始一项
				{
					hjjsq--;
					xjjsq--;

					%>
					<tr align="center">
						<td rowspan="<%=hjsl%>"><%=xmjsq%></td>
						<td rowspan="<%=hjsl%>"><%=xmdlmc%></td>
						<td rowspan="<%=hjsl%>"><%=xmxlmc%></td>
						<td rowspan="<%=hjsl%>"><%=xmbh%></td>
						<td rowspan="<%=hjsl%>"><%=xmmc%></td>
						<td rowspan="<%=xjsl%>"><%=glflmc%></td>
						<td><%=gljsq%></td>
						<td><%=wlllbz%></td>
						<td><%=lx%></td>
						<td><%=glfxclbm%></td>
						<td><%=glfxclmc%></td>
						<td align="left"><%=bz%></td>
						<td><%=jqsfl%></td>
						<td><%=bsfl%></td>
						<td><%=tvocsfl%></td>
						<td><%=jldwmc%></td>
						<td><%=xhl%></td>
						<td><%=dj%></td>
						<td><%=je%></td>
						<td rowspan="<%=xjsl%>"><%=xjje%></td>
						<td rowspan="<%=hjsl%>"><%=hjje%></td>
						<td rowspan="<%=hjsl%>"><%=lrr%></td>
						<td rowspan="<%=hjsl%>"><%=lrsj%></td>
					</tr>
					<%
				}
				else{
					hjjsq--;

					if (xjjsq==xjsl)
					{
						xjjsq--;

						%>
						<tr align="center">
							<td rowspan="<%=xjsl%>"><%=glflmc%></td>
							<td><%=gljsq%></td>
							<td><%=wlllbz%></td>
							<td><%=lx%></td>
							<td><%=glfxclbm%></td>
							<td><%=glfxclmc%></td>
							<td align="left"><%=bz%></td>
							<td><%=jqsfl%></td>
							<td><%=bsfl%></td>
							<td><%=tvocsfl%></td>
							<td><%=jldwmc%></td>
							<td><%=xhl%></td>
							<td><%=dj%></td>
							<td><%=je%></td>
							<td rowspan="<%=xjsl%>"><%=xjje%></td>
						</tr>
						<%
					}
					else{
						xjjsq--;

						%>
						<tr align="center">
							<td><%=gljsq%></td>
							<td><%=wlllbz%></td>
							<td><%=lx%></td>
							<td><%=glfxclbm%></td>
							<td><%=glfxclmc%></td>
							<td align="left"><%=bz%></td>
							<td><%=jqsfl%></td>
							<td><%=bsfl%></td>
							<td><%=tvocsfl%></td>
							<td><%=jldwmc%></td>
							<td><%=xhl%></td>
							<td><%=dj%></td>
							<td><%=je%></td>
						</tr>
						<%
					}
				}

			}
			rs2.close();
			ps2.close();


		}
		rs1.close();
		ps1.close();

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
</table>

</body>
</html>