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
double zk=0;
double dj=0;

double zjhsl=0;
double zjhzqje=0;
double zjhzhje=0;

double zjqsl=0;
double zjqzqje=0;
double zjqzhje=0;

double zjsl=0;
double zqzjje=0;
double zhzjje=0;


double xjzjhsl=0;
double xjzjhzqje=0;
double xjzjhzhje=0;

double xjzjqsl=0;
double xjzjqzqje=0;
double xjzjqzhje=0;


double xjzjsl=0;
double xjzhzjje=0;
double xjzqzjje=0;

double allzjhsl=0;
double allzjhzqje=0;
double allzjhzhje=0;

double allzjqsl=0;
double allzjqzqje=0;
double allzjqzhje=0;


double allzjsl=0;
double allzhzjje=0;
double allzqzjje=0;

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
    <td  width="7%">项目编号</td>
    <td  width="20%">项目名称</td>
    <td  width="5%">单位</td>
    <td  width="6%">折前单价</td>
    <td  width="4%">折扣</td>
    <td  width="6%">折后单价</td>
    <td  width="6%">增减前数量</td>
    <td  width="8%">增减前金额</td>
    <td  width="6%">增减后数量</td>
    <td  width="8%">增减后金额</td>
    <td  width="6%">增减数量</td>
    <td  width="8%">折前增减金额</td>
    <td  width="8%">折后增减金额</td>
  </tr>

<%
//原有、未删除房间信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	int i=0;
	ls_sql="SELECT bj_fjxxq.jgwzbm";
	ls_sql+=" FROM bj_fjxxq ";
    ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm in(SELECT jgwzbm FROM bj_fjxxh where khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
	ls_sql+=" order by bj_fjxxq.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjzjhsl=0;
		xjzjhzqje=0;
		xjzjhzhje=0;

		xjzjqsl=0;
		xjzjqzqje=0;
		xjzjqzhje=0;


		xjzjsl=0;
		xjzhzjje=0;
		xjzqzjje=0;
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="14"> 
			  <div><b><i><font size="3">结构位置：<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		//输出增减后项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,bj_bjxmmxh.xmbh,xmmc,jldwmc,bj_bjxmmxh.zk,bj_bjxmmxh.dj,bj_bjxmmxh.zqdj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.zqdj as zjhzqje,bj_gclmxh.sl*bj_bjxmmxh.dj as zjhzhje";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"' and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" order by bj_bjxmmxh.xmpx";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zk=rs.getDouble("zk");
			dj=rs.getDouble("dj");
			zqdj=rs.getDouble("zqdj");
			zjhsl=rs.getDouble("sl");
			zjhzqje=rs.getDouble("zjhzqje");
			zjhzhje=rs.getDouble("zjhzhje");



			//获取增减前项目明细
			zjqsl=-1;
			zjqzqje=-1;
			zjqzhje=-1;

			ls_sql="SELECT sl,sl*"+zqdj+",sl*"+dj;
			ls_sql+=" FROM bj_gclmxq ";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"' and xmbh='"+xmbh+"' and zjxxh='"+zjxxh+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				zjqsl=rs2.getDouble(1);
				zjqzqje=rs2.getDouble(2);
				zjqzhje=rs2.getDouble(3);
			}
			rs2.close();
			ps2.close();

			//判断增减情况
			if (zjqsl==-1)
			{
				xmmc="<font color=\"#FF0000\">"+xmmc+"（新增项目）</font>";
				zjqsl=0;
				zjqzqje=0;
				zjqzhje=0;
			}
			else{
				if (zjhsl>zjqsl)
				{
					xmmc="<font color=\"#990000\">"+xmmc+"（工程量增加）</font>";
				}
				else if (zjhsl<zjqsl)
				{
					xmmc="<font color=\"#0000CC\">"+xmmc+"（工程量减少）</font>";
				}
			}

			zjsl=zjhsl-zjqsl;
			zqzjje=zjhzqje-zjqzqje;
			zhzjje=zjhzhje-zjqzhje;

			xjzjhsl+=zjhsl;
			xjzjhzqje+=zjhzqje;
			xjzjhzhje+=zjhzhje;

			xjzjqsl+=zjqsl;
			xjzjqzqje+=zjqzqje;
			xjzjqzhje+=zjqzhje;

			xjzjsl+=zjsl;
			xjzhzjje+=zhzjje;
			xjzqzjje+=zqzjje;

			allzjhsl+=zjhsl;
			allzjhzqje+=zjhzqje;
			allzjhzhje+=zjhzhje;

			allzjqsl+=zjqsl;
			allzjqzqje+=zjqzqje;
			allzjqzhje+=zjqzhje;


			allzjsl+=zjsl;
			allzhzjje+=zhzjje;
			allzqzjje+=zqzjje;


			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=zqdj%></td>
				<td><%=zk%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(zjqsl)%></td>
				<td><%=cf.formatDouble(zjqzqje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjhsl)%></td>
				<td><%=cf.formatDouble(zjhzqje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqzjje,"#########.##")%></td>
				<td><%=cf.formatDouble(zhzjje,"#########.##")%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();


		//输出被删掉项目明细
		ls_sql="SELECT bj_bjxmmxq.xh xh,bj_bjxmmxq.xmbh,xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_bjxmmxq.zk,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.zqdj as zjqzqje,bj_gclmxq.sl*bj_bjxmmxq.dj as zjqzhje";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.khbh='"+khbh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"' and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxq.khbh=bj_gclmxq.khbh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
		ls_sql+=" and bj_bjxmmxq.xmbh not in(select xmbh from bj_gclmxh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzmc+"')";
		ls_sql+=" order by bj_bjxmmxq.xmpx";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			zk=rs.getDouble("zk");
			dj=rs.getDouble("dj");
			zjqsl=rs.getDouble("sl");
			zjqzqje=rs.getDouble("zjqzqje");
			zjqzhje=rs.getDouble("zjqzhje");

			xmmc="<font color=\"#CC33CC\">"+xmmc+"（减掉项目）</font>";

			zjhsl=0;
			zjhzqje=0;
			zjhzhje=0;

			zjsl=zjhsl-zjqsl;
			zqzjje=zjhzqje-zjqzqje;
			zhzjje=zjhzhje-zjqzhje;

			xjzjhsl+=zjhsl;
			xjzjhzqje+=zjhzqje;
			xjzjhzhje+=zjhzhje;

			xjzjqsl+=zjqsl;
			xjzjqzqje+=zjqzqje;
			xjzjqzhje+=zjqzhje;


			xjzjsl+=zjsl;
			xjzhzjje+=zhzjje;
			xjzqzjje+=zqzjje;

			allzjhsl+=zjhsl;
			allzjhzqje+=zjhzqje;
			allzjhzhje+=zjhzhje;

			allzjqsl+=zjqsl;
			allzjqzqje+=zjqzqje;
			allzjqzhje+=zjqzhje;


			allzjsl+=zjsl;
			allzhzjje+=zhzjje;
			allzqzjje+=zqzjje;


			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=zqdj%></td>
				<td><%=zk%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(zjqsl)%></td>
				<td><%=cf.formatDouble(zjqzqje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjhsl)%></td>
				<td><%=cf.formatDouble(zjhzqje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqzjje,"#########.##")%></td>
				<td><%=cf.formatDouble(zhzjje,"#########.##")%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();


		//输出小计
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="2">小 计</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjzjqsl)%></td>
			<td><%=cf.formatDouble(xjzjqzqje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzjhsl)%></td>
			<td><%=cf.formatDouble(xjzjhzqje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzjsl)%></td>
			<td><%=cf.formatDouble(xjzqzjje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzhzjje,"#########.##")%></td>
		  </tr>
		<%
	}
	rs1.close();
	ps1.close();
//原有房间信息－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

//新增房间信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	i=0;
	ls_sql="SELECT bj_fjxxh.jgwzbm";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm not in(SELECT jgwzbm FROM bj_fjxxq where khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjzjhsl=0;
		xjzjhzhje=0;
		xjzhzjje=0;
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="14"> 
			  <b><i><font size="3">结构位置：<%=jgwzmc%></font></i><font color="#FF0000">（新增房间）</font></b>
			</td>
		  </tr>
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_bjxmmxh.zk,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.zqdj as zjhzqje,bj_gclmxh.sl*bj_bjxmmxh.dj as zjhzhje";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.khbh='"+khbh+"' and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh";
		ls_sql+=" order by bj_bjxmmxh.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			zk=rs.getDouble("zk");
			dj=rs.getDouble("dj");
			zjhsl=rs.getDouble("sl");
			zjhzqje=rs.getDouble("zjhzqje");
			zjhzhje=rs.getDouble("zjhzhje");

			zjqsl=0;
			zjqzqje=0;
			zjqzhje=0;

			zjsl=zjhsl-zjqsl;
			zqzjje=zjhzqje-zjqzqje;
			zhzjje=zjhzhje-zjqzhje;

			xjzjhsl+=zjhsl;
			xjzjhzqje+=zjhzqje;
			xjzjhzhje+=zjhzhje;

			xjzjqsl+=zjqsl;
			xjzjqzqje+=zjqzqje;
			xjzjqzhje+=zjqzhje;


			xjzjsl+=zjsl;
			xjzhzjje+=zhzjje;
			xjzqzjje+=zqzjje;

			allzjhsl+=zjhsl;
			allzjhzqje+=zjhzqje;
			allzjhzhje+=zjhzhje;

			allzjqsl+=zjqsl;
			allzjqzqje+=zjqzqje;
			allzjqzhje+=zjqzhje;


			allzjsl+=zjsl;
			allzhzjje+=zhzjje;
			allzqzjje+=zqzjje;


			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=zqdj%></td>
				<td><%=zk%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(zjqsl)%></td>
				<td><%=cf.formatDouble(zjqzqje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjhsl)%></td>
				<td><%=cf.formatDouble(zjhzqje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqzjje,"#########.##")%></td>
				<td><%=cf.formatDouble(zhzjje,"#########.##")%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//输出小计
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="2">小 计</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjzjqsl)%></td>
			<td><%=cf.formatDouble(xjzjqzqje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzjhsl)%></td>
			<td><%=cf.formatDouble(xjzjhzqje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzjsl)%></td>
			<td><%=cf.formatDouble(xjzqzjje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzhzjje,"#########.##")%></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
//新增房间信息－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

//删除房间信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	i=0;
	ls_sql="SELECT bj_fjxxq.jgwzbm";
	ls_sql+=" FROM bj_fjxxq ";
    ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm not in(SELECT jgwzbm FROM bj_fjxxh where khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
	ls_sql+=" order by bj_fjxxq.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjzjhsl=0;
		xjzjhzhje=0;
		xjzhzjje=0;
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="14"> 
			  <div><b><i><font size="3">结构位置：<%=jgwzmc%></font></i><font color="#CC33CC">（减掉房间）</font></b></div>
			</td>
		  </tr>
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxq.xh xh,bj_bjxmmxq.xmbh,xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_bjxmmxq.zk,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.zqdj as zjqzqje,bj_gclmxq.sl*bj_bjxmmxq.dj as zjqzhje";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.khbh='"+khbh+"' and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxq.khbh=bj_gclmxq.khbh and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh";
		ls_sql+=" order by bj_bjxmmxq.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			zk=rs.getDouble("zk");
			dj=rs.getDouble("dj");
			zjqsl=rs.getDouble("sl");
			zjqzqje=rs.getDouble("zjqzqje");
			zjqzhje=rs.getDouble("zjqzhje");

			zjhsl=0;
			zjhzqje=0;
			zjhzhje=0;

			zjsl=zjhsl-zjqsl;
			zqzjje=zjhzqje-zjqzqje;
			zhzjje=zjhzhje-zjqzhje;

			xjzjhsl+=zjhsl;
			xjzjhzqje+=zjhzqje;
			xjzjhzhje+=zjhzhje;

			xjzjqsl+=zjqsl;
			xjzjqzqje+=zjqzqje;
			xjzjqzhje+=zjqzhje;


			xjzjsl+=zjsl;
			xjzhzjje+=zhzjje;
			xjzqzjje+=zqzjje;

			allzjhsl+=zjhsl;
			allzjhzqje+=zjhzqje;
			allzjhzhje+=zjhzhje;

			allzjqsl+=zjqsl;
			allzjqzqje+=zjqzqje;
			allzjqzhje+=zjqzhje;


			allzjsl+=zjsl;
			allzhzjje+=zhzjje;
			allzqzjje+=zqzjje;


			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=zqdj%></td>
				<td><%=zk%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(zjqsl)%></td>
				<td><%=cf.formatDouble(zjqzqje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjhsl)%></td>
				<td><%=cf.formatDouble(zjhzqje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqzjje,"#########.##")%></td>
				<td><%=cf.formatDouble(zhzjje,"#########.##")%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//输出小计
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="2">小 计</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjzjqsl)%></td>
			<td><%=cf.formatDouble(xjzjqzqje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzjhsl)%></td>
			<td><%=cf.formatDouble(xjzjhzqje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzjsl)%></td>
			<td><%=cf.formatDouble(xjzqzjje,"#########.##")%></td>
			<td><%=cf.formatDouble(xjzhzjje,"#########.##")%></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
//删除房间信息－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
%> 
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="2">合 计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allzjqsl)%></td>
	<td><%=cf.formatDouble(allzjqzqje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzjhsl)%></td>
	<td><%=cf.formatDouble(allzjhzqje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzjsl)%></td>
	<td><%=cf.formatDouble(allzqzjje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzhzjje,"#########.##")%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="9"> 
      <div><b><i><font size="3">综合取费</font></i></b></div>    </td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center">
    <td width="20%" rowspan="2">项目名称</td>
    <td width="6%" rowspan="2">折扣</td>
    <td colspan="2">增减前</td>
    <td colspan="2">增减后</td>
    <td colspan="2">增减金额</td>
    <td width="50%" rowspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td width="8%">折前金额</td>
    <td width="8%">折后金额</td>
    <td width="8%">折前金额</td>
    <td width="8%">折后金额</td>
    <td width="8%">折前</td>
    <td width="8%">折后</td>
  </tr>
  <%  
	double dxzkl=0;
	double zjqqtzqje=0;
	double zjqqtzhje=0;

	double zjhqtzqje=0;
	double zjhqtzhje=0;

	double zqqtzjje=0;
	double zhqtzjje=0;

	double allzjqqtzqje=0;
	double allzjqqtzhje=0;
	double allzjhqtzqje=0;
	double allzjhqtzhje=0;
	double allzqqtzjje=0;
	double allzhqtzjje=0;

	double allzjje=0;
	String sfxmbm=null;
	String sfxmmc=null;
	String bz=null;
	String color=null;
	ls_sql="SELECT sfxmbm,sfxmmc,dxzkl,zqsfje,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		dxzkl=rs.getDouble("dxzkl");
		zjhqtzqje=rs.getDouble("zqsfje");
		zjhqtzhje=rs.getDouble("sfje");

		zjqqtzqje=0;
		zjqqtzhje=0;
		ls_sql="SELECT zqsfje,sfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjqqtzqje=rs1.getDouble("zqsfje");
			zjqqtzhje=rs1.getDouble("sfje");
		}
		rs1.close();
		ps1.close();

		zqqtzjje=zjhqtzqje-zjqqtzqje;
		zhqtzjje=zjhqtzhje-zjqqtzhje;

		allzjqqtzqje+=zjqqtzqje;
		allzjqqtzhje+=zjqqtzhje;

		allzjhqtzqje+=zjhqtzqje;
		allzjhqtzhje+=zjhqtzqje;

		allzqqtzjje+=zqqtzjje;
		allzhqtzjje+=zhqtzjje;

		if (zjhqtzqje!=zjqqtzqje)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}


		%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		<td><%=sfxmmc%></td>
		<td><%=dxzkl%></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjqqtzqje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjqqtzhje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjhqtzqje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjhqtzhje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zqqtzjje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zhqtzjje,"#########.##")%></font></td>
		<td align="left" ><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sfxmbm,sfxmmc,dxzkl,zqsfje,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxq  ";
    ls_sql+=" where bj_sfxmmxq.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" and bj_sfxmmxq.sfxmbm not in(SELECT sfxmbm FROM bj_sfxmmxh where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
    ls_sql+=" order by bj_sfxmmxq.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		dxzkl=rs.getDouble("dxzkl");
		zjqqtzqje=rs.getDouble("zqsfje");
		zjqqtzhje=rs.getDouble("sfje");

		zjhqtzqje=0;
		zjhqtzhje=0;

		zqqtzjje=zjhqtzqje-zjqqtzqje;
		zhqtzjje=zjhqtzhje-zjqqtzhje;

		allzjqqtzqje+=zjqqtzqje;
		allzjqqtzhje+=zjqqtzhje;

		allzjhqtzqje+=zjhqtzqje;
		allzjhqtzhje+=zjhqtzqje;

		allzqqtzjje+=zqqtzjje;
		allzhqtzjje+=zhqtzjje;

		if (zjhqtzqje!=zjqqtzqje)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}

		%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		<td><%=sfxmmc%></td>
		<td><%=dxzkl%></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjqqtzqje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjqqtzhje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjhqtzqje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjhqtzhje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zqqtzjje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zhqtzjje,"#########.##")%></font></td>
		<td align="left" ><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF" align="center"> 
    <td>合计</td>
    <td align="left" >&nbsp;</td>
	<td><%=cf.formatDouble(allzjqqtzqje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzjqqtzhje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzjhqtzqje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzjhqtzhje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzqqtzjje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzhqtzjje,"#########.##")%></td>
    <td align="left" >&nbsp;</td>
  </tr>

  <tr bgcolor="#FFFFFF" align="center"> 
    <td>总计</td>
    <td align="left" >&nbsp;</td>
	<td><%=cf.formatDouble(allzjqqtzqje+allzjqzqje,"#########.##")%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allzjhqtzqje+allzjhzqje,"#########.##")%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allzqqtzjje+allzqzjje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzhqtzjje+allzhzjje,"#########.##")%></td>
    <td align="left" >&nbsp;</td>
  </tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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