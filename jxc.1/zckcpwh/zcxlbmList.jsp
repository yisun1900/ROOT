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
String cldlmc=cf.GB2Uni(cf.getParameter(request,"cldlmc"));


String clxlbm=null;
String clxlmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select clxlbm,clxlmc ";
	ls_sql+=" from  jxc_clxlbm";
	ls_sql+=" where cldlmc='"+cldlmc+"'";
	ls_sql+=" order by clxlbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
%>
  <tr>
    <td align="center" height="30"><A HREF="dwbhList.jsp?dqbm=<%=dqbm%>&cldlmc=<%=cldlmc%>&clxlmc=<%=clxlmc%>" ><%=clxlmc%></A></td>
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
