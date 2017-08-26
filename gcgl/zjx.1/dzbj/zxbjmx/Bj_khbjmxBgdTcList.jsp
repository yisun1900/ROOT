<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
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

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double zqdj=0;
double dj=0;
double ysl=0;
double yzqje=0;
double yje=0;
double sl=0;
double zqqye=0;
double qye=0;
double zjsl=0;
double zqzjje=0;
double zjje=0;

String gycl=null;

double allyzqje=0;
double allyje=0;
double allzqqye=0;
double allqye=0;
double allzqzjje=0;
double allzjje=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<center>
  <strong>工程变更单</strong>
</center>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>客户姓名：<%=khxm%></td>
    <td>联系方式：<%=lxfs%></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>工程地点：<%=fwdz%></td>
    <td>设 计 师：<%=sjs%></td>
    <td>工程等级：<%=bjjb%></td>
  </tr>
</table>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="3%">序号</td>
    <td  width="8%">项目编号</td>
    <td  width="18%">项目名称</td>
    <td  width="7%">套餐内标志</td>
	<td  width="5%">单位</td>
    <td  width="5%">单价:元</td>
    <td  width="6%">标准数量</td>
    <td  width="6%">原数量</td>
    <td  width="6%">新数量</td>
    <td  width="6%">增减数量</td>
    <td  width="6%">计价数量</td>
    <td  width="9%">增减金额（元）</td>
  </tr>

<%

	String lx="&nbsp;";
	int i=0;
	String sfxzsl=null;
	String tcnxmbz=null;
	String tcnxmbzmc=null;
	double bzsl=0;
	double sjsl=0;
	double xjjsl=0;
	double xjsl=0;
	double xjqye=0;
	double allsl=0;
	String flmcgg=null;

	double sjslH=0;
	double xjjslH=0;
	double sjslQ=0;
	double xjjslQ=0;
	ls_sql="select bj_khgcxmxjh.sfxzsl,bj_khgcxmxjh.tcnxmbz,DECODE(bj_khgcxmxjh.tcnxmbz,'Y','是','N','套餐外') tcnxmbzmc,bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_khgcxmxjh.bzsl,bj_khgcxmxjh.sjsl,bj_khgcxmxjh.xjjsl";
	ls_sql+=" from  bj_khgcxmxjh,bj_bjxmmxh,jdm_jldwbm";
	ls_sql+=" where bj_khgcxmxjh.zjxxh=bj_bjxmmxh.zjxxh and bj_khgcxmxjh.xmbh=bj_bjxmmxh.xmbh ";
	ls_sql+=" and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_khgcxmxjh.khbh='"+khbh+"' and bj_khgcxmxjh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khgcxmxjh.tcnxmbz='Y'";//套餐内项目标志  Y：是；N：否
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));
		tcnxmbz=cf.fillNull(rs1.getString("tcnxmbz"));
		tcnxmbzmc=cf.fillNull(rs1.getString("tcnxmbzmc"));
		xmbh=rs1.getString("xmbh");
		xmmc=cf.fillHtml(rs1.getString("xmmc"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		zqdj=rs1.getDouble("zqdj");
		bzsl=rs1.getDouble("bzsl");
		sjslH=rs1.getDouble("sjsl");
		xjjslH=rs1.getDouble("xjjsl");

 
		//输出增减后项目明细
		sjslQ=0;
		xjjslQ=0;
		ls_sql="SELECT sjsl,xjjsl";
		ls_sql+=" FROM bj_khgcxmxjq";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjslQ=rs.getDouble("sjsl");
			xjjslQ=rs.getDouble("xjjsl");
		}
		rs.close();
		ps.close();

		if (sjslH==sjslQ)
		{
			continue;
		}

		sl=xjjslH-xjjslQ;


		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;


		//判断增减情况
		lx="&nbsp;";
		if (sl>0)
		{
			lx="<font color=\"#990000\">＋增量</font>";
		}
		else if (sl<ysl)
		{
			lx="<font color=\"#0000CC\">－减量</font>";
		}

		row++;

		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=row%></td>
			<td><%=xmbh%></td>
			<td><%=xmmc%></td>
			<td>套餐内增量</td>
			<td><%=jldwmc%></td>
			<td><%=zqdj%></td>
			<td><%=bzsl%></td>
			<td><%=sjslQ%></td>
			<td><%=sjslH%></td>
			<td><%=cf.formatDouble(sjslH-sjslQ)%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();


	//输出被删掉项目明细
	ls_sql="select bj_khgcxmxjq.sfxzsl,bj_khgcxmxjq.tcnxmbz,DECODE(bj_khgcxmxjq.tcnxmbz,'Y','是','N','套餐外') tcnxmbzmc,bj_bjxmmxq.xmbh,bj_bjxmmxq.xmmc,bj_bjxmmxq.xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_khgcxmxjq.bzsl,bj_khgcxmxjq.sjsl,bj_khgcxmxjq.xjjsl";
	ls_sql+=" from  bj_khgcxmxjq,bj_bjxmmxq,jdm_jldwbm";
	ls_sql+=" where bj_khgcxmxjq.zjxxh=bj_bjxmmxq.zjxxh and bj_khgcxmxjq.xmbh=bj_bjxmmxq.xmbh ";
	ls_sql+=" and bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_khgcxmxjq.khbh='"+khbh+"' and bj_khgcxmxjq.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khgcxmxjq.xmbh not in(SELECT xmbh from bj_khgcxmxjh where zjxxh='"+zjxxh+"') ";
	ls_sql+=" and bj_khgcxmxjq.tcnxmbz='Y'";//套餐内项目标志  Y：是；N：否
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));
		tcnxmbz=cf.fillNull(rs1.getString("tcnxmbz"));
		tcnxmbzmc=cf.fillNull(rs1.getString("tcnxmbzmc"));
		xmbh=rs1.getString("xmbh");
		xmmc=cf.fillHtml(rs1.getString("xmmc"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		zqdj=rs1.getDouble("zqdj");
		bzsl=rs1.getDouble("bzsl");
		sjslQ=rs1.getDouble("sjsl");
		xjjslQ=rs1.getDouble("xjjsl");

 
		//输出增减后项目明细
		sjslH=0;
		xjjslH=0;

		sl=xjjslH-xjjslQ;


		if (sjslH==sjslQ)
		{
			continue;
		}

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;


		//判断增减情况
		lx="&nbsp;";
		if (sl>0)
		{
			lx="<font color=\"#990000\">＋增量</font>";
		}
		else if (sl<ysl)
		{
			lx="<font color=\"#0000CC\">－减量</font>";
		}


		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=row%></td>
			<td><%=xmbh%></td>
			<td><%=xmmc%></td>
			<td>套餐内增量</td>
			<td><%=jldwmc%></td>
			<td><%=zqdj%></td>
			<td><%=bzsl%></td>
			<td><%=sjslQ%></td>
			<td><%=sjslH%></td>
			<td><%=cf.formatDouble(sjslH-sjslQ)%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	//套餐外项目增减
	ls_sql="SELECT bj_bjxmmxh.xmbh,xmmc,bj_bjxmmxh.zqdj,jldwmc,sum(bj_gclmxh.sl) sl";
	ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
	ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' ";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" and bj_bjxmmxh.tcnxmbz='N'";//套餐内项目标志  Y：是；N：否
	ls_sql+=" group by bj_bjxmmxh.xmbh,xmmc,bj_bjxmmxh.zqdj,jldwmc";
	ls_sql+=" order by bj_bjxmmxh.xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		xmbh=rs1.getString("xmbh");
		xmmc=cf.fillHtml(rs1.getString("xmmc"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		zqdj=rs1.getDouble("zqdj");
		sjslH=rs1.getDouble("sl");

		//输出增减后项目明细
		sjslQ=0;
		ls_sql="SELECT sum(sl) sl";
		ls_sql+=" FROM bj_gclmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjslQ=rs.getDouble("sl");
		}
		rs.close();
		ps.close();

		sl=sjslH-sjslQ;

		if (sl==0)
		{
			continue;
		}

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;


		//判断增减情况
		lx="&nbsp;";
		if (sl>0)
		{
			lx="<font color=\"#990000\">＋增量</font>";
		}
		else if (sl<ysl)
		{
			lx="<font color=\"#0000CC\">－减量</font>";
		}


		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=row%></td>
			<td><%=xmbh%></td>
			<td><%=xmmc%></td>
			<td>套餐外</td>
			<td><%=jldwmc%></td>
			<td><%=zqdj%></td>
			<td><%=bzsl%></td>
			<td><%=sjslQ%></td>
			<td><%=sjslH%></td>
			<td><%=cf.formatDouble(sjslH-sjslQ)%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();


	//输出被删掉项目明细
	ls_sql="SELECT bj_bjxmmxq.xmbh,xmmc,bj_bjxmmxq.zqdj,jldwmc,sum(bj_gclmxq.sl) sl";
	ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
	ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmxq.zjxxh='"+zjxxh+"' ";
	ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
	ls_sql+=" and bj_bjxmmxq.tcnxmbz='N'";//套餐内项目标志  Y：是；N：否
	ls_sql+=" and bj_bjxmmxq.xmbh not in(SELECT xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"') ";
	ls_sql+=" group by bj_bjxmmxq.xmbh,xmmc,bj_bjxmmxq.zqdj,jldwmc";
	ls_sql+=" order by bj_bjxmmxq.xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		xmbh=rs1.getString("xmbh");
		xmmc=cf.fillHtml(rs1.getString("xmmc"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		zqdj=rs1.getDouble("zqdj");
		sjslQ=rs1.getDouble("sl");

		//输出增减后项目明细
		sjslH=0;
		ls_sql="SELECT sum(sl) sl";
		ls_sql+=" FROM bj_gclmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjslH=rs.getDouble("sl");
		}
		rs.close();
		ps.close();

		sl=sjslH-sjslQ;

		if (sl==0)
		{
			continue;
		}

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;


		//判断增减情况
		lx="&nbsp;";
		if (sl>0)
		{
			lx="<font color=\"#990000\">＋增量</font>";
		}
		else if (sl<ysl)
		{
			lx="<font color=\"#0000CC\">－减量</font>";
		}


		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=row%></td>
			<td><%=xmbh%></td>
			<td><%=xmmc%></td>
			<td>套餐外</td>
			<td><%=jldwmc%></td>
			<td><%=zqdj%></td>
			<td><%=bzsl%></td>
			<td><%=sjslQ%></td>
			<td><%=sjslH%></td>
			<td><%=cf.formatDouble(sjslH-sjslQ)%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="5"><B>工程项目小计</B></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=cf.formatDouble(xjsl)%></td>
	<td><%=cf.formatDouble(xjqye,"#########.##")%></td>
  </tr>
</table>



<table width="100%" border="0">
  <tr> 
    <td height="33">甲方签字：</td>
    <td height="33">乙方签字：</td>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>