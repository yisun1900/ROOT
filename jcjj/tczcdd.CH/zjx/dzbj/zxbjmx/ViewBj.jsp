<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {color: #0000CC}
-->
</style>
</head>


<%
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

String jgwzmc=null;
String jldwmc=null;
double sgcbj=0;
double sgdbj=0;
double zqdj=0;
double zk=0;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;

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
String fwmj=null;

try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
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
		fwmj=cf.fillNull(rs.getString("fwmj"));
	}
	rs.close();
	ps.close();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td width="20%" >设 计 师：<%=sjs%></td>
	<td width="56%" >客户地址：<%=fwdz%></td>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="4%" ><strong>序号</strong></td>
    <td  width="27%" ><strong>项目名称</strong></td>
    <td  width="12%" ><strong>项目分类</strong></td>
    <td  width="8%" ><strong>单位</strong></td>
    <td  width="7%" ><strong>数量</strong></td>
	<td  width="8%" ><strong>折前单价</strong></td>
    <td  width="10%" ><strong>折前金额（元）</strong></td>
	<td  width="6%" ><strong>折扣</strong></td>
	<td  width="8%" ><strong>折后单价</strong></td>
     <td  width="10%" ><strong>折后金额（元）</strong></td>
  </tr>

	
	
<%
	int i=0;
	double zjqye=0;
	double allzqje=0;
	double allzhje=0;
	double allsgcbj=0;
	double allsgdbj=0;
	double allsl=0;
	double allzj=0;
	ls_sql="SELECT bj_fjxx.jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		double xjsl=0;
		double xjzqje=0;
		double xjzhje=0;
		double xjsgcbj=0;
		double xjsgdbj=0;

		//输出项目明细
		String xmflmc=null;
		double zqje=0;
		double zhje=0;
		ls_sql="SELECT bj_gclmx.sl*bj_bjxmmx.sgcbj sgcbj,bj_gclmx.sl*bj_bjxmmx.sgdbj sgdbj,bj_bjxmmx.xh,xmflmc,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmx.zqdj,bj_bjxmmx.zk,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.zqdj as zqje,bj_gclmx.sl*bj_bjxmmx.dj as zhje,gycl,bj_bjxmmx.flmcgg,bj_bjxmmx.bz";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm,bdm_xmflbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.xmflbm=bdm_xmflbm.xmflbm(+) ";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		
	
		while (rs.next())
		{
			sgcbj=rs.getDouble("sgcbj");
			sgdbj=rs.getDouble("sgdbj");

			xh=cf.fillHtml(rs.getString("xh"));
		    xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));
			xmflmc=cf.fillHtml(rs.getString("xmflmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			zk=rs.getDouble("zk");
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			zqje=rs.getDouble("zqje");
			zhje=rs.getDouble("zhje");
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			xjzqje+=zqje;
			xjzhje+=zhje;

			xjsgcbj+=sgcbj;
			xjsgdbj+=sgdbj;

			allsl+=xjsl;
			allzqje+=zqje;
			allzhje+=zhje;
			allsgcbj+=sgcbj;
			allsgdbj+=sgdbj;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmmc%></td>
				<td><%=xmflmc%></td>
				<td><%=jldwmc%></td>
				<td ><%=cf.formatDouble(sl)%></td>
				<td><%=zqdj%></td>
				<td><%=zqje%></td>
				<td><%=zk%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(zhje,"#########.##")%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="3"><span class="STYLE1"><<%=jgwzmc%>>小计</span></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><span class="STYLE2"><strong><%=cf.formatDouble(xjzqje,"#########.##")%></strong></span></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><span class="STYLE2"><strong><%=cf.formatDouble(xjzhje,"#########.##")%></strong></span></td>
		  </tr>
		 <%
	}
	
	rs1.close();
	ps1.close();
%> 

  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="3"><span class="STYLE1">工 程 总 计</span></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(allzqje,"#########.##")%></strong></span></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(allzhje,"#########.##")%></strong></span></td>
  </tr>
</table>	
 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"  >
    <td width="6%"><strong>序号</strong></td> 
	<td width="30%"><strong>收费项目名称</strong></td>
	<td width="12%"><strong>是否记入业绩</strong></td>
	<td width="12%"><strong>单价</strong></td>
	<td width="10%"><strong>数量</strong></td>
	<td width="12%"><strong>折前收费金额</strong></td>
	<td width="9%"><strong>折扣率</strong></td>
	<td width="12%"><strong>折后收费金额</strong></td>
  </tr>
  <%  
	double allsfje=0;
	 row=0;

	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	double sfbfb=0;
	double sfje=0;
	String bz=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	double zqsfje=0;
	double dxzkl=0;
	String sfkdz=null;
	double zdzk=0;

	double xjqtzqje=0;
	double xjqtzhje=0;
	ls_sql="SELECT sl,dj,sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sflx=cf.fillHtml(rs.getString("sflx"));
		sfbfb=rs.getDouble("sfbfb");
		zqsfje=rs.getDouble("zqsfje");
		sfje=rs.getDouble("sfje");
		bz=cf.fillHtml(rs.getString("bz"));
		sfbxx=cf.fillHtml(rs.getString("sfbxx"));
		sfjrqye=cf.fillHtml(rs.getString("sfjrqye"));
		jrsjbz=cf.fillHtml(rs.getString("jrsjbz"));
		jrglfbz=cf.fillHtml(rs.getString("jrglfbz"));
		dxzkl=rs.getDouble("dxzkl");
		sfkdz=cf.fillHtml(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");

		xjqtzqje+=zqsfje;
		xjqtzhje+=sfje;
		allzqje+=zqsfje;
		allzhje+=sfje;

		row++;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31">
		    <td ><%=row%></td> 
			<td ><%=sfxmmc%></td>
			<td ><%=sfjrqye%></td>
			<td><%=cf.formatDouble(dj,"#########.##")%></td>
			<td><%=cf.formatDouble(sl,"#########.##")%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td><%=cf.formatDouble(dxzkl,"#########.##")%></td>
			<td><%=cf.formatDouble(sfje,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

%> 
  <tr bgcolor="#FFFFFF" align="center"  height="31">
	<td colspan="4"><span class="STYLE2"><strong>小 计</strong></span></td> 
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjqtzqje,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjqtzhje,"#########.##")%></strong></span></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="9"><strong>总 计&nbsp;&nbsp;&nbsp;&nbsp;折前：<%=cf.formatDouble(allzqje,"#########.##")%>&nbsp;&nbsp;&nbsp;&nbsp;折后：<%=cf.formatDouble(allzhje,"#########.##")%></strong></td>
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


<script  LANGUAGE="javascript">
<!--
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





