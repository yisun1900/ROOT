<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ls_sql=null;
String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

int all=0;
String nian=null;
String yue=null;
String tsxlbm=null;
String tsxlmc=null;
String tslxbm=null;
String tslxmc=null;

int qysl=0;
int allqysl=0;
int allydds=0;
int bxsl=0;
int bxkhsl=0;
int allbxsl=0;
int allbxkhsl=0;
int tssl=0;
int alltssl=0;
int tskhsl=0;
int alltskhsl=0;

double tsl=0;
double ztsl=0;
double bxl=0;
double zbxl=0;


String[][] xsdata=null; 

int yues=0;
int row=0;
int maxqysl=0;
int maxtskhsl=0;
double maxtsl=0;
int maxbxkhsl=0;
double maxbxl=0;

int maxydds=0;
int ydds=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();

	ls_sql=" select (TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')-TO_DATE('"+sjfw+"','YYYY-MM-DD'))/25";
	ls_sql+=" from dm_tslxbm";
	ls_sql+=" where rownum<2";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yues=rs.getInt(1);
	}
	ps.close();
	rs.close();

	xsdata=new String[yues][6];

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
<%
	tsxlbm="2302";//2302:木门问题

	//获取本期预订单数
	maxydds=0;
	row=0;
	allydds=0;
	ls_sql=" select TO_CHAR(jc_mmydd.lrsj,'YYYY'),TO_CHAR(jc_mmydd.lrsj,'MM'),count(distinct jc_mmydd.khbh)";
	ls_sql+=" from jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.khbh=crm_khxx.khbh";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(jc_mmydd.lrsj,'YYYY'),TO_CHAR(jc_mmydd.lrsj,'MM')";

	ls_sql+=" order by TO_CHAR(jc_mmydd.lrsj,'YYYY'),TO_CHAR(jc_mmydd.lrsj,'MM')";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		nian=rs.getString(1);
		yue=rs.getString(2);
		ydds=rs.getInt(3);

		if (ydds>maxydds)
		{
			maxydds=ydds;
		}

		allydds+=ydds;

		xsdata[row][0]=nian;
		xsdata[row][1]=yue;
		xsdata[row][2]=String.valueOf(ydds);
		row++;
	}
	rs.close();
	ps.close();


	%>
  <tr>
    <td> 
      <CENTER >
        <B>（家居投诉：木门问题）投诉率统计(<%=sjfw%>--<%=sjfw2%>)</B> 
      </CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="12%">时间范围</td>
          <td  width="22%">本期预订单数</td>
          <td  width="22%">本期签单数</td>
          <td  width="22%">投诉客户（人）</td>
          <td  width="22%">投诉 / 签单</td>
        </tr>

	<%
	maxqysl=0;
	allqysl=0;
	maxtskhsl=0;
	maxtsl=0;
	alltskhsl=0;
	for (int i=0;i<row ;i++ )
	{

		//获取签约数量
		qysl=0;
		ls_sql=" select count(distinct jc_mmydd.khbh)";
		ls_sql+=" from jc_mmydd,crm_khxx";
		ls_sql+=" where htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and clzt>='04' and clzt!='99'";//04：签订合同
		ls_sql+=" and jc_mmydd.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and TO_CHAR(htrq,'YYYY')='"+xsdata[i][0]+"' and TO_CHAR(htrq,'MM')='"+xsdata[i][1]+"'";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qysl=rs.getInt(1);

			if (qysl>maxqysl)
			{
				maxqysl=qysl;
			}

			allqysl+=qysl;
		}
		rs.close();
		ps.close();
		
		xsdata[i][3]=String.valueOf(qysl);
		
		ls_sql="select count(distinct crm_tsjl.khbh)";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";//1：投诉；2：报修
		ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and TO_CHAR(slsj,'YYYY')='"+xsdata[i][0]+"' and TO_CHAR(slsj,'MM')='"+xsdata[i][1]+"'";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			tskhsl=rs1.getInt(1);

			alltskhsl+=tskhsl;

			if (tskhsl>maxtskhsl)
			{
				maxtskhsl=tskhsl;
			}
		}
		rs1.close();
		ps1.close();

		if (qysl==0)
		{
			tsl=0;
		}
		else{
			tsl=tskhsl*1000/qysl/10.0;
		}

		if (tsl>maxtsl)
		{
			maxtsl=tsl;
		}

		xsdata[i][4]=tskhsl+"";
		xsdata[i][5]=tsl+"";

	}


	if (allqysl==0)
	{
		ztsl=0;
	}
	else{
		ztsl=alltskhsl*1000/allqysl/10.0;
	}

	for (int i=0;i<row ;i++ )
	{
		int a1=0;
		int a2=0;
		int a3=0;
		double a4=0;
		if (maxydds==0)
		{
			a1=0;
		}
		else{
			a1=Integer.parseInt(xsdata[i][2])*100/maxydds;
		}
		if (maxqysl==0)
		{
			a2=0;
		}
		else{
			a2=Integer.parseInt(xsdata[i][3])*100/maxqysl;
		}
		if (maxtskhsl==0)
		{
			a3=0;
		}
		else{
			a3=Integer.parseInt(xsdata[i][4])*100/maxtskhsl;
		}
		if (maxtsl==0)
		{
			a4=0;
		}
		else{
			a4=Double.parseDouble(xsdata[i][5])*100/maxtsl;
		}

		%> 
		<tr align="center"> 
		  <td><%=xsdata[i][0]%>年<%=xsdata[i][1]%>月</td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=a1%>" height="14">&nbsp;<%=xsdata[i][2]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=a2%>" height="14">&nbsp;<%=xsdata[i][3]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=a3%>" height="14">&nbsp;<%=xsdata[i][4]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=a4%>" height="14">&nbsp;<%=xsdata[i][5]%>%</td>
		</tr>
		<%
	}
	%> 
		<tr align="center" > 
		  <td>合计</td>
		  <td><%=allydds%></td>
		  <td><%=allqysl%></td>
		  <td ><%=alltskhsl%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=ztsl*100/maxtsl%>" height="14">&nbsp;<%=ztsl%>%</td>
		</tr>
	  </table>
	</td>
  </tr>
<%
	tsxlbm="2301";//2301:橱柜问题

	//获取本期预订单数
	maxydds=0;
	row=0;
	allydds=0;
	ls_sql=" select TO_CHAR(jc_cgdd.lrsj,'YYYY'),TO_CHAR(jc_cgdd.lrsj,'MM'),count(distinct jc_cgdd.khbh)";
	ls_sql+=" from jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.khbh=crm_khxx.khbh";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(jc_cgdd.lrsj,'YYYY'),TO_CHAR(jc_cgdd.lrsj,'MM')";

	ls_sql+=" order by TO_CHAR(jc_cgdd.lrsj,'YYYY'),TO_CHAR(jc_cgdd.lrsj,'MM')";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		nian=rs.getString(1);
		yue=rs.getString(2);
		ydds=rs.getInt(3);

		if (ydds>maxydds)
		{
			maxydds=ydds;
		}

		allydds+=ydds;

		xsdata[row][0]=nian;
		xsdata[row][1]=yue;
		xsdata[row][2]=String.valueOf(ydds);
		row++;
	}
	rs.close();
	ps.close();


	%>
  <tr>
    <td> 
      <CENTER >
        <B>（家居投诉：橱柜问题）投诉率统计(<%=sjfw%>--<%=sjfw2%>)</B> 
      </CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="12%">时间范围</td>
          <td  width="22%">本期预订单数</td>
          <td  width="22%">本期签单数</td>
          <td  width="22%">投诉客户（人）</td>
          <td  width="22%">投诉 / 签单</td>
        </tr>

	<%
	maxqysl=0;
	allqysl=0;
	maxtskhsl=0;
	maxtsl=0;
	alltskhsl=0;
	for (int i=0;i<row ;i++ )
	{

		//获取签约数量
		qysl=0;
		ls_sql=" select count(distinct jc_cgdd.khbh)";
		ls_sql+=" from jc_cgdd,crm_khxx";
		ls_sql+=" where qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and clzt>='05' and clzt!='99'";//05：签订合同
		ls_sql+=" and jc_cgdd.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and TO_CHAR(qhtsj,'YYYY')='"+xsdata[i][0]+"' and TO_CHAR(qhtsj,'MM')='"+xsdata[i][1]+"'";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qysl=rs.getInt(1);

			if (qysl>maxqysl)
			{
				maxqysl=qysl;
			}

			allqysl+=qysl;
		}
		rs.close();
		ps.close();
		
		xsdata[i][3]=String.valueOf(qysl);
		
		ls_sql="select count(distinct crm_tsjl.khbh)";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";//1：投诉；2：报修
		ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and TO_CHAR(slsj,'YYYY')='"+xsdata[i][0]+"' and TO_CHAR(slsj,'MM')='"+xsdata[i][1]+"'";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			tskhsl=rs1.getInt(1);

			alltskhsl+=tskhsl;

			if (tskhsl>maxtskhsl)
			{
				maxtskhsl=tskhsl;
			}
		}
		rs1.close();
		ps1.close();

		if (qysl==0)
		{
			tsl=0;
		}
		else{
			tsl=tskhsl*1000/qysl/10.0;
		}

		if (tsl>maxtsl)
		{
			maxtsl=tsl;
		}

		xsdata[i][4]=tskhsl+"";
		xsdata[i][5]=tsl+"";

	}


	if (allqysl==0)
	{
		ztsl=0;
	}
	else{
		ztsl=alltskhsl*1000/allqysl/10.0;
	}

	for (int i=0;i<row ;i++ )
	{
		%> 
		<tr align="center"> 
		  <td><%=xsdata[i][0]%>年<%=xsdata[i][1]%>月</td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][2])*100/maxydds%>" height="14">&nbsp;<%=xsdata[i][2]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][3])*100/maxqysl%>" height="14">&nbsp;<%=xsdata[i][3]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][4])*100/maxtskhsl%>" height="14">&nbsp;<%=xsdata[i][4]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Double.parseDouble(xsdata[i][5])*100/maxtsl%>" height="14">&nbsp;<%=xsdata[i][5]%>%</td>
		</tr>
		<%
	}
	%> 
		<tr align="center" > 
		  <td>合计</td>
		  <td><%=allydds%></td>
		  <td><%=allqysl%></td>
		  <td ><%=alltskhsl%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=ztsl*100/maxtsl%>" height="14">&nbsp;<%=ztsl%>%</td>
		</tr>
	  </table>
	</td>
  </tr>
<%
	tsxlbm="2303";//2303:家具问题

	//获取本期预订单数
	maxydds=0;
	row=0;
	allydds=0;
	ls_sql=" select TO_CHAR(jc_jjdd.lrsj,'YYYY'),TO_CHAR(jc_jjdd.lrsj,'MM'),count(distinct jc_jjdd.khbh)";
	ls_sql+=" from jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(jc_jjdd.lrsj,'YYYY'),TO_CHAR(jc_jjdd.lrsj,'MM')";

	ls_sql+=" order by TO_CHAR(jc_jjdd.lrsj,'YYYY'),TO_CHAR(jc_jjdd.lrsj,'MM')";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		nian=rs.getString(1);
		yue=rs.getString(2);
		ydds=rs.getInt(3);

		if (ydds>maxydds)
		{
			maxydds=ydds;
		}

		allydds+=ydds;

		xsdata[row][0]=nian;
		xsdata[row][1]=yue;
		xsdata[row][2]=String.valueOf(ydds);
		row++;
	}
	rs.close();
	ps.close();


	%>
  <tr>
    <td> 
      <CENTER >
        <B>（家居投诉：家具问题）投诉率统计(<%=sjfw%>--<%=sjfw2%>)</B> 
      </CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="12%">时间范围</td>
          <td  width="22%">本期预订单数</td>
          <td  width="22%">本期签单数</td>
          <td  width="22%">投诉客户（人）</td>
          <td  width="22%">投诉 / 签单</td>
        </tr>

	<%
	maxqysl=0;
	allqysl=0;
	maxtskhsl=0;
	maxtsl=0;
	alltskhsl=0;
	for (int i=0;i<row ;i++ )
	{

		//获取签约数量
		qysl=0;
		ls_sql=" select count(distinct jc_jjdd.khbh)";
		ls_sql+=" from jc_jjdd,crm_khxx";
		ls_sql+=" where qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and clzt>='05' and clzt!='99'";//05：签订合同
		ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and TO_CHAR(qhtsj,'YYYY')='"+xsdata[i][0]+"' and TO_CHAR(qhtsj,'MM')='"+xsdata[i][1]+"'";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qysl=rs.getInt(1);

			if (qysl>maxqysl)
			{
				maxqysl=qysl;
			}

			allqysl+=qysl;
		}
		rs.close();
		ps.close();
		
		xsdata[i][3]=String.valueOf(qysl);
		
		ls_sql="select count(distinct crm_tsjl.khbh)";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";//1：投诉；2：报修
		ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and TO_CHAR(slsj,'YYYY')='"+xsdata[i][0]+"' and TO_CHAR(slsj,'MM')='"+xsdata[i][1]+"'";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			tskhsl=rs1.getInt(1);

			alltskhsl+=tskhsl;

			if (tskhsl>maxtskhsl)
			{
				maxtskhsl=tskhsl;
			}
		}
		rs1.close();
		ps1.close();

		if (qysl==0)
		{
			tsl=0;
		}
		else{
			tsl=tskhsl*1000/qysl/10.0;
		}

		if (tsl>maxtsl)
		{
			maxtsl=tsl;
		}

		xsdata[i][4]=tskhsl+"";
		xsdata[i][5]=tsl+"";

	}


	if (allqysl==0)
	{
		ztsl=0;
	}
	else{
		ztsl=alltskhsl*1000/allqysl/10.0;
	}

	for (int i=0;i<row ;i++ )
	{
		%> 
		<tr align="center"> 
		  <td><%=xsdata[i][0]%>年<%=xsdata[i][1]%>月</td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][2])*100/maxydds%>" height="14">&nbsp;<%=xsdata[i][2]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][3])*100/maxqysl%>" height="14">&nbsp;<%=xsdata[i][3]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][4])*100/maxtskhsl%>" height="14">&nbsp;<%=xsdata[i][4]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Double.parseDouble(xsdata[i][5])*100/maxtsl%>" height="14">&nbsp;<%=xsdata[i][5]%>%</td>
		</tr>
		<%
	}
	%> 
		<tr align="center" > 
		  <td>合计</td>
		  <td><%=allydds%></td>
		  <td><%=allqysl%></td>
		  <td ><%=alltskhsl%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=ztsl*100/maxtsl%>" height="14">&nbsp;<%=ztsl%>%</td>
		</tr>
	  </table>
	</td>
  </tr>

<%
	tsxlbm="2304";//2304:外主材问题

	//获取签约数量
	maxqysl=0;
	allqysl=0;
	row=0;
	ls_sql=" select TO_CHAR(qhtsj,'YYYY'),TO_CHAR(qhtsj,'MM'),count(distinct jc_zcdd.khbh)";
	ls_sql+=" from jc_zcdd,crm_khxx";
	ls_sql+=" where qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and clzt>='01' and clzt!='99'";//01：签订合同
	ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(qhtsj,'YYYY'),TO_CHAR(qhtsj,'MM')";

	ls_sql+=" order by TO_CHAR(qhtsj,'YYYY'),TO_CHAR(qhtsj,'MM')";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		nian=rs.getString(1);
		yue=rs.getString(2);
		qysl=rs.getInt(3);

		if (qysl>maxqysl)
		{
			maxqysl=qysl;
		}

		allqysl+=qysl;

		xsdata[row][0]=nian;
		xsdata[row][1]=yue;
		xsdata[row][2]=String.valueOf(qysl);
		row++;
	}
	rs.close();
	ps.close();


	%>
  <tr>
    <td> 
      <CENTER >
        <B>（家居投诉：外主材问题）投诉率统计(<%=sjfw%>--<%=sjfw2%>)</B> 
      </CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="13%">时间范围</td>
          <td  width="29%">本期签单数</td>
          <td  width="29%">投诉客户（人）</td>
          <td  width="29%">投诉 / 签单</td>
        </tr>

	<%
	maxtskhsl=0;
	maxtsl=0;
	alltskhsl=0;
	for (int i=0;i<row ;i++ )
	{
		ls_sql="select count(distinct crm_tsjl.khbh)";
		ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";//1：投诉；2：报修
		ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and TO_CHAR(slsj,'YYYY')='"+xsdata[i][0]+"' and TO_CHAR(slsj,'MM')='"+xsdata[i][1]+"'";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			tskhsl=rs1.getInt(1);

			alltskhsl+=tskhsl;
		}
		else{
			tskhsl=0;
		}
		rs1.close();
		ps1.close();

		if (tskhsl>maxtskhsl)
		{
			maxtskhsl=tskhsl;
		}

		if (Integer.parseInt(xsdata[i][2])==0)
		{
			tsl=0;
		}
		else{
			tsl=tskhsl*1000/Integer.parseInt(xsdata[i][2])/10.0;
		}

		if (tsl>maxtsl)
		{
			maxtsl=tsl;
		}

		xsdata[i][3]=tskhsl+"";
		xsdata[i][4]=tsl+"";

	}


	if (allqysl==0)
	{
		ztsl=0;
	}
	else{
		ztsl=alltskhsl*1000/allqysl/10.0;
	}

	for (int i=0;i<row ;i++ )
	{
		%> 
		<tr align="center"> 
		  <td><%=xsdata[i][0]%>年<%=xsdata[i][1]%>月</td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][2])*150/maxqysl%>" height="14">&nbsp;<%=xsdata[i][2]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][3])*150/maxtskhsl%>" height="14">&nbsp;<%=xsdata[i][3]%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=Double.parseDouble(xsdata[i][4])*150/maxtsl%>" height="14">&nbsp;<%=xsdata[i][4]%>%</td>
		</tr>
		<%
	}
	%> 
		<tr align="center" > 
		  <td>合计</td>
		  <td><%=allqysl%></td>
		  <td ><%=alltskhsl%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=ztsl*150/maxtsl%>" height="14">&nbsp;<%=ztsl%>%</td>
		</tr>
	  </table>
	</td>
  </tr>
  <%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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
</table>
</body>
</html>
