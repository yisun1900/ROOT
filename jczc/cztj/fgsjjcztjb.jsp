<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090401'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面产值统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[店面产值统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>

<%

ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=cf.fillNull(request.getParameter("ssdqbm"));
String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));

String wheresql="";
String wheresql1="";
String wheresql2="";

if (!dwbh.equals(""))
{
	return;
}



if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql2+=" and fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql2+=" and qddm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (a.ssdqbm='"+ssdqbm+"')";
	wheresql2+=" and  (fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
	wheresql2+=" and  (fgsbh='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
	wheresql2+=" and  qddm='"+dwbh+"'";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>分公司家居产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<table border="1" width="4220" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="120">大区</td>
    <td  width="40">序号</td>
    <td  width="160">分公司</td>
    <td  width="100">本期收量房订金签单数</td>
    <td  width="100"><font color="#0044cc"><b>本期收量房订金数（未签单）</td>
    <td  width="100"><font color="#000099"><b>累计收量房订金数（未签单）</td>
    <td  width="100">本期收促销活动订金签单数</td>
    <td  width="100"><font color="#0044cc"><b>本期收促销活动订金数（未签单）</td>
    <td  width="100"><font color="#000099"><b>累计收促销活动订金数（未签单）</td>
    <td  width="100">家装签约额</td>
    <td  width="100">家装签约数</td>
    <td  width="100"><font color="#000099"><b>家居签约数</b></font></td>
    <td  width="70"><font color="#000099"><b>家居数/家装数</b></font></td>
    <td  width="70"><font color="#000099"><b>占总家居签约数比例</b></font></td>
    <td  width="100"><font color="#000099"><b>家居签约额</b></font></td>
    <td  width="70"><font color="#000099"><b>家居额/家装额</b></font></td>
    <td  width="70"><font color="#000099"><b>占总家居签约额比例</b></font></td>
    <td  width="100">木门签约数</td>
    <td  width="70">木门数/家装数</td>
    <td  width="70">木门数/家居数</td>
    <td  width="70">占全部木门签约数比例</td>
    <td  width="100">木门签约额</td>
    <td  width="70">木门额/家装额</td>
    <td  width="70">木门额/家居额</td>
    <td  width="70">占全部木门签约额比例</td>
    <td  width="100"><font color="#000099"><b>橱柜签约数</b></font></td>
    <td  width="70"><font color="#000099"><b>橱柜数/家装数</b></font></td>
    <td  width="70"><font color="#000099"><b>橱柜数/家居数</b></font></td>
    <td  width="70"><font color="#000099"><b>占全部橱柜签约数比例</b></font></td>
    <td  width="100"><font color="#000099"><b>橱柜签约额</b></font></td>
    <td  width="70"><font color="#000099"><b>橱柜额/家装额</b></font></td>
    <td  width="70"><font color="#000099"><b>橱柜额/家居额</b></font></td>
    <td  width="70"><font color="#000099"><b>占全部橱柜签约额比例</b></font></td>
    <td  width="100">家具签约数</td>
    <td  width="70">家具数/家装数</td>
    <td  width="70">家具数/家居数</td>
    <td  width="70">占全部家具签约数比例</td>
    <td  width="100">家具签约额</td>
    <td  width="70">家具额/家装额</td>
    <td  width="70">家具额/家居额</td>
    <td  width="70">占全部家具签约额比例</td>

    <td  width="100"><font color="#000099"><b>地板</b></font></td>
    <td  width="100"><font color="#000099"><b>洁具</b></font></td>
    <td  width="100"><font color="#000099"><b>瓷砖</b></font></td>
    <td  width="100"><font color="#000099"><b>布艺</b></font></td>
    <td  width="100"><font color="#000099"><b>其它</b></font></td>
	
	
	<td  width="100"><font color="#000099"><b>主材签约数</b></font></td>
    <td  width="70"><font color="#000099"><b>主材数/家装数</b></font></td>
    <td  width="70"><font color="#000099"><b>主材数/家居数</b></font></td>
    <td  width="70"><font color="#000099"><b>占全部主材签约数比例</b></font></td>
    <td  width="100"><font color="#000099"><b>主材签约额</b></font></td>
    <td  width="70"><font color="#000099"><b>主材额/家装额</b></font></td>
    <td  width="70"><font color="#000099"><b>主材额/家居额</b></font></td>
    <td  width="70"><font color="#000099"><b>占全部主材签约额比例</b></font></td>
  </tr>
  <%
	
	String oldfgs="";

	int row=0;
	
	String fgsbh=null;
	String fgsmc=null;

	double jzqye=0;
	int jzqys=0;
	double mmqye=0;
	int mmqys=0;
	int cgqys=0;
	double cgqye=0;
	int jjqys=0;
	double jjqye=0;
	int zcqys=0;
	double zcqye=0;

	int jcqys=0;
	double jcqye=0;

	int xjjzqys=0;
	double xjjzqye=0;	
	int xjmmqys=0;
	double xjmmqye=0;
	int xjcgqys=0;
	double xjcgqye=0;
	int xjjjqys=0;
	double xjjjqye=0;
	int xjzcqys=0;
	double xjzcqye=0;

	int xjjcqys=0;
	double xjjcqye=0;

	int zjjzqys=0;
	double zjjzqye=0;	
	int zjmmqys=0;
	double zjmmqye=0;
	int zjcgqys=0;
	double zjcgqye=0;
	int zjjjqys=0;
	double zjjjqye=0;
	int zjzcqys=0;
	double zjzcqye=0;

	int zjjcqys=0;
	double zjjcqye=0;

	double zcdbje=0;
	double zcjjje=0;
	double zcczje=0;
	double zcbyje=0;
	double zcqtje=0;

	double xjzcdbje=0;
	double xjzcjjje=0;
	double xjzcczje=0;
	double xjzcbyje=0;
	double xjzcqtje=0;

	double zjzcdbje=0;
	double zjzcjjje=0;
	double zjzcczje=0;
	double zjzcbyje=0;
	double zjzcqtje=0;

	int sdjs=0;
	int bqsdjs=0;
	int ljsdjs=0;
	int scxhddjs=0;
	int bqscxhddjs=0;
	int ljscxhddjs=0;
	int djqds=0;

	int xjsdjs=0;
	int xjbqsdjs=0;
	int xjljsdjs=0;
	int xjscxhddjs=0;
	int xjbqscxhddjs=0;
	int xjljscxhddjs=0;
	int xjdjqds=0;
	int zjsdjs=0;
	int zjbqsdjs=0;
	int zjljsdjs=0;
	int zjscxhddjs=0;
	int zjbqscxhddjs=0;
	int zjljscxhddjs=0;
	int zjdjqds=0;


	String getssdqbm=null;
	String getssdqmc=null;

	ls_sql=" SELECT ssdqbm,ssdqmc";
	ls_sql+=" FROM sq_ssdqbm";
	if (!ssdqbm.equals(""))
	{
		ls_sql+=" where ssdqbm='"+ssdqbm+"'";
	}
	ls_sql+=" order by ssdqbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{	
		getssdqbm=rs2.getString("ssdqbm");
		getssdqmc=rs2.getString("ssdqmc");

		xjjzqye=0;
		xjjzqys=0;

		xjzcqys=0;//主材总数量
		xjzcqye=0;//所有主材总额
		xjjjqys=0;//家具总数量
		xjjjqye=0;//所有家具总额
		xjcgqys=0;//橱柜总数量
		xjcgqye=0;//所有橱柜总额
		xjmmqys=0;//木门总数量
		xjmmqye=0;//所有木门总额

		xjjcqys=0;
		xjjcqye=0;

		xjzcdbje=0;
		xjzcjjje=0;
		xjzcczje=0;
		xjzcbyje=0;
		xjzcqtje=0;

		xjsdjs=0;
		xjbqsdjs=0;
		xjljsdjs=0;
		xjscxhddjs=0;
		xjbqscxhddjs=0;
		xjljscxhddjs=0;
		xjdjqds=0;

//大区业绩统计++++++++++++++++++++++++++++

		ls_sql=" SELECT count(*) jzqys,sum(qye) jzqye ";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_khxx.zt!='3' and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
			xjjzqys=rs1.getInt("jzqys");
			xjjzqye=rs1.getDouble("jzqye");
		}
		rs1.close();
		ps1.close();

		zjjzqye+=xjjzqye;
		zjjzqys+=xjjzqys;

		//木门金额计算
		//签约
		int mmqds=0;
		double mmqde=0;
		ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
		ls_sql+=" FROM jc_mmydd,sq_dwxx";
		ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='98'";//04：签订合同
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
			mmqde=rs1.getDouble(1);
			mmqds=rs1.getInt(2);
		}
		rs1.close();
		ps1.close();

		//退单
		int mmtds=0;
		double mmtde=0;
		ls_sql="SELECT sum(jc_mmydd.zjhze) htze,count(distinct jc_mmydd.khbh) mmqys";
		ls_sql+=" FROM jc_mmydd,sq_dwxx";
		ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt='99' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
			mmtde=rs1.getDouble(1);
			mmtds=rs1.getInt(2);
		}
		rs1.close();
		ps1.close();

		//增减项
		double mmzjx=0;
		ls_sql="SELECT sum(jc_mmzjx.zjxze) zjxze";
		ls_sql+=" FROM jc_mmzjx,sq_dwxx";
		ls_sql+=" where jc_mmzjx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmzjx.clzt not in('00')";
		ls_sql+=" and jc_mmzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
			mmzjx=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		xjmmqys=mmqds-mmtds;
		xjmmqye=mmqde-mmtde+mmzjx;

		zjmmqys+=xjmmqys;//木门总数量
		zjmmqye+=xjmmqye;//所有木门总额


		//橱柜金额计算
		//签单
		double cgqde=0;
		int cgqds=0;
		ls_sql="SELECT sum(jc_cgdd.htze) htze,count(distinct jc_cgdd.khbh) cgqys";
		ls_sql+=" FROM jc_cgdd,sq_dwxx";
		ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='98'";//13：签订合同
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgqde=rs1.getDouble(1);//橱柜金额
			cgqds=rs1.getInt(2);//橱柜数量
		}
		rs1.close();
		ps1.close();

		//退单
		double cgtde=0;
		int cgtds=0;
		ls_sql="SELECT sum(jc_cgdd.zjhze) htze,count(distinct jc_cgdd.khbh) cgqys";
		ls_sql+=" FROM jc_cgdd,sq_dwxx";
		ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt='99' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgtde=rs1.getDouble(1);//橱柜金额
			cgtds=rs1.getInt(2);//橱柜数量
		}
		rs1.close();
		ps1.close();

		//增减项
		double cgzjx=0;
		ls_sql="SELECT sum(jc_cgzjx.zjxze) zjxze";
		ls_sql+=" FROM jc_cgzjx,sq_dwxx";
		ls_sql+=" where jc_cgzjx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgzjx.clzt not in('00')";
		ls_sql+=" and jc_cgzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgzjx=rs1.getDouble(1);//橱柜金额
		}
		rs1.close();
		ps1.close();

		xjcgqys=cgqds-cgtds;
		xjcgqye=cgqde-cgtde+cgzjx;

		zjcgqys+=xjcgqys;//橱柜总数量
		zjcgqye+=xjcgqye;//所有橱柜总额
		
		//家具金额计算
		//签单
		double jjqde=0;
		int jjqds=0;
		ls_sql="SELECT sum(jc_jjdd.htze) htze,count(distinct jc_jjdd.khbh) jjqys";
		ls_sql+=" FROM jc_jjdd,sq_dwxx";
		ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='98'";//13：签订合同
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjqde=rs1.getDouble(1);//家具金额
			jjqds=rs1.getInt(2);//家具数量
		}
		rs1.close();
		ps1.close();

		//退单
		double jjtde=0;
		int jjtds=0;
		ls_sql="SELECT sum(jc_jjdd.zjhze) htze,count(distinct jc_jjdd.khbh) jjqys";
		ls_sql+=" FROM jc_jjdd,sq_dwxx";
		ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt='99'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjtde=rs1.getDouble(1);//家具金额
			jjtds=rs1.getInt(2);//家具数量
		}
		rs1.close();
		ps1.close();

		//增减项
		double jjzjx=0;
		ls_sql="SELECT sum(jc_jjzjx.zjxze) zjxze";
		ls_sql+=" FROM jc_jjzjx,sq_dwxx";
		ls_sql+=" where jc_jjzjx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjzjx.clzt not in('00')";
		ls_sql+=" and jc_jjzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjzjx=rs1.getDouble(1);//家具金额
		}
		rs1.close();
		ps1.close();

		xjjjqys=jjqds-jjtds;
		xjjjqye=jjqde-jjtde+jjzjx;

		zjjjqys+=xjjjqys;//家具总数量
		zjjjqye+=xjjjqye;//所有家具总额

		//主材金额计算
		//签单
		double zcqde=0;
		int zcqds=0;
		ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd,sq_dwxx";
		ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";//09：合同已完成
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zcqde=rs1.getDouble(1);//主材金额
			zcqds=rs1.getInt(2);//主材数量
		}
		rs1.close();
		ps1.close();

		//退单
		double zctde=0;
		int zctds=0;
		ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd,sq_dwxx";
		ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt='99'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zctde=rs1.getDouble(1);//主材金额
			zctds=rs1.getInt(2);//主材数量
		}
		rs1.close();
		ps1.close();

		//增减项
		double zczjx=0;
		ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx,sq_dwxx";
		ls_sql+=" where jc_zczjx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_zczjx.clzt not in('00')";
		ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zczjx=rs1.getDouble(1);//主材金额
		}
		rs1.close();
		ps1.close();

		xjzcqys=zcqds-zctds;
		xjzcqye=zcqde-zctde+zczjx;

		zjzcqys+=xjzcqys;//主材数量
		zjzcqye+=xjzcqye;//主材总额

		ls_sql="SELECT count(distinct khbh)";
		ls_sql+=" FROM (";

		ls_sql+=" SELECT jc_mmydd.khbh";
		ls_sql+=" FROM jc_mmydd,sq_dwxx";
		ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_cgdd.khbh";
		ls_sql+=" FROM jc_cgdd,sq_dwxx";
		ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_jjdd.khbh";
		ls_sql+=" FROM jc_jjdd,sq_dwxx";
		ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_zcdd.khbh";
		ls_sql+=" FROM jc_zcdd,sq_dwxx";
		ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
		ls_sql+=wheresql2;
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";

		ls_sql+=" )";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			xjjcqys=rs1.getInt(1);//家居数量
		}
		rs1.close();
		ps1.close();

		xjjcqye=xjmmqye+xjcgqye+xjjjqye+xjzcqye;

		zjjcqys+=xjjcqys;
		zjjcqye+=xjjcqye;

//大区业绩统计----------------------------



//分公司业绩统计++++++++++++++++++++++++++++
		ls_sql=" SELECT dwbh,dwmc";
		ls_sql+=" FROM sq_dwxx a";
		ls_sql+=" where dwlx='F0' and cxbz='N'";
		ls_sql+=" and sfjms='N'";//N：否；Y：是
		ls_sql+=" and ssdqbm='"+getssdqbm+"'";
		ls_sql+=wheresql1;
		ls_sql+=" order by dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{	
			fgsbh=rs.getString("dwbh");
			fgsmc=rs.getString("dwmc");

			row++;

/*
			if (fgsmc.equals(oldfgs))
			{
				fgsmc="同上";
			}
			else{
				oldfgs=fgsmc;
			}
*/


			//本期收量房订金签单数		
			ls_sql=" SELECT count(*) ";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in ('3') and crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and crm_zxkhxx.lfdjbz='Y' ";
			ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				sdjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//本期收量房订金数(未签单)		
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.lfdjbz='Y' ";
		    ls_sql+=" and crm_zxkhxx.zxzt in ('0','1','5') and ssfgs='"+fgsbh+"'";
			ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				bqsdjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();			
			
			//累计收量房订金数(未签单)		
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.lfdjbz='Y' and crm_zxkhxx.ssfgs='"+fgsbh+"'";
		    ls_sql+="  and crm_zxkhxx.zxzt in ('0','1','5') ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				ljsdjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();


			//本期收促销活动订金签单数		
			ls_sql=" SELECT count(*) ";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in ('3') and crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and crm_zxkhxx.hddjbz='Y' ";
			ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				scxhddjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();


			//本期收促销活动订金数(未签单)		
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.hddjbz='Y' and crm_zxkhxx.ssfgs='"+fgsbh+"'";
		    ls_sql+="  and crm_zxkhxx.zxzt in ('0','1','5') ";
			ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				bqscxhddjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//累计收促销活动订金数(未签单)		
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.hddjbz='Y' and crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+="  and crm_zxkhxx.zxzt in ('0','1','5')  ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				ljscxhddjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			xjsdjs+=sdjs;
			xjbqsdjs+=bqsdjs;
			xjljsdjs+=ljsdjs;
			xjscxhddjs+=scxhddjs;
			xjbqscxhddjs+=bqscxhddjs;
			xjljscxhddjs+=ljscxhddjs;
			xjdjqds+=djqds;

			zjsdjs+=sdjs;
			zjbqsdjs+=bqsdjs;
			zjljsdjs+=ljsdjs;
			zjscxhddjs+=scxhddjs;
			zjbqscxhddjs+=bqscxhddjs;
			zjljscxhddjs+=ljscxhddjs;
			zjdjqds+=djqds;

		
			ls_sql=" SELECT count(*) jzqys,sum(qye) jzqye ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt!='3' and crm_khxx.fgsbh='"+fgsbh+"'";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				jzqys=rs1.getInt("jzqys");
				jzqye=rs1.getDouble("jzqye");
			}
			rs1.close();
			ps1.close();


			//木门金额计算
			//签约
			mmqds=0;
			mmqde=0;
			ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
			ls_sql+=" FROM jc_mmydd";
			ls_sql+=" where  jc_mmydd.fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='98'";//04：签订合同
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{
				mmqde=rs1.getDouble(1);//分公司木门金额
				mmqds=rs1.getInt(2);//分公司木门数量
			}
			rs1.close();
			ps1.close();

			//退单
			mmtds=0;
			mmtde=0;
			ls_sql="SELECT sum(jc_mmydd.zjhze) htze,count(distinct jc_mmydd.khbh) mmqys";
			ls_sql+=" FROM jc_mmydd";
			ls_sql+=" where  fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt='99' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{
				mmtde=rs1.getDouble(1);//分公司木门金额
				mmtds=rs1.getInt(2);//分公司木门数量
			}
			rs1.close();
			ps1.close();

			//增减项
			mmzjx=0;
			ls_sql="SELECT sum(jc_mmzjx.zjxze) zjxze";
			ls_sql+=" FROM jc_mmzjx";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_mmzjx.clzt not in('00')";
			ls_sql+=" and jc_mmzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{
				mmzjx=rs1.getDouble(1);//分公司木门金额
			}
			rs1.close();
			ps1.close();

			mmqys=mmqds-mmtds;
			mmqye=mmqde-mmtde+mmzjx;


			//橱柜金额计算
			//签单
			cgqde=0;
			cgqds=0;
			ls_sql="SELECT sum(jc_cgdd.htze) htze,count(distinct jc_cgdd.khbh) cgqys";
			ls_sql+=" FROM jc_cgdd";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='98'";//13：签订合同
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				cgqde=rs1.getDouble(1);//橱柜金额
				cgqds=rs1.getInt(2);//橱柜数量
			}
			rs1.close();
			ps1.close();
			
			//退单
			cgtde=0;
			cgtds=0;
			ls_sql="SELECT sum(jc_cgdd.zjhze) htze,count(distinct jc_cgdd.khbh) cgqys";
			ls_sql+=" FROM jc_cgdd";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt='99' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				cgtde=rs1.getDouble(1);//橱柜金额
				cgtds=rs1.getInt(2);//橱柜数量
			}
			rs1.close();
			ps1.close();
			
			//增减项
			cgzjx=0;
			ls_sql="SELECT sum(jc_cgzjx.zjxze) zjxze";
			ls_sql+=" FROM jc_cgzjx";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_cgzjx.clzt not in('00')";
			ls_sql+=" and jc_cgzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				cgzjx=rs1.getDouble(1);//橱柜金额
			}
			rs1.close();
			ps1.close();
			
			cgqys=cgqds-cgtds;
			cgqye=cgqde-cgtde+cgzjx;
		
			//家具金额计算
			//签单
			jjqde=0;
			jjqds=0;
			ls_sql="SELECT sum(jc_jjdd.htze) htze,count(distinct jc_jjdd.khbh) jjqys";
			ls_sql+=" FROM jc_jjdd";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='98'";//13：签订合同
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jjqde=rs1.getDouble(1);//家具金额
				jjqds=rs1.getInt(2);//家具数量
			}
			rs1.close();
			ps1.close();

			//退单
			jjtde=0;
			jjtds=0;
			ls_sql="SELECT sum(jc_jjdd.zjhze) htze,count(distinct jc_jjdd.khbh) jjqys";
			ls_sql+=" FROM jc_jjdd";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt='99'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jjtde=rs1.getDouble(1);//家具金额
				jjtds=rs1.getInt(2);//家具数量
			}
			rs1.close();
			ps1.close();

			//增减项
			jjzjx=0;
			ls_sql="SELECT sum(jc_jjzjx.zjxze) zjxze";
		ls_sql+=" FROM jc_jjzjx";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_jjzjx.clzt not in('00')";
			ls_sql+=" and jc_jjzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jjzjx=rs1.getDouble(1);//家具金额
			}
			rs1.close();
			ps1.close();

			jjqys=jjqds-jjtds;
			jjqye=jjqde-jjtde+jjzjx;


			//主材金额计算＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
			//签单
			zcqde=0;
			zcqds=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";//09：合同已完成
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcqde=rs1.getDouble(1);//主材金额
				zcqds=rs1.getInt(2);//主材数量
			}
			rs1.close();
			ps1.close();

//			out.println(ls_sql);

			//退单
			zctde=0;
			zctds=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zctde=rs1.getDouble(1);//主材金额
				zctds=rs1.getInt(2);//主材数量
			}
			rs1.close();
			ps1.close();

//			out.println(ls_sql);

			//增减项
			zczjx=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zczjx=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			zcqys=zcqds-zctds;
			zcqye=zcqde-zctde+zczjx;


			//地板金额计算＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

			double zcdbhtje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ls_sql+=" and jc_zcdd.zcxlbm='地板'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbhtje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			//退单
			double zcdbtdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.zcxlbm='地板'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbtdje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			//增减项
			double zcdbzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.zcxlbm='地板'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbzjxje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			zcdbje=zcdbhtje-zcdbtdje+zcdbzjxje;

			xjzcdbje+=zcdbje;
			zjzcdbje+=zcdbje;

			//洁具金额计算＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

			double zcjjhtje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ls_sql+=" and jc_zcdd.zcxlbm='洁具'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjhtje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			//退单
			double zcjjtdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.zcxlbm='洁具'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjtdje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			//增减项
			double zcjjzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.zcxlbm='洁具'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjzjxje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			zcjjje=zcjjhtje-zcjjtdje+zcjjzjxje;

			xjzcjjje+=zcjjje;
			zjzcjjje+=zcjjje;

			//瓷砖金额计算＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

			double zcczhtje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ls_sql+=" and jc_zcdd.zcxlbm='瓷砖'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcczhtje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			//退单
			double zccztdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.zcxlbm='瓷砖'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zccztdje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			//增减项
			double zcczzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.zcxlbm='瓷砖'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcczzjxje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			zcczje=zcczhtje-zccztdje+zcczzjxje;

			xjzcczje+=zcczje;
			zjzcczje+=zcczje;

			//布艺金额计算＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

			double zcbyhtje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ls_sql+=" and jc_zcdd.zcxlbm='布艺'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcbyhtje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			//退单
			double zcbytdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.zcxlbm='布艺'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcbytdje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			//增减项
			double zcbyzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.zcxlbm='布艺'";//1003:地板
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcbyzjxje=rs1.getDouble(1);//主材金额
			}
			rs1.close();
			ps1.close();

			zcbyje=zcbyhtje-zcbytdje+zcbyzjxje;

			xjzcbyje+=zcbyje;
			zjzcbyje+=zcbyje;


			zcqtje=zcqye-zcdbje-zcjjje-zcczje-zcbyje;

			xjzcqtje+=zcqtje;
			zjzcqtje+=zcqtje;
			//＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

			ls_sql="SELECT count(distinct khbh)";
			ls_sql+=" FROM (";

			ls_sql+=" SELECT jc_mmydd.khbh";
			ls_sql+=" FROM jc_mmydd";
			ls_sql+=" where  fgsbh='"+fgsbh+"'";
			ls_sql+=wheresql2;
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_cgdd.khbh";
			ls_sql+=" FROM jc_cgdd";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=wheresql2;
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_jjdd.khbh";
			ls_sql+=" FROM jc_jjdd";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=wheresql2;
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_zcdd.khbh";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where fgsbh='"+fgsbh+"'";
			ls_sql+=wheresql2;
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";

			ls_sql+=" )";

			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jcqys=rs1.getInt(1);//家居数量
			}
			rs1.close();
			ps1.close();

			jcqye=mmqye+cgqye+jjqye+zcqye;


			double dmjcjzsbl=0;
			double dmjcjzebl=0;
			double dmjcsbl=0;
			double dmjcebl=0;

			if (jzqys==0)
			{
				dmjcjzsbl=0;
			}
			else{
				dmjcjzsbl=jcqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmjcjzebl=0;
			}
			else{
				dmjcjzebl=jcqye*100.0/jzqye;
			}

			if (xjjcqys==0)
			{
				dmjcsbl=0;
			}
			else{
				dmjcsbl=jcqys*100.0/xjjcqys;
			}
			if (xjjcqye==0)
			{
				dmjcebl=0;
			}
			else{
				dmjcebl=jcqye*100.0/xjjcqye;
			}

			double dmmmjzsbl=0;
			double dmmmjzebl=0;
			double dmmmjcsbl=0;
			double dmmmjcebl=0;
			double dmmmsbl=0;
			double dmmmebl=0;
			if (jzqys==0)
			{
				dmmmjzsbl=0;
			}
			else{
				dmmmjzsbl=mmqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmmmjzebl=0;
			}
			else{
				dmmmjzebl=mmqye*100.0/jzqye;
			}

			if (jcqys==0)
			{
				dmmmjcsbl=0;
			}
			else{
				dmmmjcsbl=mmqys*100.0/jcqys;
			}
			if (jcqye==0)
			{
				dmmmjcebl=0;
			}
			else{
				dmmmjcebl=mmqye*100.0/jcqye;
			}

			if (xjmmqys==0)
			{
				dmmmsbl=0;
			}
			else{
				dmmmsbl=mmqys*100.0/xjmmqys;
			}
			if (xjmmqye==0)
			{
				dmmmebl=0;
			}
			else{
				dmmmebl=mmqye*100.0/xjmmqye;
			}


			double dmcgjzsbl=0;
			double dmcgjzebl=0;
			double dmcgsbl=0;
			double dmcgebl=0;
			double dmcgjcsbl=0;
			double dmcgjcebl=0;

			if (jzqys==0)
			{
				dmcgjzsbl=0;
			}
			else{
				dmcgjzsbl=cgqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmcgjzebl=0;
			}
			else{
				dmcgjzebl=cgqye*100.0/jzqye;
			}

			if (jcqys==0)
			{
				dmcgjcsbl=0;
			}
			else{
				dmcgjcsbl=cgqys*100.0/jcqys;
			}
			if (jcqye==0)
			{
				dmcgjcebl=0;
			}
			else{
				dmcgjcebl=cgqye*100.0/jcqye;
			}

			if (xjcgqys==0)
			{
				dmcgsbl=0;
			}
			else{
				dmcgsbl=cgqys*100.0/xjcgqys;
			}
			if (xjcgqye==0)
			{
				dmcgebl=0;
			}
			else{
				dmcgebl=cgqye*100.0/xjcgqye;
			}

			double dmjjjzsbl=0;
			double dmjjjzebl=0;
			double dmjjsbl=0;
			double dmjjebl=0;
			double dmjjjcsbl=0;
			double dmjjjcebl=0;

			if (jzqys==0)
			{
				dmjjjzsbl=0;
			}
			else{
				dmjjjzsbl=jjqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmjjjzebl=0;
			}
			else{
				dmjjjzebl=jjqye*100.0/jzqye;
			}

			if (jcqys==0)
			{
				dmjjjcsbl=0;
			}
			else{
				dmjjjcsbl=jjqys*100.0/jcqys;
			}
			if (jcqye==0)
			{
				dmjjjcebl=0;
			}
			else{
				dmjjjcebl=jjqye*100.0/jcqye;
			}

			if (xjjjqys==0)
			{
				dmjjsbl=0;
			}
			else{
				dmjjsbl=jjqys*100.0/xjjjqys;
			}
			if (xjjjqye==0)
			{
				dmjjebl=0;
			}
			else{
				dmjjebl=jjqye*100.0/xjjjqye;
			}

			double dmzcjzsbl=0;
			double dmzcjzebl=0;
			double dmzcsbl=0;
			double dmzcebl=0;
			double dmzcjcsbl=0;
			double dmzcjcebl=0;

			if (jzqys==0)
			{
				dmzcjzsbl=0;
			}
			else{
				dmzcjzsbl=zcqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmzcjzebl=0;
			}
			else{
				dmzcjzebl=zcqye*100.0/jzqye;
			}

			if (jcqys==0)
			{
				dmzcjcsbl=0;
			}
			else{
				dmzcjcsbl=zcqys*100.0/jcqys;
			}
			if (jcqye==0)
			{
				dmzcjcebl=0;
			}
			else{
				dmzcjcebl=zcqye*100.0/jcqye;
			}

			if (xjzcqys==0)
			{
				dmzcsbl=0;
			}
			else{
				dmzcsbl=zcqys*100.0/xjzcqys;
			}
			if (xjzcqye==0)
			{
				dmzcebl=0;
			}
			else{
				dmzcebl=zcqye*100.0/xjzcqye;
			}

			
			%> 
			  <tr align="center" > 
				<td ><%=getssdqmc%></td>
				<td ><%=row%></td>
				<td ><%=fgsmc%></td>

				<td  align="right"><A HREF="ViewFgsSdjs.jsp?fgsbh=<%=fgsbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=sdjs%></A></td>
				<td  align="right"><A HREF="ViewFgsBqsdjs.jsp?fgsbh=<%=fgsbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=bqsdjs%></A></td>
				<td  align="right"><A HREF="ViewFgsLjsdjs.jsp?fgsbh=<%=fgsbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljsdjs%></A></td>
				<td  align="right"><A HREF="ViewFgsScxhddjs.jsp?fgsbh=<%=fgsbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=scxhddjs%></A></td>
				<td  align="right"><A HREF="ViewFgsBqscxhddjs.jsp?fgsbh=<%=fgsbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=bqscxhddjs%></A></td>
				<td  align="right"><A HREF="ViewFgsLjscxhddjs.jsp?fgsbh=<%=fgsbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljscxhddjs%></A></td>

				<td  align="right"><%=cf.formatDouble(jzqye)%></td>
				<td  align="right"><%=jzqys%></td>
				<td  align="right"><%=jcqys%></td>
				<td  align="right"><%=cf.formatDouble(dmjcjzsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmjcsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(jcqye)%></td>
				<td  align="right"><%=cf.formatDouble(dmjcjzebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmjcebl)%>%</td>
				<!-- 以下是木门内容: --> 
				<td  align="right"><%=mmqys%></td>
				<td  align="right"><%=cf.formatDouble(dmmmjzsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmmmjcsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmmmsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(mmqye)%></td>
				<td  align="right"><%=cf.formatDouble(dmmmjzebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmmmjcebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmmmebl)%>%</td>
				<!-- 以下是橱柜内容: --> 
				<td  align="right"><%=cgqys%></td>
				<td  align="right"><%=cf.formatDouble(dmcgjzsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmcgjcsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmcgsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(cgqye)%></td>
				<td  align="right"><%=cf.formatDouble(dmcgjzebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmcgjcebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmcgebl)%>%</td>
				<!-- 以下是家具内容: --> 
				<td  align="right"><%=jjqys%></td>
				<td  align="right"><%=cf.formatDouble(dmjjjzsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmjjjcsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmjjsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(jjqye)%></td>
				<td  align="right"><%=cf.formatDouble(dmjjjzebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmjjjcebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmjjebl)%>%</td>
				<!-- 以下是主材内容: --> 
			 
				<td  align="right"><%=cf.formatDouble(zcdbje)%></td>
				<td  align="right"><%=cf.formatDouble(zcjjje)%></td>
				<td  align="right"><%=cf.formatDouble(zcczje)%></td>
				<td  align="right"><%=cf.formatDouble(zcbyje)%></td>
				<td  align="right"><%=cf.formatDouble(zcqtje)%></td>

				<td  align="right"><%=zcqys%></td>
				<td  align="right"><%=cf.formatDouble(dmzcjzsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmzcjcsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmzcsbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(zcqye)%></td>
				<td  align="right"><%=cf.formatDouble(dmzcjzebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmzcjcebl)%>%</td>
				<td  align="right"><%=cf.formatDouble(dmzcebl)%>%</td>
			  </tr>
			<%	
		}
		rs.close();
		ps.close();


		double dmjcjzsbl=0;
		double dmjcjzebl=0;

		if (xjjzqys==0)
		{
			dmjcjzsbl=0;
		}
		else{
			dmjcjzsbl=xjjcqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmjcjzebl=0;
		}
		else{
			dmjcjzebl=xjjcqye*100.0/xjjzqye;
		}

		double dmmmjzsbl=0;
		double dmmmjzebl=0;
		double dmmmjcsbl=0;
		double dmmmjcebl=0;
		if (xjjzqys==0)
		{
			dmmmjzsbl=0;
		}
		else{
			dmmmjzsbl=xjmmqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmmmjzebl=0;
		}
		else{
			dmmmjzebl=xjmmqye*100.0/xjjzqye;
		}

		if (xjjcqys==0)
		{
			dmmmjcsbl=0;
		}
		else{
			dmmmjcsbl=xjmmqys*100.0/xjjcqys;
		}
		if (xjjcqye==0)
		{
			dmmmjcebl=0;
		}
		else{
			dmmmjcebl=xjmmqye*100.0/xjjcqye;
		}


		double dmcgjzsbl=0;
		double dmcgjzebl=0;
		double dmcgjcsbl=0;
		double dmcgjcebl=0;

		if (xjjzqys==0)
		{
			dmcgjzsbl=0;
		}
		else{
			dmcgjzsbl=xjcgqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmcgjzebl=0;
		}
		else{
			dmcgjzebl=xjcgqye*100.0/xjjzqye;
		}

		if (xjjcqys==0)
		{
			dmcgjcsbl=0;
		}
		else{
			dmcgjcsbl=xjcgqys*100.0/xjjcqys;
		}
		if (xjjcqye==0)
		{
			dmcgjcebl=0;
		}
		else{
			dmcgjcebl=xjcgqye*100.0/xjjcqye;
		}

		double dmjjjzsbl=0;
		double dmjjjzebl=0;
		double dmjjjcsbl=0;
		double dmjjjcebl=0;

		if (xjjzqys==0)
		{
			dmjjjzsbl=0;
		}
		else{
			dmjjjzsbl=xjjjqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmjjjzebl=0;
		}
		else{
			dmjjjzebl=xjjjqye*100.0/xjjzqye;
		}

		if (xjjcqys==0)
		{
			dmjjjcsbl=0;
		}
		else{
			dmjjjcsbl=xjjjqys*100.0/xjjcqys;
		}
		if (xjjcqye==0)
		{
			dmjjjcebl=0;
		}
		else{
			dmjjjcebl=xjjjqye*100.0/xjjcqye;
		}

		double dmzcjzsbl=0;
		double dmzcjzebl=0;
		double dmzcjcsbl=0;
		double dmzcjcebl=0;

		if (xjjzqys==0)
		{
			dmzcjzsbl=0;
		}
		else{
			dmzcjzsbl=xjzcqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmzcjzebl=0;
		}
		else{
			dmzcjzebl=xjzcqye*100.0/xjjzqye;
		}

		if (xjjcqys==0)
		{
			dmzcjcsbl=0;
		}
		else{
			dmzcjcsbl=xjzcqys*100.0/xjjcqys;
		}
		if (xjjcqye==0)
		{
			dmzcjcebl=0;
		}
		else{
			dmzcjcebl=xjzcqye*100.0/xjjcqye;
		}

		%> 
		  <tr align="center" > 
			<td colspan="3"><font color="#000099"><b><%=getssdqmc%>小 计</b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjsdjs%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjbqsdjs%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjljsdjs%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjscxhddjs%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjbqscxhddjs%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjljscxhddjs%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjzqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjjzqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjjcqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjcjzsbl)%>%</b></font></td>
			<td >&nbsp;</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjcqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjcjzebl)%>%</b></font></td>
			<td >&nbsp;</td>
			<!-- 以下是木门内容: --> 
			<td  align="right"><font color="#000099"><b><%=xjmmqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjzsbl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjcsbl)%>%</b></font></td>
			<td >&nbsp;</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjmmqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjzebl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjcebl)%>%</b></font></td>
			<td >&nbsp;</td>
			<!-- 以下是橱柜内容: --> 
			<td  align="right"><font color="#000099"><b><%=xjcgqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjzsbl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjcsbl)%>%</b></font></td>
			<td >&nbsp;</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjcgqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjzebl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjcebl)%>%</b></font></td>
			<td >&nbsp;</td>
			<!-- 以下是家具内容: --> 
			<td  align="right"><font color="#000099"><b><%=xjjjqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjzsbl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjcsbl)%>%</b></font></td>
			<td >&nbsp;</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjjqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjzebl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjcebl)%>%</b></font></td>
			<td >&nbsp;</td>
			<!-- 以下是主材内容: --> 
			<td  align="right"><%=cf.formatDouble(xjzcdbje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcjjje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcczje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcbyje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcqtje)%></td>

			<td  align="right"><font color="#000099"><b><%=xjzcqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjzsbl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjcsbl)%>%</b></font></td>
			<td ><font color="#000099"><b>&nbsp;</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjzcqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjzebl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjcebl)%>%</b></font></td>
			<td >&nbsp;</td>
		  </tr>
		<%

	}
	rs2.close();
	ps2.close();

//分公司业绩统计--------------------------------

	//总计
	
	double dmjcjzsbl=0;
	double dmjcjzebl=0;

	if (zjjzqys==0)
	{
		dmjcjzsbl=0;
	}
	else{
		dmjcjzsbl=zjjcqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmjcjzebl=0;
	}
	else{
		dmjcjzebl=zjjcqye*100.0/zjjzqye;
	}

	double dmmmjzsbl=0;
	double dmmmjzebl=0;
	double dmmmjcsbl=0;
	double dmmmjcebl=0;
	if (zjjzqys==0)
	{
		dmmmjzsbl=0;
	}
	else{
		dmmmjzsbl=zjmmqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmmmjzebl=0;
	}
	else{
		dmmmjzebl=zjmmqye*100.0/zjjzqye;
	}

	if (zjjcqys==0)
	{
		dmmmjcsbl=0;
	}
	else{
		dmmmjcsbl=zjmmqys*100.0/zjjcqys;
	}
	if (zjjcqye==0)
	{
		dmmmjcebl=0;
	}
	else{
		dmmmjcebl=zjmmqye*100.0/zjjcqye;
	}


	double dmcgjzsbl=0;
	double dmcgjzebl=0;
	double dmcgjcsbl=0;
	double dmcgjcebl=0;

	if (zjjzqys==0)
	{
		dmcgjzsbl=0;
	}
	else{
		dmcgjzsbl=zjcgqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmcgjzebl=0;
	}
	else{
		dmcgjzebl=zjcgqye*100.0/zjjzqye;
	}

	if (zjjcqys==0)
	{
		dmcgjcsbl=0;
	}
	else{
		dmcgjcsbl=zjcgqys*100.0/zjjcqys;
	}
	if (zjjcqye==0)
	{
		dmcgjcebl=0;
	}
	else{
		dmcgjcebl=zjcgqye*100.0/zjjcqye;
	}

	double dmjjjzsbl=0;
	double dmjjjzebl=0;
	double dmjjjcsbl=0;
	double dmjjjcebl=0;

	if (zjjzqys==0)
	{
		dmjjjzsbl=0;
	}
	else{
		dmjjjzsbl=zjjjqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmjjjzebl=0;
	}
	else{
		dmjjjzebl=zjjjqye*100.0/zjjzqye;
	}

	if (zjjcqys==0)
	{
		dmjjjcsbl=0;
	}
	else{
		dmjjjcsbl=zjjjqys*100.0/zjjcqys;
	}
	if (zjjcqye==0)
	{
		dmjjjcebl=0;
	}
	else{
		dmjjjcebl=zjjjqye*100.0/zjjcqye;
	}

	double dmzcjzsbl=0;
	double dmzcjzebl=0;
	double dmzcjcsbl=0;
	double dmzcjcebl=0;

	if (zjjzqys==0)
	{
		dmzcjzsbl=0;
	}
	else{
		dmzcjzsbl=zjzcqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmzcjzebl=0;
	}
	else{
		dmzcjzebl=zjzcqye*100.0/zjjzqye;
	}

	if (zjjcqys==0)
	{
		dmzcjcsbl=0;
	}
	else{
		dmzcjcsbl=zjzcqys*100.0/zjjcqys;
	}
	if (zjjcqye==0)
	{
		dmzcjcebl=0;
	}
	else{
		dmzcjcebl=zjzcqye*100.0/zjjcqye;
	}

%> 
  <tr align="center" > 
    <td colspan="3"><b>总 计</b></td>
    <td  align="right"><b><%=zjsdjs%></b></td>
    <td  align="right"><b><%=zjbqsdjs%></b></td>
    <td  align="right"><b><%=zjljsdjs%></b></td>
    <td  align="right"><b><%=zjscxhddjs%></b></td>
    <td  align="right"><b><%=zjbqscxhddjs%></b></td>
    <td  align="right"><b><%=zjljscxhddjs%></b></td>
    <td  align="right"><b><%=cf.formatDouble(zjjzqye)%></b></td>
    <td  align="right"><b><%=zjjzqys%></b></td>
    <td  align="right"><b><%=zjjcqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjcjzsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjjcqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjcjzebl)%>%</b></td>
    <td >&nbsp;</td>
    <!-- 以下是木门内容: --> 
    <td  align="right"><b><%=zjmmqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmmmjzsbl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmmmjcsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjmmqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmmmjzebl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmmmjcebl)%>%</b></td>
    <td >&nbsp;</td>
    <!-- 以下是橱柜内容: --> 
    <td  align="right"><b><%=zjcgqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmcgjzsbl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmcgjcsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjcgqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmcgjzebl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmcgjcebl)%>%</b></td>
    <td >&nbsp;</td>
    <!-- 以下是家具内容: --> 
    <td  align="right"><b><%=zjjjqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjzsbl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjcsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjjjqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjzebl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjcebl)%>%</b></td>
    <td >&nbsp;</td>
    <!-- 以下是主材内容: --> 
    <td  align="right"><%=cf.formatDouble(zjzcdbje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcjjje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcczje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcbyje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcqtje)%></td>

    <td  align="right"><b><%=zjzcqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjzsbl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjcsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjzcqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjzebl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjcebl)%>%</b></td>
    <td >&nbsp;</td>
  </tr>
</table>
<br>
注：

<BR>1.占总家居签约数比例=(单项家居签约数/大区家居总签约数)

<BR>2.占总家居签约额比例=(单项家居签约额/大区家居总签约额)

<P>[工程签约额]：指合同金额，包括公装和家装，不包括增减项
<BR>[家居金额]：本期签约额+本期增项<可能前期签得合同>-本期减项<可能前期签得合同>-本期退单<可能前期签得合同>

</body>
</html>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
