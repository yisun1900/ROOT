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
String zcdlbm=cf.GB2Uni(cf.getParameter(request,"zcdlbm"));


String zcxlbm=null;
String zcxlmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcxlbm,zcxlmc ";
	ls_sql+=" from  jdm_zcxlbm";
	ls_sql+=" where zcdlmc='"+zcdlbm+"'";
	ls_sql+=" order by zcxlbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		zcxlmc=cf.fillNull(rs.getString("zcxlmc"));
%>
  <tr>
    <td align="center" height="30"><A HREF="dwbhList.jsp?dqbm=<%=dqbm%>&zcdlbm=<%=zcdlbm%>&zcxlbm=<%=zcxlmc%>" ><%=zcxlmc%></A></td>
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
