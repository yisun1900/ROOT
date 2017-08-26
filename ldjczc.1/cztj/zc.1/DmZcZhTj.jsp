<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030343'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面主材统计(综合)]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[店面主材统计(综合)]："+xtrzyhmc+"') ";
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

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));


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
  <B>店面主材统计</B><BR>
  <b>(订单确认时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="280%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  >
  <td  width="2%" rowspan="3" >序号</td>
  <td  width="6%" rowspan="3" >店面</td>
  <td colspan="7" rowspan="2" >套餐</td>
  <td colspan="19" >非套餐</td>
</tr>
<TR bgcolor="#CCCCCC"  align="center"  >
  <td colspan="7" >合计</td>
  <td colspan="3" >集成</td>
  <td colspan="3" >散客</td>
  <td colspan="3" >选配</td>
  <td colspan="3" >套餐外</td>
</tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" ><strong>合计成本额</strong></td>
  <td  width="3%" >客户数</td>
  <td  width="3%" >订单数</td>
  <td  width="4%" >合同成本</td>
  <td  width="4%" >平均成本单值</td>
  <td  width="4%" >退单</td>
  <td  width="4%" >增减项</td>

  <td  width="4%" ><strong>合计销售额</strong></td>
  <td  width="3%" >客户数</td>
  <td  width="3%" >订单数</td>
  <td  width="4%" >合同销售额</td>
  <td  width="4%" >平均单额</td>
  <td  width="4%" >退单</td>
  <td  width="4%" >增减项</td>

  <td  width="3%" >客户数</td>
  <td  width="3%" >订单数</td>
  <td  width="4%" >合同销售额</td>

  <td  width="3%" >客户数</td>
  <td  width="3%" >订单数</td>
  <td  width="4%" >合同销售额</td>

  <td  width="3%" >客户数</td>
  <td  width="3%" >订单数</td>
  <td  width="4%" >合同销售额</td>

  <td  width="3%" >客户数</td>
  <td  width="3%" >订单数</td>
  <td  width="4%" >合同销售额</td>

  </tr>
<%
	//获取最大数
	

	int row=0;


	int zjtckhsl=0;
	int zjtcddsl=0;
	double zjtccbze=0;
	double zjtctdcbe=0;
	double zjzjxcbe=0;
	double zjtcje=0;
	
	int zjkhsl=0;
	int zjddsl=0;
	double zjqye=0;
	double zjtde=0;
	double zjzjxje=0;
	double zjje=0;
	
	int zjjc_khsl=0;
	int zjjc_ddsl=0;
	double zjjc_qye=0;
	
	int zjsk_khsl=0;
	int zjsk_ddsl=0;
	double zjsk_qye=0;
	
	int zjxp_khsl=0;
	int zjxp_ddsl=0;
	double zjxp_qye=0;
	
	int zjtw_khsl=0;
	int zjtw_ddsl=0;
	double zjtw_qye=0;


	
	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";


	ls_sql =" SELECT dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where sq_dwxx.dwlx='F0'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");
	
		int xjtckhsl=0;
		int xjtcddsl=0;
		double xjtccbze=0;
		double xjtctdcbe=0;
		double xjzjxcbe=0;
		double xjtcje=0;

		int xjkhsl=0;
		int xjddsl=0;
		double xjqye=0;
		double xjje=0;
		double xjtde=0;
		double xjzjxje=0;

		int xjjc_khsl=0;
		int xjjc_ddsl=0;
		double xjjc_qye=0;

		int xjsk_khsl=0;
		int xjsk_ddsl=0;
		double xjsk_qye=0;

		int xjxp_khsl=0;
		int xjxp_ddsl=0;
		double xjxp_qye=0;

		int xjtw_khsl=0;
		int xjtw_ddsl=0;
		double xjtw_qye=0;

		
		
		
		ls_sql =" SELECT dwbh,dwmc,kdsj,gdsj,cxbz ";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where sq_dwxx.dwlx='F2'";
		ls_sql+=" and sq_dwxx.ssfgs='"+getfgsbh+"'";

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" order by sq_dwxx.dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getdwbh=rs.getString("dwbh");
			dmmc=rs.getString("dwmc");
			cxbz=rs.getString("cxbz");
			kdsj=cf.fillNull(rs.getDate("kdsj"));
			gdsj=cf.fillNull(rs.getDate("gdsj"));

			if (cxbz.equals("Y"))//Y：已撤销；N：未撤销
			{
				dmmc="<font color=\"#FF0033\">"+dmmc+"<BR>("+kdsj+"至"+gdsj+")</font>";
			}
			else{
				if (!kdsj.equals(""))
				{
					dmmc=dmmc+"<BR>(开店:"+kdsj+")";
				}
			}

			//套餐＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

			//签单
			int tckhsl=0;
			int tcddsl=0;
			double tccbze=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(cbze) cbze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tckhsl=rs1.getInt("khsl");
				tcddsl=rs1.getInt("ddsl");
				tccbze=rs1.getDouble("cbze");
			}
			rs1.close();
			ps1.close();

			xjtckhsl+=tckhsl;
			xjtcddsl+=tcddsl;
			xjtccbze+=tccbze;

			zjtckhsl+=tckhsl;
			zjtcddsl+=tcddsl;
			zjtccbze+=tccbze;


			int tcpjde=0;
			if (tcddsl!=0)
			{
				tcpjde=(int)tccbze/tcddsl;
			}
			else{
				tcpjde=0;
			}

			//退单
			double tctdcbe=0;
			ls_sql =" SELECT -1*sum(cbze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.ddqrsj is not null";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tctdcbe=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			ls_sql =" SELECT -1*sum(jc_zczjx.zjxcbze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zczjx.clzt='99'";
			ls_sql+=" and jc_zczjx.qrsj is not null";
			ls_sql+=" and jc_zczjx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tctdcbe+=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtctdcbe+=tctdcbe;
			zjtctdcbe+=tctdcbe;

			//增减项
			double zjxcbe=0;
			ls_sql =" SELECT sum(jc_zczjx.zjxcbze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zczjx.clzt not in('00','01')";
			ls_sql+=" and jc_zczjx.qrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.qrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxcbe=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxcbe+=zjxcbe;
			zjzjxcbe+=zjxcbe;


			double tcje=0;
			tcje=tccbze+tctdcbe+zjxcbe;

			xjtcje+=tcje;
			zjtcje+=tcje;



			//非套餐＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
			int khsl=0;
			int ddsl=0;
			double qye=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				khsl=rs1.getInt("khsl");
				ddsl=rs1.getInt("ddsl");
				qye=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjkhsl+=khsl;
			xjddsl+=ddsl;
			xjqye+=qye;


			zjkhsl+=khsl;
			zjddsl+=ddsl;
			zjqye+=qye;


			int pjde=0;
			if (ddsl!=0)
			{
				pjde=(int)qye/ddsl;
			}
			else{
				pjde=0;
			}

			//退单
			double tde=0;
			ls_sql =" SELECT -1*sum(hkze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.ddqrsj is not null";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			ls_sql =" SELECT -1*sum(jc_zczjx.zjxze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zczjx.clzt='99'";
			ls_sql+=" and jc_zczjx.qrsj is not null";
			ls_sql+=" and jc_zczjx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde+=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtde+=tde;
			zjtde+=tde;

			//增减项
			double zjxje=0;
			ls_sql =" SELECT sum(jc_zczjx.zjxze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zczjx.clzt not in('00','01')";
			ls_sql+=" and jc_zczjx.qrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.qrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxje=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxje+=zjxje;
			zjzjxje+=zjxje;


			double je=0;
			je=qye+tde+zjxje;

			xjje+=je;
			zjje+=je;


			//集成
			int jc_khsl=0;
			int jc_ddsl=0;
			double jc_qye=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx='9'";//1：代销品；4：有库存订单；5：标准套餐；9：代购主材、C:选配主材；D：套餐外主材；E：散客
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jc_khsl=rs1.getInt("khsl");
				jc_ddsl=rs1.getInt("ddsl");
				jc_qye=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjjc_khsl+=jc_khsl;
			xjjc_ddsl+=jc_ddsl;
			xjjc_qye+=jc_qye;


			zjjc_khsl+=jc_khsl;
			zjjc_ddsl+=jc_ddsl;
			zjjc_qye+=jc_qye;

			//散客
			int sk_khsl=0;
			int sk_ddsl=0;
			double sk_qye=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx='E'";//1：代销品；4：有库存订单；5：标准套餐；9：代购主材、C:选配主材；D：套餐外主材；E：散客
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sk_khsl=rs1.getInt("khsl");
				sk_ddsl=rs1.getInt("ddsl");
				sk_qye=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjsk_khsl+=sk_khsl;
			xjsk_ddsl+=sk_ddsl;
			xjsk_qye+=sk_qye;


			zjsk_khsl+=sk_khsl;
			zjsk_ddsl+=sk_ddsl;
			zjsk_qye+=sk_qye;

			//选配
			int xp_khsl=0;
			int xp_ddsl=0;
			double xp_qye=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx='C'";//1：代销品；4：有库存订单；5：标准套餐；9：代购主材、C:选配主材；D：套餐外主材；E：散客
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				xp_khsl=rs1.getInt("khsl");
				xp_ddsl=rs1.getInt("ddsl");
				xp_qye=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjxp_khsl+=xp_khsl;
			xjxp_ddsl+=xp_ddsl;
			xjxp_qye+=xp_qye;


			zjxp_khsl+=xp_khsl;
			zjxp_ddsl+=xp_ddsl;
			zjxp_qye+=xp_qye;

			//套餐外
			int tw_khsl=0;
			int tw_ddsl=0;
			double tw_qye=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx='D'";//1：代销品；4：有库存订单；5：标准套餐；9：代购主材、C:选配主材；D：套餐外主材；E：散客
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tw_khsl=rs1.getInt("khsl");
				tw_ddsl=rs1.getInt("ddsl");
				tw_qye=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjtw_khsl+=tw_khsl;
			xjtw_ddsl+=tw_ddsl;
			xjtw_qye+=tw_qye;


			zjtw_khsl+=tw_khsl;
			zjtw_ddsl+=tw_ddsl;
			zjtw_qye+=tw_qye;
			
			row++;

			%>
			<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td ><%=row%></td>
				<td ><%=dmmc%></td>

				<td><%=cf.formatDouble(tcje)%></td>

				<td><%=tckhsl%></td>
				<td><%=tcddsl%></td>
				<td>
					<A HREF="ViewDmZcCbQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(tccbze)%>				</td>
				<td><%=cf.formatDouble(tcpjde)%></td>
				<td>
					<A HREF="ViewDmZcCbTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(tctdcbe)%>				</td>
				<td>
					<A HREF="ViewDmZcCbZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(zjxcbe)%>				</td>

				

				<td><%=cf.formatDouble(je)%></td>

				<td><%=khsl%></td>
				<td><%=ddsl%></td>
				<td>
					<A HREF="ViewDmZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(qye)%>				</td>
				<td><%=cf.formatDouble(pjde)%></td>
				<td>
					<A HREF="ViewDmZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(tde)%>				</td>
				<td><%=cf.formatDouble(zjxje)%></td>


				<td><%=jc_khsl%></td>
				<td><%=jc_ddsl%></td>
				<td>
					<A HREF="ViewDmZcQdMx_ddlx.jsp?ddlx=9&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(jc_qye)%></A>				
				</td>

				<td><%=sk_khsl%></td>
				<td><%=sk_ddsl%></td>
				<td>
					<A HREF="ViewDmZcQdMx_ddlx.jsp?ddlx=E&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(sk_qye)%></A>				
				</td>

				<td><%=xp_khsl%></td>
				<td><%=xp_ddsl%></td>
				<td>
					<A HREF="ViewDmZcQdMx_ddlx.jsp?ddlx=C&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(xp_qye)%></A>				
				</td>

				<td><%=tw_khsl%></td>
				<td><%=tw_ddsl%></td>
				<td>
					<A HREF="ViewDmZcQdMx_ddlx.jsp?ddlx=D&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(tw_qye)%></A>				
				</td>



				</tr>
			<%	
		}
		rs.close();
		ps.close();

		int tcpjde=0;
		if (xjtcddsl!=0)
		{
			tcpjde=(int)xjtccbze/xjtcddsl;
		}
		else{
			tcpjde=0;
		}


		int pjde=0;
		if (xjddsl!=0)
		{
			pjde=(int)xjqye/xjddsl;
		}
		else{
			pjde=0;
		}

		%>
		<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="2"><strong><font color="#ff0000">[<%=fgsmc%>]小计</strong></td>

			<td><strong><%=cf.formatDouble(xjtcje)%></strong></td>
			<td><strong><%=xjtckhsl%></strong></td>
			<td><strong><%=xjtcddsl%></strong></td>
			<td><strong><%=cf.formatDouble(xjtccbze)%></strong></td>
			<td><strong><%=cf.formatDouble(tcpjde)%></strong></td>
			<td><strong><%=cf.formatDouble(xjtctdcbe)%></strong></td>
			<td><strong><%=cf.formatDouble(xjzjxcbe)%></strong></td>
			<td><strong><%=cf.formatDouble(xjje)%></strong></td>

			<td><strong><%=xjkhsl%></strong></td>
			<td><strong><%=xjddsl%></strong></td>
			<td><strong><%=cf.formatDouble(xjqye)%></strong></td>
			<td><strong><%=cf.formatDouble(pjde)%></strong></td>
			<td><strong><%=cf.formatDouble(xjtde)%></strong></td>
			<td><strong><%=cf.formatDouble(xjzjxje)%></strong></td>

			<td><strong><%=xjjc_khsl%></strong></td>
			<td><strong><%=xjjc_ddsl%></strong></td>
			<td><strong><%=cf.formatDouble(xjjc_qye)%></strong></td>

			<td><strong><%=xjsk_khsl%></strong></td>
			<td><strong><%=xjsk_ddsl%></strong></td>
			<td><strong><%=cf.formatDouble(xjsk_qye)%></strong></td>

			<td><strong><%=xjxp_khsl%></strong></td>
			<td><strong><%=xjxp_ddsl%></strong></td>
			<td><strong><%=cf.formatDouble(xjxp_qye)%></strong></td>

			<td><strong><%=xjtw_khsl%></strong></td>
			<td><strong><%=xjtw_ddsl%></strong></td>
			<td><strong><%=cf.formatDouble(xjtw_qye)%></strong></td>

		</tr>
		<%
	}
	rs2.close();
	ps2.close();


	int tcpjde=0;
	if (zjtcddsl!=0)
	{
		tcpjde=(int)zjtccbze/zjtcddsl;
	}
	else{
		tcpjde=0;
	}


	int pjde=0;
	if (zjddsl!=0)
	{
		pjde=(int)zjqye/zjddsl;
	}
	else{
		pjde=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><strong><font color="#ff0000">总计</strong></td>

	<td><strong><%=cf.formatDouble(zjtcje)%></strong></td>
	<td><strong><%=zjtckhsl%></strong></td>
	<td><strong><%=zjtcddsl%></strong></td>
	<td><strong><%=cf.formatDouble(zjtccbze)%></strong></td>
	<td><strong><%=cf.formatDouble(tcpjde)%></strong></td>
	<td><strong><%=cf.formatDouble(zjtctdcbe)%></strong></td>
	<td><strong><%=cf.formatDouble(zjzjxcbe)%></strong></td>
	<td><strong><%=cf.formatDouble(zjje)%></strong></td>

	<td><strong><%=zjkhsl%></strong></td>
	<td><strong><%=zjddsl%></strong></td>
	<td><strong><%=cf.formatDouble(zjqye)%></strong></td>
	<td><strong><%=cf.formatDouble(pjde)%></strong></td>
	<td><strong><%=cf.formatDouble(zjtde)%></strong></td>
	<td><strong><%=cf.formatDouble(zjzjxje)%></strong></td>

	<td><strong><%=zjjc_khsl%></strong></td>
	<td><strong><%=zjjc_ddsl%></strong></td>
	<td><strong><%=cf.formatDouble(zjjc_qye)%></strong></td>

	<td><strong><%=zjsk_khsl%></strong></td>
	<td><strong><%=zjsk_ddsl%></strong></td>
	<td><strong><%=cf.formatDouble(zjsk_qye)%></strong></td>

	<td><strong><%=zjxp_khsl%></strong></td>
	<td><strong><%=zjxp_ddsl%></strong></td>
	<td><strong><%=cf.formatDouble(zjxp_qye)%></strong></td>

	<td><strong><%=zjtw_khsl%></strong></td>
	<td><strong><%=zjtw_ddsl%></strong></td>
	<td><strong><%=cf.formatDouble(zjtw_qye)%></strong></td>
</tr>
</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 