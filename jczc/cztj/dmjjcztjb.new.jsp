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
String yhdlm=(String)session.getAttribute("yhdlm");

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";
String wheresql2="";

if (!(fgs.equals("")))	wheresql+=" and  fgsbh='"+fgs+"'";
if (!(dwbh.equals("")))	wheresql+=" and  dwbh='"+dwbh+"'";

if (!(fgs.equals("")))	wheresql1+=" and  fgsbh='"+fgs+"'";
if (!(dwbh.equals("")))	wheresql1+=" and  qddm='"+dwbh+"'";

if (!(fgs.equals("")))	wheresql2+=" and  ssfgs='"+fgs+"'";
if (!(dwbh.equals("")))	wheresql2+=" and  dwbh='"+dwbh+"'";


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


	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：店面家居业绩："+sjfw+"："+sjfw2+"："+fgs+"："+dwbh+"：");
	ps.executeUpdate();
	ps.close();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>店面家居产值统计</B><font color="#CC0033">(注意:各分项小数被舍掉,因此汇总值会大于各分项之和)</font><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>

<table border="1" width="3480" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="120">分公司</td>
    <td  width="40">序号</td>
    <td  width="160">店面</td>
    <td  width="70">家装签约数</td>
    <td  width="70"><font color="#000099"><b>家居签约数<签单－退单></b></font></td>
    <td  width="70"><font color="#000099"><b>家居数/家装数</b></font></td>
    <td  width="70"><font color="#000099"><b>占分公司家居签约数比例</b></font></td>
    <td  width="100">家装签约额</td>
    <td  width="100"><font color="#000099"><b>家居签约额</b></font></td>
    <td  width="70"><font color="#000099"><b>家居额/家装额</b></font></td>
    <td  width="70"><font color="#000099"><b>占分公司家居签约额比例</b></font></td>
    <td  width="100">木门签约数</td>
    <td  width="70">木门数/家装数</td>
    <td  width="70">木门数/家居数</td>
    <td  width="70">占全部木门签约数比例</td>
    <td  width="100">木门签约额</td>
    <td  width="70">木门额/家装额</td>
    <td  width="70">木门额/家居额</td>
    <td  width="70">占分公司木门签约额比例</td>
    <td  width="100"><font color="#000099"><b>橱柜签约数</b></font></td>
    <td  width="70"><font color="#000099"><b>橱柜数/家装数</b></font></td>
    <td  width="70"><font color="#000099"><b>橱柜数/家居数</b></font></td>
    <td  width="70"><font color="#000099"><b>占分公司橱柜签约数比例</b></font></td>
    <td  width="100"><font color="#000099"><b>橱柜签约额</b></font></td>
    <td  width="70"><font color="#000099"><b>橱柜额/家装额</b></font></td>
    <td  width="70"><font color="#000099"><b>橱柜额/家居额</b></font></td>
    <td  width="70"><font color="#000099"><b>占分公司橱柜签约额比例</b></font></td>
    <td  width="100">家具签约数</td>
    <td  width="70">家具数/家装数</td>
    <td  width="70">家具数/家居数</td>
    <td  width="70">占分公司家具签约数比例</td>
    <td  width="100">家具签约额</td>
    <td  width="70">家具额/家装额</td>
    <td  width="70">家具额/家居额</td>
    <td  width="70">占分公司家具签约额比例</td>
    <td  width="100"><font color="#000099"><b>主材签约数</b></font></td>
    <td  width="70"><font color="#000099"><b>主材数/家装数</b></font></td>
    <td  width="70"><font color="#000099"><b>主材数/家居数</b></font></td>
    <td  width="70"><font color="#000099"><b>占分公司主材签约数比例</b></font></td>
    <td  width="100"><font color="#000099"><b>主材签约额</b></font></td>
    <td  width="70"><font color="#000099"><b>主材额/家装额</b></font></td>
    <td  width="70"><font color="#000099"><b>主材额/家居额</b></font></td>
    <td  width="70"><font color="#000099"><b>占分公司主材签约额比例</b></font></td>
  </tr>
  <%
	//删除临时表
	ls_sql=" delete from cw_tjlsb21";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from cw_tjlsb22";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from cw_tjlsb31";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from cw_tjlsb32";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//插入临时表＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	//全部集成
	ls_sql="insert into cw_tjlsb22 (yhdlm,fgsbh,qddm,lx,czlx,sz11,sz1)";
	ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,lx,czlx,count(distinct khbh),sum(je)";
	ls_sql+=" FROM jc_jcdd";
	ls_sql+=" where fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql1;
	ls_sql+=" group by fgsbh,qddm,lx,czlx";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//把退单数变为负数
	ls_sql=" update cw_tjlsb22 set sz11=-1*sz11";
	ls_sql+=" where czlx='3'";//1：合同；2：增减项；3：退单
	ls_sql+=" and yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//把增减项变为0
	ls_sql=" update cw_tjlsb22 set sz11=0";
	ls_sql+=" where czlx='2'";//1：合同；2：增减项；3：退单
	ls_sql+=" and yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

//	out.println(ls_sql);
	
	
	//家装
	ls_sql="insert into cw_tjlsb21 (yhdlm,fgsbh,qddm,lx,sz11,sz1,sz12,sz2,sz13,sz3,sz14,sz4,sz15,sz5,sz16,sz6)";
	ls_sql+=" SELECT '"+yhdlm+"',fgsbh,dwbh,'0',count(*),sum(qye),0,0,0,0,0,0,0,0,0,0";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：非家装客户；5：设计客户
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by fgsbh,dwbh";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//集成
	ls_sql="insert into cw_tjlsb21 (yhdlm,fgsbh,qddm,lx,sz11,sz1,sz12,sz2,sz13,sz3,sz14,sz4,sz15,sz5,sz16,sz6)";
	ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,'9',0,0,sum(sz11),sum(sz1),0,0,0,0,0,0,0,0";
	ls_sql+=" FROM cw_tjlsb22";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ls_sql+=" group by fgsbh,qddm";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//木门
	ls_sql="insert into cw_tjlsb21 (yhdlm,fgsbh,qddm,lx,sz11,sz1,sz12,sz2,sz13,sz3,sz14,sz4,sz15,sz5,sz16,sz6)";
	ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,'1',0,0,0,0,sum(sz11),sum(sz1),0,0,0,0,0,0";
	ls_sql+=" FROM cw_tjlsb22";
	ls_sql+=" where lx='1'";//1：木门；2：橱柜；3：家具；4：主材
	ls_sql+=" and yhdlm='"+yhdlm+"'";
	ls_sql+=" group by fgsbh,qddm";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//橱柜
	ls_sql="insert into cw_tjlsb21 (yhdlm,fgsbh,qddm,lx,sz11,sz1,sz12,sz2,sz13,sz3,sz14,sz4,sz15,sz5,sz16,sz6)";
	ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,'2',0,0,0,0,0,0,sum(sz11),sum(sz1),0,0,0,0";
	ls_sql+=" FROM cw_tjlsb22";
	ls_sql+=" where lx='2'";//1：木门；2：橱柜；3：家具；4：主材
	ls_sql+=" and yhdlm='"+yhdlm+"'";
	ls_sql+=" group by fgsbh,qddm";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//家具
	ls_sql="insert into cw_tjlsb21 (yhdlm,fgsbh,qddm,lx,sz11,sz1,sz12,sz2,sz13,sz3,sz14,sz4,sz15,sz5,sz16,sz6)";
	ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,'3',0,0,0,0,0,0,0,0,sum(sz11),sum(sz1),0,0";
	ls_sql+=" FROM cw_tjlsb22";
	ls_sql+=" where lx='3'";//1：木门；2：橱柜；3：家具；4：主材
	ls_sql+=" and yhdlm='"+yhdlm+"'";
	ls_sql+=" group by fgsbh,qddm";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//主材
	ls_sql="insert into cw_tjlsb21 (yhdlm,fgsbh,qddm,lx,sz11,sz1,sz12,sz2,sz13,sz3,sz14,sz4,sz15,sz5,sz16,sz6)";
	ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,'4',0,0,0,0,0,0,0,0,0,0,sum(sz11),sum(sz1)";
	ls_sql+=" FROM cw_tjlsb22";
	ls_sql+=" where lx='4'";//1：木门；2：橱柜；3：家具；4：主材
	ls_sql+=" and yhdlm='"+yhdlm+"'";
	ls_sql+=" group by fgsbh,qddm";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//分公司业绩
	ls_sql="insert into cw_tjlsb31 (yhdlm,fgsbh,lx,sz11,sz1,sz12,sz2,sz13,sz3,sz14,sz4,sz15,sz5,sz16,sz6)";
	ls_sql+=" SELECT '"+yhdlm+"',fgsbh,'0',sum(sz11),sum(sz1),sum(sz12),sum(sz2),sum(sz13),sum(sz3),sum(sz14),sum(sz4),sum(sz15),sum(sz5),sum(sz16),sum(sz6)";
	ls_sql+=" FROM cw_tjlsb21";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ls_sql+=" group by fgsbh";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	//插入临时表======================================完成
	


	String oldfgs="";

	int row=0;
	
	String fgsbh=null;
	String fgsmc=null;
	String dmmc=null;
	String dmbh=null;

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



	//分公司
	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (!(fgs.equals("")))
	{
		ls_sql+=" and ssfgs='"+fgs+"'";
	}
	ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{	
		fgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");

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

		//计算分公司汇总值++++++++++++++++++++++++++++开始
		ls_sql=" SELECT sz11,sz1,sz12,sz2,sz13,sz3,sz14,sz4,sz15,sz5,sz16,sz6";
		ls_sql+=" FROM cw_tjlsb31";
		ls_sql+=" WHERE yhdlm='"+yhdlm+"' and fgsbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{	
			xjjzqys=rs.getInt("sz11");
			xjjzqye=rs.getDouble("sz1");
			xjjcqys=rs.getInt("sz12");
			xjjcqye=rs.getDouble("sz2");
			xjmmqys=rs.getInt("sz13");
			xjmmqye=rs.getDouble("sz3");
			xjcgqys=rs.getInt("sz14");
			xjcgqye=rs.getDouble("sz4");
			xjjjqys=rs.getInt("sz15");
			xjjjqye=rs.getDouble("sz5");
			xjzcqys=rs.getInt("sz16");
			xjzcqye=rs.getDouble("sz6");
		}
		rs.close();
		ps.close();

		//计算分公司：家装签约额、家装签约数

		zjjzqye+=xjjzqye;
		zjjzqys+=xjjzqys;
		zjmmqys+=xjmmqys;//木门总数量
		zjmmqye+=xjmmqye;//所有木门总额
		zjcgqys+=xjcgqys;//橱柜总数量
		zjcgqye+=xjcgqye;//所有橱柜总额
		zjjjqys+=xjjjqys;//家具总数量
		zjjjqye+=xjjjqye;//所有家具总额
		zjzcqys+=xjzcqys;//主材数量
		zjzcqye+=xjzcqye;//主材总额
		zjjcqys+=xjjcqys;
		zjjcqye+=xjjcqye;

		//计算分公司汇总值－－－－－－－－－－－－－－－－－－－－－结束



		//店面业绩统计++++++++++++++++++++++++++++开始
		ls_sql=" SELECT cw_tjlsb21.qddm,dwmc,sum(sz11) sz11,sum(sz1) sz1,sum(sz12) sz12,sum(sz2) sz2,sum(sz13) sz13,sum(sz3) sz3,sum(sz14) sz14,sum(sz4) sz4,sum(sz15) sz15,sum(sz5) sz5,sum(sz16) sz16,sum(sz6) sz6";
		ls_sql+=" FROM cw_tjlsb21,sq_dwxx";
		ls_sql+=" WHERE cw_tjlsb21.yhdlm='"+yhdlm+"' and cw_tjlsb21.fgsbh='"+fgsbh+"' and cw_tjlsb21.qddm=sq_dwxx.dwbh(+)";
		ls_sql+=" GROUP BY cw_tjlsb21.qddm,dwmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{	
			dmbh=rs.getString("qddm");
			dmmc=rs.getString("dwmc");
			jzqys=rs.getInt("sz11");
			jzqye=rs.getDouble("sz1");
			jcqys=rs.getInt("sz12");
			jcqye=rs.getDouble("sz2");
			mmqys=rs.getInt("sz13");
			mmqye=rs.getDouble("sz3");
			cgqys=rs.getInt("sz14");
			cgqye=rs.getDouble("sz4");
			jjqys=rs.getInt("sz15");
			jjqye=rs.getDouble("sz5");
			zcqys=rs.getInt("sz16");
			zcqye=rs.getDouble("sz6");

			row++;


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
			<td ><%=fgsmc%></td>
			<td ><%=row%></td>
			<td ><%=dmmc%></td>
			<td  align="right"><%=jzqys%></td>
			<td  align="right"><%=jcqys%></td>
			<td  align="right"><%=cf.formatDouble(dmjcjzsbl)%>%</td>
			<td  align="right"><%=cf.formatDouble(dmjcsbl)%>%</td>
			<td  align="right"><%=cf.formatDouble(jzqye)%></td>
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
			<td colspan="3"><font color="#000099"><b><%=fgsmc%>小 计</b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjjzqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjjcqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjcjzsbl)%>%</b></font></td>
			<td >&nbsp;</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjzqye)%></b></font></td>
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

//店面业绩统计--------------------------------

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
    <td  align="right"><b><%=zjjzqys%></b></td>
    <td  align="right"><b><%=zjjcqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjcjzsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjjzqye)%></b></td>
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
<p><br>
  注： <BR>
  家装签约数=不包括设计客户（统计签约时间） </p>
<font color="#000099"><b>家居签约数</b></font>＝ <font color="#000099"><b>签单－退单</b></font> 
<p>1.占总家居签约数比例=(单项家居签约数/分公司家居总签约数) <BR>
  2.占总家居签约额比例=(单项家居签约额/分公司家居总签约额) </p>
<P>[工程签约额]：指合同金额，包括公装和家装，不包括增减项
<BR>[家居金额]：本期签约额+本期增项<可能前期签得合同>-本期减项<可能前期签得合同>-本期退单<可能前期签得合同>

</body>
</html>
<%
	//删除临时表
	ls_sql=" delete from cw_tjlsb21";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from cw_tjlsb22";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from cw_tjlsb31";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from cw_tjlsb32";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
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
