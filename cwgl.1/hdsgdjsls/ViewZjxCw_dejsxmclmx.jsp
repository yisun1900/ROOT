<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");

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



%>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER > <B><font size="3">查看基价单价（地区：<%=khbh%>） </font></B></CENTER>
<table border="1" width="120%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">序号</td>
	<td  width="6%">项目编号</td>
	<td  width="14%">项目名称</td>
	<td  width="4%" bgcolor="#E8E8FF">对外单价</td>
	<td  width="5%" bgcolor="#E8E8FF">合计（基价）</td>
	<td  width="4%">分类</td>
	<td  width="5%" bgcolor="#E8E8FF">小计</td>
	<td  width="3%">需到物流领料</td>
	<td  width="4%">结算材料编码</td>
	<td  width="12%">工料名称</td>
	<td  width="10%">品牌</td>
	<td  width="8%">型号规格</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">材料单价</td>
	<td  width="5%">应领材料用量</td>
	<td  width="5%">实领材料用量</td>
	<td  width="5%">材料费</td>
</tr>
<%

	String xmbh=null;
	String xmmc=null;
	String bjlx=null;
	double dwdj=0;

	String glmc=null;
	String cljldwmc=null;
	String pp=null;
	String xhgg=null;
	double dj=0;
	double ylclyl=0;
	double slclyl=0;
	double clf=0;
	String wlbm=null;
	String wlllbz=null;

	int bjxmxh=0;//项目序号

	ls_sql="SELECT distinct bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,bj_bjxmmxh.dj,bj_bjxmmxh.bjlx,bj_bjxmmxh.xmpx ";
	ls_sql+=" FROM cw_dejsxmclmx,bj_bjxmmxh";
    ls_sql+=" where cw_dejsxmclmx.xmbh=bj_bjxmmxh.xmbh and cw_dejsxmclmx.khbh=bj_bjxmmxh.khbh ";
	ls_sql+=" and cw_dejsxmclmx.khbh='"+khbh+"' and bj_bjxmmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_bjxmmxh.xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjxmxh++;

		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		bjlx=cf.fillNull(rs.getString("bjlx"));
		dwdj=rs.getDouble("dj");

		if (bjlx.equals("2"))//1:标准项目;2:自定义项目
		{
			%>
			<tr align="center">
				<td ><%=bjxmxh%></td>
				<td ><%=xmbh%></td>
				<td ><%=xmmc%></td>
				<td bgcolor="#E8E8FF" ><%=dwdj%></td>
				<td bgcolor="#E8E8FF">&nbsp;</td>
				<td>&nbsp;</td>
				<td bgcolor="#E8E8FF">&nbsp;</td>
				<td colspan="11" align="left">自定义项目</td>
			</tr>
			<%

			continue;
		}


		//材料小计
		double clxjje=0;
		int xjsl=0;
		ls_sql="SELECT ROUND(sum(clf),2),count(*)";
		ls_sql+=" FROM cw_dejsxmclmx  ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			clxjje=rs2.getDouble(1);
			xjsl=rs2.getInt(2);
		}
		rs2.close();
		ps2.close();

		//人工小计
		double rgxjje=0;
		ls_sql="SELECT sum(xhl*dj)";
		ls_sql+=" FROM bj_khglfxbh  ";
		ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_khglfxbh.glflbm='2'  ";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			rgxjje=rs2.getDouble(1);
		}
		rs2.close();
		ps2.close();

		//机械小计
		double jjxjje=0;
		ls_sql="SELECT sum(xhl*dj)";
		ls_sql+=" FROM bj_khglfxbh  ";
		ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_khglfxbh.glflbm='3'  ";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			jjxjje=rs2.getDouble(1);
		}
		rs2.close();
		ps2.close();

		//合计（基价）
		double hjje=cf.doubleTrim(clxjje+rgxjje+jjxjje);
		int hjsl=xjsl+2;

		int rowspan=hjsl;//行合并

		//输出材料明细
		ls_sql="SELECT wlbm,DECODE(wlllbz,'Y','需要','N','否') wlllbz,glmc,pp,xhgg,cljldwmc,ylclyl,slclyl,dj,clf";
		ls_sql+=" FROM bdm_cljldwbm,cw_dejsxmclmx  ";
		ls_sql+=" where cw_dejsxmclmx.jldwbm=bdm_cljldwbm.cljldwbm(+) ";
		ls_sql+=" and khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ls_sql+=" order by cw_dejsxmclmx.wlbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			wlbm=cf.fillHtml(rs2.getString("wlbm"));
			wlllbz=cf.fillHtml(rs2.getString("wlllbz"));
			glmc=cf.fillNull(rs2.getString("glmc"));
			pp=cf.fillHtml(rs2.getString("pp"));
			xhgg=cf.fillHtml(rs2.getString("xhgg"));
			cljldwmc=cf.fillNull(rs2.getString("cljldwmc"));
			ylclyl=rs2.getDouble("ylclyl");
			slclyl=rs2.getDouble("slclyl");
			dj=rs2.getDouble("dj");
			clf=rs2.getDouble("clf");


			if (rowspan==hjsl)//开始新的报价项目
			{
				rowspan--;

				%>
				<tr align="center">
					<td rowspan="<%=hjsl%>"><%=bjxmxh%></td>
					<td rowspan="<%=hjsl%>"><%=xmbh%></td>
					<td rowspan="<%=hjsl%>"><%=xmmc%></td>
					<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=dwdj%></td>
					<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=hjje%></td>
					<td rowspan="<%=xjsl%>">材料</td>
					<td rowspan="<%=xjsl%>" bgcolor="#E8E8FF"><%=clxjje%></td>
					<td><%=wlllbz%></td>
					<td><%=wlbm%></td>
					<td><%=glmc%></td>
					<td><%=pp%></td>
					<td><%=xhgg%></td>
					<td><%=cljldwmc%></td>
					<td><%=dj%></td>
					<td><%=ylclyl%></td>
					<td><%=slclyl%></td>
					<td><%=clf%></td>
				</tr>
				<%
			}
			else{
				rowspan--;
				%>
				<tr align="center">
					<td><%=wlllbz%></td>
					<td><%=wlbm%></td>
					<td><%=glmc%></td>
					<td><%=pp%></td>
					<td><%=xhgg%></td>
					<td><%=cljldwmc%></td>
					<td><%=dj%></td>
					<td><%=ylclyl%></td>
					<td><%=slclyl%></td>
					<td><%=clf%></td>
				</tr>
				<%
			}

		}
		rs2.close();
		ps2.close();

		%>
		<tr align="center">
			<td >人工</td>
			<td bgcolor="#E8E8FF"><%=rgxjje%></td>
			<td colspan="10">&nbsp;</td>
		</tr>
		<tr align="center">
			<td >机械</td>
			<td bgcolor="#E8E8FF"><%=jjxjje%></td>
			<td colspan="10">&nbsp;</td>
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