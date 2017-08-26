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
	
	
Connection conn = null;
String wheresql="";
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zqs=request.getParameter("zqs");//周期数
String ssfgs=request.getParameter("ssfgs");//周期数

String date_bs=null;//本周开始时间
String date_be=null;
String date_ss=null;//上周日期开始
String date_se=null;

String dwmc=null;
String dwbh=null;
String dqbm=null;
int sl=0;
double a=0;
double b=0;
double c=0;
double d=0;
double ee=0;
double f=0;
double g=0;
double h=0;
double i=0;
double j=0;
double a1=0;
double a2=0;
double a3=0;
double a4=0;


int xjsl=0;
double xja=0;
double xjb=0;
double xjc=0;
double xjd=0;
double xjee=0;
double xjf=0;
double xjg=0;
double xjh=0;
double xji=0;
double xjj=0;


int zjsl=0;
double zja=0;
double zjb=0;
double zjc=0;
double zjd=0;
double zjee=0;
double zjf=0;
double zjg=0;
double zjh=0;
double zji=0;
double zjj=0;


try{
	conn=cf.getConnection();
	

	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();
	

	ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" where zqs="+zqs;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();
	
%>
<body>

<div align="center"><%=dwmc%>汇总明细</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">上周日期：</td>
 <td width="20%"><%=date_ss%> 至 <%=date_se%></td>
<td width="11%" align="right">本周日期：</td>
 <td width="20%" ><%=date_bs%> 至 <%=date_be%></td>
 <td width="38%" >&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">

<tr height=28 bgcolor="#CCCCCC"  align="center" >
	<td width="10%" rowspan=2 >市场部</td>
	<td width="5%" rowspan=2 >家装顾问人数</td>
	<td colspan="8">目标客户数量</td>
	<td colspan="8" >收取定金数量</td>
 </tr>
 <tr bgcolor="#CCCCCC" align="center">
  <td  width="5%" >本月计划(分公司自定)</td>
  <td  width="5%" >本月计划(集团要求)</td>
  <td  width="5%" >本月累计</td>
  <td  width="5%" >本月达成率</td>
  <td  width="5%" >本月人均邀约数</td>
  <td  width="5%" >上周计划</td>
  <td  width="5%">上周完成</td>
  <td  width="5%" >本周预计</td>

  <td  width="5%" >本月计划(分公司自定)</td>
  <td  width="5%" >本月计划(集团要求)</td>
  <td  width="5%" >本月累计</td>
  <td  width="5%" >本月达成率</td>
  <td  width="5%" >本月定金成功率</td>
  <td  width="5%" >上周计划</td>
  <td  width="5%" >上周完成</td>
  <td  width="5%" >本周预计</td>
 </tr>
 <tr>
  <%
	double yy_sjscb_mbkh=0;	
	double yy_sjscb_sqdj=0;	
	ls_sql="select yy_sjscb_mbkh,yy_sjscb_sqdj"; 
	ls_sql+=" from YY_SJ ";
	ls_sql+=" where yy_sj_fgs='"+ssfgs+"'";
	ls_sql+=" and zqs="+zqs;
	ps = conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		yy_sjscb_mbkh=rs.getInt("yy_sjscb_mbkh");
		yy_sjscb_sqdj=rs.getInt("yy_sjscb_sqdj");
	}
	rs.close();
	ps.close();

	xjsl=0;
	xja=0;
	xjb=0;
	xjc=0;
	xjd=0;
	xjee=0;
	xjf=0;
	xjg=0;
	xjh=0;
	xji=0;
	xjj=0;

	ls_sql="select yy_scb.ssbm,dwmc,count(*) rs";
	ls_sql+=" ,sum(yy_scbkh_byjh) a,sum(yy_scbkh_bylj) b,sum(yy_scbkh_szjh) c,sum(yy_scbkh_szwc) d,sum(yy_scbkh_bzyj) e,sum(yy_scbdj_byjh) f,sum(yy_scbdj_bylj) g,sum(yy_scbdj_szjh) h,sum(yy_scbdj_szwc) i,sum(yy_scbdj_bzjh) j"; 
	ls_sql+=" from yy_scb,sq_dwxx ";
	ls_sql+=" where yy_scb.ssbm=sq_dwxx.dwbh(+) ";
	ls_sql+=" and yy_scb.ssfgs='"+ssfgs+"'";
	ls_sql+=" and yy_scb.zqs="+zqs;
	ls_sql+=" group by yy_scb.ssbm,dwmc";
	ls_sql+=" order by yy_scb.ssbm";
    ps = conn.prepareStatement(ls_sql);
    rs =ps.executeQuery();
	while(rs.next())
	{
		dwbh=rs.getString("ssbm");	
		dwmc=rs.getString("dwmc");	
		sl=rs.getInt("rs");
	
		a=rs.getDouble("a");
		b=rs.getDouble("b");
		c=rs.getDouble("c");
		d=rs.getDouble("d");
		ee=rs.getDouble("e");
		f=rs.getDouble("f");
		g=rs.getDouble("g");
		h=rs.getDouble("h");
		i=rs.getDouble("i");
		j=rs.getDouble("j");


		xjsl+=sl;
		xja+=a;
		xjb+=b;
		xjc+=c;
		xjd+=d;
		xjee+=ee;
		xjf+=f;
		xjg+=g;
		xjh+=h;
		xji+=i;
		xjj+=j;


		zjsl+=sl;
		zja+=a;
		zjb+=b;
		zjc+=c;
		zjd+=d;
		zjee+=ee;
		zjf+=f;
		zjg+=g;
		zjh+=h;
		zji+=i;
		zjj+=j;


		if(yy_sjscb_mbkh==0 || b==0)
		{
			a1=0;//本月达成率
		}
		else
		{
			a1=b*100.0/yy_sjscb_mbkh;
		}

		if(b==0 || sl==0)
		{
			a2=0;//本月人均邀约数
		}
		else
		{
			a2=b/sl;
		}

		if(g==0 || yy_sjscb_sqdj==0)
		{
			a3=0;//本月达成率
		}
		else
		{
			a3=g*100.0/yy_sjscb_sqdj;
		}

		if(g==0 || sl==0)
		{
			a4=0;//本月定金成功率
		}
		else
		{
			a4=g*100.0/sl;
		}


		%>
		<tr align="center">
			<td><%=dwmc%></td>
			<td><%=sl%></td>

			<td><%=a%></td>
			<td><%=yy_sjscb_mbkh%></td>
			<td><%=b%></td>
			<td><%=cf.formatDouble(a1)%></td>
			<td><%=cf.formatDouble(a2)%></td>
			<td><%=c%></td>
			<td><%=d%></td>
			<td><%=ee%></td>

			<td><%=f%></td>
			<td><%=yy_sjscb_sqdj%></td>
			<td><%=g%></td>
			<td><%=cf.formatDouble(a3)%></td>
			<td><%=cf.formatDouble(a4)%></td>
			<td><%=h%></td>
			<td><%=i%></td>
			<td><%=j%></td>
		</tr>
		<%
     
	}
	rs.close();
	ps.close();


	if(yy_sjscb_mbkh==0 || xjb==0)
	{
		a1=0;//本月达成率
	}
	else
	{
		a1=xjb*100.0/yy_sjscb_mbkh;
	}

	if(xjb==0 || xjsl==0)
	{
		a2=0;//本月人均邀约数
	}
	else
	{
		a2=xjb/xjsl;
	}

	if(xjg==0 || yy_sjscb_sqdj==0)
	{
		a3=0;//本月达成率
	}
	else
	{
		a3=xjg*100.0/yy_sjscb_sqdj;
	}

	if(xjg==0 || xjsl==0)
	{
		a4=0;//本月定金成功率
	}
	else
	{
		a4=xjg*100.0/xjsl;
	}
%>
<tr align="center">
	<td>小计</td>
	<td><%=xjsl%></td>

	<td><%=xja%></td>
	<td><%=yy_sjscb_mbkh%></td>
	<td><%=xjb%></td>
	<td><%=cf.formatDouble(a1)%></td>
	<td><%=cf.formatDouble(a2)%></td>
	<td><%=xjc%></td>
	<td><%=xjd%></td>
	<td><%=xjee%></td>

	<td><%=xjf%></td>
	<td><%=yy_sjscb_sqdj%></td>
	<td><%=xjg%></td>
	<td><%=cf.formatDouble(a3)%></td>
	<td><%=cf.formatDouble(a4)%></td>
	<td><%=xjh%></td>
	<td><%=xji%></td>
	<td><%=xjj%></td>
</tr>
</table>

	
	

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">

<tr height=28 bgcolor="#CCCCCC"  align="center" >
	<td width="10%" rowspan=2 >网销部</td>
	<td width="5%" rowspan=2 >网销专员人数</td>
	<td colspan="8">目标客户数量</td>
	<td colspan="8" >收取定金数量</td>
 </tr>
 <tr bgcolor="#CCCCCC" align="center">
  <td  width="5%" >本月计划(分公司自定)</td>
  <td  width="5%" >本月计划(集团要求)</td>
  <td  width="5%" >本月累计</td>
  <td  width="5%" >本月达成率</td>
  <td  width="5%" >本月人均邀约数</td>
  <td  width="5%" >上周计划</td>
  <td  width="5%">上周完成</td>
  <td  width="5%" >本周预计</td>

  <td  width="5%" >本月计划(分公司自定)</td>
  <td  width="5%" >本月计划(集团要求)</td>
  <td  width="5%" >本月累计</td>
  <td  width="5%" >本月达成率</td>
  <td  width="5%" >本月定金成功率</td>
  <td  width="5%" >上周计划</td>
  <td  width="5%" >上周完成</td>
  <td  width="5%" >本周预计</td>
 </tr>
 <tr>
  <%
	double yy_sjwxb_mbkh=0;	
	double yy_sjwxb_sqdj=0;	
	ls_sql="select yy_sjwxb_mbkh,yy_sjwxb_sqdj"; 
	ls_sql+=" from YY_SJ ";
	ls_sql+=" where yy_sj_fgs='"+ssfgs+"'";
	ls_sql+=" and zqs="+zqs;
	ps = conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		yy_sjwxb_mbkh=rs.getInt("yy_sjwxb_mbkh");
		yy_sjwxb_sqdj=rs.getInt("yy_sjwxb_sqdj");
	}
	rs.close();
	ps.close();

	xjsl=0;
	xja=0;
	xjb=0;
	xjc=0;
	xjd=0;
	xjee=0;
	xjf=0;
	xjg=0;
	xjh=0;
	xji=0;
	xjj=0;

	ls_sql="select yy_wxb.ssbm,dwmc,count(*) rs";
	ls_sql+=" ,sum(yy_wxbkh_byjh) a,sum(yy_wxbkh_bylj) b,sum(yy_wxbkh_szjh) c,sum(yy_wxbkh_szwc) d,sum(yy_wxbkh_bzyj) e,sum(yy_wxbdj_byjh) f,sum(yy_wxbdj_bylj) g,sum(yy_wxbdj_szjh) h,sum(yy_wxbdj_szwc) i,sum(yy_wxbdj_bzjh) j"; 
	ls_sql+=" from yy_wxb,sq_dwxx ";
	ls_sql+=" where yy_wxb.ssbm=sq_dwxx.dwbh(+) ";
	ls_sql+=" and yy_wxb.ssfgs='"+ssfgs+"'";
	ls_sql+=" and yy_wxb.zqs="+zqs;
	ls_sql+=" group by yy_wxb.ssbm,dwmc";
	ls_sql+=" order by yy_wxb.ssbm";
    ps = conn.prepareStatement(ls_sql);
    rs =ps.executeQuery();
	while(rs.next())
	{
		dwbh=rs.getString("ssbm");	
		dwmc=rs.getString("dwmc");	
		sl=rs.getInt("rs");
	
		a=rs.getDouble("a");
		b=rs.getDouble("b");
		c=rs.getDouble("c");
		d=rs.getDouble("d");
		ee=rs.getDouble("e");
		f=rs.getDouble("f");
		g=rs.getDouble("g");
		h=rs.getDouble("h");
		i=rs.getDouble("i");
		j=rs.getDouble("j");


		xjsl+=sl;
		xja+=a;
		xjb+=b;
		xjc+=c;
		xjd+=d;
		xjee+=ee;
		xjf+=f;
		xjg+=g;
		xjh+=h;
		xji+=i;
		xjj+=j;


		zjsl+=sl;
		zja+=a;
		zjb+=b;
		zjc+=c;
		zjd+=d;
		zjee+=ee;
		zjf+=f;
		zjg+=g;
		zjh+=h;
		zji+=i;
		zjj+=j;


		if(yy_sjwxb_mbkh==0 || b==0)
		{
			a1=0;//本月达成率
		}
		else
		{
			a1=b*100.0/yy_sjwxb_mbkh;
		}

		if(b==0 || sl==0)
		{
			a2=0;//本月人均邀约数
		}
		else
		{
			a2=b/sl;
		}

		if(g==0 || yy_sjwxb_sqdj==0)
		{
			a3=0;//本月达成率
		}
		else
		{
			a3=g*100.0/yy_sjwxb_sqdj;
		}

		if(g==0 || sl==0)
		{
			a4=0;//本月定金成功率
		}
		else
		{
			a4=g*100.0/sl;
		}


		%>
		<tr align="center">
			<td><%=dwmc%></td>
			<td><%=sl%></td>

			<td><%=a%></td>
			<td><%=yy_sjwxb_mbkh%></td>
			<td><%=b%></td>
			<td><%=cf.formatDouble(a1)%></td>
			<td><%=cf.formatDouble(a2)%></td>
			<td><%=c%></td>
			<td><%=d%></td>
			<td><%=ee%></td>

			<td><%=f%></td>
			<td><%=yy_sjwxb_sqdj%></td>
			<td><%=g%></td>
			<td><%=cf.formatDouble(a3)%></td>
			<td><%=cf.formatDouble(a4)%></td>
			<td><%=h%></td>
			<td><%=i%></td>
			<td><%=j%></td>
		</tr>
		<%
     
	}
	rs.close();
	ps.close();


	if(yy_sjwxb_mbkh==0 || xjb==0)
	{
		a1=0;//本月达成率
	}
	else
	{
		a1=xjb*100.0/yy_sjwxb_mbkh;
	}

	if(xjb==0 || xjsl==0)
	{
		a2=0;//本月人均邀约数
	}
	else
	{
		a2=xjb/xjsl;
	}

	if(xjg==0 || yy_sjwxb_sqdj==0)
	{
		a3=0;//本月达成率
	}
	else
	{
		a3=xjg*100.0/yy_sjwxb_sqdj;
	}

	if(xjg==0 || xjsl==0)
	{
		a4=0;//本月定金成功率
	}
	else
	{
		a4=xjg*100.0/xjsl;
	}
%>
<tr align="center">
	<td>小计</td>
	<td><%=xjsl%></td>

	<td><%=xja%></td>
	<td><%=yy_sjwxb_mbkh%></td>
	<td><%=xjb%></td>
	<td><%=cf.formatDouble(a1)%></td>
	<td><%=cf.formatDouble(a2)%></td>
	<td><%=xjc%></td>
	<td><%=xjd%></td>
	<td><%=xjee%></td>

	<td><%=xjf%></td>
	<td><%=yy_sjwxb_sqdj%></td>
	<td><%=xjg%></td>
	<td><%=cf.formatDouble(a3)%></td>
	<td><%=cf.formatDouble(a4)%></td>
	<td><%=xjh%></td>
	<td><%=xji%></td>
	<td><%=xjj%></td>
</tr>
</table>

	

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">

<tr height=28 bgcolor="#CCCCCC"  align="center" >
	<td width="10%" rowspan=2 >其他渠道</td>
	<td width="5%" rowspan=2 >&nbsp;</td>
	<td colspan="8">目标客户数量</td>
	<td colspan="8" >收取定金数量</td>
 </tr>
 <tr bgcolor="#CCCCCC" align="center">
  <td  width="5%" >本月计划(分公司自定)</td>
  <td  width="5%" >本月计划(集团要求)</td>
  <td  width="5%" >本月累计</td>
  <td  width="5%" >本月达成率</td>
  <td  width="5%" >本月人均邀约数</td>
  <td  width="5%" >上周计划</td>
  <td  width="5%">上周完成</td>
  <td  width="5%" >本周预计</td>

  <td  width="5%" >本月计划(分公司自定)</td>
  <td  width="5%" >本月计划(集团要求)</td>
  <td  width="5%" >本月累计</td>
  <td  width="5%" >本月达成率</td>
  <td  width="5%" >本月定金成功率</td>
  <td  width="5%" >上周计划</td>
  <td  width="5%" >上周完成</td>
  <td  width="5%" >本周预计</td>
 </tr>
 <tr>
  <%
	double yy_sjqtqd_mbkh=0;	
	double yy_sjqtqd_sqdj=0;	
	ls_sql="select yy_sjqtqd_mbkh,yy_sjqtqd_sqdj"; 
	ls_sql+=" from YY_SJ ";
	ls_sql+=" where yy_sj_fgs='"+ssfgs+"'";
	ls_sql+=" and zqs="+zqs;
	ps = conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		yy_sjqtqd_mbkh=rs.getInt("yy_sjqtqd_mbkh");
		yy_sjqtqd_sqdj=rs.getInt("yy_sjqtqd_sqdj");
	}
	rs.close();
	ps.close();

	xjsl=0;
	xja=0;
	xjb=0;
	xjc=0;
	xjd=0;
	xjee=0;
	xjf=0;
	xjg=0;
	xjh=0;
	xji=0;
	xjj=0;

	ls_sql="select sum(yy_qtqdkh_byjh) a,sum(yy_qtqdkh_bylj) b,sum(yy_qtqdkh_szjh) c,sum(yy_qtqdkh_szwc) d,sum(yy_qtqdkh_bzyj) e,sum(yy_qtqddj_byjh) f,sum(yy_qtqddj_bylj) g,sum(yy_qtqddj_szjh) h,sum(yy_qtqddj_szwc) i,sum(yy_qtqddj_bzyj) j"; 
	ls_sql+=" from yy_qtqd ";
	ls_sql+=" where yy_qtqd.ssfgs='"+ssfgs+"'";
	ls_sql+=" and yy_qtqd.zqs="+zqs;
    ps = conn.prepareStatement(ls_sql);
    rs =ps.executeQuery();
	while(rs.next())
	{
		a=rs.getDouble("a");
		b=rs.getDouble("b");
		c=rs.getDouble("c");
		d=rs.getDouble("d");
		ee=rs.getDouble("e");
		f=rs.getDouble("f");
		g=rs.getDouble("g");
		h=rs.getDouble("h");
		i=rs.getDouble("i");
		j=rs.getDouble("j");


		xja+=a;
		xjb+=b;
		xjc+=c;
		xjd+=d;
		xjee+=ee;
		xjf+=f;
		xjg+=g;
		xjh+=h;
		xji+=i;
		xjj+=j;


		zja+=a;
		zjb+=b;
		zjc+=c;
		zjd+=d;
		zjee+=ee;
		zjf+=f;
		zjg+=g;
		zjh+=h;
		zji+=i;
		zjj+=j;


		if(yy_sjqtqd_mbkh==0 || b==0)
		{
			a1=0;//本月达成率
		}
		else
		{
			a1=b*100.0/yy_sjqtqd_mbkh;
		}

		if(b==0 || sl==0)
		{
			a2=0;//本月人均邀约数
		}
		else
		{
			a2=b/sl;
		}

		if(g==0 || yy_sjqtqd_sqdj==0)
		{
			a3=0;//本月达成率
		}
		else
		{
			a3=g*100.0/yy_sjqtqd_sqdj;
		}

		if(g==0 || sl==0)
		{
			a4=0;//本月定金成功率
		}
		else
		{
			a4=g*100.0/sl;
		}


		%>
		<tr align="center">
			<td>&nbsp;</td>
			<td>&nbsp;</td>

			<td><%=a%></td>
			<td><%=yy_sjqtqd_mbkh%></td>
			<td><%=b%></td>
			<td><%=cf.formatDouble(a1)%></td>
			<td><%=cf.formatDouble(a2)%></td>
			<td><%=c%></td>
			<td><%=d%></td>
			<td><%=ee%></td>

			<td><%=f%></td>
			<td><%=yy_sjqtqd_sqdj%></td>
			<td><%=g%></td>
			<td><%=cf.formatDouble(a3)%></td>
			<td><%=cf.formatDouble(a4)%></td>
			<td><%=h%></td>
			<td><%=i%></td>
			<td><%=j%></td>
		</tr>
		<%
     
	}
	rs.close();
	ps.close();


	if((yy_sjscb_mbkh+yy_sjscb_mbkh+yy_sjwxb_mbkh)==0 || zjb==0)
	{
		a1=0;//本月达成率
	}
	else
	{
		a1=zjb*100.0/(yy_sjscb_mbkh+yy_sjscb_mbkh+yy_sjwxb_mbkh);
	}

	if(zjb==0 || zjsl==0)
	{
		a2=0;//本月人均邀约数
	}
	else
	{
		a2=zjb/zjsl;
	}

	if(zjg==0 || (yy_sjscb_sqdj+yy_sjqtqd_sqdj+yy_sjwxb_sqdj)==0)
	{
		a3=0;//本月达成率
	}
	else
	{
		a3=zjg*100.0/(yy_sjscb_sqdj+yy_sjqtqd_sqdj+yy_sjwxb_sqdj);
	}

	if(zjg==0 || zjsl==0)
	{
		a4=0;//本月定金成功率
	}
	else
	{
		a4=zjg*100.0/zjsl;
	}
%>


<tr align="center">
	<td>三部门合计</td>
	<td><%=zjsl%></td>

	<td><%=zja%></td>
	<td><%=yy_sjwxb_mbkh%></td>
	<td><%=zjb%></td>
	<td><%=cf.formatDouble(a1)%></td>
	<td><%=cf.formatDouble(a2)%></td>
	<td><%=zjc%></td>
	<td><%=zjd%></td>
	<td><%=zjee%></td>

	<td><%=zjf%></td>
	<td><%=yy_sjwxb_sqdj%></td>
	<td><%=zjg%></td>
	<td><%=cf.formatDouble(a3)%></td>
	<td><%=cf.formatDouble(a4)%></td>
	<td><%=zjh%></td>
	<td><%=zji%></td>
	<td><%=zjj%></td>
</tr>
</table>
	
<table width="250%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">

<tr height=28 bgcolor="#CCCCCC"  align="center" >
	<td width="4%" rowspan=2 >设计部</td>
	<td width="2%" rowspan=2 >设计师人数</td>
	<td colspan="10">收取定金情况</td>
	<td colspan="9" >设计费</td>
	<td colspan="8" >工程产值</td>
	<td colspan="8" >主材产值</td>
 </tr>
 <tr bgcolor="#CCCCCC" align="center">
	<td  width="170px">上月储备</td>
	<td  width="170px">本月计划</td>
	<td  width="170px">本月累计</td>
	<td  width="170px">本月达成率</td>
	<td  width="170px">本月人均定金数量</td>
	<td  width="170px">上周计划</td>
	<td  width="170px">上周完成</td>
	<td  width="170px">本周预计</td>
	<td  width="170px">本周退定金</td>
	<td  width="170px">本月累计退定金</td>

	<td  width="170px">本月计划(分公司自定)</td>
	<td  width="170px">本月计划(集团要求)</td>
	<td  width="170px">本月累计</td>
	<td  width="170px">本月达成率</td>
	<td  width="170px">本月人均设计费</td>
	<td  width="170px">本月设计/工程占比</td>
	<td  width="170px">上周计划</td>
	<td  width="170px">上周完成</td>
	<td  width="170px">本周预计</td>

	<td  width="170px">本月计划(分公司自定)</td>
	<td  width="170px">本月计划(集团要求)</td>
	<td  width="170px">本月累计</td>
	<td  width="170px">本月达成率</td>
	<td  width="170px">本月人均</td>
	<td  width="170px">上周计划</td>
	<td  width="170px">上周完成</td>
	<td  width="170px">本周预计</td>

	<td  width="170px">本月计划</td>
	<td  width="170px">本月累计</td>
	<td  width="170px">本月达成率</td>
	<td  width="170px">本月人均</td>
	<td  width="170px">本月主材/工程占比</td>
	<td  width="170px">上周计划</td>
	<td  width="170px">上周完成</td>
	<td  width="170px">本月预计</td>
 </tr>
 <tr>
  <%
	double yy_sjsjb_sjf=0;	
	double yy_sjsjb_tqsjf=0;	
	double yy_sjsjb_gccz=0;	
	double yy_sjsjb_tqgccz=0;	
	ls_sql="select yy_sjsjb_sjf,yy_sjsjb_tqsjf ,yy_sjsjb_gccz,yy_sjsjb_tqgccz"; 
	ls_sql+=" from YY_SJ ";
	ls_sql+=" where yy_sj_fgs='"+ssfgs+"'";
	ls_sql+=" and zqs="+zqs;
	ps = conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		yy_sjsjb_sjf=rs.getDouble("yy_sjsjb_sjf");
		yy_sjsjb_tqsjf=rs.getDouble("yy_sjsjb_tqsjf");
		yy_sjsjb_gccz=rs.getDouble("yy_sjsjb_gccz");
		yy_sjsjb_tqgccz=rs.getDouble("yy_sjsjb_tqgccz");
	}
	rs.close();
	ps.close();


	double c1=0;
	double c2=0;
	double c3=0;
	double c4=0;
	double c5=0;
	double c6=0;
	double c7=0;
	double c8=0;
	double c9=0;
	double c10=0;
	double c11=0;
	double c12=0;
	double c13=0;
	double c14=0;
	double c15=0;
	double c16=0;
	double c17=0;
	double c18=0;
	double c19=0;
	double c20=0;
	double c21=0;
	double c22=0;
	double c23=0;

	double xjc1=0;
	double xjc2=0;
	double xjc3=0;
	double xjc4=0;
	double xjc5=0;
	double xjc6=0;
	double xjc7=0;
	double xjc8=0;
	double xjc9=0;
	double xjc10=0;
	double xjc11=0;
	double xjc12=0;
	double xjc13=0;
	double xjc14=0;
	double xjc15=0;
	double xjc16=0;
	double xjc17=0;
	double xjc18=0;
	double xjc19=0;
	double xjc20=0;
	double xjc21=0;
	double xjc22=0;
	double xjc23=0;

	ls_sql="select yy_sjb.ssbm,dwmc,count(*) rs";
	ls_sql+=" ,sum(yy_sjb.yy_sjbdj_sydjcb),sum(yy_sjb.yy_sjbdj_byjh),sum(yy_sjb.yy_sjbdj_bylj),sum(yy_sjb.yy_sjbdj_szjh),sum(yy_sjb.yy_sjbdj_szwc),sum(yy_sjb.yy_sjbdj_bzyj),sum(yy_sjb.yy_sjbdj_bztdj),sum(yy_sjb.yy_sjbdj_byljtdj),sum(yy_sjb.yy_sjbsjf_byjh),sum(yy_sjb.yy_sjbsjf_bylj),sum(yy_sjb.yy_sjbsjf_szjh),sum(yy_sjb.yy_sjbsjf_szwc),sum(yy_sjb.yy_sjbsjf_bzyj),sum(yy_sjb.yy_sjbgccz_byjh),sum(yy_sjb.yy_sjbgccz_bylj),sum(yy_sjb.yy_sjbgccz_szjh),sum(yy_sjb.yy_sjbgccz_szwc),sum(yy_sjb.yy_sjbgccz_bzyj),sum(yy_sjb.yy_sjbzccz_byjh),sum(yy_sjb.yy_sjbzccz_bylj),sum(yy_sjb.yy_sjbzccz_szjh),sum(yy_sjb.yy_sjbzccz_szwc),sum(yy_sjb.yy_sjbzccz_bzyj)  ";
	ls_sql+=" from yy_sjb,sq_dwxx ";
	ls_sql+=" where yy_sjb.ssbm=sq_dwxx.dwbh(+) ";
	ls_sql+=" and yy_sjb.ssfgs='"+ssfgs+"'";
	ls_sql+=" and yy_sjb.zqs="+zqs;
	ls_sql+=" group by yy_sjb.ssbm,dwmc";
	ls_sql+=" order by yy_sjb.ssbm";
    ps = conn.prepareStatement(ls_sql);
    rs =ps.executeQuery();
	while(rs.next())
	{
		dwbh=rs.getString("ssbm");	
		dwmc=rs.getString("dwmc");	
		sl=rs.getInt("rs");
	
		c1=rs.getDouble(3);
		c2=rs.getDouble(4);
		c3=rs.getDouble(5);
		c4=rs.getDouble(6);
		c5=rs.getDouble(7);
		c6=rs.getDouble(8);
		c7=rs.getDouble(9);
		c8=rs.getDouble(10);
		c9=rs.getDouble(11);
		c10=rs.getDouble(12);
		c11=rs.getDouble(13);
		c12=rs.getDouble(14);
		c13=rs.getDouble(15);
		c14=rs.getDouble(16);
		c15=rs.getDouble(17);
		c16=rs.getDouble(18);
		c17=rs.getDouble(19);
		c18=rs.getDouble(20);
		c19=rs.getDouble(21);
		c20=rs.getDouble(22);
		c21=rs.getDouble(23);
		c22=rs.getDouble(24);
		c23=rs.getDouble(25);


		xjc1+=c1;
		xjc2+=c2;
		xjc3+=c3;
		xjc4+=c4;
		xjc5+=c5;
		xjc6+=c6;
		xjc7+=c7;
		xjc8+=c8;
		xjc9+=c9;
		xjc10+=c10;
		xjc11+=c11;
		xjc12+=c12;
		xjc13+=c13;
		xjc14+=c14;
		xjc15+=c15;
		xjc16+=c16;
		xjc17+=c17;
		xjc18+=c18;
		xjc19+=c19;
		xjc20+=c20;
		xjc21+=c21;
		xjc22+=c22;
		xjc23+=c23;

		double djdcl=0;//定金本月达成率
		double djrj=0;//本月人均定金数量

		if(c2==0)
		{
			djdcl=0;//本月达成率
		}
		else
		{
			djdcl=c3*100.0/c2;
		}

		if(c1==0)
		{
			djrj=0;//本月人均定金数量
		}
		else
		{
			djrj=c3/c1;
		}

		double sjfdcl=0;//设计费本月达成率
		double sjfrj=0;//本月人均设计费
		double sjgczb=0;//本月设计/工程占比

		if(yy_sjsjb_sjf==0)
		{
			sjfdcl=0;//本月达成率
		}
		else
		{
			sjfdcl=c3*100.0/yy_sjsjb_sjf;
		}

		if(c1==0)
		{
			sjfrj=0;//本月人均
		}
		else
		{
			sjfrj=c10/c1;
		}

		if(c15==0)
		{
			sjgczb=0;
		}
		else
		{
			sjgczb=c10*100.0/c15;
		}


		double gcdcl=0;//工程本月达成率
		double gcrj=0;//本月人均工程

		if(yy_sjsjb_gccz==0)
		{
			gcdcl=0;//本月达成率
		}
		else
		{
			gcdcl=c15*100.0/yy_sjsjb_gccz;
		}

		if(c1==0)
		{
			gcrj=0;//本月人均
		}
		else
		{
			gcrj=c15/c1;
		}


		double zcdcl=0;//主材本月达成率
		double zcrj=0;//本月人均主材
		double zcgczb=0;//本月主材/工程占比

		if(c19==0)
		{
			zcdcl=0;//本月达成率
		}
		else
		{
			zcdcl=c20*100.0/c19;
		}

		if(c1==0)
		{
			zcrj=0;//本月人均
		}
		else
		{
			zcrj=c20/c1;
		}

		if(c15==0)
		{
			zcgczb=0;
		}
		else
		{
			zcgczb=c20*100.0/c15;
		}
		%>
		<tr align="center">
			<td><%=dwmc%></td>
			<td><%=sl%></td>

			<td><%=c1%></td>
			<td><%=c2%></td>
			<td><%=c3%></td>
			<td><%=djdcl%>%</td>
			<td><%=djrj%></td>
			<td><%=c4%></td>
			<td><%=c5%></td>
			<td><%=c6%></td>
			<td><%=c7%></td>
			<td><%=c8%></td>

			<td><%=c9%></td>
			<td><%=yy_sjsjb_sjf%></td>
			<td><%=c10%></td>
			<td><%=sjfdcl%></td>
			<td><%=sjfrj%></td>
			<td><%=sjgczb%></td>
			<td><%=c11%></td>
			<td><%=c12%></td>
			<td><%=c13%></td>

			<td><%=c14%></td>
			<td><%=yy_sjsjb_gccz%></td>
			<td><%=gcdcl%></td>
			<td><%=gcrj%></td>
			<td><%=c15%></td>
			<td><%=c16%></td>
			<td><%=c17%></td>
			<td><%=c18%></td>

			<td><%=c19%></td>
			<td><%=c20%></td>
			<td><%=zcdcl%></td>
			<td><%=zcrj%></td>
			<td><%=zcgczb%></td>
			<td><%=c21%></td>
			<td><%=c22%></td>
			<td><%=c23%></td>

		</tr>
		<%
     
	}
	rs.close();
	ps.close();


	double djdcl=0;//定金本月达成率
	double djrj=0;//本月人均定金数量

	if(xjc2==0)
	{
		djdcl=0;//本月达成率
	}
	else
	{
		djdcl=xjc3*100.0/xjc2;
	}

	if(xjc1==0)
	{
		djrj=0;//本月人均定金数量
	}
	else
	{
		djrj=xjc3/xjc1;
	}

	double sjfdcl=0;//设计费本月达成率
	double sjfrj=0;//本月人均设计费
	double sjgczb=0;//本月设计/工程占比

	if(yy_sjsjb_sjf==0)
	{
		sjfdcl=0;//本月达成率
	}
	else
	{
		sjfdcl=xjc3*100.0/yy_sjsjb_sjf;
	}

	if(xjc1==0)
	{
		sjfrj=0;//本月人均
	}
	else
	{
		sjfrj=xjc10/xjc1;
	}

	if(xjc15==0)
	{
		sjgczb=0;
	}
	else
	{
		sjgczb=xjc10*100.0/xjc15;
	}


	double gcdcl=0;//工程本月达成率
	double gcrj=0;//本月人均工程

	if(yy_sjsjb_gccz==0)
	{
		gcdcl=0;//本月达成率
	}
	else
	{
		gcdcl=xjc15*100.0/yy_sjsjb_gccz;
	}

	if(xjc1==0)
	{
		gcrj=0;//本月人均
	}
	else
	{
		gcrj=xjc15/xjc1;
	}


	double zcdcl=0;//主材本月达成率
	double zcrj=0;//本月人均主材
	double zcgczb=0;//本月主材/工程占比

	if(xjc19==0)
	{
		zcdcl=0;//本月达成率
	}
	else
	{
		zcdcl=xjc20*100.0/xjc19;
	}

	if(xjc1==0)
	{
		zcrj=0;//本月人均
	}
	else
	{
		zcrj=c20/xjc1;
	}

	if(xjc15==0)
	{
		zcgczb=0;
	}
	else
	{
		zcgczb=xjc20*100.0/xjc15;
	}
%>
<tr align="center">
	<td>小计</td>
	<td><%=xjsl%></td>


	<td><%=xjc1%></td>
	<td><%=xjc2%></td>
	<td><%=xjc3%></td>
	<td><%=djdcl%>%</td>
	<td><%=djrj%></td>
	<td><%=xjc4%></td>
	<td><%=xjc5%></td>
	<td><%=xjc6%></td>
	<td><%=xjc7%></td>
	<td><%=xjc8%></td>

	<td><%=xjc9%></td>
	<td><%=yy_sjsjb_sjf%></td>
	<td><%=xjc10%></td>
	<td><%=sjfdcl%></td>
	<td><%=sjfrj%></td>
	<td><%=sjgczb%></td>
	<td><%=xjc11%></td>
	<td><%=xjc12%></td>
	<td><%=xjc13%></td>

	<td><%=xjc14%></td>
	<td><%=yy_sjsjb_gccz%></td>
	<td><%=gcdcl%></td>
	<td><%=gcrj%></td>
	<td><%=xjc15%></td>
	<td><%=xjc16%></td>
	<td><%=xjc17%></td>
	<td><%=xjc18%></td>

	<td><%=xjc19%></td>
	<td><%=xjc20%></td>
	<td><%=zcdcl%></td>
	<td><%=zcrj%></td>
	<td><%=zcgczb%></td>
	<td><%=xjc21%></td>
	<td><%=xjc22%></td>
	<td><%=xjc23%></td>

</tr>

</table>

	
	

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">

<tr height=28 bgcolor="#CCCCCC"  align="center" >
	<td width="10%" >家居部</td>
	<td width="5%" >家居顾问人数</td>
	<td  width="8%">去年同期月度主材产值</td>
	<td  width="8%">本月计划(分公司自定)</td>
	<td  width="8%">本月计划(集团要求)</td>
	<td  width="8%">本月累计</td>
	<td  width="8%">本月达成率</td>
	<td  width="8%">所属店面本月累计工程产值</td>
	<td  width="8%">本月主材/工程占比</td>
	<td  width="8%">上周计划</td>
	<td  width="8%">上周完成</td>
	<td  width="8%">本周预计</td>
 </tr>

 <tr>
  <%
	double yy_sjjjb_byjh=0;	
	double yy_sjjjb_qntq=0;	
	ls_sql="select yy_sjjjb_byjh,yy_sjjjb_qntq"; 
	ls_sql+=" from YY_SJ ";
	ls_sql+=" where yy_sj_fgs='"+ssfgs+"'";
	ls_sql+=" and zqs="+zqs;
	ps = conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		yy_sjjjb_byjh=rs.getInt("yy_sjjjb_byjh");
		yy_sjjjb_qntq=rs.getInt("yy_sjjjb_qntq");
	}
	rs.close();
	ps.close();

	xjsl=0;
	xja=0;
	xjb=0;
	xjc=0;
	xjd=0;
	xjee=0;
	xjf=0;
	xjg=0;
	xjh=0;
	xji=0;
	xjj=0;

	ls_sql="select yy_jjb.ssbm,dwmc,count(*) rs";
	ls_sql+=" ,sum(yy_jjb.yy_jjbqntq),sum(yy_jjb.yy_jjbbyjh),sum(yy_jjb.yy_jjbylj),sum(yy_jjb.yy_jjbdmbylj),sum(yy_jjb.yy_jjbszjh),sum(yy_jjb.yy_jjbszwc),sum(yy_jjb.yy_jjbbzyj) ";
	ls_sql+=" from yy_jjb,sq_dwxx ";
	ls_sql+=" where yy_jjb.ssbm=sq_dwxx.dwbh(+) ";
	ls_sql+=" and yy_jjb.ssfgs='"+ssfgs+"'";
	ls_sql+=" and yy_jjb.zqs="+zqs;
	ls_sql+=" group by yy_jjb.ssbm,dwmc";
	ls_sql+=" order by yy_jjb.ssbm";
    ps = conn.prepareStatement(ls_sql);
    rs =ps.executeQuery();
	while(rs.next())
	{
		dwbh=rs.getString("ssbm");	
		dwmc=rs.getString("dwmc");	
		sl=rs.getInt("rs");
	
		c1=rs.getDouble(3);
		c2=rs.getDouble(4);
		c3=rs.getDouble(5);
		c4=rs.getDouble(6);
		c5=rs.getDouble(7);
		c6=rs.getDouble(8);
		c7=rs.getDouble(9);


		xjc1+=c1;
		xjc2+=c2;
		xjc3+=c3;
		xjc4+=c4;
		xjc5+=c5;
		xjc6+=c6;
		xjc7+=c7;


		double jjdcl=0;//家居部本月达成率
		double jjgczb=0;//本月主材/工程占比

		if(yy_sjjjb_byjh==0)
		{
			jjdcl=0;//本月达成率
		}
		else
		{
			jjdcl=c3*100.0/yy_sjjjb_byjh;
		}

		if(c4==0)
		{
			jjgczb=0;
		}
		else
		{
			jjgczb=c3*100.0/c4;
		}


		%>
		<tr align="center">
			<td><%=dwmc%></td>
			<td><%=sl%></td>

			<td><%=c1%></td>
			<td><%=c2%></td>
			<td><%=yy_sjjjb_byjh%></td>
			<td><%=c3%></td>
			<td><%=jjdcl%>%</td>

			<td><%=c4%></td>
			<td><%=jjgczb%>%</td>
			<td><%=c5%></td>
			<td><%=c6%></td>
			<td><%=c7%></td>
		</tr>
		<%
     
	}
	rs.close();
	ps.close();


	double jjdcl=0;//家居部本月达成率
	double jjgczb=0;//本月主材/工程占比

	if(yy_sjjjb_byjh==0)
	{
		jjdcl=0;//本月达成率
	}
	else
	{
		jjdcl=xjc3*100.0/yy_sjjjb_byjh;
	}

	if(xjc4==0)
	{
		jjgczb=0;
	}
	else
	{
		jjgczb=xjc3*100.0/xjc4;
	}
%>
<tr align="center">
	<td>小计</td>
	<td><%=xjsl%></td>

	<td><%=xjc1%></td>
	<td><%=xjc2%></td>
	<td><%=yy_sjjjb_byjh%></td>
	<td><%=xjc3%></td>
	<td><%=jjdcl%>%</td>

	<td><%=xjc4%></td>
	<td><%=jjgczb%>%</td>
	<td><%=xjc5%></td>
	<td><%=xjc6%></td>
	<td><%=xjc7%></td>
</tr>
</table>

	
	
	
	
<%

}  
catch (Exception e) {
	out.print("Exception: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


</body>

</html>
