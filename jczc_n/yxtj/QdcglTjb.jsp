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
PreparedStatement ps2=null;//用于分公司显示
ResultSet rs2=null;//用于分公司显示
String ls_sql=null;

String xxlybm=null;

String fgsbh=null;
String fgsmc=null;

String rownm=null;//序号
int allzxs=0;
int fgsallzxs=0;//分公司所有咨询数
int allqys=0;
int fgsallqys=0;//分公司签约总数
double allqye=0;
double fgsallqye=0;//分公司签约总额
int fgsallsbs=0;//分公司失败数
int allsbs=0;//总失败数
int qdcgl=0;

try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>签单成功率分析 <BR>
  (统计时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center"> 
  <td  width="7%">序号</td>
  <td  width="7%">分公司</td>
  <td  width="6%">客户咨询数</td>
  <td  width="10%">失败客户数</td>
  <td  width="6%">签约客户数</td>
  <td  width="12%">签单成功率</td>
  <td  width="8%">签单周期</td>
  <td  width="8%">签约额</td>
</tr>
<%
	//全部签约数、签约额
	ls_sql="select count(*),sum(qye),sum(sjf)";
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
		//allsjf=rs.getDouble(3);
		//allfwmj=rs.getInt(4);
	}
	rs.close();
	ps.close();


	//获取时间差
	int sjc=0;
	double pjts=0;//平均天数
	double allpjts=0;//总平均天数

	ls_sql="SELECT TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')-TO_DATE('"+sjfw+"','YYYY-MM-DD')+1";
	ls_sql+=" FROM dm_gcjdbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjc=rs.getInt(1);
	}
	rs.close();
	ps.close();


//分公司	
	ls_sql=" SELECT rownum,dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  dwbh ='"+fgs+"'";
	}
	ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery(ls_sql);
	while (rs2.next())
	{
		fgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");	
		rownm=rs2.getString("rownum");	

		//分公司全部咨询数
		ls_sql="select count(*)";
		ls_sql+=" from crm_zxkhxx";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and crm_zxkhxx.ssfgs='"+fgsbh+"'";
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
			fgsallzxs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		allzxs+=fgsallzxs;

		//分公司失败数
		ls_sql="select count(*)";
		ls_sql+=" from crm_zxkhxx";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and crm_zxkhxx.ssfgs='"+fgsbh+"' and zxzt='4'";
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
			fgsallsbs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		allsbs+=fgsallsbs;

		//分公司全部签约数、签约额
		ls_sql="select count(*),sum(qye),sum(sjf)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2'";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and crm_khxx.fgsbh='"+fgsbh+"'";
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
			fgsallqys=rs.getInt(1);
			fgsallqye=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		//签单成功率
		if (fgsallzxs!=0)
		{
			qdcgl=fgsallqys*100/fgsallzxs;
		}
		else{
			qdcgl=0;
		}

		//平均天数
		if (fgsallqys!=0)
		{
			pjts=sjc*1.0/fgsallqys;
		}
		else{
			pjts=0;
		}
		%>
		<tr align="center">
		  <td><%=rownm%></td>
		  <td><%=fgsmc%></td>
		  <td><%=fgsallzxs%></td>
		  <td><%=fgsallsbs%></td>
		  <td><%=fgsallqys%></td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=qdcgl%>" height="14"><%=qdcgl%>%</td>
		  <td ><%=cf.formatDouble(pjts)%>天</td>	
		  <td align="right"><%=cf.formatDouble(fgsallqye)%></td>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();	


if (allzxs!=0)
{
	qdcgl=allqys*100/allzxs;
}
else{
	qdcgl=0;
}


//平均天数
if (allqys!=0)
{
	allpjts=sjc*1.0/allqys;
}
else{
	allpjts=0;
}



%> 

<tr align="center">
  <td>总数</td>
  <td>&nbsp;</td>
  <td><%=allzxs%></td>
  <td><%=allsbs%></td>
  <td><%=allqys%></td>
  <td align="left"><img src="/images/ColuGif.gif" width="<%=qdcgl%>" height="14"><%=qdcgl%>%</td>
  <td ><%=cf.formatDouble(allpjts)%>天</td>
  <td align="right"><%=cf.formatDouble(allqye)%></td>
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
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
