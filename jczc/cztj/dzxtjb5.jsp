<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
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
	String dwbh=request.getParameter("dwbh");

	String wheresql="";

	String wheresql1="";


	if (!(fgs.equals("")))
	{
		if (!(dwbh.equals("")))
		{
		wheresql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		wheresql1+=" and ssfgs='"+fgs+"'";
		}else{
			wheresql+=" and  crm_khxx.fgsbh='"+fgs+"'";
			wheresql1+=" and  ssfgs='"+fgs+"'";
		}
	}

	

	String[] rddqbms=request.getParameterValues("rddqbm");
	if (rddqbms!=null)
	{
		wheresql+=cf.arrayToSQL(rddqbms,"crm_khxx.rddqbm");
	}
	String[] hxwzbms=request.getParameterValues("hxwzbm");
	if (hxwzbms!=null)
	{
		wheresql+=cf.arrayToSQL(hxwzbms,"crm_khxx.hxwzbm");
	}
	String[] cqbms=request.getParameterValues("cqbm");
	if (cqbms!=null)
	{
		wheresql+=cf.arrayToSQL(cqbms,"crm_khxx.cqbm");
	}
	String[] ysrbm=request.getParameterValues("ysrbm");
	if (ysrbm!=null)
	{
		wheresql+=cf.arrayToSQL(ysrbm,"crm_khxx.ysrbm");
	}
	String[] nlqjbm=request.getParameterValues("nlqjbm");
	if (nlqjbm!=null)
	{
		wheresql+=cf.arrayToSQL(nlqjbm,"crm_khxx.nlqjbm");
	}
	String[] zybm=request.getParameterValues("zybm");
	if (zybm!=null)
	{
		wheresql+=cf.arrayToSQL(zybm,"crm_khxx.zybm");
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String getfgsbh=null;
String getfgsmc=null;

String cqbm=null;
String cqmc=null;
String deflbm=null;
String deflmc=null;
int dedy=0;
int dexy=0;

double bfb=0;

int allqys=0;
int allqye=0;
int allfwmj=0;
int allpjqye=0;
int allpmjj=0;

int qys=0;
int qye=0;
int fwmj=0;
int pjqye=0;
int pmjj=0;

int xjqys=0;
int xjqye=0;
int xjfwmj=0;
int xjpjqye=0;
int xjpmjj=0;

try {
	conn=cf.getConnection();

%>
	<CENTER >
	  <B>大小单统计<BR>
	  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
	</CENTER>
	<table border="1" width="400%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="2%" rowspan="2">分公司</td>
	  <td  width="1%" rowspan="2">签约数</td>
	  <td  width="2%" rowspan="2">工程签约额</td>
	  <td  width="2%" rowspan="2">平均单额</td>
	  <td  width="2%" rowspan="2">平米均价</td>

<%
	//写表头
	ls_sql="SELECT deflbm,deflmc";
	ls_sql+=" FROM kp_deflbm";
	ls_sql+=" order by deflbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		deflbm=rs1.getString("deflbm");
		deflmc=rs1.getString("deflmc");
		%>
		<td colspan=6><%=deflmc%></td>
		<%
	}
		ps1.close();
		rs1.close();
%>
</tr>
<tr bgcolor="#CCCCCC">
<%
	ls_sql="SELECT deflbm,deflmc";
	ls_sql+=" FROM kp_deflbm";
	ls_sql+=" order by deflbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
	
		%>
		  <td  width="1%">签约数</td>
		  <td  width="1%">签约数百分比</td>
		  <td  width="2%">签约额</td>
		  <td  width="1%">签约额百分比</td>
		  <td  width="2%">平均单额</td>
		  <td  width="1%">平米均价</td>
		<%
	}
	rs.close();
	ps.close();
%>
</tr>
<!--表头结束-->
<!--开始取数据-->

<%
	
	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' ";
	ls_sql+=wheresql1;
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	//rs.last();
	//out.print(rs.getRow());
	//rs.first();
	while (rs.next())
	{
		getfgsbh=rs.getString("dwbh");
		getfgsmc=rs.getString("dwmc");
		//out.print(getfgsbh);

		ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where ";
		ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=wheresql;
	
		//out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			allqys=rs1.getInt(1);
			allqye=rs1.getInt(2);
			fwmj=rs1.getInt(3);

			if (allqys!=0)
			{
				allpjqye=allqye/allqys;
			}
			else{
				allpjqye=0;
			}
			if (fwmj!=0)
			{
				allpmjj=allqye/fwmj;
			}
			else{
				allpmjj=0;
			}
		 }
		 rs1.close();
		 ps1.close();

	
%>
<tr>
		<td ><%=getfgsmc%></td>
		<td  align="right"><%=allqys%></td>
		<td  align="right"><%=allqye%></td>
		<td  align="right"><%=allpjqye%></td>
		<td  align="right"><%=allpmjj%></td>
		
<%
		double qysbfb=0;
		double qyebfb=0;
		ls_sql="SELECT deflbm,deflmc,dedy,dexy";
		ls_sql+=" FROM kp_deflbm";
		ls_sql+=" order by deflbm ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			deflbm=rs1.getString("deflbm");
			deflmc=rs1.getString("deflmc");
			dedy=rs1.getInt("dedy");
			dexy=rs1.getInt("dexy");

			ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
			ls_sql+=wheresql;
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				qys=rs2.getInt(1);
				qye=rs2.getInt(2);
				fwmj=rs2.getInt(3);

				if (qys!=0)
				{
					pjqye=qye/qys;
				}
				else{
					pjqye=0;
				}
				if (allqys!=0)
				{
					qysbfb=qys*100.0/allqys;
				}
				else{
					qysbfb=0;
				}
				if (allqye!=0)
				{
					qyebfb=qye*100.0/allqye;
				}
				else{
					qyebfb=0;
				}
				if (fwmj!=0)
				{
					pmjj=qye/fwmj;
				}
				else{
					pmjj=0;
				}
			}
			rs2.close();
			ps2.close();

			%>
				<td  align="right"><%=cf.formatDouble(qys)%></td>
				<td  align="right"><%=cf.formatDouble(qysbfb)+"%"%></td>
				<td  align="right"><%=cf.formatDouble(qye)%></td>
				<td  align="right"><%=cf.formatDouble(qyebfb)+"%"%></td>
				<td  align="right"><%=cf.formatDouble(pjqye)%></td>
				<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			
			<%
		}
		rs1.close();
		ps1.close();
	%>
	</tr>
	<%
	}

	rs.close();
	ps.close();
%>
	
</table>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


</body>
</html>