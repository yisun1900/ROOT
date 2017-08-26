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
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";
String wheresql1="";

if (!(fgs.equals("")))	wheresql+=" and  fgsbh='"+fgs+"'";
if (!(dwbh.equals("")))	wheresql+=" and  dwbh='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql+=" and  sjs='"+sjs+"'";

if (!(fgs.equals("")))	wheresql1+=" and  fgsbh='"+fgs+"'";
if (!(dwbh.equals("")))	wheresql1+=" and  qddm='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql1+=" and  jzsjs='"+sjs+"'";

String getfgsbh=null;
String getdwbh=null;
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

	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：设计师家居业绩："+sjfw+"："+sjfw2+"："+fgs+"："+dwbh+"：");
	ps.executeUpdate();
	ps.close();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师家居单项产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>

<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 

<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=0 width="180%" style='FONT-SIZE: 13px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="3%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">序号</td>
	<td  width="9%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">店面</td>
	<td  width="4%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计师</td>
	<td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工程签约数</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工程签约额</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">木门签约额</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">木门/家装</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">橱柜签约额</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">橱柜/家装</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">家具签约额</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">家具/家装</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#00FF00"><b>地板</b></font></td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#00FF00"><b>洁具</b></font></td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#00FF00"><b>瓷砖</b></font></td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#00FF00"><b>其它</b></font></td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">主材签约额</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">主材/家装</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">集成总额</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">集成/家装</td>

</tr>
<%
  //家居业绩＝本期签约额+本期增项<可能前期签得合同>-本期减项<可能前期签得合同>-本期退单<可能前期签得合同>

		ls_sql=" delete from cw_tjlsb11";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from cw_tjlsb12";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	//插入临时表＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

		//全部集成
		ls_sql="insert into cw_tjlsb12 (yhdlm,fgsbh,qddm,jzsjs,lx,sz1)";
		ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,NVL(jzsjs,'空') jzsjs,lx,sum(je)";
		ls_sql+=" FROM jc_jcdd";
		ls_sql+=" where fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql1;
		ls_sql+=" group by fgsbh,qddm,jzsjs,lx";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		
		//家装
		ls_sql="insert into cw_tjlsb11 (yhdlm,fgsbh,qddm,jzsjs,lx,sz11,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8)";
		ls_sql+=" SELECT '"+yhdlm+"',fgsbh,dwbh,sjs,'0',count(*),sum(qye),0,0,0,0,0,0,0";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：非家装客户；5：设计客户
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by fgsbh,dwbh,sjs";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//木门
		ls_sql="insert into cw_tjlsb11 (yhdlm,fgsbh,qddm,jzsjs,lx,sz11,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8)";
		ls_sql+=" SELECT yhdlm,fgsbh,qddm,jzsjs,lx,0,0,sz1,0,0,0,0,0,0";
		ls_sql+=" FROM cw_tjlsb12";
		ls_sql+=" where lx='1'";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=" and yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//橱柜
		ls_sql="insert into cw_tjlsb11 (yhdlm,fgsbh,qddm,jzsjs,lx,sz11,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8)";
		ls_sql+=" SELECT yhdlm,fgsbh,qddm,jzsjs,lx,0,0,0,sz1,0,0,0,0,0";
		ls_sql+=" FROM cw_tjlsb12";
		ls_sql+=" where lx='2'";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=" and yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//家具
		ls_sql="insert into cw_tjlsb11 (yhdlm,fgsbh,qddm,jzsjs,lx,sz11,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8)";
		ls_sql+=" SELECT yhdlm,fgsbh,qddm,jzsjs,lx,0,0,0,0,sz1,0,0,0,0";
		ls_sql+=" FROM cw_tjlsb12";
		ls_sql+=" where lx='3'";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=" and yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//主材
		ls_sql="insert into cw_tjlsb11 (yhdlm,fgsbh,qddm,jzsjs,lx,sz11,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8)";
		ls_sql+=" SELECT yhdlm,fgsbh,qddm,jzsjs,lx,0,0,0,0,0,sz1,0,0,0";
		ls_sql+=" FROM cw_tjlsb12";
		ls_sql+=" where lx='4'";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=" and yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//地板
		ls_sql="insert into cw_tjlsb11 (yhdlm,fgsbh,qddm,jzsjs,lx,sz11,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8)";
		ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,NVL(jzsjs,'空') jzsjs,'5',0,0,0,0,0,0,sum(je),0,0";
		ls_sql+=" FROM jc_jcdd";
		ls_sql+=" where lx='4'";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=wheresql1;
		ls_sql+=" and jc_jcdd.zcxlbm='地板'";
		ls_sql+=" and fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by fgsbh,qddm,jzsjs";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//洁具
		ls_sql="insert into cw_tjlsb11 (yhdlm,fgsbh,qddm,jzsjs,lx,sz11,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8)";
		ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,NVL(jzsjs,'空') jzsjs,'6',0,0,0,0,0,0,0,sum(je),0";
		ls_sql+=" FROM jc_jcdd";
		ls_sql+=" where lx='4'";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=wheresql1;
		ls_sql+=" and jc_jcdd.zcxlbm='洁具'";
		ls_sql+=" and fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by fgsbh,qddm,jzsjs";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//瓷砖
		ls_sql="insert into cw_tjlsb11 (yhdlm,fgsbh,qddm,jzsjs,lx,sz11,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8)";
		ls_sql+=" SELECT '"+yhdlm+"',fgsbh,qddm,NVL(jzsjs,'空') jzsjs,'7',0,0,0,0,0,0,0,0,sum(je)";
		ls_sql+=" FROM jc_jcdd";
		ls_sql+=" where lx='4'";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=wheresql1;
		ls_sql+=" and jc_jcdd.zcxlbm='瓷砖'";
		ls_sql+=" and fssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and fssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by fgsbh,qddm,jzsjs";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	//插入临时表======================================完成

		int jzqys=0;
		double jzqye=0;
		int xjjzqys=0;
		double xjjzqye=0;

		double mmje =0;
		double cgje=0;
		double jjje=0;
		double zcje=0;
		double zcdbje=0;
		double zcjjje=0;
		double zcczje=0;
		double zcqtje=0;
		double jcje=0;

		double xjmmje=0;
		double xjcgje=0;
		double xjjjje=0;
		double xjzcje=0;
		double xjzcdbje=0;
		double xjzcjjje=0;
		double xjzcczje=0;
		double xjzcqtje=0;
		double xjjcje=0;


		double mmjzbl=0;
		double cgjzbl=0;
		double jjjzbl=0;
		double zcjzbl=0;
		double jcjzbl=0;
	//获取最大数

		ls_sql=" SELECT fgsbh,dwbh,sjs,sum(c1),sum(c2),sum(c3),sum(c4),sum(c5),sum(c6),sum(c7),sum(c8),sum(c9)";
		ls_sql+=" from ";
		ls_sql+=" ( ";

		ls_sql+=" SELECT fgsbh,qddm dwbh,jzsjs sjs,sum(sz11) c1,sum(sz1) c2,sum(sz2) c3,sum(sz3) c4,sum(sz4) c5,sum(sz5) c6,sum(sz6) c7,sum(sz7) c8,sum(sz8) c9";
		ls_sql+=" FROM cw_tjlsb11";
		ls_sql+=" WHERE yhdlm='"+yhdlm+"'";
		ls_sql+=" GROUP BY fgsbh,qddm,jzsjs";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT sq_yhxx.ssfgs fgsbh,sq_yhxx.dwbh,sq_yhxx.yhmc sjs,0,0,0,0,0,0,0,0,0";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sflz='N'";

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

		ls_sql+=" group by fgsbh,dwbh,sjs";
		ls_sql+=" order by fgsbh,dwbh,sjs";

//		out.println(ls_sql);

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getfgsbh=rs.getString("fgsbh");
			getdwbh=rs.getString("dwbh");
			getsjs=rs.getString("sjs");
			jzqys=rs.getInt(4);
			jzqye=rs.getDouble(5);
			mmje=rs.getDouble(6);
			cgje=rs.getDouble(7);
			jjje=rs.getDouble(8);
			zcje=rs.getDouble(9);
			zcdbje=rs.getDouble(10);
			zcjjje=rs.getDouble(11);
			zcczje=rs.getDouble(12);


			zcqtje=zcje-zcdbje-zcjjje-zcczje;
			jcje=mmje+cgje+jjje+zcje;

			xjjzqys+=jzqys;
			xjjzqye+=jzqye;

			xjmmje+=mmje;
			xjcgje+=cgje;
			xjjjje+=jjje;
			xjzcje+=zcje;
			xjzcdbje+=zcdbje;
			xjzcjjje+=zcjjje;
			xjzcczje+=zcczje;
			xjzcqtje+=zcqtje;
			xjjcje+=jcje;

			row++;

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



			//计算比例
			if(jzqye==0)
			{
				mmjzbl=0;
				cgjzbl=0;
				jjjzbl=0;
				zcjzbl=0;
				jcjzbl=0;
			}
			else
			{
				mmjzbl=mmje*100/jzqye;
				cgjzbl=cgje*100/jzqye;
				jjjzbl=jjje*100/jzqye;
				zcjzbl=zcje*100/jzqye;
				jcjzbl=jcje*100/jzqye;
			}

		%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%>
				</td>
				<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getdwmc%></td>
				<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getsjs%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewSjsJjcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=getdwbh%>" target="_blank"><%=jzqys%></A></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(jzqye)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(mmje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(mmjzbl)%>%</td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(cgje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(cgjzbl)%>%</td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(jjje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(jjjzbl)%>%</td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(zcdbje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(zcjjje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(zcczje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(zcqtje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(zcje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(zcjzbl)%>%</td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(jcje)%></td>
				<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(jcjzbl)%>%</td>
			</tr>
		<%
		}
		rs.close();
		ps.close();


		//计算比例
		if(xjjzqye==0)
		{
			mmjzbl=0;
			cgjzbl=0;
			jjjzbl=0;
			zcjzbl=0;
			jcjzbl=0;
		}
		else
		{
			mmjzbl=xjmmje*100/xjjzqye;
			cgjzbl=xjcgje*100/xjjzqye;
			jjjzbl=xjjjje*100/xjjzqye;
			zcjzbl=xjzcje*100/xjjzqye;
			jcjzbl=xjjcje*100/xjjzqye;
		}

%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">总计</td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=xjjzqys%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjjzqye)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjmmje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(mmjzbl)%>%</td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjcgje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(cgjzbl)%>%</td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjjjje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(jjjzbl)%>%</td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzcdbje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzcjjje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzcczje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzcqtje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzcje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(zcjzbl)%>%</td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjjcje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(jcjzbl)%>%</td>
		</tr>
		</table>
<%
		ls_sql=" delete from cw_tjlsb11";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from cw_tjlsb12";
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<P>[工程签约额]：指合同金额，包括公装和家装，不包括增减项
<P>[家居金额]：本期签约额+本期增项<可能前期签得合同>-本期减项<可能前期签得合同>-本期退单<可能前期签得合同>
 

