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
double dj=0;
double sl=0;
double qye=0;
double zjsl=0;
double zjje=0;


String gycl=null;
double xjqye=0;
double xjqyeq=0;

double xjsl=0;
double xjzjje=0;

double allqye=0;
double allqyeq=0;
double allzjje=0;
double allsl=0;

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
    <td  width="4%">序号</td>
    <td  width="7%">项目编号</td>
    <td  width="20%">项目名称</td>
    <td  width="7%">单位</td>
    <td  width="8%">单价（元）</td>
    <td  width="6%">增减前数量</td>
    <td  width="8%">增减前金额</td>
    <td  width="6%">增减后数量</td>
    <td  width="8%">增减后金额</td>
    <td  width="6%">增减数量</td>
    <td  width="8%">增减金额</td>
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

		xjsl=0;
		xjqye=0;
		xjqyeq=0;
		xjzjje=0;
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="11"> 
			  <div><b><i><font size="3">结构位置：<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		//输出增减后项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,bj_bjxmmxh.xmbh,xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.zqdj as je,gycl";
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
			dj=rs.getDouble("zqdj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));



			//获取增减前项目明细
			double qsl=-1;
			double qje=-1;

			ls_sql="SELECT sl,sl*"+dj;
			ls_sql+=" FROM bj_gclmxq ";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"' and xmbh='"+xmbh+"' and zjxxh='"+zjxxh+"'";
		//	out.println(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				qsl=rs2.getDouble(1);
				qje=rs2.getDouble(2);
			}
			rs2.close();
			ps2.close();

			//判断增减情况
			if (qsl==-1)
			{
				xmmc="<font color=\"#FF0000\">"+xmmc+"（新增项目）</font>";
				qsl=0;
				qje=0;
			}
			else{
				if (sl>qsl)
				{
					xmmc="<font color=\"#990000\">"+xmmc+"（工程量增加）</font>";
				}
				else if (sl<qsl)
				{
					xmmc="<font color=\"#0000CC\">"+xmmc+"（工程量减少）</font>";
				}
			}

			zjsl=sl-qsl;
			zjje=qye-qje;

			xjzjje+=zjje;

			xjqyeq+=qje;


			xjsl+=sl;
			xjqye+=qye;

			allsl+=sl;
			allqye+=qye;
			allqyeq+=qje;
			allzjje+=zjje;


			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(qsl)%></td>
				<td><%=cf.formatDouble(qje,"#########.##")%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=cf.formatDouble(qye,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zjje,"#########.##")%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();


		//输出被删掉项目明细
		ls_sql="SELECT bj_bjxmmxq.xh xh,bj_bjxmmxq.xmbh,xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.zqdj as je,gycl";
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
			dj=rs.getDouble("zqdj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));

			xmmc="<font color=\"#CC33CC\">"+xmmc+"（减掉项目）</font>";

			xjqyeq+=qye;

			zjsl=-1*sl;
			zjje=-1*qye;
			xjzjje+=zjje;

			allsl+=0;
			allqye+=0;
			allqyeq+=qye;
			allzjje+=zjje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=cf.formatDouble(qye,"#########.##")%></td>
				<td>0</td>
				<td>0</td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zjje,"#########.##")%></td>
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
			<td><%=cf.formatDouble(xjqyeq,"#########.##")%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjqye,"#########.##")%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjzjje,"#########.##")%></td>
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

		xjsl=0;
		xjqye=0;
		xjzjje=0;
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="11"> 
			  <b><i><font size="3">结构位置：<%=jgwzmc%></font></i><font color="#FF0000">（新增房间）</font></b>
			</td>
		  </tr>
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.zqdj as je,gycl";
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
			dj=rs.getDouble("zqdj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));

			zjsl=sl;
			zjje=qye;
			xjzjje+=zjje;


			xjsl+=sl;
			xjqye+=qye;

			allsl+=sl;
			allqye+=qye;
			allqyeq+=0;
			allzjje+=zjje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=dj%></td>
				<td>0</td>
				<td>0</td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=cf.formatDouble(qye,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zjje,"#########.##")%></td>
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
			<td><%=cf.formatDouble(xjqyeq,"#########.##")%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjqye,"#########.##")%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjzjje,"#########.##")%></td>
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

		xjsl=0;
		xjqye=0;
		xjzjje=0;
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="9"> 
			  <div><b><i><font size="3">结构位置：<%=jgwzmc%></font></i><font color="#CC33CC">（减掉房间）</font></b></div>
			</td>
		  </tr>
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxq.xh xh,bj_bjxmmxq.xmbh,xmmc,jldwmc,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.dj as je,gycl";
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
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));

			zjsl=-1*sl;
			zjje=-1*qye;
			xjzjje+=zjje;


			xjsl+=sl;
			xjqye+=qye;

			allsl+=0;
			allqye+=0;
			allqyeq+=qye;
			allzjje+=zjje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=qye%></td>
				<td>0</td>
				<td>0</td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zjje,"#########.##")%></td>
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
			<td><%=cf.formatDouble(xjqyeq,"#########.##")%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjqye,"#########.##")%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjzjje,"#########.##")%></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
//删除房间信息－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
%> 
//输出总计
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="2">总 计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allqyeq,"#########.##")%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allqye,"#########.##")%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allzjje,"#########.##")%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"> 
      <div><b><i><font size="3">综合取费</font></i></b></div>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="25%" >项目名称</td>
    <td width="13%" >增减前</td>
    <td width="12%">增减后</td>
    <td width="12%">增减金额</td>
    <td align="left" width="50%">&nbsp;</td>
  </tr>
  <%  
	double zqsfjeq=0;
	double zqsfjeh=0;
	double allzqsfjeq=0;
	double allzqsfjeh=0;
	allzjje=0;
	String sfxmbm=null;
	String sfxmmc=null;
	String bz=null;
	String color=null;
	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,bz";
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
		zqsfjeh=rs.getDouble("zqsfje");

		zqsfjeq=0;
		ls_sql="SELECT zqsfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
	//	out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqsfjeq=rs1.getDouble("zqsfje");
		}
		rs1.close();
		ps1.close();

		zjje=zqsfjeh-zqsfjeq;

		allzjje+=zjje;

		if (zqsfjeh!=zqsfjeq)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}


		allzqsfjeh+=zqsfjeh;
		allzqsfjeq+=zqsfjeq;

		%> 
		<tr bgcolor="#FFFFFF"> 
		<td width="25%" ><%=sfxmmc%></td>
		<td width="13%" ><font color="<%=color%>"><%=cf.formatDouble(zqsfjeq,"#########.##")%></font></td>
		<td width="12%"><font color="<%=color%>"><%=cf.formatDouble(zqsfjeh,"#########.##")%></font></td>
		<td width="12%"><font color="<%=color%>"><%=cf.formatDouble(zjje,"#########.##")%></font></td>
		<td align="left" width="50%"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF"> 
    <td width="25%" >合计</td>
    <td width="13%" ><%=cf.formatDouble(allzqsfjeq,"#########.##")%></td>
    <td width="12%"><%=cf.formatDouble(allzqsfjeh,"#########.##")%></td>
    <td width="12%"><%=cf.formatDouble(allzjje,"#########.##")%></td>
    <td align="left" width="50%">&nbsp;</td>
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