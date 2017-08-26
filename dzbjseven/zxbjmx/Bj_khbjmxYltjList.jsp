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
String ls_sql=null;

int row=1;

String xh=null;
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
double xjxhl=0;
double xjclf=0;

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

double clfbfb=0;//电子报价中无工料分析，默认材料费百分比


try {
	conn=cf.getConnection();

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

	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//获取电子报价金额
    zjqye=dzbj.getAllBjje(conn,khbh,"csrj");

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>用料统计</b> 
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
    <td  width="5%" >序号</td>
    <td  width="9%" >分类</td>
    <td  width="19%" >工料名称</td>
    <td  width="10%" >品牌</td>
    <td  width="10%" >型号规格</td>
    <td  width="8%" >单位</td>
    <td  width="8%" >材料单价</td>
    <td  width="10%" >消耗量</td>
    <td  width="11%" >材料费</td>
  </tr>

<%
	int i=0;


	//输出项目明细

		String glflbm=null;
		String glflmc=null;
		String glbxh=null;
		String glfxclmc=null;
		String jldwbm=null;
		String xhgg=null;
		String pp=null;
		double cldj=0;
		double xhl=0;


		double clf=0;

		xjxhl=0;
		xjclf=0;

		ls_sql="SELECT bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.gg xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj,sum(bj_khglfxb.xhl*bj_gclmx.sl) xhl,sum(bj_khglfxb.xhl*bj_gclmx.sl*bj_khglfxb.dj) clf ";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb,bj_gclmx,jxc_clbm  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+) and trim(bj_khglfxb.glfxclbm)=jxc_clbm.nbbm(+)";
		ls_sql+=" and bj_gclmx.khbh='"+khbh+"'  and bj_khglfxb.glflbm='1'";//材料费
		ls_sql+=" and bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm and bj_gclmx.xmbh=bj_khglfxb.xmbh ";
		ls_sql+=" group by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
		ls_sql+=" order by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			glflbm=cf.fillNull(rs.getString("glflbm"));
			glflmc=cf.fillHtml(rs.getString("glflmc"));
			glfxclmc=cf.fillNull(rs.getString("glfxclmc"));
			jldwbm=cf.fillNull(rs.getString("jldwbm"));
			jldwmc=cf.fillHtml(rs.getString("jldwmc"));

			xhgg=rs.getString("xhgg");
			pp=rs.getString("ppmc");
			cldj=rs.getDouble("dj");
			xhl=rs.getDouble("xhl");
			clf=rs.getDouble("clf");

			allxhl+=xhl;
			allclf+=clf;
			xjxhl+=xhl;
			xjclf+=clf;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=glflmc%></td>
				<td><%=glfxclmc%></td>
				<td><%=cf.fillHtml(pp)%></td>
				<td><%=cf.fillHtml(xhgg)%></td>
				<td><%=jldwmc%></td>
				<td><%=cldj%></td>
				<td><%=cf.formatDouble(xhl)%></td>
				<td><%=cf.formatDouble(clf)%></td>
			  </tr>
			<%
			row++;
		}
		rs.close();
		ps.close();

	//输出小计
	%> 
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>材  料  费  小  计</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjxhl,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
	  </tr>
	  <tr bgcolor="#CCCCFF" align="center"> 
		<td colspan="9">&nbsp;</td>
	  </tr>
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td  width="5%" >序号</td>
		<td  width="9%" >分类</td>
		<td  width="19%" >人工费名称</td>
		<td  width="10%" >&nbsp;</td>
		<td  width="10%" >&nbsp;</td>
		<td  width="8%" >单位</td>
		<td  width="8%" >单价</td>
		<td  width="10%" >消耗量</td>
		<td  width="11%" >材料费</td>
	  </tr>
	<%

		xjxhl=0;
		xjclf=0;

		ls_sql="SELECT bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.gg xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj,sum(bj_khglfxb.xhl*bj_gclmx.sl) xhl,sum(bj_khglfxb.xhl*bj_gclmx.sl*bj_khglfxb.dj) clf ";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb,bj_gclmx,jxc_clbm  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+) and trim(bj_khglfxb.glfxclbm)=jxc_clbm.nbbm(+)";
		ls_sql+=" and bj_gclmx.khbh='"+khbh+"'  and bj_khglfxb.glflbm='2'";//材料费
		ls_sql+=" and bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm and bj_gclmx.xmbh=bj_khglfxb.xmbh ";
		ls_sql+=" group by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
		ls_sql+=" order by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			glflbm=cf.fillNull(rs.getString("glflbm"));
			glflmc=cf.fillHtml(rs.getString("glflmc"));
			glfxclmc=cf.fillNull(rs.getString("glfxclmc"));
			jldwbm=cf.fillNull(rs.getString("jldwbm"));
			jldwmc=cf.fillHtml(rs.getString("jldwmc"));

			xhgg=rs.getString("xhgg");
			pp=rs.getString("pp");
			cldj=rs.getDouble("dj");
			xhl=rs.getDouble("xhl");
			clf=rs.getDouble("clf");


			allxhl+=xhl;
			allclf+=clf;
			xjxhl+=xhl;
			xjclf+=clf;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=glflmc%></td>
				<td><%=glfxclmc%></td>
				<td><%=cf.fillHtml(pp)%></td>
				<td><%=cf.fillHtml(xhgg)%></td>
				<td><%=jldwmc%></td>
				<td><%=cldj%></td>
				<td><%=cf.formatDouble(xhl)%></td>
				<td><%=cf.formatDouble(clf)%></td>
			  </tr>
			<%
			row++;
		}
		rs.close();
		ps.close();

	//输出小计
	%> 
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>人  工  费  小  计</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjxhl,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
	  </tr>
	  <tr bgcolor="#CCCCFF" align="center"> 
		<td colspan="9">&nbsp;</td>
	  </tr>
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td  width="5%" >序号</td>
		<td  width="9%" >分类</td>
		<td  width="19%" >机械费名称</td>
		<td  width="10%" >&nbsp;</td>
		<td  width="10%" >&nbsp;</td>
		<td  width="8%" >单位</td>
		<td  width="8%" >单价</td>
		<td  width="10%" >消耗量</td>
		<td  width="11%" >材料费</td>
	  </tr>
	<%

		xjxhl=0;
		xjclf=0;

		ls_sql="SELECT bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.gg xhgg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj,sum(bj_khglfxb.xhl*bj_gclmx.sl) xhl,sum(bj_khglfxb.xhl*bj_gclmx.sl*bj_khglfxb.dj) clf ";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb,bj_gclmx,jxc_clbm  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+) and trim(bj_khglfxb.glfxclbm)=jxc_clbm.nbbm(+)";
		ls_sql+=" and bj_gclmx.khbh='"+khbh+"'  and bj_khglfxb.glflbm='3'";//材料费
		ls_sql+=" and bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm and bj_gclmx.xmbh=bj_khglfxb.xmbh ";
		ls_sql+=" group by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
		ls_sql+=" order by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			glflbm=cf.fillNull(rs.getString("glflbm"));
			glflmc=cf.fillHtml(rs.getString("glflmc"));
			glfxclmc=cf.fillNull(rs.getString("glfxclmc"));
			jldwbm=cf.fillNull(rs.getString("jldwbm"));
			jldwmc=cf.fillHtml(rs.getString("jldwmc"));

			xhgg=rs.getString("xhgg");
			pp=rs.getString("pp");
			cldj=rs.getDouble("dj");
			xhl=rs.getDouble("xhl");
			clf=rs.getDouble("clf");


			allxhl+=xhl;
			allclf+=clf;
			xjxhl+=xhl;
			xjclf+=clf;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=glflmc%></td>
				<td><%=glfxclmc%></td>
				<td><%=cf.fillHtml(pp)%></td>
				<td><%=cf.fillHtml(xhgg)%></td>
				<td><%=jldwmc%></td>
				<td><%=cldj%></td>
				<td><%=cf.formatDouble(xhl)%></td>
				<td><%=cf.formatDouble(clf)%></td>
			  </tr>
			<%
			row++;
		}
		rs.close();
		ps.close();

	//输出小计
	%> 
	  
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>机  械  费  小  计</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjxhl,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
	  </tr>
	  <tr bgcolor="#CCCCFF" align="center"> 
		<td colspan="10">&nbsp;</td>
	  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="10"><B>报价项目--无工料对照关系（材料费收取比率：<%=clfbfb%>%）</B></td>
	  </tr>
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td >序号</td>
		<td>项目编号</td>
		<td>项目名称</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >工程量</td>
		<td >单位</td>
		<td >工程单价（元）</td>
		<td >工程金额（元）</td>
		<td >材料费</td>
	  </tr>
	<%


	//输出无工料


	row=1;
	xjqye=0;
	xjsl=0;
	xjclf=0;
	ls_sql="SELECT bj_bjxmmx.xh,bj_bjxmmx.dqbm,trim(bj_bjxmmx.xmbh)||DECODE(bj_bjxmmx.bjlx,'1','','2','增') xmbh,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' ";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_bjxmmx.xmbh not in(select xmbh from bj_khglfxb where khbh='"+khbh+"') ";
	ls_sql+=" group by bj_bjxmmx.xh,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.dj";
	ls_sql+=" order by bj_bjxmmx.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=cf.fillHtml(rs.getString("xh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillHtml(rs.getString("xmbh"));
		xmmc=cf.fillHtml(rs.getString("xmmc"));

		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		qye=rs.getDouble("je");


		clf=clfbfb*qye/100;
		xjsl+=sl;
		xjqye+=qye;
		xjclf+=clf;

		allclf+=clf;
		allsl+=sl;
		allqye+=qye;

		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=xmbh%></td>
			<td ><%=xmmc%></td>
			<td colspan='2'>&nbsp;</td>
			<td ><%=cf.formatDouble(sl)%></td>
			<td ><%=jldwmc%></td>
			<td ><%=dj%></td>
			<td ><%=cf.formatDouble(qye,"#########.##")%></td>
			<td><%=cf.formatDouble(clf)%></td>
		  </tr>
		<%

		row++;
	}
	rs.close();
	ps.close();


	//输出小计
	%> 
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>小  计</B></td>
		<td ><%=cf.formatDouble(xjsl,"#########.##")%></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjqye,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
	  </tr>
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>总  计</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>