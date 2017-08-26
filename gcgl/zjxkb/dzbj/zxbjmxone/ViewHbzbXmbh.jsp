<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "隶书";
}
-->
</style>
</head>

<%
String khbh=request.getParameter("khbh");
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String bjjb=request.getParameter("bjjb");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";

int row=0;

String xmbh=null;
String xmmc=null;
String glmc=null;
String pp=null;
String xh=null;

double tj=0;
double zdyxmmj=0;
double zdybzmj=0;

double jqsfl=0;
double bsfl=0;
double tvocsfl=0;
double hj=0;
double zjhsl=0;

double jqsflAll=0;
double bsflAll=0;
double tvocsflAll=0;
double hjAll=0;

String jqsflStr=null;
String bsflStr=null;
String tvocsflStr=null;
String hjStr=null;


double zdyxmjqbz=0;
double zdyxmbbz=0;
double zdyxmtvocbz=0;

double zdybzjqbz=0;
double zdybzbbz=0;
double zdybztvocbz=0;

double zdyxmjqsfl=0;
double zdyxmbsfl=0;
double zdyxmtvocsfl=0;

double zdybcjqsfl=0;
double zdybcbsfl=0;
double zdybctvocsfl=0;

try {
	conn=cf.getConnection();


	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdyxmjqbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmjqbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdyxmbbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmbbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdyxmtvocbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmtvocbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdybzjqbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdybzjqbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdybzbbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdybzbbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdybztvocbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdybztvocbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	
	
	ls_sql="SELECT fjmj*fjg tj,zdyxmmj,zdybzmj";
	ls_sql+=" FROM bj_fjxx";
    ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
    ls_sql+=" order by xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tj=rs.getDouble("tj");
		zdyxmmj=rs.getDouble("zdyxmmj");
		zdybzmj=rs.getDouble("zdybzmj");
	}
	rs.close();
	ps.close();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>


<center>
    <span class="STYLE2">环保指标（<%=jgwzbm%>，<%=tj%>立方）</span>
</center>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >

  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">项目编号</td>
	  <td  width="22%"><font color="#0000FF"><b>项目名称</b></font></td>
	  <td  width="6%"><font color="#0000FF"><b>工程量</b></font></td>
	  <td  width="18%"><font color="#0000FF"><b>工料名称</b></font></td>
	  <td  width="11%"><font color="#0000FF"><b>品牌</b></font></td>
	  <td  width="11%"><font color="#0000FF"><b>型号</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>甲醛释放量</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>苯释放量</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>TVOC释放量</b></font></td>

    </tr>

<%


	ls_sql="SELECT bj_gclmx.xmbh,bj_bjxmmx.xmmc,bj_jzglfxb.glmc,bj_jzglfxb.pp,bj_jzglfxb.xh,bj_gclmx.zjhsl,bj_gclmx.zjhsl*bj_jzglfxb.jqsfl jqsfl,bj_gclmx.zjhsl*bj_jzglfxb.bsfl bsfl,bj_gclmx.zjhsl*bj_jzglfxb.tvocsfl tvocsfl";
	ls_sql+=" FROM bj_gclmx,bj_bjxmmx,bj_jzglfxb";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" and bj_gclmx.dqbm=bj_jzglfxb.dqbm and bj_gclmx.xmbh=bj_jzglfxb.xmbh and bj_jzglfxb.bjjbbm='"+bjjb+"'";
	ls_sql+=" and bj_gclmx.khbh=bj_bjxmmx.khbh and bj_gclmx.xmbh=bj_bjxmmx.xmbh  ";
	ls_sql+=" and bj_bjxmmx.bjlx='1'";//1:标准项目;2:自定义项目
//		out.println(ls_sql);
	ls_sql+=" order by bj_gclmx.xmbh,bj_jzglfxb.glmc";//1:标准项目;2:自定义项目
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		glmc=rs.getString("glmc");
		pp=cf.fillHtml(rs.getString("pp"));
		xh=cf.fillHtml(rs.getString("xh"));
		zjhsl=rs.getDouble("zjhsl");
		jqsfl=rs.getDouble("jqsfl");
		bsfl=rs.getDouble("bsfl");
		tvocsfl=rs.getDouble("tvocsfl");

		if (tj!=0)
		{
			jqsfl=cf.round(jqsfl/tj,4);
			bsfl=cf.round(bsfl/tj,4);
			tvocsfl=cf.round(tvocsfl/tj,4);
		}
		else{
			jqsfl=0;
			bsfl=0;
			tvocsfl=0;
		}

		hj=jqsfl+bsfl+tvocsfl;

		jqsflAll+=jqsfl;
		bsflAll+=bsfl;
		tvocsflAll+=tvocsfl;
		hjAll+=hj;



		if (jqsfl!=0)
		{
			jqsflStr=cf.formatDouble(jqsfl,"0.####")+"/立方";
		}
		else{
			jqsflStr="&nbsp;";
		}

		if (bsfl!=0)
		{
			bsflStr=cf.formatDouble(bsfl,"0.####")+"/立方";
		}
		else{
			bsflStr="&nbsp;";
		}

		if (tvocsfl!=0)
		{
			tvocsflStr=cf.formatDouble(tvocsfl,"0.####")+"/立方";
		}
		else{
			tvocsflStr="&nbsp;";
		}

		if (hj!=0)
		{
			hjStr=hj+"/立方";
		}
		else{
			hjStr="&nbsp;";
		}
	
		
		
		
		
		
		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//输出每行数据
		%> 
		<tr bgcolor="<%=bgcolor%>" align="center"> 
		<td><%=xmbh%></td>
		<td><%=xmmc%></td>
		<td><%=zjhsl%></td>
		<td><%=glmc%></td>
		<td><%=pp%></td>
		<td><%=xh%></td>
		<td><%=jqsflStr%></td>
		<td><%=bsflStr%></td>
		<td><%=tvocsflStr%></td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();


	
	jqsflAll=cf.round(jqsflAll,4);
	bsflAll=cf.round(bsflAll,4);
	tvocsflAll=cf.round(tvocsflAll,4);
	hjAll=cf.round(hjAll,4);
	
	if (jqsflAll!=0)
	{
		jqsflStr=jqsflAll+"/立方";
	}
	else{
		jqsflStr="&nbsp;";
	}

	if (bsflAll!=0)
	{
		bsflStr=bsflAll+"/立方";
	}
	else{
		bsflStr="&nbsp;";
	}

	if (tvocsflAll!=0)
	{
		tvocsflStr=tvocsflAll+"/立方";
	}
	else{
		tvocsflStr="&nbsp;";
	}

	if (hjAll!=0)
	{
		hjStr=hjAll+"/立方";
	}
	else{
		hjStr="&nbsp;";
	}
%>
	<tr bgcolor="<%=bgcolor%>" align="center"> 
	<td colspan="2">标准报价项目合计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=jqsflStr%></td>
	<td><%=bsflStr%></td>
	<td><%=tvocsflStr%></td>
	</tr>

  </table>

<P><center>自定义报价项目</center>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >

  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">项目编号</td>
	  <td  width="22%"><font color="#0000FF"><b>项目名称</b></font></td>
	  <td  width="6%"><font color="#0000FF"><b>工程量</b></font></td>
	  <td  width="18%"><font color="#0000FF"><b>工料名称</b></font></td>
	  <td  width="11%"><font color="#0000FF"><b>品牌</b></font></td>
	  <td  width="11%"><font color="#0000FF"><b>型号</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>甲醛释放量</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>苯释放量</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>TVOC释放量</b></font></td>
  </tr>

<%


	ls_sql="SELECT bj_gclmx.xmbh,bj_bjxmmx.xmmc,bj_gclmx.zjhsl";
	ls_sql+=" FROM bj_gclmx,bj_bjxmmx";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" and bj_gclmx.khbh=bj_bjxmmx.khbh and bj_gclmx.xmbh=bj_bjxmmx.xmbh  ";
	ls_sql+=" and bj_bjxmmx.bjlx='2'";//1:标准项目;2:自定义项目
	ls_sql+=" order by bj_gclmx.xmbh ";//1:标准项目;2:自定义项目
//		out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		zjhsl=rs.getDouble("zjhsl");

				
		
		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//输出每行数据
		%> 
		<tr bgcolor="<%=bgcolor%>" align="center"> 
		<td><%=xmbh%></td>
		<td><%=xmmc%></td>
		<td><%=zjhsl%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
%>
</table>

<%

	//自定义木作
	zdyxmjqsfl=zdyxmjqbz*zdyxmmj;

	zdyxmbsfl=zdyxmbbz*zdyxmmj;

	zdyxmtvocsfl=zdyxmtvocbz*zdyxmmj;

	//自定义壁纸
	zdybcjqsfl=zdybzjqbz*zdybzmj;

	zdybcbsfl=zdybzbbz*zdybzmj;

	zdybctvocsfl=zdybztvocbz*zdybzmj;


	if (tj!=0)
	{
		zdyxmjqsfl=cf.round(zdyxmjqsfl/tj,4);
		zdyxmbsfl=cf.round(zdyxmbsfl/tj,4);
		zdyxmtvocsfl=cf.round(zdyxmtvocsfl/tj,4);

		zdybcjqsfl=cf.round(zdybcjqsfl/tj,4);
		zdybcbsfl=cf.round(zdybcbsfl/tj,4);
		zdybctvocsfl=cf.round(zdybctvocsfl/tj,4);
	}
	else{
		zdyxmjqsfl=0;
		zdyxmbsfl=0;
		zdyxmtvocsfl=0;

		zdybcjqsfl=0;
		zdybcbsfl=0;
		zdybctvocsfl=0;
	}


%>
  </table>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
    <tr align="center">
      <td width="14%" rowspan="2">&nbsp;</td>
      <td colspan="3"><strong>自定义木作项目</strong></td>
      <td colspan="3"><strong>自定义壁纸项目</strong></td>
      <td width="14%" rowspan="2"><strong>合计</strong></td>
    </tr>
    <tr align="center">
      <td width="12%"><strong>每平米释放量</strong></td>
      <td width="12%"><strong>自定义面积</strong></td>
      <td width="12%"><strong>总释放量</strong></td>
      <td width="12%"><strong>每平米释放量</strong></td>
      <td width="12%"><strong>自定义面积</strong></td>
      <td width="12%"><strong>总释放量</strong></td>
    </tr>
    <tr align="center">
      <td><font color="#0000FF"><b>甲醛</b></font></td>
      <td><%=cf.formatDouble(zdyxmjqbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmjqsfl,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzjqbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdybcjqsfl,"0.####")%></td>
      <td><%=cf.formatDouble(cf.round((zdyxmjqsfl+zdybcjqsfl),4),"0.####")%></td>
    </tr>
    <tr align="center">
      <td><font color="#0000FF"><b>苯</b></font></td>
      <td><%=cf.formatDouble(zdyxmbbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmbsfl,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzbbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdybcbsfl,"0.####")%></td>
      <td><%=cf.formatDouble(cf.round((zdyxmbsfl+zdybcbsfl),4),"0.####")%></td>
    </tr>
    <tr align="center">
      <td><font color="#0000FF"><b>TVOC</b></font></td>
      <td><%=cf.formatDouble(zdyxmtvocbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmtvocsfl,"0.####")%></td>
      <td><%=cf.formatDouble(zdybztvocbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdybctvocsfl,"0.####")%></td>
      <td><%=cf.formatDouble(cf.round((zdyxmtvocsfl+zdybctvocsfl),4),"0.####")%></td>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>