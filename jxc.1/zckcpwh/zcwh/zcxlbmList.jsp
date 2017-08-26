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
String cldlbm=cf.GB2Uni(cf.getParameter(request,"cldlbm"));


String clxlbm=null;
String zcxlmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select clxlbm,zcxlmc ";
	ls_sql+=" from  jdm_clxlbm";
	ls_sql+=" where zcdlmc='"+cldlbm+"'";
	ls_sql+=" order by clxlbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		zcxlmc=cf.fillNull(rs.getString("zcxlmc"));
%>
  <tr>
    <td align="center" height="30"><A HREF="ppmcList.jsp?dqbm=<%=dqbm%>&cldlbm=<%=cldlbm%>&clxlbm=<%=zcxlmc%>" ><%=zcxlmc%></A></td>
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
