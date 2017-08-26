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

<%
String dqbm=request.getParameter("dqbm");

String cldlbm=null;
String cldlmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cldlbm,cldlmc ";
	ls_sql+=" from  jxc_cldlbm";
	ls_sql+=" where cldllb in('1','3')";
	ls_sql+=" order by cldlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
%>
  <tr>
    <td align="center" height="30"><A HREF="zcxlbmList.jsp?dqbm=<%=dqbm%>&cldlmc=<%=cldlmc%>" ><%=cldlmc%></A></td>
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
</table>
</body>
</html>
