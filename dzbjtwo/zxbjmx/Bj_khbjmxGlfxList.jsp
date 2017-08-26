<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=1;

String dqbm=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allxhl=0;
double allclf=0;

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

double jqsfl=0;
double bsfl=0;
double tvocsfl=0;

double clfbfb=0;//电子报价中无工料分析，默认材料费百分比


try {
	conn=cf.getConnection();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='clfbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clfbfb=rs.getDouble("csz");
	}
	else{
		out.println("错误！在表sq_xtcsb中无默认材料费百分比");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
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

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	zjqye=dzbj.getAllBjje(conn,khbh,"yz");

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>工料分析</b> 
  <hr>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>客户姓名：<%=khxm%></td>
    <td>联系方式：<%=lxfs%> </td>
    <td>金额总计：<%=cf.formatDouble(zjqye,"#########.##")%>元</td>
  </tr>
  <tr> 
    <td>工程地点：<%=fwdz%></td>
    <td>设 计 师：<%=sjs%></td>
    <td>工程等级：<%=bjjb%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="4%" >序号</td>
    <td  width="7%" >项目编号</td>
    <td  width="15%" >项目名称</td>
    <td  width="7%" >工程单价（元）</td>
    <td  width="6%" >工程量</td>
    <td  width="7%" >工程金额（元）</td>
    <td  width="6%" >分类</td>
    <td  width="7%" >材料编码</td>
    <td  width="20%" >材料名称</td>
    <td  width="7%" >材料单价</td>
    <td  width="7%" >消耗量</td>
    <td  width="9%" >材料费</td>
  </tr>

<%
	int i=0;


	//输出项目明细
	ls_sql="SELECT bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,trim(bj_bjxmmx.xmbh)||DECODE(bj_bjxmmx.bjlx,'1','','2','增') xmbh,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' ";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" group by bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.dj";
	ls_sql+=" order by bj_bjxmmx.xmpx";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dqbm=cf.fillHtml(rs.getString("dqbm"));
		xmbh=cf.fillHtml(rs.getString("xmbh"));
		xmmc=cf.fillHtml(rs.getString("xmmc"));

		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		qye=rs.getDouble("je");

		String glflmc=null;
		String glbxh=null;
		String glfxclbm=null;
		String glfxclmc=null;
		String pp=null;
		double cldj=0;
		double xhl=0;

		int rowsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=" and bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.dqbm='"+dqbm+"' and bj_khglfxb.xmbh='"+xmbh+"' ";
		ls_sql+=" order by bj_khglfxb.glflbm,bj_khglfxb.glbxh";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			rowsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		double clf=0;

		if (rowsl>0)
		{
			String cljldwmc="";
			ls_sql="SELECT bdm_glflbm.glflmc,bj_khglfxb.glbxh,bj_khglfxb.glfxclbm,jdm_jldwbm.jldwmc,bj_khglfxb.xhl,bj_khglfxb.dj,bj_khglfxb.glfxclmc,bj_khglfxb.jqsfl,bj_khglfxb.bsfl,bj_khglfxb.tvocsfl  ";
			ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb  ";
			ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
			ls_sql+=" and bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.dqbm='"+dqbm+"' and bj_khglfxb.xmbh='"+xmbh+"' ";
			ls_sql+=" order by bj_khglfxb.glflbm,bj_khglfxb.glbxh";
	//		out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				glflmc=cf.fillHtml(rs1.getString("glflmc"));
				glbxh=cf.fillNull(rs1.getString("glbxh"));
				glfxclbm=cf.fillHtml(rs1.getString("glfxclbm"));
				cljldwmc=cf.fillHtml(rs1.getString("jldwmc"));

				glfxclmc=cf.fillHtml(rs1.getString("glfxclmc"));
				cldj=rs1.getDouble("dj");
				xhl=rs1.getDouble("xhl");

				jqsfl=rs1.getDouble("jqsfl");
				bsfl=rs1.getDouble("bsfl");
				tvocsfl=rs1.getDouble("tvocsfl");

				xhl=xhl*sl;

				clf=cldj*xhl;

				allxhl+=xhl;
				allclf+=clf;

				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=rowsl%>"><%=row%></td>
					<td rowspan="<%=rowsl%>"><%=xmbh%></td>
					<td rowspan="<%=rowsl%>"><%=xmmc%></td>
					<td rowspan="<%=rowsl%>"><%=dj%>/<%=jldwmc%></td>
					<td rowspan="<%=rowsl%>"><%=cf.formatDouble(sl)%></td>
					<td rowspan="<%=rowsl%>"><%=cf.formatDouble(qye,"#########.##")%></td>
					<td><%=glflmc%></td>
					<td><%=glfxclbm%></td>
					<td><%=glfxclmc%></td>
					<td><%=cldj%>/<%=cljldwmc%></td>
					<td><%=cf.formatDouble(xhl)%></td>
					<td><%=cf.formatDouble(clf)%></td>
				  </tr>
				<%
			
			}

			while (rs1.next())
			{
				glflmc=cf.fillHtml(rs1.getString("glflmc"));
				glbxh=cf.fillNull(rs1.getString("glbxh"));
				glfxclbm=cf.fillHtml(rs1.getString("glfxclbm"));
				cljldwmc=cf.fillHtml(rs1.getString("jldwmc"));

				glfxclmc=cf.fillHtml(rs1.getString("glfxclmc"));
				cldj=rs1.getDouble("dj");
				xhl=rs1.getDouble("xhl");

				jqsfl=rs1.getDouble("jqsfl");
				bsfl=rs1.getDouble("bsfl");
				tvocsfl=rs1.getDouble("tvocsfl");

				xhl=xhl*sl;

				clf=cldj*xhl;

				allxhl+=xhl;
				allclf+=clf;

				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=glflmc%></td>
					<td><%=glfxclbm%></td>
					<td><%=glfxclmc%></td>
					<td><%=cldj%>/<%=cljldwmc%></td>
					<td><%=cf.formatDouble(xhl)%></td>
					<td><%=cf.formatDouble(clf)%></td>
				  
				  </tr>
				<%
			
			}
			rs1.close();
			ps1.close();

			row++;
			allsl+=sl;
			allqye+=qye;
		}

	}
	rs.close();
	ps.close();

	//输出无工料

	ls_sql="SELECT bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,trim(bj_bjxmmx.xmbh)||DECODE(bj_bjxmmx.bjlx,'1','','2','增') xmbh,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' ";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" group by bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.dj";
	ls_sql+=" order by bj_bjxmmx.xmpx";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillHtml(rs.getString("xmbh"));
		xmmc=cf.fillHtml(rs.getString("xmmc"));

		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		qye=rs.getDouble("je");


		String glflmc=null;
		String glbxh=null;
		String glfxclbm=null;
		String glfxclmc=null;
		String pp=null;
		double cldj=0;
		double xhl=0;

		int rowsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=" and bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.dqbm='"+dqbm+"' and bj_khglfxb.xmbh='"+xmbh+"' ";
		ls_sql+=" order by bj_khglfxb.glflbm,bj_khglfxb.glbxh";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			rowsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		double clf=0;

		if (rowsl>0)
		{
			continue;
		}
		else{
			clf=clfbfb*qye/100;
			allclf+=clf;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td rowspan="<%=rowsl%>"><%=row%></td>
				<td rowspan="<%=rowsl%>"><%=xmbh%></td>
				<td rowspan="<%=rowsl%>"><%=xmmc%></td>
				<td rowspan="<%=rowsl%>"><%=dj%>/<%=jldwmc%></td>
				<td rowspan="<%=rowsl%>"><%=cf.formatDouble(sl)%></td>
				<td rowspan="<%=rowsl%>"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td >&nbsp;</td>
				<td >无工料分析</td>
				<td >&nbsp;</td>
				<td colspan="2">收取比例：<%=clfbfb%>%</td>
				<td><%=cf.formatDouble(clf)%></td>
			  </tr>
			<%

			row++;
			allsl+=sl;
			allqye+=qye;
		}
	}
	rs.close();
	ps.close();


	//输出小计
	%> 
	  <tr bgcolor="#FFFFFF" align="center"> 
		<td colspan="2">小  计</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(allsl)%></td>
		<td ><%=cf.formatDouble(allqye,"#########.##")%></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(allxhl,"#########.##")%></td>
		<td ><%=cf.formatDouble(allclf,"#########.##")%></td>
	  </tr>
	
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"> 
      <div align="center"><b>其它收费项目</b></div>
    </td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" width="11%" >&nbsp;</td>
			<td align="center" width="15%" ><%=sfxmmc%></td>
			<td align="center" width="21%" >&nbsp;</td>
			<td align="center" width="8%"><%=cf.formatDouble(sfje,"#########.##")%></td>
			<td align="left" width="45%"><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF" align="right"> 
    <td colspan="5"><i><b><font size="3">其它收费小计：<%=cf.formatDouble(allsfje,"#########.##")%>元&nbsp;&nbsp;&nbsp;&nbsp;</font></b></i></td>
  </tr>
</table>
<br>
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