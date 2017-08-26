<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
String bgcolor="";


try {
	conn=cf.getConnection();

	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;'  >
<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="0000526" >

  <table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td width="3%" align="center">序号</td>
	  <td width="9%" align="center">类别</td>
	  <td width="11%" align="center">项目</td>
	  <td width="12%" align="center">产品类别</td>
	  <td width="6%" align="center">选主材</td>
	  <td width="7%" align="center">标准数量</td>
	  <td width="7%" align="center">实际数量</td>
	  <td width="6%" align="center">减免</td>
	  <td  width="7%" align="center">减免数量</td>
	  <td align="center" width="39%">主材升级级别说明</td>
    </tr>

<%
	String tccplbbm=null;
	String tccpdlbm=null;
	String clxlmc=null;
	String cldlmc=null;
	String jgwzbm=null;
	String lx=null;
	double zdmfsl=0;//标准数量
	double sjjmsl=0;//实际减免数量
	double sjsl=0;//实际数量
	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,zdmfsl,sjjmsl,sjsl";
	ls_sql+=" from  tc_khmmjgb,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_khmmjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_khmmjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		zdmfsl=rs.getDouble("zdmfsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");

		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="8" align="center">一</td>
		  <td rowspan="8" align="center">机加工类</td>
		  <td rowspan="4" align="center">门</td>
		  <td align="center"><%=clxlmc%></td>
		  <td align="center"><a href="InsertBj_khzcxmMm.jsp?khbh=<%=khbh%>&khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
		  <td><%=cf.formatDouble(zdmfsl)%></td>
		  <td><%=cf.formatDouble(sjsl)%></td>
		  <td rowspan="4" align="center"><a href="zcjmMm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>" target="_blank">减免</a></td>
		  <td><%=cf.formatDouble(sjjmsl)%></td>
		  <td align="left"></td>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		zdmfsl=rs.getDouble("zdmfsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");

		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td align="center"><a href="InsertBj_khzcxmMm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
		  <td><%=cf.formatDouble(zdmfsl)%></td>
		  <td><%=cf.formatDouble(sjsl)%></td>
		  <td><%=cf.formatDouble(sjjmsl)%></td>
		  <td align="left"></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();



	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,zdmfsl,sjjmsl,sjsl";
	ls_sql+=" from  tc_khcgjgb,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_khcgjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_khcgjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		zdmfsl=rs.getDouble("zdmfsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");

		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="4">橱柜</td>
		  <td align="center"><%=clxlmc%></td>
		  <td align="center"><a href="InsertBj_khzcxmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
		  <td><%=cf.formatDouble(zdmfsl)%></td>
		  <td><%=cf.formatDouble(sjsl)%></td>
		  <td align="center"><a href="zcjmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">减免</a></td>
		  <td><%=cf.formatDouble(sjjmsl)%></td>
		  <td align="left"></td>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		zdmfsl=rs.getDouble("zdmfsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");

		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td align="center"><a href="InsertBj_khzcxmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
		  <td><%=cf.formatDouble(zdmfsl)%></td>
		  <td><%=cf.formatDouble(sjsl)%></td>
		  <td align="center"><a href="zcjmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">减免</a></td>
		  <td><%=cf.formatDouble(sjjmsl)%></td>
		  <td align="left"></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	int hbsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  tc_khjjjgb";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int row=0;
	ls_sql="select distinct jgwzbm";
	ls_sql+=" from  tc_khjjjgb";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by jgwzbm desc ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		int fjsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  tc_khjjjgb";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
		ls_sql+=" ,sjjmsl,sjsl";
		ls_sql+=" from  tc_khjjjgb,jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where tc_khjjjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_khjjjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by jgwzbm desc,tccpdlbm,tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			row++;

			if (row==1)//第一行
			{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td rowspan="<%=hbsl%>" align="center">二</td>
				  <td rowspan="<%=hbsl%>" align="center">洁具</td>
				  <td align="center" rowspan="<%=fjsl%>"><%=jgwzbm%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td align="center"><a href="InsertBj_khzcxmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
				  <td>1</td>
				  <td><%=cf.formatDouble(sjsl)%></td>
				  <td align="center"><a href="zcjmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">减免</a></td>
				  <td><%=cf.formatDouble(sjjmsl)%></td>
				  <td align="left"></td>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td align="center" rowspan="<%=fjsl%>"><%=jgwzbm%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td align="center"><a href="InsertBj_khzcxmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
				  <td>1</td>
				  <td><%=cf.formatDouble(sjsl)%></td>
				  <td align="center"><a href="zcjmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">减免</a></td>
				  <td><%=cf.formatDouble(sjjmsl)%></td>
				  <td align="left"></td>
				</tr>
				<%
			}

		}

		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			row++;

			%>
			<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td align="center"><%=clxlmc%></td>
			  <td align="center"><a href="InsertBj_khzcxmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
			  <td>1</td>
			  <td><%=cf.formatDouble(sjsl)%></td>
			  <td align="center"><a href="zcjmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">减免</a></td>
			  <td><%=cf.formatDouble(sjjmsl)%></td>
			  <td align="left"></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();


	ls_sql="select count(*)";
	ls_sql+=" from  tc_khczjgb";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	row=0;
	ls_sql="select distinct jgwzbm";
	ls_sql+=" from  tc_khczjgb";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by jgwzbm desc ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		int fjsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  tc_khczjgb";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc,jgwzbm,lx";
		ls_sql+=" ,sjjmsl,sjsl";
		ls_sql+=" from  tc_khczjgb,jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where tc_khczjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_khczjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by jgwzbm desc,tccpdlbm,tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");
			jgwzbm=rs.getString("jgwzbm");
			lx=cf.fillNull(rs.getString("lx"));

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			row++;

			if (lx.equals("2"))//1：套餐内；2：套餐外
			{
				if (row==1)
				{
					%>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="<%=hbsl%>" align="center">三</td>
					  <td rowspan="<%=hbsl%>" align="center">瓷砖</td>
					  <td align="center" rowspan="<%=fjsl%>" ><%=jgwzbm%></td>
					  <td align="center"><%=clxlmc%>（套餐外）</td>
					  <td align="center"><a href="InsertBj_khzcxmCzTcw.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
					  <td>&nbsp</td>
					  <td><%=cf.formatDouble(sjsl)%></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left">需额外收费</td>
					</tr>
					<%
				}
				else{
					%>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td align="center" rowspan="<%=fjsl%>" ><%=jgwzbm%></td>
					  <td align="center"><%=clxlmc%>（套餐外）</td>
					  <td align="center"><a href="InsertBj_khzcxmCzTcw.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
					  <td>&nbsp</td>
					  <td><%=cf.formatDouble(sjsl)%></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left">需额外收费</td>
					</tr>
					<%
				}
			}
			else{//1：套餐内
				if (row==1)
				{
					%>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="<%=hbsl%>" align="center">三</td>
					  <td rowspan="<%=hbsl%>" align="center">瓷砖</td>
					  <td align="center" rowspan="<%=fjsl%>" ><%=jgwzbm%></td>
					  <td align="center"><%=clxlmc%></td>
					  <td align="center"><a href="InsertBj_khzcxmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
					  <td>&nbsp</td>
					  <td><%=cf.formatDouble(sjsl)%></td>
					  <td align="center"><a href="zcjmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">减免</a></td>
					  <td><%=cf.formatDouble(sjjmsl)%></td>
					  <td align="left"></td>
					</tr>
					<%
				}
				else{
					%>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td align="center" rowspan="<%=fjsl%>" ><%=jgwzbm%></td>
					  <td align="center"><%=clxlmc%></td>
					  <td align="center"><a href="InsertBj_khzcxmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
					  <td>&nbsp</td>
					  <td><%=cf.formatDouble(sjsl)%></td>
					  <td align="center"><a href="zcjmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">减免</a></td>
					  <td><%=cf.formatDouble(sjjmsl)%></td>
					  <td align="left"></td>
					</tr>
					<%
				}
			}
		}

		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");
			jgwzbm=rs.getString("jgwzbm");
			lx=cf.fillNull(rs.getString("lx"));

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			row++;

			if (lx.equals("2"))//1：套餐内；2：套餐外
			{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td align="center"><%=clxlmc%>（套餐外）</td>
				  <td align="center"><a href="InsertBj_khzcxmCzTcw.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
				  <td>&nbsp</td>
				  <td><%=cf.formatDouble(sjsl)%></td>
				  <td>&nbsp</td>
				  <td>&nbsp</td>
				  <td align="left">需额外收费</td>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td align="center"><%=clxlmc%></td>
				  <td align="center"><a href="InsertBj_khzcxmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">选择</a></td>
				  <td>&nbsp</td>
				  <td><%=cf.formatDouble(sjsl)%></td>
				  <td align="center"><a href="zcjmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">减免</a></td>
				  <td><%=cf.formatDouble(sjjmsl)%></td>
				  <td align="left"></td>
				</tr>
				<%
			}
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();


	ls_sql="select count(*)";
	ls_sql+=" from  tc_khlkbjgb";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	row=0;
	ls_sql="select distinct jgwzbm";
	ls_sql+=" from  tc_khlkbjgb";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by jgwzbm desc ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		int fjsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  tc_khlkbjgb";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
		ls_sql+=" ,sjjmsl,sjsl";
		ls_sql+=" from  tc_khlkbjgb,jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where tc_khlkbjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_khlkbjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by  tccpdlbm,tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			row++;

			if (row==1)
			{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td rowspan="<%=hbsl%>" align="center">四</td>
				  <td rowspan="<%=hbsl%>" align="center">铝扣板</td>
				  <td align="center" rowspan="<%=fjsl%>"><%=jgwzbm%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
				  <td>&nbsp</td>
				  <td><%=cf.formatDouble(sjsl)%></td>
				  <td align="center"><a href="zcjm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">减免</a></td>
				  <td><%=cf.formatDouble(sjjmsl)%></td>
				  <td align="left"></td>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td align="center" rowspan="<%=fjsl%>"><%=jgwzbm%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
				  <td>&nbsp</td>
				  <td><%=cf.formatDouble(sjsl)%></td>
				  <td align="center"><a href="zcjm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">减免</a></td>
				  <td><%=cf.formatDouble(sjjmsl)%></td>
				  <td align="left"></td>
				</tr>
				<%
			}
		}

		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			row++;


			%>
			<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td align="center"><%=clxlmc%></td>
			  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
			  <td>&nbsp</td>
			  <td><%=cf.formatDouble(sjsl)%></td>
			  <td align="center"><a href="zcjm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">减免</a></td>
			  <td><%=cf.formatDouble(sjjmsl)%></td>
			  <td align="left"></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();


	ls_sql="select count(*)";
	ls_sql+=" from  tc_khdbjgb";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,sjjmsl,sjsl";
	ls_sql+=" from  tc_khdbjgb,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_khdbjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_khdbjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=hbsl%>" align="center">五</td>
		  <td colspan="<%=hbsl%>" rowspan="2" align="center">地板</td>
		  <td align="center"><%=clxlmc%></td>
		  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
		  <td>&nbsp</td>
		  <td><%=cf.formatDouble(sjsl)%></td>
		  <td align="center"><a href="zcjm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>" target="_blank">减免</a></td>
		  <td><%=cf.formatDouble(sjjmsl)%></td>
		  <td align="left"></td>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
		  <td>&nbsp</td>
		  <td><%=cf.formatDouble(sjsl)%></td>
		  <td align="center"><a href="zcjm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">减免</a></td>
		  <td><%=cf.formatDouble(sjjmsl)%></td>
		  <td align="left"></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	int tcwsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  tc_cytcwxm,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_cytcwxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_cytcwxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	tcwsl++;

	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" from  tc_cytcwxm,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_cytcwxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_cytcwxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
    ls_sql+=" order by dqbm,bjjbbm,tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=tcwsl%>" align="center">六</td>
		  <td rowspan="<%=tcwsl%>" align="center">套餐外</td>
		  <td align="center"><%=cldlmc%></td>
		  <td align="center"><%=clxlmc%></td>
		  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
		  <td align="center">0.0</td>
		  <td >&nbsp;</td>
		  <td >&nbsp;</td>
		  <td >&nbsp;</td>
		  <td align="left">需额外收费</td>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=cldlmc%></td>
		  <td align="center"><%=clxlmc%></td>
		  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">选择</a></td>
		  <td align="center">0.0</td>
		  <td >&nbsp;</td>
		  <td >&nbsp;</td>
		  <td >&nbsp;</td>
		  <td align="left">需额外收费</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>

	<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td align="center" colspan="2">其它主材</td>
	  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>" target="_blank">选择</a></td>
	  <td align="center">&nbsp;</td>
	  <td >&nbsp;</td>
	  <td >&nbsp;</td>
	  <td >&nbsp;</td>
	  <td align="left">需额外收费</td>
	</tr>

	<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td rowspan="1" align="center">七</td>
	  <td colspan="2" rowspan="1" align="center">油漆</td>
	  <td align="center">品牌、色号</td>
	  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&tccpdlbm=14&tccplbbm=37" target="_blank">选择</a></td>
	  <td >&nbsp;</td>
	  <td >&nbsp;</td>
	  <td  rowspan="1" align="center">&nbsp;</td>
	  <td align="center">&nbsp;</td>
	  <td align="left">标准3个颜色，每增加1个加200</td>
	</tr>

<%
	ls_sql="select count(*)";
	ls_sql+=" from  tc_khlbmx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String lbxmbm=null;
	String lbmc=null;
	String xmmc=null;
	String ppmc=null;
	String xh=null;
	String jldw=null;
	double dj=0;
	double sl=0;
	String bz=null;
//	String lx=null;
	ls_sql="select lbxmbm,lbmc,xmmc,ppmc,xh,jldw,dj,sl,bz,lx ";
	ls_sql+=" from  tc_khlbmx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by lbxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lbxmbm=cf.fillNull(rs.getString("lbxmbm"));
		lbmc=cf.fillNull(rs.getString("lbmc"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		bz=cf.fillNull(rs.getString("bz"));
		lx=cf.fillNull(rs.getString("lx"));


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=hbsl%>" align="center">八</td>
		  <td rowspan="<%=hbsl%>" align="center"><%=lbmc%></td>
		  <td align="center"><%=xmmc%></td>
		  <td align="center"><%=ppmc%></td>
			<%
			if (lx.equals("2"))//1：工程；2：主材
			{
				%>
				  <td><a href="lbsj.jsp?khbh=<%=khbh%>&lbxmbm=<%=lbxmbm%>" target="_blank">选择</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
			%>
		  <td ><%=sl%></td>
		  <td >&nbsp;</td>
		  <td align="center">&nbsp;</td>
		  <td align="center">&nbsp;</td>
		  <td align="left"><%=xh%></td>
		</tr>
		<%
	}

	while (rs.next())
	{
		lbxmbm=cf.fillNull(rs.getString("lbxmbm"));
		lbmc=cf.fillNull(rs.getString("lbmc"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		bz=cf.fillNull(rs.getString("bz"));
		lx=cf.fillNull(rs.getString("lx"));


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=xmmc%></td>
		  <td align="center"><%=ppmc%></td>
			<%
			if (lx.equals("2"))//1：工程；2：主材
			{
				%>
				  <td><a href="lbsj.jsp?khbh=<%=khbh%>&lbxmbm=<%=lbxmbm%>" target="_blank">选择</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
			%>
		  <td ><%=sl%></td>
		  <td >&nbsp;</td>
		  <td align="center">&nbsp;</td>
		  <td align="center">&nbsp;</td>
		  <td align="left"><%=xh%></td>
		</tr>
		<%
	}

	rs.close();
	ps.close();

%>
  </table>

</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
//-->
</script>

