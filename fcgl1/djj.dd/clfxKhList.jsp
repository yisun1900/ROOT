<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	String wheresql="";

	String fgs=cf.GB2Uni(request.getParameter("fgs"));

	String sjwjrq=request.getParameter("sjwjrq");
	String sjwjrq2=request.getParameter("sjwjrq2");

	String getcldlmc=cf.GB2Uni(request.getParameter("cldlmc"));

%>

<center><b>材料统计
<BR>完结时间：（<%=sjwjrq%>－－<%=sjwjrq2%>）
</b></center><br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="5%"><B>序号</b></td>
		<td width="11%"><B>合同号</b></td>
		<td width="10%"><B>客户姓名</b></td>
		<td width="12%"><B>结算金额</b></td>
		<td width="10%"><B>代金券序号</b></td>
		<td width="20%"><B>材料大类</b></td>
		<td width="20%"><B>减免原因</b></td>
		<td width="12%"><B>减免金额</b></td>
	</tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String bgcolor="";


	int row=0;

	String dwbh="";
	String dwmc="";

	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (!fgs.equals(""))
	{
		ls_sql+=" and dwbh='"+fgs+"'";
	}
    ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		dwbh=cf.fillNull(rs2.getString("dwbh"));
		dwmc=cf.fillNull(rs2.getString("dwmc"));


		String khbh="";
		String hth="";
		String khxm="";
		String czxh="";
		double khjsje=0;
		String cldlmc="";
		String jmyy="";
		double jmje=0;


		ls_sql="select crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,cl_djj.czxh,crm_khxx.khjsje,cl_djjflmx.cldlmc,cl_djjflmx.jmyy,cl_djjflmx.ylqje-cl_djjflmx.sjje jmje";
		ls_sql+=" from cl_djj,cl_djjflmx,crm_khxx  ";
		ls_sql+=" where cl_djjflmx.czxh=cl_djj.czxh and cl_djj.khbh=crm_khxx.khbh and cl_djj.czzt='3' and cl_djj.sfjm='2'  ";
		ls_sql+=" and cl_djj.dwbh='"+dwbh+"' and crm_khxx.gcjdbm='5' and cl_djjflmx.jmyy is not null  ";
		ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=rs.getString("khbh");
			hth=rs.getString("hth");
			khxm=rs.getString("khxm");
			czxh=rs.getString("czxh");
			khjsje=rs.getDouble("khjsje");

			cldlmc=rs.getString("cldlmc");
			jmyy=rs.getString("jmyy");
			jmje=rs.getDouble("jmje");


			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			row++;
		
			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
				<td ><%=row%></td>
				<td ><%=hth%></td>
				<td ><%=khxm%></td>
				<td ><%=khjsje%></td>
				<td ><%=czxh%></td>
				<td ><%=cldlmc%></td>
				<td ><%=jmyy%></td>
				<td ><%=jmje%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

	}
	rs2.close();
	ps2.close();

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
</table>
</body>
</html>