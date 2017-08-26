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
String dwbh=request.getParameter("dwbh");
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";

if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";


String getfgsbh=null;
String getdwbh=null;
String getdwmc=null;
String getsjs=null;
String olddwbh="";

int qys=0;
double zqye=0;
double wdzgce=0;
double sjf=0;
long fwmj=0;
int allqys=0;
double allzqye=0;
double allwdzgce=0;
double allsjf=0;
long allfwmj=0;
double zkl=0;
int pjde=0;
int pmjj=0;

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

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师家居单项产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
<BR>[工程签约额]指合同金额，包括公装和家装，[家居金额]包括增减项金额
</CENTER>

<table border="1" width="160%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">序号</td>
  <td  width="9%">店面</td>
  <td  width="4%">设计师</td>
  <td  width="5%">工程签约数</td>
  <td  width="6%">工程签约额</td>
  <td  width="6%">木门签约额</td>
  <td  width="4%">木门/家装</td>
   <td  width="6%">橱柜签约额</td>
  <td  width="4%">橱柜/家装</td>
   <td  width="6%">家具签约额</td>
  <td  width="4%">家具/家装</td>
<td  width="6%"><font color="#CC0000"><b>地板</b></font></td>
<td  width="6%"><font color="#CC0000"><b>洁具</b></font></td>
<td  width="6%"><font color="#CC0000"><b>瓷砖</b></font></td>
<td  width="6%"><font color="#CC0000"><b>其它</b></font></td>
   <td  width="6%">主材签约额</td>
  <td  width="4%">主材/家装</td>
  <td  width="6%">集成总额</td>
  <td  width="4%">集成/家装</td>

</tr>
<%
		double allsishtje=0;

		int maxkhsl=0;

		double Sjsmmvalue=0;
		double Sjscgvalue=0;
		double Sjsjjvalue=0;
		double Sjszcvalue=0;

		double Sjsjcze=0;

		double AllSjsmmvalue=0;
		double AllSjscgvalue=0;
		double AllSjsjjvalue=0;
		double AllSjszcvalue=0;
		double AllSjsjcze=0;

		double zcczje=0;
		double zcdbje=0;
		double zcjjje=0;
		double zcqtje=0;

		double Allzcczje=0;
		double Allzcdbje=0;
		double Allzcjjje=0;
		double Allzcqtje=0;

	//获取最大数

		ls_sql=" SELECT distinct fgsbh,dwbh,sjs";
		ls_sql+=" from ";
		ls_sql+=" ( ";

		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx,jc_mmydd";
		ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh ";
		ls_sql+=wheresql;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=wheresql;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=wheresql;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
		ls_sql+=wheresql;
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT sq_yhxx.ssfgs fgsbh,sq_yhxx.dwbh,sq_yhxx.yhmc sjs";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";

			if (!(fgs.equals("")))	
			{
				ls_sql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
			}

			if (!(dwbh.equals("")))	
			{
				ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
			}

		}


		ls_sql+=" ) ";

		ls_sql+=" order by fgsbh,dwbh,sjs";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getfgsbh=rs.getString("fgsbh");
			getdwbh=rs.getString("dwbh");
			getsjs=rs.getString("sjs");

			row++;

			qys=0;
			zqye=0;

			Sjsmmvalue=0;
			Sjscgvalue=0;
			Sjsjjvalue=0;
			Sjszcvalue=0;

			Sjsjcze=0;

			zcczje=0;
			zcdbje=0;
			zcjjje=0;
			zcqtje=0;

			if (!olddwbh.equals(getdwbh))
			{
				ls_sql=" SELECT dwmc";
				ls_sql+=" FROM sq_dwxx";
				ls_sql+=" where dwbh='"+getdwbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					getdwmc=rs1.getString("dwmc");
				}
				rs1.close();
				ps1.close();

				olddwbh=getdwbh;
			}


			//家装业绩
			ls_sql=" SELECT count(*) qys,sum(qye) zqye";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt='2'";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qys=rs1.getInt("qys");
				zqye=rs1.getDouble("zqye");
			}
			rs1.close();
			ps1.close();


			allqys+=qys;
			allzqye+=zqye;


			//木门金额计算
			ls_sql="SELECT sum(jc_mmydd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,jc_mmydd";
			ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				Sjsmmvalue=rs1.getDouble(1);//设计师木门金额
			}
			rs1.close();
			ps1.close();

			AllSjsmmvalue+=Sjsmmvalue;

			//橱柜金额计算
			ls_sql="SELECT sum(jc_cgdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,jc_cgdd";
			ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				Sjscgvalue=rs1.getDouble(1);//设计师橱柜金额
			}
			rs1.close();
			ps1.close();

			AllSjscgvalue+=Sjscgvalue;

			//家具金额计算
			ls_sql="SELECT sum(jc_jjdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,jc_jjdd";
			ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				Sjsjjvalue=rs1.getDouble(1);//设计师橱柜金额
			}
			rs1.close();
			ps1.close();

			AllSjsjjvalue+=Sjsjjvalue;

			//主材金额计算
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				Sjszcvalue=rs1.getDouble(1);//设计师橱柜金额
			}
			rs1.close();
			ps1.close();

			AllSjszcvalue+=Sjszcvalue;

			//地板金额计算
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh  and jc_zcdd.zcxlbm='地板'";//1003:地板
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbje=rs1.getDouble(1);//地板金额
			}
			rs1.close();
			ps1.close();

			Allzcdbje+=zcdbje;

			//洁具金额计算
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh  and jc_zcdd.zcxlbm='洁具'";//0901:洁具
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjje=rs1.getDouble(1);//洁具金额
			}
			rs1.close();
			ps1.close();

			Allzcjjje+=zcjjje;

			//瓷砖金额计算
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh  and jc_zcdd.zcxlbm='瓷砖'";//1001:瓷砖
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcczje=rs1.getDouble(1);//瓷砖金额
			}
			rs1.close();
			ps1.close();

			Allzcczje+=zcczje;

			zcqtje=Sjszcvalue-zcczje-zcdbje-zcjjje;
			Allzcqtje+=zcqtje;


			Sjsjcze=Sjsmmvalue+Sjscgvalue+Sjsjjvalue+Sjszcvalue;
			AllSjsjcze+=Sjsjcze;

			double tem=0;
			double tem1=0;
			double tem2=0;
			double tem3=0;
			double tem4=0;
			if(zqye==0)
			{
				tem=0;
				tem1=0;
				tem2=0;
				tem3=0;
				tem4=0;
			}
			else
			{
				tem=Sjsmmvalue*100/zqye;
				tem1=Sjscgvalue*100/zqye;
				tem2=Sjsjjvalue*100/zqye;
				tem3=Sjszcvalue*100/zqye;
				tem4=Sjsjcze*100/zqye;
			}

		%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td ><%=row%>
				</td>
				<td ><%=getdwmc%></td>
				<td ><%=getsjs%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble(zqye)%></td>
				<td  align="right"><%=cf.formatDouble(Sjsmmvalue)%></td>
				<td  align="right"><%=cf.formatDouble(tem)%>%</td>
				<td  align="right"><%=cf.formatDouble(Sjscgvalue)%></td>
				<td  align="right"><%=cf.formatDouble(tem1)%>%</td>
				<td  align="right"><%=cf.formatDouble(Sjsjjvalue)%></td>
				<td  align="right"><%=cf.formatDouble(tem2)%>%</td>
				<td  align="right"><%=cf.formatDouble(zcdbje)%></td>
				<td  align="right"><%=cf.formatDouble(zcjjje)%></td>
				<td  align="right"><%=cf.formatDouble(zcczje)%></td>
				<td  align="right"><%=cf.formatDouble(zcqtje)%></td>
				<td  align="right"><%=cf.formatDouble(Sjszcvalue)%></td>
				<td  align="right"><%=cf.formatDouble(tem3)%>%</td>
				<td  align="right"><A HREF="ViewSjsJjcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=getdwbh%>" target="_blank"><%=cf.formatDouble(Sjsjcze)%></A></td>
				<td  align="right"><%=cf.formatDouble(tem4)%>%</td>
			</tr>
		<%
		}
		rs.close();
		ps.close();

		double tem=0;
		double tem1=0;
		double tem2=0;
		double tem3=0;
		double tem4=0;
		if(allzqye==0)
		{
			tem=0;
			tem1=0;
			tem2=0;
			tem3=0;
			tem4=0;
		}
		else
		{
			tem=AllSjsmmvalue*100/allzqye;
			tem1=AllSjscgvalue*100/allzqye;
			tem2=AllSjsjjvalue*100/allzqye;
			tem3=AllSjszcvalue*100/allzqye;
			tem4=AllSjsjcze*100/allzqye;
		}

%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td >总计</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td  align="right"><%=allqys%></td>
			<td  align="right"><%=cf.formatDouble(allzqye)%></td>
			<td  align="right"><%=cf.formatDouble(AllSjsmmvalue)%></td>
			<td  align="right"><%=cf.formatDouble(tem)%>%</td>
			<td  align="right"><%=cf.formatDouble(AllSjscgvalue)%></td>
			<td  align="right"><%=cf.formatDouble(tem1)%>%</td>
			<td  align="right"><%=cf.formatDouble(AllSjsjjvalue)%></td>
			<td  align="right"><%=cf.formatDouble(tem2)%>%</td>
			<td  align="right"><%=cf.formatDouble(Allzcdbje)%></td>
			<td  align="right"><%=cf.formatDouble(Allzcjjje)%></td>
			<td  align="right"><%=cf.formatDouble(Allzcczje)%></td>
			<td  align="right"><%=cf.formatDouble(Allzcqtje)%></td>
			<td  align="right"><%=cf.formatDouble(AllSjszcvalue)%></td>
			<td  align="right"><%=cf.formatDouble(tem3)%>%</td>
			<td  align="right"><%=cf.formatDouble(AllSjsjcze)%></td>
			<td  align="right"><%=cf.formatDouble(tem4)%>%</td>
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
