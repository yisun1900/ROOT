<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ddlx="";

try {
	conn=cf.getConnection();

	ls_sql="select ddlx";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ddlx=cf.fillNull(rs.getString("ddlx"));
	}
	rs.close();
	ps.close();

	if (ddlx.equals("4"))
	{
		response.sendRedirect("ShJc_zcddYkc.jsp?ddbh="+ddbh);
	}
	else{
		response.sendRedirect("ShJc_zcddWkc.jsp?ddbh="+ddbh);
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
