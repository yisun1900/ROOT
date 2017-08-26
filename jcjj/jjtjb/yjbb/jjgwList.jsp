<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String zgsmc=(String)session.getAttribute("zgsmc");
	String cxrq=request.getParameter("cxrq");
	String cxrq2=request.getParameter("cxrq2");
%>
<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

 <body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<center><B>家居顾问定单统计表<br>(统计时间：<%=cxrq%>--<%=cxrq2%>)</B></center><BR>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ztjjgw=null;
	ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
	String wheresql="";
	if(ztjjgw!=null)
	{
		if(!(ztjjgw.equals("")))
		{
				wheresql=" and yhmc='"+ztjjgw+"'";
		}
	}
	//out.print(wheresql);
	String ddrq=null;
	
	
	
	Connection conn  = null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;
	ResultSet rs=null;
	String yhmc=null;
	String mmsl=null;
	int lx=0;
	double htje=0;
	int lx1=0;
	double htje1=0;
	int lx2=0;
	double htje2=0;
	int lx3=0;
	double htje3=0;
	int lx4=0;
	double htje4=0;
	double htje5=0;
%>


<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12">
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="4%">家居顾问</td>
	<td  width="6%">家居类型</td>
	<td  width="6%">定单数量</td>
	<td  width="6%">合同金额</td>

</tr>
<%

try {
		conn=cf.getConnection();
		ls_sql="select yhmc from sq_yhxx where zwbm='08'";
		ls_sql+=wheresql;
		//out.print(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			yhmc=rs.getString("yhmc");
			//out.print(yhmc);
			//统计木门
			ls_sql=" SELECT count(*) lstscs,sum(jc_mmydd.htje) htje  ";
			ls_sql+=" from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and jc_mmydd.htrq<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_mmydd.htrq>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and ztjjgw='"+yhmc+"'";

			//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				lx=rs1.getInt("lstscs");
				htje=rs1.getDouble("htje");

			//	out.print(htje);
				//out.print(lx);
			}
			rs1.close();
			ps1.close();
			//统计橱柜
			ls_sql=" SELECT count(*) lstscs,sum(jc_cgdd.htze) htje  ";
			ls_sql+=" from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and jc_cgdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_cgdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and ztjjgw='"+yhmc+"'";
			//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				lx1=rs1.getInt("lstscs");
				htje1=rs1.getDouble("htje");

				//out.print(htje);
				//out.print(lx);
			}
			rs1.close();
			ps1.close();
            //统计家具
			ls_sql=" SELECT count(*) lstscs,sum(jc_jjdd.htze) htje  ";
			ls_sql+=" from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and jc_jjdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_jjdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and ztjjgw='"+yhmc+"'";
			//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				lx2=rs1.getInt("lstscs");
				htje2=rs1.getDouble("htje");

				//out.print(htje);
				//out.print(lx);
			}
			rs1.close();
			ps1.close();
             //统计主材
			ls_sql=" SELECT count(*) lstscs,sum(jc_zcdd.hkze) htje  ";
			ls_sql+=" from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_zcdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and ztjjgw='"+yhmc+"'";
			//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				lx3=rs1.getInt("lstscs");
				htje3=rs1.getDouble("htje");

				//out.print(htje);
				//out.print(ls_sql);
			}
			rs1.close();
			ps1.close();

			htje4=htje+htje2+htje3+htje1;
%>

		<tr align="center">
		<td  rowspan='4' width="4%"><%=yhmc%></td>
		<td  width="6%">木门</td>
		
		<td  width="6%"><%=lx%></td>
	
		<td  width="12%"><%=htje%></td>

		</tr>
		<tr align="center">
		<!--  <td  width="4%"><%=yhmc%></td>-->
		<td  width="6%">橱柜</td>
	
		<td  width="6%"><%=lx1%></td>
		
		<td  width="12%"><%=htje1%></td>

		</tr>
		<tr align="center">
		<!--  <td  width="4%"><%=yhmc%></td>-->
		<td  width="6%">家具</td>
		
		<td  width="12%"><%=lx2%></td>
		
		<td  width="6%"><%=htje2%></td>

		</tr>
		<tr align="center">
		<!--  <td  width="4%"><%=yhmc%></td>-->
		<td  width="6%">主材</td>
		
		<td  width="6%"><%=lx3%></td>
		
		<td  width="12%"><%=htje3%></td>

		</tr>
		  <tr align="center">
		<td  width="4%"><b><font color="blue">小计</b></td>
		<td  width="6%">&nbsp;&nbsp;&nbsp;</td>
		
		<td  width="6%">&nbsp;&nbsp;&nbsp;</td>
		
		<td  width="12%" >&nbsp;&nbsp;&nbsp;<font color="blue"><b><%=htje4%></b></font></td>

		</tr>
		
<%
	htje5=htje5+htje4;

	}
	rs.close();
	ps.close();

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>
<tr  align="center">
    <td  width="4%"><font color="red"><b>合计(元)</b></td>
	<td  width="6%">  &nbsp;&nbsp;&nbsp; </td>
	<td  width="6%"> &nbsp;&nbsp;&nbsp;</td>
	
	
	
	<td  width="6%"><font color="red"><b><%=htje5%></B></td>

</tr>
</table>

<table  width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:16">
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right"><%=zgsmc%>家居管理中心</td><td>&nbsp;&nbsp;</td></tr>
</table></body>
</html>