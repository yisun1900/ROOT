<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>主材展厅</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:16"  cellpadding="2" cellspacing="2">
  <tr align="center">
	<td height="67" ><font color="#000099" size="+2"><b><font size="+3" face="楷体_GB2312">主材展厅</font></b></font></td>
  </tr>
  <tr align="center">
	<td height="40">&nbsp;</td>
  </tr>
<%
String yhjs=(String)session.getAttribute("yhjs");
String lrdqbm=(String)session.getAttribute("dqbm");
%>

<%

String dqbm=null;
String dqmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		ls_sql="select dqbm,dqmc ";
		ls_sql+=" from  dm_dqbm";
		ls_sql+=" order by dqbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			dqbm=cf.fillNull(rs.getString("dqbm"));
			dqmc=cf.fillNull(rs.getString("dqmc"));

			%>
			  <tr>
				<td align="center" height="30"><A HREF="cldlbmList.jsp?dqbm=<%=dqbm%>"><%=dqmc%></A></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();
	}
	else{
		response.sendRedirect("cldlbmList.jsp?dqbm="+lrdqbm);
	}

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
</body>
</html>
