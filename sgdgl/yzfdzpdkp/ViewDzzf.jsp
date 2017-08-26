<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">队长总分</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">派单考评得分</td>
	<td  width="5%">完工加分</td>
	<td  width="5%">派单减分</td>
	<td  width="5%">最大在施工地数</td>
	<td  width="5%">目前在施工地数</td>
	<td  width="5%">闲置施工力量加分</td>
	<td  width="5%">队长总分</td>
	<td  width="44%">队长总分说明</td>
</tr>

<%
String sgd=request.getParameter("sgd");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int sgdpdjf=0;
	int sgdwgjf=0;
	int pdkpf=0;
	int zdzsgds=0;
	int mqzsgds=0;
	int dzzf=0;

	ls_sql="SELECT sq_sgd.sgdpdjf,sq_sgd.sgdwgjf,sq_sgd.pdkpf,sq_sgd.zdzsgds,sq_sgd.mqzsgds";
	ls_sql+=" FROM sq_sgd ";
    ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdpdjf=rs.getInt("sgdpdjf");
		sgdwgjf=rs.getInt("sgdwgjf");
		pdkpf=rs.getInt("pdkpf");
		zdzsgds=rs.getInt("zdzsgds");
		mqzsgds=rs.getInt("mqzsgds");

		dzzf=pdkpf+sgdwgjf-sgdpdjf+(zdzsgds-mqzsgds);

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td>+<%=pdkpf%></td>
			<td>+<%=sgdwgjf%></td>
			<td>-<%=sgdpdjf%></td>
			<td><%=zdzsgds%></td>
			<td><%=mqzsgds%></td>
			<td>+<%=zdzsgds-mqzsgds%></td>
			<td><%=dzzf%></td>
			<td align="left">队长总分=派单考评得分+完工加分-派单减分+闲置施工力量加分(最大在施工地数-目前在施工地数)</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
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