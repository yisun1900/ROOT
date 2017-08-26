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
.STYLE3 {color: #0000FF}
.STYLE4 {color: #990000}
-->
</style>
</head>


<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");


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
double cbj=0;
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
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<noscript><iframe scr="*.htm"></iframe></noscript>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td width="20%" >设 计 师：<%=sjs%></td>
	<td width="56%" >客户地址：<%=fwdz%></td>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="3%" ><strong>序号</strong></td>
    <td  width="8%" ><strong>项目编号</strong></td>
    <td  width="18%" ><strong>项目名称</strong></td>
    <td  width="7%" ><strong>项目分类</strong></td>
    <td  width="5%" ><strong>单位</strong></td>
    <td  width="6%" ><strong>数量</strong></td>
	<td  width="7%" ><strong>折前单价</strong></td>
    <td  width="7%" ><strong>折前金额</strong></td>
	<td  width="5%" ><strong>折扣</strong></td>
	<td  width="7%" ><strong>折后单价</strong></td>
    <td  width="7%" ><strong>折后金额</strong></td>
	<td  width="7%" ><strong>成本价</strong></td>
	<td  width="7%" ><strong>施工成本价</strong></td>
	<td  width="37%" ><strong>工程基础报价</strong></td>
  </tr>

	
	
<%
	int i=0;
	double zjqye=0;
	double allzqje=0;
	double allzhje=0;
	double allcbj=0;
	double allsgcbj=0;
	double allsgdbj=0;
	double allsl=0;
	double allzj=0;
	ls_sql="SELECT bj_fjxxh.jgwzbm";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		double xjsl=0;
		double xjzqje=0;
		double xjzhje=0;
		double xjcbj=0;
		double xjsgcbj=0;
		double xjsgdbj=0;

		//输出项目明细
		String xmflmc=null;
		double zqje=0;
		double zhje=0;
		ls_sql="SELECT bj_gclmxh.sl*bj_bjxmmxh.cbenj cbj,bj_gclmxh.sl*bj_bjxmmxh.sgcbj sgcbj,bj_gclmxh.sl*bj_bjxmmxh.sgdbj sgdbj,bj_bjxmmxh.xh,xmflmc,bj_bjxmmxh.xmbh,xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_bjxmmxh.zk,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.zqdj as zqje,bj_gclmxh.sl*bj_bjxmmxh.dj as zhje,gycl,bj_bjxmmxh.flmcgg,bj_bjxmmxh.bz";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm,bdm_xmflbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.xmflbm=bdm_xmflbm.xmflbm(+) ";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" and bj_bjxmmxh.xmflbm='01'";
		ls_sql+=" order by bj_gclmxh.fjnxh,bj_bjxmmxh.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		
	
		while (rs.next())
		{
			cbj=rs.getDouble("cbj");
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

			xjcbj+=cbj;
			xjsgcbj+=sgcbj;
			xjsgdbj+=sgdbj;

			allsl+=xjsl;
			allzqje+=zqje;
			allzhje+=zhje;
			allcbj+=cbj;
			allsgcbj+=sgcbj;
			allsgdbj+=sgdbj;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=xmflmc%></td>
				<td><%=jldwmc%></td>
				<td ><%=cf.formatDouble(sl)%></td>
				<td><%=zqdj%></td>
				<td><%=zqje%></td>
				<td><%=zk%></td>
				<td><%=dj%></td>
				<td><%=cf.formatDouble(zhje,"#########.##")%></td>
				<td ><%=cbj%></td>
				<td ><%=sgcbj%></td>
				<td ><%=sgdbj%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="4"><span class="STYLE1"><<%=jgwzmc%>>小计</span></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><span class="STYLE2"><strong><%=cf.formatDouble(xjzqje,"#########.##")%></strong></span></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><span class="STYLE2"><strong><%=cf.formatDouble(xjzhje,"#########.##")%></strong></span></td>
			<td><span class="STYLE2"><strong><%=cf.formatDouble(xjcbj,"#########.##")%></strong></span></td>
			<td><span class="STYLE2"><strong><%=cf.formatDouble(xjsgcbj,"#########.##")%></strong></span></td>
			<td><span class="STYLE2"><strong><%=cf.formatDouble(xjsgdbj,"#########.##")%></strong></span></td>
		  </tr>
		 <%
	}
	
	rs1.close();
	ps1.close();
%> 

  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4"><span class="STYLE1">工 程 总 计</span></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(allzqje,"#########.##")%></strong></span></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(allzhje,"#########.##")%></strong></span></td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(allcbj,"#########.##")%></strong></span></td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(allsgcbj,"#########.##")%></strong></span></td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(allsgdbj,"#########.##")%></strong></span></td>
  </tr>
</table>	
 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"  >
    <td width="3%"><strong>序号</strong></td> 
	<td width="12%"><strong>收费项目名称</strong></td>
	<td width="6%"><strong>项目类型</strong></td>
	<td width="5%"><strong>记入业绩</strong></td>
	<td width="5%"><strong>参与施工队结算</strong></td>
	<td width="6%"><strong>单价</strong></td>
	<td width="5%"><strong>数量</strong></td>
	<td width="6%"><strong>折前金额</strong></td>
	<td width="5%"><strong>折扣率</strong></td>
	<td width="6%"><strong>折后金额</strong></td>
	<td  width="5%" ><strong>成本价百分比</strong></td>
	<td  width="6%" ><strong>成本价</strong></td>
	<td  width="5%" ><strong>施工成本价百分比</strong></td>
	<td  width="6%" ><strong>施工成本价<span class="STYLE3">（参与施工队结算项目）</span></strong></td>
	<td  width="6%" ><strong>其它成本价<span class="STYLE4">（不参与施工队结算项目）</span></strong></td>
	<td  width="5%" ><strong>工程基础报价百分比</strong></td>
	<td  width="6%" ><strong>工程基础报价</strong></td>
  </tr>
  <%  
	double allsfje=0;
	 row=0;

	String sfxmlx=null;
	String sfxmlxmc=null;
	String sfcysgdjs=null;
	String sfcysgdjsmc=null;
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

	double cbjbfb=0;
	double sgcbjbfb=0;
	double gcjcbjbfb=0;

	double xjqtzqje=0;
	double xjqtzhje=0;
	double gcjcbj=0;
	double xjcbj=0;
	double xjsgcbj=0;
	double qtsgcbj=0;
	double xjqtsgcbj=0;
	double xjgcjcbj=0;


	ls_sql="SELECT bj_sfxmmxh.sfxmlx,DECODE(bj_sfxmmxh.sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','4','间接主材费','5','工程管理费','6','工程税金','7','主材管理费','8','主材税金','9','其它') sfxmlxmc,sfcysgdjs,DECODE(sfcysgdjs,'Y','是','N','否') sfcysgdjsmc,sl,cbjbfb,sgcbjbfb,gcjcbjbfb,dj,DECODE(cbjjsfs,'1',zqsfje*cbjbfb/100,sfje*cbjbfb/100) cbj,DECODE(cbjjsfs,'1',zqsfje*sgcbjbfb/100,sfje*sgcbjbfb/100) sgcbj,DECODE(cbjjsfs,'1',zqsfje*gcjcbjbfb/100,sfje*gcjcbjbfb/100) gcjcbj,sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"'";
    ls_sql+=" and sfxmlx in('D','E')";//D：水电路；E：水电路预收
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmlx=cf.fillNull(rs.getString("sfxmlx"));
		sfxmlxmc=cf.fillHtml(rs.getString("sfxmlxmc"));
		sfcysgdjs=cf.fillNull(rs.getString("sfcysgdjs"));
		sfcysgdjsmc=cf.fillHtml(rs.getString("sfcysgdjsmc"));
		cbjbfb=rs.getDouble("cbjbfb");
		sgcbjbfb=rs.getDouble("sgcbjbfb");
		gcjcbjbfb=rs.getDouble("gcjcbjbfb");

		cbj=rs.getDouble("cbj");
		sgcbj=rs.getDouble("sgcbj");
		gcjcbj=rs.getDouble("gcjcbj");
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

		String qtsgcbjStr="&nbsp;";
		String sgcbjStr="&nbsp;";

		if (!sfxmlx.equals("5") && !sfxmlx.equals("6") && !sfxmlx.equals("7") && !sfxmlx.equals("8") && !sfxmlx.equals("A") && !sfxmlx.equals("B"))
		{
			if (sfcysgdjs.equals("Y"))//是否参与施工队结算  Y：是；N：否
			{
				qtsgcbj=0;

				qtsgcbjStr="&nbsp;";
				sgcbjStr=""+sgcbj;
			}
			else{
				qtsgcbj=sgcbj;
				sgcbj=0;

				sgcbjStr="&nbsp;";
				qtsgcbjStr=""+qtsgcbj;
			}
		}
		else{
			qtsgcbj=0;
			sgcbj=0;
		}

		xjcbj+=cbj;
		xjsgcbj+=sgcbj;
		xjqtsgcbj+=qtsgcbj;
		xjgcjcbj+=gcjcbj;
		xjqtzqje+=zqsfje;
		xjqtzhje+=sfje;
		allzqje+=zqsfje;
		allzhje+=sfje;

		row++;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31">
		    <td ><%=row%></td> 
			<td ><%=sfxmmc%></td>
			<td ><%=sfxmlxmc%></td>
			<td ><%=sfjrqye%></td>
			<td ><%=sfcysgdjsmc%></td>
			<td><%=cf.formatDouble(dj,"#########.##")%></td>
			<td><%=cf.formatDouble(sl,"#########.##")%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td><%=cf.formatDouble(dxzkl,"#########.##")%></td>
			<td><%=cf.formatDouble(sfje,"#########.##")%></td>
			<td><%=cf.formatDouble(cbjbfb,"#########.##")%>%</td>
			<td><%=cf.formatDouble(cbj,"#########.##")%></td>
			<td><%=cf.formatDouble(sgcbjbfb,"#########.##")%>%</td>
			<td><%=sgcbjStr%></td>
			<td><%=qtsgcbjStr%></td>
			<td><%=cf.formatDouble(gcjcbjbfb,"#########.##")%>%</td>
			<td><%=cf.formatDouble(gcjcbj,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

%>
  <tr bgcolor="#FFFFFF" align="center"  height="31">
	<td colspan="3"><span class="STYLE2"><strong>水电路小计</strong></span></td> 
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjqtzqje,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjqtzhje,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjcbj,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjsgcbj,"#########.##")%></strong></span></td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjqtsgcbj,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjgcjcbj,"#########.##")%></strong></span></td>
  </tr>


  <tr bgcolor="#FFFFFF" align="center"  height="31">
	<td colspan="3"><span class="STYLE2"><strong>合 计</strong></span></td> 
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjqtzqje,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjqtzhje,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjcbj,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjsgcbj,"#########.##")%></strong></span></td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjqtsgcbj,"#########.##")%></strong></span></td>
	<td >&nbsp;</td>
	<td><span class="STYLE2"><strong><%=cf.formatDouble(xjgcjcbj,"#########.##")%></strong></span></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="17"><strong>总 计&nbsp;&nbsp;&nbsp;&nbsp;折前：<%=cf.formatDouble(allzqje,"#########.##")%>&nbsp;&nbsp;&nbsp;&nbsp;折后：<%=cf.formatDouble(allzhje,"#########.##")%></strong></td>
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





