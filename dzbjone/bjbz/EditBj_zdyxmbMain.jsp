<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String shbz="";
try {
	conn=cf.getConnection();

	ls_sql="select shbz";
	ls_sql+=" from  bj_zdyxmb";
	ls_sql+=" where  lrr='"+lrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shbz=cf.fillNull(rs.getString("shbz"));
	}
	rs.close();
	ps.close();
	if (shbz.equals("W"))
	{
		response.sendRedirect("CEditBj_zdyxmb.jsp?xmbh="+xmbh+"&lrr="+lrr);
	}
	else{
		response.sendRedirect("EditBj_zdyxmb.jsp?xmbh="+xmbh+"&lrr="+lrr);
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
