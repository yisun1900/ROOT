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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

 <body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<center><B>家居顾问外主材完结额所占比例<br>(统计时间：<%=cxrq%>--<%=cxrq2%>)</B></center><BR>
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
	String khbh1=null;
	double allfkje=0;
	
	
	Connection conn  = null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	PreparedStatement ps2=null;
	ResultSet rs2=null;
	String ls_sql=null;
	ResultSet rs=null;
	String yhmc=null;
	String mmsl=null;
	
	double htje5=0;
%>


<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">序号</td>
    <td  width="4%">家居顾问</td>
	<td  width="6%">实收款额</td>
	<td  width="6%">所占比例</td>

</tr>
<%

try {
		double fkje1=0;
		
		int row=0;
		conn=cf.getConnection();
		ls_sql="select sum(fkje) from cw_khfkjl where fklxbm='23'";
		ps2= conn.prepareStatement(ls_sql);
		rs2=ps2.executeQuery(ls_sql);
		if(rs2.next())
		{
			fkje1=rs2.getDouble(1);
		}
		
		rs2.close();
		ps2.close();

		if(fkje1==0)
		{
			return;
		}

		ls_sql="select yhmc from sq_yhxx where zwbm='08'";
		ls_sql+=wheresql;
		ls_sql+=" order by yhmc ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			double fkje=0;
			row++;
			yhmc=rs.getString("yhmc");
			
			ls_sql=" SELECT jc_zcdd.khbh  ";
			ls_sql+=" from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and clzt='20' and jc_zcdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_zcdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and clgw='"+yhmc+"'";
			//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			while(rs1.next())
			{
				
				khbh1=rs1.getString("khbh");
				ls_sql="select sum(fkje) from cw_khfkjl where fklxbm='23' and khbh='"+khbh1+"'";
				ps2= conn.prepareStatement(ls_sql);
				rs2=ps2.executeQuery(ls_sql);
				if(rs2.next())
				{
					fkje+=rs2.getDouble(1);
				}
			}
			rs1.close();
			ps1.close();
			allfkje+=fkje;

%>

		<tr align="center">
		<td  width="4%"><%=row%></td>
		<td  width="4%"><%=yhmc%></td>
		<td  width="4%"><%=fkje%></td>
		
		<td  width="6%" align="left"><img src="/images/ColuGif.gif" width="<%=fkje*200/fkje1%>" height="14"></td>

		</tr>
		
	
		
<%
	

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
	<td  width="4%"><%=allfkje%></td>
	<td  width="6%"> &nbsp;&nbsp;&nbsp;</td>
</tr>
</table>

<table  width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:16">
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right"><%=zgsmc%>家居管理中心</td><td>&nbsp;&nbsp;</td></tr>
</table></body>
</html>