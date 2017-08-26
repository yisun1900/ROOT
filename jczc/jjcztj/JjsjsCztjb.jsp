<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
}
if (!(sjs.equals("")))
{
	wheresql+=" and sq_yhxx.yhmc='"+sjs+"'";
}


String getfgsbh=null;
String getdwmc=null;
String getsjs=null;

String olddwbh="";

int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;
try {
	conn=cf.getConnection();

	//系统日志
	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+8 from sq_ckxxrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：设计师家居业绩："+sjfw+"："+sjfw2+"："+fgs);
	ps.executeUpdate();
	ps.close();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>家居设计师产值统计<BR>
  (时间范围：<%=sjfw%>--<%=sjfw2%>)</B> <BR>
</CENTER>

<table border="1" width="190%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="3%">序号</td>
    <td rowspan="2"  width="6%">分公司</td>
    <td rowspan="2"  width="4%">设计师</td>
    <td colspan="2">接单量</td>
    <td colspan="2">累计接单量</td>
    <td colspan="2">现存单未签数</td>
    <td rowspan="2"  width="3%">成单率</td>
    <td colspan="2">签单量</td>
    <td colspan="2">签约金额</td>
    <td colspan="2">退单数量</td>
    <td  rowspan="2" width="4%">橱柜家具客诉</td>
    <td colspan="3">累计签约额</td>
    <td colspan="3">累计安装户数</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="4%">橱柜</td>
    <td  width="4%">家具</td>
    <td  width="4%">橱柜</td>
    <td  width="4%">家具</td>
    <td  width="4%">橱柜</td>
    <td  width="4%">家具</td>
    <td  width="4%">橱柜</td>
    <td  width="4%">家具</td>
    <td  width="5%">橱柜</td>
    <td  width="5%">家具</td>
    <td  width="4%">橱柜</td>
    <td  width="4%">家具</td>

    <td  width="6%">橱柜</td>
    <td  width="6%">家具</td>
    <td  width="6%">合计</td>
    <td  width="4%">橱柜</td>
    <td  width="4%">家具</td>
    <td  width="4%">合计</td>
  </tr>
  <%
  //家居业绩＝本期签约额+本期增项<可能前期签得合同>-本期减项<可能前期签得合同>-本期退单<可能前期签得合同>

	int xjcgjdl=0;
	int xjjjjdl=0;
	int xjljcgjdl=0;
	int xjljjjjdl=0;
	int xjcgwqds=0;
	int xjjjwqds=0;
	int xjcgqds=0;
	double xjcgqde=0;
	int xjjjqds=0;
	double xjjjqde=0;
	int xjcgtds=0;
	double xjcgtde=0;
	int xjjjtds=0;
	double xjjjtde=0;
	int xjcgjjkss=0;
	int xjljcgqds=0;
	double xjljcgqde=0;
	int xjljjjqds=0;
	double xjljjjqde=0;

	int xjljcgazs=0;
	int xjljjjazs=0;

	double cgjjqdl=0;

	//获取全部家居设计师，扣除离职员工
	ls_sql=" select sq_yhxx.ssfgs,dwmc,yhmc";
	ls_sql+=" from sq_yhxx,sq_dwxx ";
	ls_sql+=" where sq_yhxx.ssfgs=sq_dwxx.dwbh and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N')";
	ls_sql+=wheresql;
	ls_sql+=" order by ssfgs,yhmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("ssfgs");
		getdwmc=rs.getString("dwmc");
		getsjs=rs.getString("yhmc");

		row++;

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else
		{
			bgcolor="FFFFFF";
		}

		//时间段橱柜接单量
		int cgjdl=0;
		int jjjdl=0;

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgjdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjcgjdl+=cgjdl;

		//时间段家具接单量
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjjdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjjjjdl+=jjjdl;

		//累计橱柜接单量
		int ljcgjdl=0;
		int ljjjjdl=0;

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljcgjdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjljcgjdl+=ljcgjdl;

		//累计家具接单量
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljjjjdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjljjjjdl+=ljjjjdl;

		//橱柜未签单数
		int cgwqds=0;
		int jjwqds=0;

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.clzt in('03','05','07','09','11')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgwqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjcgwqds+=cgwqds;

		//家具未签单数
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.clzt in('03','05','07','09','11')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjwqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjjjwqds+=jjwqds;

		//橱柜签单数、签约金额
		int cgqds=0;
		double cgqde=0;

		ls_sql="SELECT count(*),sum(jc_cgdd.htze)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgqds=rs1.getInt(1);
			cgqde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		//橱柜退单数
		int cgtds=0;
		double cgtde=0;

		ls_sql="SELECT count(*),sum(jc_cgdd.htze)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt='99' and jc_cgdd.htze>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgtds=rs1.getInt(1);
			cgtde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		xjcgtds+=cgtds;
		xjcgtde+=cgtde;

		//橱柜增减项总额
		double cgzjxze=0;
		ls_sql="SELECT sum(jc_cgzjx.zjxze) zjxze";
		ls_sql+=" FROM crm_khxx,jc_cgdd,jc_cgzjx";
		ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgdd.ddbh=jc_cgzjx.ddbh";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
		ls_sql+=" and jc_cgzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgzjx.clzt!='00'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgzjxze=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		xjcgqds+=cgqds-cgtds;
		xjcgqde+=cgqde-cgtde+cgzjxze;

		//家具签单数、签约金额
		int jjqds=0;
		double jjqde=0;

		ls_sql="SELECT count(*),sum(jc_jjdd.htze)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjqds=rs1.getInt(1);
			jjqde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		//家具退单数
		int jjtds=0;
		double jjtde=0;

		ls_sql="SELECT count(*),sum(jc_jjdd.htze)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt='99' and jc_jjdd.htze>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjtds=rs1.getInt(1);
			jjtde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		xjjjtds+=jjtds;
		xjjjtde+=jjtde;

		//家具增减项金额计算
		double jjzjxze=0;
		ls_sql="SELECT sum(jc_jjzjx.zjxze) zjxze";
		ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjzjx";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjzjx.ddbh=jc_jjdd.ddbh";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
		ls_sql+=" and jc_jjzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjzjx.clzt!='00'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjzjxze=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		xjjjqds+=jjqds-jjtds;
		xjjjqde+=jjqde-jjtde+jjzjxze;

		//橱柜家具客诉数
		int cgjjkss=0;


		ls_sql="SELECT count(distinct khbh)";
		ls_sql+=" from (";
		ls_sql+=" SELECT crm_khxx.khbh";
		ls_sql+=" FROM crm_khxx,jc_cgdd,crm_tsjl,crm_tsbm";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"' and crm_tsbm.tslxbm='2305'";//2305：家居设计师/测量师投诉
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT crm_khxx.khbh";
		ls_sql+=" FROM crm_khxx,jc_jjdd,crm_tsjl,crm_tsbm";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"' and crm_tsbm.tslxbm='2305'";//2305：家居设计师/测量师投诉
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" )";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgjjkss=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjcgjjkss+=cgjjkss;


		//累计橱柜签单数、累计签约金额
		int ljcgqds=0;
		double ljcgqde=0;
		int ljjjqds=0;
		double ljjjqde=0;

		ls_sql="SELECT count(*),sum(jc_cgdd.zjhze)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljcgqds=rs1.getInt(1);
			ljcgqde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		xjljcgqds+=ljcgqds;
		xjljcgqde+=ljcgqde;

		//累计家具签单数、累计签约金额
		ls_sql="SELECT count(*),sum(jc_jjdd.zjhze)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljjjqds=rs1.getInt(1);
			ljjjqde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		xjljjjqds+=ljjjqds;
		xjljjjqde+=ljjjqde;

	  
		//累计橱柜安装户数
		int ljcgazs=0;
		int ljjjazs=0;

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.clzt in('31','33','35')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljcgazs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjljcgazs+=ljcgazs;

		//累计家具安装户数
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.clzt in('31','33','35')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljjjazs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjljjjazs+=ljjjazs;

		if ((ljcgjdl+ljjjjdl)==0)
		{
			cgjjqdl=0;
		}
		else{
			cgjjqdl=(ljcgqds+ljjjqds)*100.0/(ljcgjdl+ljjjjdl);
		}

	  %> 
	  <tr align="center" bgcolor="<%=bgcolor%>"> 
		<td ><%=row%> </td>
		<td ><%=getdwmc%></td>
		<td ><%=getsjs%></td>
		<td  align="right"><%=cgjdl%></td>
		<td  align="right"><%=jjjdl%></td>
		<td  align="right"><%=ljcgjdl%></td>
		<td  align="right"><%=ljjjjdl%></td>
		<td  align="right"><%=cgwqds%></td>
		<td  align="right"><%=jjwqds%></td>
		<td  align="right"><%=cf.formatDouble(cgjjqdl)%>%</td>
		<td  align="right"><%=cgqds%></td>
		<td  align="right"><%=jjqds%></td>
		<td  align="right"><%=cf.formatDouble(cgqde)%></td>
		<td  align="right"><%=cf.formatDouble(jjqde)%></td>
		<td  align="right"><%=cgtds%></td>
		<td  align="right"><%=jjtds%></td>
		<td  align="right"><%=cgjjkss%></td>
		<td  align="right"><%=cf.formatDouble(ljcgqde)%></td>
		<td  align="right"><%=cf.formatDouble(ljjjqde)%></td>
		<td  align="right"><%=cf.formatDouble(ljcgqde+ljjjqde)%></td>
		<td  align="right"><%=ljcgazs%></td>
		<td  align="right"><%=ljjjazs%></td>
		<td  align="right"><%=(ljcgazs+ljjjazs)%></td>
	  </tr>
	  <%
	}
	rs.close();
	ps.close();

	if ((xjljcgjdl+xjljjjjdl)==0)
	{
		cgjjqdl=0;
	}
	else{
		cgjjqdl=(xjljcgqds+xjljjjqds)*100.0/(xjljcgjdl+xjljjjjdl);
	}

%> 
  <tr align="center" bgcolor="<%=bgcolor%>"> 
    <td >总计</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
	<td  align="right"><%=xjcgjdl%></td>
	<td  align="right"><%=xjjjjdl%></td>
	<td  align="right"><%=xjljcgjdl%></td>
	<td  align="right"><%=xjljjjjdl%></td>
	<td  align="right"><%=xjcgwqds%></td>
	<td  align="right"><%=xjjjwqds%></td>
	<td  align="right"><%=cf.formatDouble(cgjjqdl)%>%</td>
	<td  align="right"><%=xjcgqds%></td>
	<td  align="right"><%=xjjjqds%></td>
	<td  align="right"><%=cf.formatDouble(xjcgqde)%></td>
	<td  align="right"><%=cf.formatDouble(xjjjqde)%></td>
	<td  align="right"><%=xjcgtds%></td>
	<td  align="right"><%=xjjjtds%></td>
	<td  align="right"><%=xjcgjjkss%></td>
	<td  align="right"><%=cf.formatDouble(xjljcgqde)%></td>
	<td  align="right"><%=cf.formatDouble(xjljjjqde)%></td>
	<td  align="right"><%=cf.formatDouble(xjljcgqde+xjljjjqde)%></td>
	<td  align="right"><%=xjljcgazs%></td>
	<td  align="right"><%=xjljjjazs%></td>
	<td  align="right"><%=(xjljcgazs+xjljjjazs)%></td>
  </tr>
</table>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

<P>接单量：本期内派单数（统计派单时间）
<P>累计接单量：全部派单数（统计派单时间）
<P>现存单未签数：已派设计师、确定初测时间、橱柜※家具初测、复测通知、橱柜※家具复测5个状态的基本信息
<P>成单率：(橱柜+家具)签单总数除以(橱柜+家具)接单总数的百分比
<P>签单量：本期内签单数（不包括退单）
<P>签约金额：本期签约额+本期增项<可能前期签得合同>-本期减项<可能前期签得合同>-本期退单<可能前期签得合同>
<P>退单数量：本期内退单数（统计退单时间）
<P>客诉：本期内受理的、家居设计师/测量师投诉客户数，而非投诉次数
<P>累计签约额：签约额+增项-减项-退单
<P>累计安装户数：全部安装户数（包括开始安装、安装完成、已完结）
