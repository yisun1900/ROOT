<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzbm=null;
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

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
String ssfgs=null;
String dzbjbz=null;


try {
	conn=cf.getConnection();


	
	String ysshbz="";
	String bjdysq="";
	int bjdycs=0;
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();


%>
<body >

<div align="center"> </div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" height="35"><b><font size="5">工种统计</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >设 计 师：<%=sjs%></td>
    <td >联系方式：<%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >工程地点：<%=fwdz%></td>
    <td align="left" >工程等级：<%=bjjb%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="4%">序号</td>
    <td  width="15%">结构位置</td>
    <td  width="15%">项目编号</td>
    <td  width="28%">项目名称</td>
    <td  width="8%">单位</td>
    <td  width="10%">单价</td>
    <td  width="8%">数量</td>
    <td  width="12%">金额（元）</td>
  </tr>
  <%
	int i=0;
	String xmflbm=null;
	String xmflmc=null;
	ls_sql="SELECT distinct bj_bjxmmx.xmflbm,xmflmc";
	ls_sql+=" FROM bj_bjxmmx,bdm_xmflbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmflbm=bdm_xmflbm.xmflbm  ";
	ls_sql+=" order by bj_bjxmmx.xmflbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmflbm=rs1.getString("xmflbm");
		xmflmc=rs1.getString("xmflmc");

		xjsl=0;
		xjqye=0;
		row=0;
		
	
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8"> 
			  <b><font size="3"><%=xmflmc%></font</b>
			</td>
		  </tr>
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmx.xh,bj_gclmx.jgwzbm,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.xmflbm='"+xmflbm+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			jgwzbm=cf.fillHtml(rs.getString("jgwzbm"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");

			xjqye+=qye;
			allzj+=qye;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=jgwzbm%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=cf.formatDouble(qye,"#########.##")%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8" align="right"> 
			  <b><font size="3">小计：￥<%=cf.formatDouble(xjqye,"#########.##")%></font</b>
			</td>
		  </tr>
		<%

	}
	rs1.close();
	ps1.close();
%> 

		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8"> 
			  <b><font size="3">无工种项目</font</b>
			</td>
		  </tr>
<%

		xjsl=0;
		xjqye=0;
		row=0;
		//输出项目明细
		ls_sql="SELECT bj_bjxmmx.xh,bj_gclmx.jgwzbm,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.xmflbm is null";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			jgwzbm=cf.fillHtml(rs.getString("jgwzbm"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");

			xjqye+=qye;
			allzj+=qye;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=jgwzbm%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=cf.formatDouble(qye,"#########.##")%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8" align="right"> 
			  <b><font size="3">小计：￥<%=cf.formatDouble(xjqye,"#########.##")%></font</b>
			</td>
		  </tr>
		<%
	

%>

  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="8"><b><font size="3">总 计：￥<%=cf.formatDouble(allzj,"#########.##")%></font></b></td>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






