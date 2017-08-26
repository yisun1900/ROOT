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

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String lrdwbh=request.getParameter("dwbh");
String lrxmzy=request.getParameter("xmzy");
String wheresql="";
if (lrxmzy!=null)
{
	lrxmzy=cf.GB2Uni(lrxmzy);
	if (!(lrxmzy.equals("")))	wheresql+=" and  (xmzy='"+lrxmzy+"')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String dwbh=null;
String dwmc=null;
String xmzy=null;
String clzt=null;

int sl=0;

int ddzl=0;
double htze=0;
int wwc=0;
int ywc=0;
int ypd=0;
int ycc=0;
int yfc=0;
int yht=0;
int yqr=0;
int yrk=0;
int yaz=0;

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>集成家居订单统计</B><b>(录入时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<div align="center"><B>木门预订单统计</B><BR></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="15%">店面</td>
  <td width="9%">项目专员</td>
  <td width="9%">订单总数</td>
  <td width="11%">合同总额</td>
  <td width="8%">未完成</td>
  <td width="8%">已完成</td>
  <td width="8%">已派单</td>
  <td width="8%">已初测</td>
  <td width="8%">签订合同</td>
  <td width="8%">已入库</td>
  <td width="8%">安装完成</td>
</tr>
<%

	//木门预订单统计:明细
	ls_sql="SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_xmzy.xmzy";
	ls_sql+=" FROM sq_dwxx,sq_xmzy";
    ls_sql+=" where sq_dwxx.dwbh=sq_xmzy.dwbh(+) and (dwlx='F2' and cxbz='N')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by sq_dwxx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));

		ddzl=0;
		htze=0;
		wwc=0;
		ywc=0;
		ypd=0;
		ycc=0;
		yht=0;
		yrk=0;
		yaz=0;

		ls_sql="SELECT clzt,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_mmydd,crm_khxx";
		ls_sql+=" where jc_mmydd.clzt!='99' and jc_mmydd.khlx='1'";
		ls_sql+=" and jc_mmydd.khbh=crm_khxx.khbh(+) ";
		ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and jc_mmydd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by clzt";
		ls_sql+=" order by clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);

			if (clzt.equals("00"))
			{
				wwc=sl;
			}
			else if (clzt.equals("01"))
			{
				ywc=sl;
			}
			else if (clzt.equals("02"))
			{
				ypd=sl;
			}
			else if (clzt.equals("03"))
			{
				ycc=sl;
			}
			else if (clzt.equals("04"))
			{
				yht=sl;
			}
			else if (clzt.equals("05"))
			{
				yrk=sl;
			}
			else if (clzt.equals("06"))
			{
				yaz=sl;
			}
		}
		rs.close();
		ps.close();

		ddzl=wwc+ywc+ypd+ycc+yht+yrk+yaz;

		%>
		<tr align="center">
		<td><%=dwmc%></td>
		<td><%=xmzy%></td>
		<td><%=ddzl%></td>
		<td><%=htze%></td>
		<td><%=wwc%></td>
		<td><%=ywc%></td>
		<td><%=ypd%></td>
		<td><%=ycc%></td>
		<td><%=yht%></td>
		<td><%=yrk%></td>
		<td><%=yaz%></td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	ddzl=0;
	wwc=0;
	ywc=0;
	ypd=0;
	ycc=0;
	yht=0;
	yrk=0;
	yaz=0;

	//木门预订单统计:合 计

	ls_sql="SELECT clzt,count(*),sum(zjhze)";
	ls_sql+=" FROM jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+) and jc_mmydd.clzt!='99' and jc_mmydd.khlx='1'";
	ls_sql+=" and jc_mmydd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" group by clzt";
	ls_sql+=" order by clzt";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clzt=rs.getString("clzt");
		sl=rs.getInt(2);
		htze+=rs.getDouble(3);

		if (clzt.equals("00"))
		{
			wwc=sl;
		}
		else if (clzt.equals("01"))
		{
			ywc=sl;
		}
		else if (clzt.equals("02"))
		{
			ypd=sl;
		}
		else if (clzt.equals("03"))
		{
			ycc=sl;
		}
		else if (clzt.equals("04"))
		{
			yht=sl;
		}
		else if (clzt.equals("05"))
		{
			yrk=sl;
		}
		else if (clzt.equals("06"))
		{
			yaz=sl;
		}
	}
	rs.close();
	ps.close();

	ddzl=wwc+ywc+ypd+ycc+yht+yrk+yaz;

	%>
	<tr align="center">
	<td>合  计</td>
	<td>&nbsp;</td>
	<td><%=ddzl%></td>
	<td><%=htze%></td>
	<td><%=wwc%></td>
	<td><%=ywc%></td>
	<td><%=ypd%></td>
	<td><%=ycc%></td>
	<td><%=yht%></td>
	<td><%=yrk%></td>
	<td><%=yaz%></td>
	</tr>
</table>


<div align="center"><B>橱柜预订单统计</B><BR></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="14%">店面</td>
  <td width="7%">项目专员</td>
  <td width="7%">订单总数</td>
  <td width="9%">合同总额</td>
  <td width="7%">未完成</td>
  <td width="7%">已完成</td>
  <td width="7%">已派单</td>
  <td width="7%">已初测</td>
  <td width="7%">已复测</td>
  <td width="7%">签订合同</td>
  <td width="7%">合同已确认</td>
  <td width="7%">已入库</td>
  <td width="7%">安装完成</td>
</tr>
<%
	//橱柜预订单统计:明细
	ls_sql="SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_xmzy.xmzy";
	ls_sql+=" FROM sq_dwxx,sq_xmzy";
    ls_sql+=" where sq_dwxx.dwbh=sq_xmzy.dwbh(+) and (dwlx='F2' and cxbz='N')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));

		ddzl=0;
		htze=0;
		wwc=0;
		ywc=0;
		ypd=0;
		ycc=0;
		yfc=0;
		yht=0;
		yqr=0;
		yrk=0;
		yaz=0;

		ls_sql="SELECT clzt,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_cgdd,crm_khxx";
		ls_sql+=" where jc_cgdd.clzt!='99' and jc_cgdd.khlx='1'";
		ls_sql+=" and jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and jc_cgdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by clzt";
		ls_sql+=" order by clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);

			//00：预订单未完成；01：预订单已完成；02：已派单；03：已初测；04：已复测；05：签订合同；06：合同已确认；07：已入库；08：已安装
			if (clzt.equals("00"))
			{
				wwc=sl;
			}
			else if (clzt.equals("01"))
			{
				ywc=sl;
			}
			else if (clzt.equals("02"))
			{
				ypd=sl;
			}
			else if (clzt.equals("03"))
			{
				ycc=sl;
			}
			else if (clzt.equals("04"))
			{
				yfc=sl;
			}
			else if (clzt.equals("05"))
			{
				yht=sl;
			}
			else if (clzt.equals("06"))
			{
				yqr=sl;
			}
			else if (clzt.equals("07"))
			{
				yrk=sl;
			}
			else if (clzt.equals("08"))
			{
				yaz=sl;
			}
		}
		rs.close();
		ps.close();

		ddzl=wwc+ywc+ypd+ycc+yfc+yht+yqr+yrk+yaz;

		%>
		<tr align="center">
		<td><%=dwmc%></td>
		<td><%=xmzy%></td>
		<td><%=ddzl%></td>
		<td><%=htze%></td>
		<td><%=wwc%></td>
		<td><%=ywc%></td>
		<td><%=ypd%></td>
		<td><%=ycc%></td>
		<td><%=yfc%></td>
		<td><%=yht%></td>
		<td><%=yqr%></td>
		<td><%=yrk%></td>
		<td><%=yaz%></td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	ddzl=0;
	wwc=0;
	ywc=0;
	ypd=0;
	ycc=0;
	yfc=0;
	yht=0;
	yqr=0;
	yrk=0;
	yaz=0;

	//橱柜预订单统计:合计
	ls_sql="SELECT clzt,count(*),sum(zjhze)";
	ls_sql+=" FROM jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt!='99' and jc_cgdd.khlx='1'";
	ls_sql+=" and jc_cgdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" group by clzt";
	ls_sql+=" order by clzt";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clzt=rs.getString("clzt");
		sl=rs.getInt(2);
		htze+=rs.getDouble(3);

		//00：预订单未完成；01：预订单已完成；02：已派单；03：已初测；04：已复测；05：签订合同；06：合同已确认；07：已入库；08：已安装
		if (clzt.equals("00"))
		{
			wwc=sl;
		}
		else if (clzt.equals("01"))
		{
			ywc=sl;
		}
		else if (clzt.equals("02"))
		{
			ypd=sl;
		}
		else if (clzt.equals("03"))
		{
			ycc=sl;
		}
		else if (clzt.equals("04"))
		{
			yfc=sl;
		}
		else if (clzt.equals("05"))
		{
			yht=sl;
		}
		else if (clzt.equals("06"))
		{
			yqr=sl;
		}
		else if (clzt.equals("07"))
		{
			yrk=sl;
		}
		else if (clzt.equals("08"))
		{
			yaz=sl;
		}
	}
	rs.close();
	ps.close();

	ddzl=wwc+ywc+ypd+ycc+yfc+yht+yqr+yrk+yaz;

	%>
	<tr align="center">
	<td>合  计</td>
	<td>&nbsp;</td>
	<td><%=ddzl%></td>
	<td><%=htze%></td>
	<td><%=wwc%></td>
	<td><%=ywc%></td>
	<td><%=ypd%></td>
	<td><%=ycc%></td>
	<td><%=yfc%></td>
	<td><%=yht%></td>
	<td><%=yqr%></td>
	<td><%=yrk%></td>
	<td><%=yaz%></td>
	</tr>
</table>


<div align="center"><B>家具预订单统计</B><BR></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="14%">店面</td>
  <td width="7%">项目专员</td>
  <td width="7%">订单总数</td>
  <td width="9%">合同总额</td>
  <td width="7%">未完成</td>
  <td width="7%">已完成</td>
  <td width="7%">已派单</td>
  <td width="7%">已初测</td>
  <td width="7%">已复测</td>
  <td width="7%">签订合同</td>
  <td width="7%">合同已确认</td>
  <td width="7%">已入库</td>
  <td width="7%">安装完成</td>
</tr>
<%
	//家具预订单统计:明细
	ls_sql="SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_xmzy.xmzy";
	ls_sql+=" FROM sq_dwxx,sq_xmzy";
    ls_sql+=" where sq_dwxx.dwbh=sq_xmzy.dwbh(+) and (dwlx='F2' and cxbz='N')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));

		ddzl=0;
		htze=0;
		wwc=0;
		ywc=0;
		ypd=0;
		ycc=0;
		yfc=0;
		yht=0;
		yqr=0;
		yrk=0;
		yaz=0;

		ls_sql="SELECT clzt,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_jjdd,crm_khxx";
		ls_sql+=" where jc_jjdd.clzt!='99' and jc_jjdd.khlx='1'";
		ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and jc_jjdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by clzt";
		ls_sql+=" order by clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);

			//00：预订单未完成；01：预订单已完成；02：已派单；03：已初测；04：已复测；05：签订合同；06：合同已确认；07：已入库；08：已安装
			if (clzt.equals("00"))
			{
				wwc=sl;
			}
			else if (clzt.equals("01"))
			{
				ywc=sl;
			}
			else if (clzt.equals("02"))
			{
				ypd=sl;
			}
			else if (clzt.equals("03"))
			{
				ycc=sl;
			}
			else if (clzt.equals("04"))
			{
				yfc=sl;
			}
			else if (clzt.equals("05"))
			{
				yht=sl;
			}
			else if (clzt.equals("06"))
			{
				yqr=sl;
			}
			else if (clzt.equals("07"))
			{
				yrk=sl;
			}
			else if (clzt.equals("08"))
			{
				yaz=sl;
			}
		}
		rs.close();
		ps.close();

		ddzl=wwc+ywc+ypd+ycc+yfc+yht+yqr+yrk+yaz;

		%>
		<tr align="center">
		<td><%=dwmc%></td>
		<td><%=xmzy%></td>
		<td><%=ddzl%></td>
		<td><%=htze%></td>
		<td><%=wwc%></td>
		<td><%=ywc%></td>
		<td><%=ypd%></td>
		<td><%=ycc%></td>
		<td><%=yfc%></td>
		<td><%=yht%></td>
		<td><%=yqr%></td>
		<td><%=yrk%></td>
		<td><%=yaz%></td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	ddzl=0;
	wwc=0;
	ywc=0;
	ypd=0;
	ycc=0;
	yfc=0;
	yht=0;
	yqr=0;
	yrk=0;
	yaz=0;

	//家具预订单统计:合计
	ls_sql="SELECT clzt,count(*),sum(htze-jxje+zxje)";
	ls_sql+=" FROM jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+) and jc_jjdd.clzt!='99' and jc_jjdd.khlx='1'";
	ls_sql+=" and jc_jjdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" group by clzt";
	ls_sql+=" order by clzt";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clzt=rs.getString("clzt");
		sl=rs.getInt(2);
		htze+=rs.getDouble(3);

		//00：预订单未完成；01：预订单已完成；02：已派单；03：已初测；04：已复测；05：签订合同；06：合同已确认；07：已入库；08：已安装
		if (clzt.equals("00"))
		{
			wwc=sl;
		}
		else if (clzt.equals("01"))
		{
			ywc=sl;
		}
		else if (clzt.equals("02"))
		{
			ypd=sl;
		}
		else if (clzt.equals("03"))
		{
			ycc=sl;
		}
		else if (clzt.equals("04"))
		{
			yfc=sl;
		}
		else if (clzt.equals("05"))
		{
			yht=sl;
		}
		else if (clzt.equals("06"))
		{
			yqr=sl;
		}
		else if (clzt.equals("07"))
		{
			yrk=sl;
		}
		else if (clzt.equals("08"))
		{
			yaz=sl;
		}
	}
	rs.close();
	ps.close();

	ddzl=wwc+ywc+ypd+ycc+yfc+yht+yqr+yrk+yaz;

	%>
	<tr align="center">
	<td>合  计</td>
	<td>&nbsp;</td>
	<td><%=ddzl%></td>
	<td><%=htze%></td>
	<td><%=wwc%></td>
	<td><%=ywc%></td>
	<td><%=ypd%></td>
	<td><%=ycc%></td>
	<td><%=yfc%></td>
	<td><%=yht%></td>
	<td><%=yqr%></td>
	<td><%=yrk%></td>
	<td><%=yaz%></td>
	</tr>
</table>


<div align="center"><B>主材合同统计</B><BR></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="14%">店面</td>
  <td width="7%">项目专员</td>
  <td width="7%">合同总数</td>
  <td width="9%">合同总额</td>
  <td width="7%">未完成</td>
  <td width="7%">已完成</td>
  <td width="7%">合同已确认</td>
  <td width="7%">已送货</td>
</tr>
<%
	//主材预订单统计:明细
	ls_sql="SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_xmzy.xmzy";
	ls_sql+=" FROM sq_dwxx,sq_xmzy";
    ls_sql+=" where sq_dwxx.dwbh=sq_xmzy.dwbh(+) and (dwlx='F2' and cxbz='N')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));

		ddzl=0;
		htze=0;
		wwc=0;
		ywc=0;
		ypd=0;
		ycc=0;
		yfc=0;
		yht=0;
		yqr=0;
		yrk=0;
		yaz=0;

		ls_sql="SELECT clzt,count(*),sum(hkze+zjhze)";
		ls_sql+=" FROM jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcdd.clzt!='99' ";
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and jc_zcdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by clzt";
		ls_sql+=" order by clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);

			//00：订单未完成；01：订单已完成；02：订单已确认；03：已送货
			if (clzt.equals("00"))
			{
				wwc=sl;
			}
			else if (clzt.equals("01"))
			{
				ywc=sl;
			}
			else if (clzt.equals("02"))
			{
				yqr=sl;
			}
			else if (clzt.equals("03"))
			{
				yaz=sl;
			}
		}
		rs.close();
		ps.close();

		ddzl=wwc+ywc+yqr+yaz;

		%>
		<tr align="center">
		<td><%=dwmc%></td>
		<td><%=xmzy%></td>
		<td><%=ddzl%></td>
		<td><%=htze%></td>
		<td><%=wwc%></td>
		<td><%=ywc%></td>
		<td><%=yqr%></td>
		<td><%=yaz%></td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	ddzl=0;
	wwc=0;
	ywc=0;
	ypd=0;
	ycc=0;
	yfc=0;
	yht=0;
	yqr=0;
	yrk=0;
	yaz=0;

	//主材预订单统计:合计
	ls_sql="SELECT clzt,count(*),sum(hkze+zjhze)";
	ls_sql+=" FROM jc_zcdd,crm_khxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.clzt!='99' ";
	ls_sql+=" and jc_zcdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" group by clzt";
	ls_sql+=" order by clzt";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clzt=rs.getString("clzt");
		sl=rs.getInt(2);
		htze+=rs.getDouble(3);

		//00：订单未完成；01：订单已完成；02：订单已确认；03：已送货
		if (clzt.equals("00"))
		{
			wwc=sl;
		}
		else if (clzt.equals("01"))
		{
			ywc=sl;
		}
		else if (clzt.equals("02"))
		{
			yqr=sl;
		}
		else if (clzt.equals("03"))
		{
			yaz=sl;
		}
	}
	rs.close();
	ps.close();

	ddzl=wwc+ywc+yqr+yaz;

	%>
	<tr align="center">
	<td>合  计</td>
	<td>&nbsp;</td>
	<td><%=ddzl%></td>
	<td><%=htze%></td>
	<td><%=wwc%></td>
	<td><%=ywc%></td>
	<td><%=yqr%></td>
	<td><%=yaz%></td>
	</tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + ls_sql);
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