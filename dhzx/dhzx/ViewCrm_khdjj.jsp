<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户代金券(客户编号：<%=khbh%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">代金券赠送方式</td>
	<td  width="15%">赠送基数</td>
	<td  width="15%">赠送百分比</td>
	<td  width="15%">赠送金额</td>
</tr>
<%
try {
	conn=cf.getConnection();

	String djjzsfs=null;
	String zsjs=null;

	double khfqje=0;
	double khfqbfb=0;

	ls_sql="SELECT khfqje,khfqbfb,DECODE(djjzsfs,'1','固定金额','2','百分比') djjzsfs,DECODE(zsjs,'1','折前合同额','2','折后合同额','3','折前工程费','4','折后工程费','5','结算金额') zsjs";
	ls_sql+=" FROM crm_khdjj  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khfqje=rs.getDouble("khfqje");
		khfqbfb=rs.getDouble("khfqbfb");
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));


		%>
		<tr align="center">
			<td><%=djjzsfs%></td>
			<td><%=zsjs%></td>
			<td><%=khfqbfb%>%</td>
			<td><%=khfqje%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

</table>
</form>
</body>

</html>
