<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
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
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double cldj=0;
double clje=0;
double xjclje=0;
double rgdj=0;
double rgje=0;
double xjrgje=0;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
String bjxmbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allclje=0;
double allrgje=0;
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

String zcsfss=null;

int crow=0;

String cxh=null;
String cxmbh=null;
String cxmmc=null;

String cjgwzmc=null;
String cjldwmc=null;
double ccldj=0;
double cclje=0;
double xjcclje=0;
double crgdj=0;
double crgje=0;
double xjcrgje=0;
double cdj=0;
double csl=0;
double cqye=0;
String cgycl=null;
String cbjxmbz=null;
double cxjqye=0;
double czjqye=0;
double cxjsl=0;
double callqye=0;
double callsl=0;
double callzj=0;

double glfbfb=0;
double suijinbfb=0;

try {

	
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,zcsfss";
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
		zcsfss=cf.fillNull(rs.getString("zcsfss"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT glfbfb,suijinbfb";
	ls_sql+=" FROM crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		glfbfb=rs.getDouble("glfbfb");
		suijinbfb=rs.getDouble("suijinbfb");
	}
	rs.close();
	ps.close();

	oracle.sql.CLOB  clob=null;

	ls_sql="select dzbjbz";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where  (dwbh='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz");
	}
	rs.close();
	ps.close();

	dzbjbz="";

	if(clob!=null){
		Reader is=clob.getCharacterStream();
		BufferedReader br=new BufferedReader(is);
		String s=br.readLine();
		while(s!=null)
		{
			dzbjbz+=s+",";
			s=br.readLine();
		}
	}

	if (dzbjbz==null)
	{
		dzbjbz="";
	}
	if (dzbjbz.length()>1)
	{
		dzbjbz=dzbjbz.substring(0,dzbjbz.length()-1);
	}
	else{
		dzbjbz="";
	}


	dzbj.Dzbj dzbj=new dzbj.Dzbj();


    double gcsuijin=dzbj.getZhZjxSuijinJe(conn,khbh,zjxxh,"hmy","1");//lx   1:工程费税金；2:主材税金
	double zcsuijin=dzbj.getZhZjxSuijinJe(conn,khbh,zjxxh,"hmy","2");
	double allsuijin = cf.round(gcsuijin + zcsuijin,2) ;

	double gcglf=dzbj.getZhZjxGlfJe(conn,khbh,zjxxh,"hmy","1");//1:工程管理费；2:主材管理费；3:自购主材管理费；4:自购主材管理费＋主材管理费
	double zcglf=dzbj.getZhZjxGlfJe(conn,khbh,zjxxh,"hmy","4");
	double allglf = cf.round(gcglf + zcglf,2) ;

	
%>
<body >

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td colspan="5"><div align="center"><img src="../../images/name.jpg" width="227" height="15"></div></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="center" colspan="5" height="35"><font size="3" face="楷体_GB2312">工程预(决)算书--企业ERP运营管理系统</td>
  </tr>
 
  <tr bgcolor="#FFFFFF">
    <td colspan="4" >业主姓名：<%=khxm%></td>
    <td width="80%" align="left" >工程地点：<%=fwdz%></td>
  </tr>
</table>
<table border="1" width="100%"  style="border-collapse:   collapse"   cellpadding="0"   cellspacing="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center">
    <td  width="3%" rowspan="2">项次</td>
    <td  width="16%" rowspan="2">分部分项工程名称</td>
    <td  width="32%" rowspan="2">主材及辅材 规格 型号 品牌 等级</td>
    <td  width="2%" rowspan="2">单位</td>
    <td  width="4%" rowspan="2">数量</td>
    <td colspan="2">主材及辅料费</td>
    <td colspan="2">人工单价</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="3%">单价</td>
    <td  width="5%">金额</td>
    <td  width="3%">单价</td>
    <td width="5%">金额</td>
    <td  width="27%">备注</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="18" colspan="10"><strong>A 基础装修部分</strong></td>
  </tr>
  <%
	
	int i=0;
	ls_sql="SELECT bj_fjxxh.jgwzbm";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		xjclje=0;
		xjrgje=0;
		
		ls_sql="SELECT sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je,sum(bj_gclmxh.sl*bj_bjxmmxh.cldj) as clje,sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj) as rgje";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";//1：工程类（与其它收费项目相关）；2：工程类（与其它收费项目无关）；3：主材类
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjsl=rs.getDouble("sl");
			xjqye=rs.getDouble("je");
			xjclje=rs.getDouble("clje");
			xjrgje=rs.getDouble("rgje");
		}
		rs.close();
		ps.close();

		if (xjqye == 0)
		{
			continue ;
		}

		allsl+=xjsl;
		allqye+=xjqye;
		allclje+=xjclje;
		allrgje+=xjrgje;
		
		//输出标题
		%> 
  
  <tr bgcolor="#FFFFFF"> 
    <td height="18" colspan="10"><%=jgwzmc%></td>
  </tr>
  <%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmxh.cldj,bj_gclmxh.sl*bj_bjxmmxh.cldj as clje,bj_bjxmmxh.rgdj,bj_gclmxh.sl*bj_bjxmmxh.rgdj as rgje,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,gycl,bj_bjxmmxh.bz";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" order by bj_gclmxh.fjnxh,bj_bjxmmxh.xmpx,bj_bjxmmxh.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			cldj=rs.getDouble("cldj");
            clje=rs.getDouble("clje");
			rgdj=rs.getDouble("rgdj");
			rgje=rs.getDouble("rgje");
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));
			bjxmbz=cf.fillHtml(rs.getString("bz"));

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center" height="18"> 
				<td ><%=row%></td>
				<td align="left"><%=xmmc%></td>
				<td align="left"><%=gycl%></td>
				<td ><%=jldwmc%></td>
				<td ><%=cf.formatDouble(sl)%></td>
				<td ><%=cldj%></td>
				<td ><%=cf.formatDouble(clje,"#########.##")%></td>
				<td ><%=rgdj%></td>
				<td ><%=cf.formatDouble(rgje,"#########.##")%></td>
				<td align="left"><%=bjxmbz%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();
		%>

	<tr bgcolor="#FFFFFF" height="18" align="center">
		<td colspan="5"><B>小 计</B></td>
		<td colspan="2"><%=cf.formatDouble(xjclje,"#########.##")%></td>
		<td colspan="2"><%=cf.formatDouble(xjrgje,"#########.##")%></td>
		<td>&nbsp;</td>
	</tr>

<%
	}
	rs1.close();
	ps1.close();
%> 

  
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="5">基础装修工程直接费合计：</td>
    <td colspan="4" align="center"><%=cf.formatDouble(allqye,"#########.##")%></td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="18" colspan="10" align="center"><div align="left">基础装修工程间接费</div></td>
  </tr>
  <%  
	double allsfje=0;
	int count=0;

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
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金','4','固定金额(不可改)','5','管理费','6','主材费百分比','7','工程加主材费百分比') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and sfxmlx not in('4','5','6')";
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sflx=cf.fillHtml(rs.getString("sflx"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		bz=cf.fillHtml(rs.getString("bz"));
		sfbxx=cf.fillHtml(rs.getString("sfbxx"));
		sfjrqye=cf.fillHtml(rs.getString("sfjrqye"));
		jrsjbz=cf.fillHtml(rs.getString("jrsjbz"));
		jrglfbz=cf.fillHtml(rs.getString("jrglfbz"));
		zqsfje=rs.getDouble("zqsfje");
		dxzkl=rs.getDouble("dxzkl");
		sfkdz=cf.fillHtml(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");

       
		allsfje+=zqsfje;
		
		count++;

		%> 
		  <tr bgcolor="#FFFFFF" align="center"  height="18" >
			<td><%=count%></td>
			<td  colspan="4"><%=sfxmmc%></td>
			<td  colspan="4"><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td  ><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;

%> 

  <tr bgcolor="#FFFFFF" align="center"  height="18" > 
    <td><%=count+1%></td>
    <td colspan="4">基础装修施工管理费<%=glfbfb%>%（基础装修直接费 x <%=glfbfb%>%）</td>
    
    <td colspan="4"><%=gcglf%></td>
    <td >&nbsp;</td>
  </tr>
<%
	if (!zcsfss.equals("Y"))//主材是否收税
	{
		%>
	  <tr bgcolor="#FFFFFF"  height="18"> 
		<td colspan="5" ><div align="left">基础装修工程间接费合计</div></td>
		<td colspan="4" ><div align="center"><%=cf.formatDouble(allsfje+gcglf,"#########.##")%></div></td>
		<td >&nbsp;</td>
	  </tr>
	  <tr bgcolor="#FFFFFF"  height="18">
		<td colspan="5" ><div align="left">代收代交税金<%=suijinbfb%>%</div></td>
		<td colspan="4" ><div align="center"><%=allsuijin%></div></td>
		<td >&nbsp;</td>
	  </tr>
	  <tr bgcolor="#FFFFFF"  height="18">
		<td colspan="5" ><div align="left">基础装修部分总价</div></td>
		<td colspan="4" ><div align="center"><%=cf.formatDouble(allzj+gcglf+allsuijin,"#########.##")%></div></td>
		<td >&nbsp;</td>
	  </tr>
		<%
	}
	else
	{
		%>
	  <tr bgcolor="#FFFFFF"  height="18"> 
		<td colspan="5" ><div align="left">基础装修工程间接费合计</div></td>
		<td colspan="4" ><div align="center"><%=cf.formatDouble(allsfje+gcglf,"#########.##")%></div></td>
		<td >&nbsp;</td>
	  </tr>
	  <tr bgcolor="#FFFFFF"  height="18">
		<td colspan="5" ><div align="left">基础装修部分总价</div></td>
		<td colspan="4" ><div align="center"><%=cf.formatDouble(allzj+gcglf,"#########.##")%></div></td>
		<td >&nbsp;</td>
	  </tr>
		<%
	}
%>







  <tr bgcolor="#FFFFFF">
    <td height="18" colspan="10"><div align="left"><strong>B 主要材料部分</strong></div></td>
  </tr>
  <%
    int ci=0;
	ls_sql="SELECT bj_fjxxh.jgwzbm";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		cjgwzmc=rs1.getString("jgwzbm");

		cxjsl=0;
		cxjqye=0;
		
		ls_sql="SELECT sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je,sum(bj_gclmxh.sl*bj_bjxmmxh.cldj) as clje,sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj) as rgje";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+cjgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('3')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cxjsl=rs.getDouble("sl");
			cxjqye=rs.getDouble("je");
			xjcclje=rs.getDouble("clje");
			xjcrgje=rs.getDouble("rgje");
		}
		rs.close();
		ps.close();

		if (cxjqye == 0)
		{
			continue ;
		}
        
		callsl+=cxjsl;
		callqye+=cxjqye;
		
		//输出标题
		%> 
  
  <tr bgcolor="#FFFFFF"> 
    <td height="18" colspan="10"><%=cjgwzmc%> </td>
  </tr>
  <%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmxh.cldj,bj_gclmxh.sl*bj_bjxmmxh.cldj as clje,bj_bjxmmxh.rgdj,bj_gclmxh.sl*bj_bjxmmxh.rgdj as rgje,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,gycl,bj_bjxmmxh.bz";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+) ";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+cjgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('3')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" order by bj_gclmxh.fjnxh,bj_bjxmmxh.xmpx,bj_bjxmmxh.xh";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{

			cxh=cf.fillHtml(rs.getString("xh"));
			cxmbh=cf.fillHtml(rs.getString("xmbh"));
			cxmmc=cf.fillHtml(rs.getString("xmmc"));

			cjldwmc=cf.fillHtml(rs.getString("jldwmc"));
			ccldj=rs.getDouble("cldj");
            cclje=rs.getDouble("clje");
			crgdj=rs.getDouble("rgdj");
			crgje=rs.getDouble("rgje");
			cdj=rs.getDouble("dj");
			csl=rs.getDouble("sl");
			cqye=rs.getDouble("je");
			cgycl=cf.fillHtml(rs.getString("gycl"));
			cbjxmbz=cf.fillHtml(rs.getString("bz"));

			crow++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" height="18" align="center"> 
				<td><%=crow%></td>
				<td align="left"><%=cxmmc%></td>
				<td align="left"><%=cgycl%></td>
				<td><%=cjldwmc%></td>
				<td><%=cf.formatDouble(csl)%></td>
				<td><%=ccldj%></td>
				<td><%=cf.formatDouble(cclje,"#########.##")%></td>
				<td><%=crgdj%></td>
				<td><%=cf.formatDouble(crgje,"#########.##")%></td>
				<td align="left"><%=cbjxmbz%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();
	
		%>
		<tr bgcolor="#FFFFFF" height="18" align="center">
			<td colspan="5"><B>小 计</B></td>
			<td colspan="2"><%=cf.formatDouble(xjcclje,"#########.##")%></td>
			<td colspan="2"><%=cf.formatDouble(xjcrgje,"#########.##")%></td>
			<td>&nbsp;</td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();
%> 
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5">主要材料工程直接费合计</td>
    <td colspan="4" align="center"><%=cf.formatDouble(callqye,"#########.##")%></td>
    <td>&nbsp;</td>
  </tr>



  <tr bgcolor="#FFFFFF"> 
    <td height="18" colspan="10">主要材料工程间接费</td>
  </tr>
  <%  
	double callsfje=0;
	count=0;

	String csfxmbm=null;
	String csfxmmc=null;
	String csflx=null;
	double csfbfb=0;
	double csfje=0;
	String cbz=null;
	String csfbxx=null;
	String csfjrqye=null;
	String cjrsjbz=null;
	String cjrglfbz=null;
	double czqsfje=0;
	double cdxzkl=0;
	String csfkdz=null;
	double czdzk=0;
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金','4','固定金额(不可改)','5','管理费','6','主材费百分比','7','工程加主材费百分比') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and sfxmlx in('4')";
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		csfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		csfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		csflx=cf.fillHtml(rs.getString("sflx"));
		csfbfb=rs.getDouble("sfbfb");
		csfje=rs.getDouble("sfje");
		cbz=cf.fillHtml(rs.getString("bz"));
		csfbxx=cf.fillHtml(rs.getString("sfbxx"));
		csfjrqye=cf.fillHtml(rs.getString("sfjrqye"));
		cjrsjbz=cf.fillHtml(rs.getString("jrsjbz"));
		cjrglfbz=cf.fillHtml(rs.getString("jrglfbz"));
		czqsfje=rs.getDouble("zqsfje");
		cdxzkl=rs.getDouble("dxzkl");
		csfkdz=cf.fillHtml(rs.getString("sfkdz"));
		czdzk=rs.getDouble("zdzk");
        
		
		callsfje+=czqsfje;
		count++;
       
		%> 
		  <tr bgcolor="#FFFFFF" align="center" height="18"  > 
			<td><%=count%></td>
			<td colspan="4"><%=csfxmmc%></td>
			<td colspan="4"><%=cf.formatDouble(czqsfje,"#########.##")%></td>
			<td  ><%=cbz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	callzj=callsfje+callqye;

%> 
  <tr bgcolor="#FFFFFF" align="center" height="18"  > 
    <td><%=count+1%></td>
    <td colspan="4">主要材料施工管理费<%=glfbfb%>%（主材直接费 x <%=glfbfb%>%）</td>
    <td colspan="4"><%=zcglf%></td>
    <td >&nbsp;</td>
  </tr>

	<tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="5">主要材料工程间接费合计</td>
    <td colspan="4" align="center"><%=cf.formatDouble(callsfje+zcglf,"#########.##")%></td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="5">主要材料部分总价</td>
    <td colspan="4" align="center" ><%=cf.formatDouble(callzj+zcglf,"#########.##")%></td>
    <td>&nbsp;</td>
  </tr>
<%
	double zgzchj=0;

	ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je ";
	ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm  ";
	ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"' ";
	ls_sql+=" and bj_bjxmmxh.sfzgzc='Y' ";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('3')";
	ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zgzchj=rs.getDouble(1);
	}
	rs.close();
	ps.close();
%>

  <tr bgcolor="#FFFFFF" height="18" align="center"> 
    <td colspan="2"><B>扣除甲供材料</B></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td colspan="4"><%=zgzchj%></td>
    <td>&nbsp;</td>
  </tr>

<%
	if (zcsfss.equals("Y"))
	{
		%>
	  <tr bgcolor="#FFFFFF" height="18" align="center"> 
		<td colspan="2"><B>代收代交税金<%=suijinbfb%>%</B></td>
		<td >（总价 x <%=suijinbfb%>%）</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td colspan="4" align="center"><%=allsuijin%></td>
		<td>&nbsp;</td>
	  </tr>
		<%
	}
%>

  <tr bgcolor="#FFFFFF" height="18" align="center"> 
    <td colspan="2"><B>总价</B></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td colspan="4" align="center"><%=cf.formatDouble(allzj+callzj+gcsuijin+zcsuijin+gcglf+zcglf-zgzchj,"#########.##")%></td>
    <td>&nbsp;</td>
  </tr>






  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="10">备注：</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="10">一、本工程所用材料品牌、等级均按预算中所定内容执行。所有现场制作家具均不包括拉手。</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="10">二、决算时工程量按实结算，单价不变；现场签证的工程内容，按签证金额列入决算。</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="10">三、预算中隐蔽工程量为初步估算、所有工程量按实际测量为准。</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="10">四、墙地砖、地板、洁具等报价在不确定其型号、规格时按普价进行预算，待确定具体型号时再按实际价格计算，并签定变更单。</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="10">五、墙地砖、地板斜铺或异形铺法价格另计；本报价系统主材部分报价已打折优惠。</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="10">六、乙方给甲方推荐材料部分，其售后由商家提供的保修服务为准。</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="18"> 
    <td colspan="10">七、因建材市场价格不稳定，其不确定因素较多，故本报价自报出日期起有效期为一个月。</td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td height="18" colspan="10"><div align="left"><strong>甲供材料清单</strong></div></td>
  </tr>
  <%

	//输出项目明细
	crow=0;
	ls_sql="SELECT bj_bjxmmxh.xmbh,bj_bjxmmxh.bjlx,xmmc,jldwmc,bj_bjxmmxh.dj,gycl,sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je";
	ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
	ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+) ";
	ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' ";
	ls_sql+=" and bj_bjxmmxh.sfzgzc='Y' ";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('3')";
	ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.bjlx,xmmc,jldwmc,bj_bjxmmxh.dj,gycl";
//		out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{

		cxmbh=cf.fillHtml(rs.getString("xmbh"));
		cxmmc=cf.fillHtml(rs.getString("xmmc"));

		cjldwmc=cf.fillHtml(rs.getString("jldwmc"));
		cdj=rs.getDouble("dj");
		csl=rs.getDouble("sl");
		cqye=rs.getDouble("je");
		cgycl=cf.fillHtml(rs.getString("gycl"));


		crow++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" height="18" align="center"> 
			<td><%=crow%></td>
			<td align="left" colspan="2"><%=cxmmc%></td>
			<td><%=cjldwmc%></td>
			<td><%=cf.formatDouble(csl)%></td>
			<td colspan="2"><%=cdj%></td>
			<td colspan="2"><%=cf.formatDouble(cqye,"#########.##")%></td>
			<td>&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3">&nbsp;</td>
    <td colspan="6" align="center"><%=cf.formatDouble(zgzchj,"#########.##")%></td>
    <td>&nbsp;</td>
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






