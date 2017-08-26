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
	int sl5=0;
	int sl3=0;
	int sl4=0;
	
	
	Connection conn  = null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;
	ResultSet rs=null;
	String yhmc=null;
	String mmsl=null;
	int allwjsl=0;
	
%>

      <div align="center"><b>客户完工申请单未订集成的比例</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>

<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12">
<tr bgcolor="#CCCCCC"  align="center">
    
	<td  width="6%">家居类型</td>
	<td  width="6%">定单数量</td>
	<td  width="6%">比例分析</td>

</tr>
<%

try {
		conn=cf.getConnection();
		ls_sql="select khbh from crM_khxx where zt='2' and gcjdbm='5'";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=wheresql;
		//out.print(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{	
		
			int sl1=0;
			int sl2=0;
			
			
			int temp1=0;
			int temp2=0;
			int temp3=0;
			int temp4=0;
			khbh=rs.getString("khbh");

			allwjsl++;
			//out.print(yhmc);
			//统计木门
			ls_sql=" SELECT count(*)";
			ls_sql+=" from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and jc_mmydd.htrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and jc_mmydd.khbh='"+khbh+"'";
			
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				temp1++;

			}
			rs1.close();
			ps1.close();
			//统计橱柜
			ls_sql=" SELECT count(*)";
			ls_sql+=" from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and jc_cgdd.khbh='"+khbh+"'";
			//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				temp2++;
			}
			rs1.close();
			ps1.close();
            //统计家具
			ls_sql=" SELECT count(*) ";
			ls_sql+=" from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and jc_jjdd.khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				temp3++;
			}
			rs1.close();
			ps1.close();
             //统计主材
			ls_sql=" SELECT count(*)  ";
			ls_sql+=" from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and jc_zcdd.khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				temp4++;
			}
			rs1.close();
			ps1.close();

			if((1<=(temp1+temp2+temp3+temp4)))
			{
				sl1++;//定购领成的客户
			}
			else
			{
				sl2++;
			}
			//out.print(temp1);
			sl3+=sl1;
			sl4+=sl2;
			
	}
	rs.close();
	ps.close();
	sl5+=sl3+sl4;

	if(sl5==0)//如果为零时的情况。
	{
		return;
	}
%>
		<tr align="center">
		
		<td  width="6%">定购集成类产品</td>		
		<td  width="6%"><%=sl3%></td>
		<td align="left"><img src="/images/ColuGif.gif" width="<%=sl3*180/sl5%>" height=20><%=sl3*100/sl5%>%</td>

		</tr>
		<tr align="center">

		<td  width="6%">未定购集成产品</td>
		<td  width="6%"><%=sl4%></td>
		<td align="left"><img src="/images/ColuGif.gif" width="<%=sl4*180/sl5%>" height=20><%=sl4*100/sl5%>%&nbsp;</td>
 
		  <tr align="center">
		<td  width="4%"><b><font color="blue">小计</b></td>
		
		
		<td  width="12%" ><font color="blue"><b><%=sl5%></b></font></td>
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