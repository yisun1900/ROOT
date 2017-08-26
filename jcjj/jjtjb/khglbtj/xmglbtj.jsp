<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String zgsmc=(String)session.getAttribute("zgsmc");

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=null;
	String sjfw2=null;
	String dwbh=request.getParameter("dwbh");
	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");
	String wheresql="";
	String khbh=null;

	if (fgs!=null)
	{
			if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
			if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	
	String ddrq=null;
	String khbh1="";
	int sl5=0;
	int allsl=0;
	
	
	Connection conn  = null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	PreparedStatement ps2=null;
	ResultSet rs1=null;
	ResultSet rs2=null;
	String ls_sql=null;
	ResultSet rs=null;
	String yhmc=null;
	String mmsl=null;
	String oldcxhdbm=null;
	int allwjsl=0;
	
%>

<div align="center"><b>完结客户订购集成产品种类统计</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12">
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="6%">参加活动</td>
		<td  width="6%">家居类型</td>
		<td  width="6%">客户数量</td>
		<td  width="6%">比例分析</td>
	</tr>
<%

try {
		conn=cf.getConnection();
		ls_sql="select count(*) from crM_khxx where zt='2' and gcjdbm='5'";
		ls_sql+="  and qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+="  and cxhdbm is not  null ";
		ls_sql+=wheresql;
		ps=conn.prepareStatement(ls_sql);
		rs=ps.executeQuery(ls_sql);
		if(rs.next())
		{	
			allsl=rs.getInt(1);
		}
		ps.close();
		rs.close();
	
		ls_sql="select cxhdbm,count(*) from crM_khxx where zt='2' and gcjdbm='5'";
		ls_sql+="  and qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+="  and cxhdbm is not  null ";
		ls_sql+=wheresql;
		ls_sql+=" group by cxhdbm";
		ps=conn.prepareStatement(ls_sql);
		rs=ps.executeQuery(ls_sql);	
		while (rs.next())
		{	
			String cxhdbm="";
			
			int sl1=0;
			int sl2=0;
			int sl3=0;
			int sl4=0;
			int sl6=0;
			
			int temp1=0;//临时变量,进行分类统计
			
			cxhdbm=rs.getString("cxhdbm");
			allwjsl++;
			ls_sql="select  khbh  from crM_khxx where zt='2' and gcjdbm='5'";
			ls_sql+="  and qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+="  and cxhdbm='"+cxhdbm+"'";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			
			while (rs2.next())
			{	
					khbh1="";
					khbh1=rs2.getString("khbh");
					//out.print(ls_sql);
					//统计木门
					ls_sql=" SELECT distinct(khbh) ";
					ls_sql+=" from jc_mmydd where  jc_mmydd.htrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and jc_mmydd.khbh='"+khbh1+"'";
					
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery(ls_sql);
					if (rs1.next())
					{
						temp1++;

					}
					rs1.close();
					ps1.close();
					
					//统计橱柜
					ls_sql=" SELECT distinct(khbh) ";
					ls_sql+=" from jc_cgdd where   jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and jc_cgdd.khbh='"+khbh1+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery(ls_sql);
					if (rs1.next())
					{
						temp1++;
					}
					rs1.close();
					ps1.close();
					//统计家具
					ls_sql=" SELECT count(*) ";
					ls_sql+=" from jc_jjdd where  jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and jc_jjdd.khbh='"+khbh1+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery(ls_sql);
					if (rs1.next())
					{
						temp1++;
					}
					rs1.close();
					ps1.close();
					 //统计主材
					ls_sql=" SELECT count(*)  ";
					ls_sql+=" from jc_zcdd where jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and jc_zcdd.khbh='"+khbh1+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery(ls_sql);
					if (rs1.next())
					{
						temp1++;
					}
					rs1.close();
					ps1.close();

					//对于定购几类产品的客户进行统计
					if((1<=temp1)&&(temp1<2))
					{
						sl1++;
					}
					else if((2<=temp1)&&(temp1<3))
					{
						sl2++;
					}
					else if((3<=temp1)&&(temp1<4))
					{
						sl3++;
					}
					else if(temp1==0)
					{
						
					}
					else
					{
						sl4++;
					}
			}
			rs2.close();
			ps2.close();
			sl5+=sl1+sl2+sl3+sl4;
			sl6=sl1+sl2+sl3+sl4;
%>
		<tr align="center">
			<td  width="15%" rowspan="5"><%=cxhdbm%></td>
			<td  width="10%">仅购一类产品</td>
			<td  width="6%"><%=sl1%></td>
			<td align="left" width="20%"><img src="/images/ColuGif.gif" width="<%=sl1*100/allsl%>" height=20><%=sl1*100/allsl%>%</td>
		</tr>
		<tr align="center">
			<td  width="6%">仅购二类产品</td>
			<td  width="6%"><%=sl2%></td>
			<td align="left"><img src="/images/ColuGif.gif" width="<%=sl2*100/allsl%>" height=20><%=sl2*100/allsl%>%</td>
		</tr>
		<tr align="center">
			<td  width="6%">仅购三类产品</td>
			<td  width="6%"><%=sl3%></td>
			<td align="left"><img src="/images/ColuGif.gif" width="<%=sl3*100/allsl%>" height=20><%=sl3*100/allsl%>%</td>
		</tr>
		<tr align="center">
			<td  width="6%">仅购四类产品</td>
			<td  width="6%"><%=sl4%></td>
			<td align="left"><img src="/images/ColuGif.gif" width="<%=sl4*100/allsl%>" height=20><%=sl4*100/allsl%>%</td>
		</tr>
		 <tr align="center">
			<td  width="4%"><b><font color="blue">小计</b></td>
			<td  width="12%" ><font color="blue"><b><%=sl6%></b></font></td>
			<td  width="6%">&nbsp;&nbsp;&nbsp;</td>
		</tr>
		
<%
	}
	rs.close();
	ps.close();

			
%>
		<tr align="center">
			<td  width="4%"><b><font color="blue">总计</b></td>
			<td  width="6%">&nbsp;&nbsp;&nbsp;</td>
			<td  width="12%" ><font color="blue"><b><%=allsl%></b></font></td>
			<td  width="6%">&nbsp;&nbsp;&nbsp;</td>
		</tr>

		
		
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
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

</table>

<table  width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:16">
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right"><%=zgsmc%>家居管理中心</td><td>&nbsp;&nbsp;</td></tr>
</table></body>
</html>
