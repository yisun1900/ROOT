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
    <td  width="7%" >项目编号</td>
    <td  width="24%" >项目名称</td>
    <td  width="7%" >类型</td>
    <td  width="6%" >单位</td>
    <td  width="8%" >折前单价（元）</td>
    <td  width="8%" >折后单价（元）</td>
    <td  width="6%" >原数量</td>
    <td  width="9%" >原金额（元）</td>
    <td  width="6%" >增减数量</td>
    <td  width="9%" >折前增减金额（元）</td>
    <td  width="9%" >折后增减金额（元）</td>
  </tr>

<%
//原有、未删除房间信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	String lx="&nbsp;";
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

		double xjyzqje=0;
		double xjyje=0;
		double xjzqqye=0;
		double xjqye=0;
		double xjzqzjje=0;
		double xjzjje=0;
		

		//输出增减后项目明细
		String xsxmbh=null;
		ls_sql="SELECT bj_bjxmmxh.xh xh,bj_bjxmmxh.xmbh,bj_bjxmmxh.xmbh xsxmbh,xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_bjxmmxh.dj";
		ls_sql+=" ,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.zqdj as zqje,bj_gclmxh.sl*bj_bjxmmxh.dj as je";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
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
			xsxmbh=cf.fillHtml(rs.getString("xsxmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			zqqye=rs.getDouble("zqje");
			qye=rs.getDouble("je");


			//获取增减前项目明细
			ysl=-1;
			yzqje=-1;
			yje=-1;

			ls_sql="SELECT sl,sl*"+zqdj+",sl*"+dj;
			ls_sql+=" FROM bj_gclmxq ";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"' and xmbh='"+xmbh+"' and zjxxh='"+zjxxh+"'";
		//	out.println(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				ysl=rs2.getDouble(1);
				yzqje=rs2.getDouble(2);
				yje=rs2.getDouble(3);
			}
			rs2.close();
			ps2.close();


			//判断增减情况
			lx="&nbsp;";
			if (ysl==-1)
			{
				lx="<font color=\"#FF0000\">＋增项</font>";
				ysl=0;
				yzqje=0;
				yje=0;
			}
			else{
				if (sl>ysl)
				{
					lx="<font color=\"#990000\">＋增量</font>";
				}
				else if (sl<ysl)
				{
					lx="<font color=\"#0000CC\">－减量</font>";
				}
				else{
					continue;
				}
			}

			zjsl=sl-ysl;
			zqzjje=zqqye-yzqje;
			zjje=qye-yje;

			xjyzqje+=yzqje;
			xjyje+=yje;
			xjzqqye+=zqqye;
			xjqye+=qye;
			xjzqzjje+=zqzjje;
			xjzjje+=zjje;

			allyzqje+=yzqje;
			allyje+=yje;
			allzqqye+=zqqye;
			allqye+=qye;
			allzqzjje+=zqzjje;
			allzjje+=zjje;


			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xsxmbh%></td>
				<td align="left"><%=xmmc%></td>
				<td><%=lx%></td>
				<td><%=jldwmc%></td>
				<td><%=zqdj%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(ysl)%></td>
				<td><%=cf.formatDouble(yje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqzjje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjje,"#########.##")%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();


		//输出被删掉项目明细
		ls_sql="SELECT bj_bjxmmxq.xh xh,bj_bjxmmxq.xmbh,xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.zqdj as zqje,bj_gclmxq.sl*bj_bjxmmxq.dj as je";
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
			dj=rs.getDouble("dj");
			ysl=rs.getDouble("sl");
			yzqje=rs.getDouble("zqje");
			yje=rs.getDouble("je");

			sl=0;
			qye=0;
			zqqye=0;

			zjsl=sl-ysl;
			zqzjje=zqqye-yzqje;
			zjje=qye-yje;

			xjyzqje+=yzqje;
			xjyje+=yje;
			xjzqqye+=zqqye;
			xjqye+=qye;
			xjzqzjje+=zqzjje;
			xjzjje+=zjje;

			allyzqje+=yzqje;
			allyje+=yje;
			allzqqye+=zqqye;
			allqye+=qye;
			allzqzjje+=zqzjje;
			allzjje+=zjje;

			lx="<font color=\"#CC33CC\">－减项</font>";

			row++;


			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td align="left"><%=xmmc%></td>
				<td><%=lx%></td>
				<td><%=jldwmc%></td>
				<td><%=zqdj%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(ysl)%></td>
				<td><%=cf.formatDouble(yje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqzjje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjje,"#########.##")%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		if (xjzjje!=0)
		{
			//输出小计
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td colspan="5"><B>[<%=jgwzmc%>]小计</B></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td><%=cf.formatDouble(xjyje,"#########.##")%></td>
				<td>&nbsp;</td>
				<td><%=cf.formatDouble(xjzqzjje,"#########.##")%></td>
				<td><%=cf.formatDouble(xjzjje,"#########.##")%></td>
			  </tr>
			<%
		}


	
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

		double xjyzqje=0;
		double xjyje=0;
		double xjzqqye=0;
		double xjqye=0;
		double xjzqzjje=0;
		double xjzjje=0;
		
		lx="<font color=\"#FF0000\">＋新增房间</font>";


		//输出项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,bj_bjxmmxh.xmbh xmbh,xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,bj_gclmxh.sl*bj_bjxmmxh.zqdj as zqje";
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
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			zqqye=rs.getDouble("zqje");
			qye=rs.getDouble("je");

			ysl=0;
			yzqje=0;
			yje=0;

			zjsl=sl-ysl;
			zqzjje=zqqye-yzqje;
			zjje=qye-yje;

			xjyzqje+=yzqje;
			xjyje+=yje;
			xjzqqye+=zqqye;
			xjqye+=qye;
			xjzqzjje+=zqzjje;
			xjzjje+=zjje;

			allyzqje+=yzqje;
			allyje+=yje;
			allzqqye+=zqqye;
			allqye+=qye;
			allzqzjje+=zqzjje;
			allzjje+=zjje;

			row++;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center" > 
				<td><%=row%></td>
				<td ><%=xmbh%></td>
				<td align="left"><%=xmmc%></td>
				<td><%=lx%></td>
				<td><%=jldwmc%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(ysl)%></td>
				<td><%=cf.formatDouble(yje,"#########.##")%></td>
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
			<td colspan="5"><B>新增房间[<%=jgwzmc%>]小计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td><%=cf.formatDouble(xjyje,"#########.##")%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjzqzjje,"#########.##")%></td>
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

		double xjyzqje=0;
		double xjyje=0;
		double xjzqqye=0;
		double xjqye=0;
		double xjzqzjje=0;
		double xjzjje=0;
		
		lx="<font color=\"#CC33CC\">－删除房间</font>";


		//输出项目明细
		ls_sql="SELECT bj_bjxmmxq.xh xh,bj_bjxmmxq.xmbh,xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.zqdj as zqje,bj_gclmxq.sl*bj_bjxmmxq.dj as je";
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
			dj=rs.getDouble("dj");
			ysl=rs.getDouble("sl");
			yzqje=rs.getDouble("zqje");
			yje=rs.getDouble("je");

			sl=0;
			zqqye=0;
			qye=0;

			zjsl=sl-ysl;
			zqzjje=zqqye-yzqje;
			zjje=qye-yje;

			xjyzqje+=yzqje;
			xjyje+=yje;
			xjzqqye+=zqqye;
			xjqye+=qye;
			xjzqzjje+=zqzjje;
			xjzjje+=zjje;

			allyzqje+=yzqje;
			allyje+=yje;
			allzqqye+=zqqye;
			allqye+=qye;
			allzqzjje+=zqzjje;
			allzjje+=zjje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=xmbh%></td>
				<td align="left"><%=xmmc%></td>
				<td><%=lx%></td>
				<td><%=jldwmc%></td>
				<td><%=zqdj%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(ysl)%></td>
				<td><%=cf.formatDouble(yje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqzjje,"#########.##")%></td>
				<td><%=cf.formatDouble(zjje,"#########.##")%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//输出小计
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="5"><B>删除房间[<%=jgwzmc%>]小计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td><%=cf.formatDouble(xjyje,"#########.##")%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjzjje,"#########.##")%></td>
		  </tr>
		<%
	}
	rs1.close();
	ps1.close();
//删除房间信息－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
%> 
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="5"><B>工程项目小计</B></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=cf.formatDouble(allyje,"#########.##")%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allzqzjje,"#########.##")%></td>
	<td><%=cf.formatDouble(allzjje,"#########.##")%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6"> 
      <div align="center"><b><font size="4">综合取费</font></b></div>
    </td>
  </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td align="center" width="22%" >项目名称</td>
    <td align="center" width="10%" >原金额</td>
    <td align="center" width="10%">新金额</td>
    <td align="center" width="10%">折前增减金额</td>
    <td align="center" width="10%">折后增减金额</td>
    <td align="left" width="48%">&nbsp;</td>
  </tr>
  <%  
	double zqsfjeq=0;
	double zqsfjeh=0;
	double sfjeq=0;
	double sfjeh=0;
	double allzqsfjeq=0;
	double allzqsfjeh=0;
	double allsfjeq=0;
	double allsfjeh=0;
	double allzqqtsf=0;
	double allqtsf=0;
	String sfxmbm=null;
	String sfxmmc=null;
	String bz=null;
	String color=null;
	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		zqsfjeh=rs.getDouble("zqsfje");
		sfjeh=rs.getDouble("sfje");

		zqsfjeq=0;
		sfjeq=0;
		ls_sql="SELECT zqsfje,sfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqsfjeq=rs1.getDouble("zqsfje");
			sfjeq=rs1.getDouble("sfje");
		}
		rs1.close();
		ps1.close();

		zqzjje=zqsfjeh-zqsfjeq;
		zjje=sfjeh-sfjeq;

		if (sfjeh!=sfjeq)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}


		allzqsfjeh+=zqsfjeh;
		allsfjeh+=sfjeh;
		allzqsfjeq+=zqsfjeq;
		allsfjeq+=sfjeq;
		allzqqtsf+=zqzjje;
		allqtsf+=zjje;

		if (zjje!=0)
		{
			%> 
			<tr bgcolor="#FFFFFF" align="center"> 
			<td><%=sfxmmc%></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(sfjeq,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(sfjeh,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(zqzjje,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(zjje,"#########.##")%></font></td>
			<td align="left" width="48%"><%=bz%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();

	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,sfje,bz";
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
		zqsfjeq=rs.getDouble("zqsfje");
		sfjeq=rs.getDouble("sfje");

		zqsfjeh=0;
		sfjeh=0;

		zqzjje=zqsfjeh-zqsfjeq;
		zjje=sfjeh-sfjeq;

		if (sfjeh!=sfjeq)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}


		allzqsfjeh+=zqsfjeh;
		allsfjeh+=sfjeh;
		allzqsfjeq+=zqsfjeq;
		allsfjeq+=sfjeq;
		allzqqtsf+=zqzjje;
		allqtsf+=zjje;

		%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		<td><%=sfxmmc%></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(sfjeq,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(sfjeh,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zqzjje,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zjje,"#########.##")%></font></td>
		<td align="left" width="48%"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF" align="center"> 
    <td><B>综合取费小计</B></td>
    <td ><%=cf.formatDouble(allsfjeq,"#########.##")%></td>
    <td><%=cf.formatDouble(allsfjeh,"#########.##")%></td>
    <td><%=cf.formatDouble(allzqqtsf,"#########.##")%></td>
    <td><%=cf.formatDouble(allqtsf,"#########.##")%></td>
    <td >&nbsp;</td>
  </tr>
</table>
<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"  > 
    <td><B><font size="3">变更单总计：</font><%=cf.formatDouble(allzjje+allqtsf,"#########.##")%></B></td>
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