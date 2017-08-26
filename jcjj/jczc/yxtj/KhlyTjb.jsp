<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
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

String px=request.getParameter("px");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String xxlybm=null;
String xxlymc=null;
int zxs=0;
int zxsbfb=0;

int qys=0;
int qysbfb=0;

double qye=0;
int qyebfb=0;
int fwmj=0;

double sjf=0;
int sjfbfb=0;

int pjde=0;

int allzxs=0;
int allqys=0;
double allqye=0;
double allsjf=0;
int allfwmj=0;

int qdcgl=0;

try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>客户来源分析 <BR>
  (统计时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center"> 
  <td  width="14%">客户来源</td>
  <td  width="6%">咨询数</td>
  <td  width="12%">咨询数百分比</td>
  <td  width="6%">签约数</td>
  <td  width="12%">签约数百分比</td>
  <td  width="10%">签约额</td>
  <td  width="12%">签约额百分比</td>
  <td  width="7%">平均单额</td>
  <td  width="9%">设计费</td>
  <td  width="12%">签单成功率</td>
</tr>
<%

	
	//全部咨询数
	ls_sql="select count(*)";
	ls_sql+=" from crm_zxkhxx";
	ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allzxs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//全部签约数、签约额
	ls_sql="select count(*),sum(qye),sum(sjf),sum(fwmj)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2'";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allqye=rs.getDouble(2);
		allsjf=rs.getDouble(3);
		allfwmj=rs.getInt(4);
	}
	rs.close();
	ps.close();
	
	//信息来源
	ls_sql="select xxlybm,xxlymc";
	ls_sql+=" from dm_xxlybm";
	ls_sql+=" order by xxlybm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		xxlybm=rs1.getString("xxlybm");
		xxlymc=rs1.getString("xxlymc");

		zxs=0;
		zxsbfb=0;
		qys=0;
		qye=0;
		sjf=0;
		fwmj=0;
		//咨询数
		ls_sql="select count(*)";
		ls_sql+=" from crm_zxkhxx,crm_khxxly";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.khbh=crm_khxxly.khbh and crm_khxxly.khlx='2'";//1：签约客户；2：咨询客户
		ls_sql+=" and crm_khxxly.xxlybm='"+xxlybm+"'";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zxs=rs.getInt(1);
		}
		rs.close();
		ps.close();


//		ls_sql="select count(*),sum(qye),TO_CHAR(ROUND(sum(qye)/count(*))),'<img src=\"/images/ColuGif.gif\" width='||sum(qye)*150/"+all+"||' height=14>'";

		//获取签约数
		ls_sql="select count(*),sum(qye),sum(sjf),sum(fwmj)";
		ls_sql+=" from crm_khxx,crm_khxxly";
		ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2'";
		ls_sql+=" and crm_khxx.khbh=crm_khxxly.khbh and crm_khxxly.khlx='1'";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxxly.xxlybm='"+xxlybm+"'";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys=rs.getInt(1);
			qye=rs.getDouble(2);
			sjf=rs.getDouble(3);
			fwmj=rs.getInt(4);
		}
		rs.close();
		ps.close();

		if (allzxs!=0)
		{
			zxsbfb=zxs*100/allzxs;
		}
		else{
			zxsbfb=0;
		}
		if (allqys!=0)
		{
			qysbfb=qys*100/allqys;
		}
		else{
			qysbfb=0;
		}
		if (allqye!=0)
		{
			qyebfb=(int)(qye*100/allqye);
		}
		else{
			qyebfb=0;
		}
		if (allsjf!=0)
		{
			sjfbfb=(int)(sjf*100/allsjf);
		}
		else{
			sjfbfb=0;
		}
		if (fwmj!=0)
		{
			pjde=(int)(qye/qys);
		}
		else{
			pjde=0;
		}
		if (zxs!=0)
		{
			qdcgl=qys*100/zxs;
		}
		else{
			qdcgl=0;
		}

		%>
		<tr align="center"> 
		  <td><%=xxlymc%></td>
		  <td><%=zxs%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=zxsbfb%>" height="14"><%=zxsbfb%>%</td>
		  <td><%=qys%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=qysbfb%>" height="14"><%=qysbfb%>%</td>
		  <td align="right"><%=cf.formatDouble(qye)%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=qyebfb%>" height="14"><%=qyebfb%>%</td>
		  <td align="right"><%=pjde%></td>
		  <td align="right"><%=cf.formatDouble(sjf)%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=qdcgl%>" height="14"><%=qdcgl%>%</td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();
	

if (allfwmj!=0)
{
	pjde=(int)(allqye/allqys);
}
else{
	pjde=0;
}
if (allzxs!=0)
{
	qdcgl=allqys*100/allzxs;
}
else{
	qdcgl=0;
}
%> 

<tr align="center"> 
  <td>总数</td>
  <td><%=allzxs%></td>
  <td>&nbsp;</td>
  <td><%=allqys%></td>
  <td>&nbsp;</td>
  <td align="right"><%=cf.formatDouble(allqye)%></td>
  <td>&nbsp;</td>
  <td align="right"><%=pjde%></td>
  <td align="right"><%=cf.formatDouble(allsjf)%></td>
  <td align="left"><img src="/images/ColuGif.gif" width="<%=qdcgl%>" height="14"><%=qdcgl%>%</td>
</tr>
</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
