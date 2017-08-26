<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String xh=request.getParameter("xh");
String lywj=cf.GB2Uni(cf.getParameter(request,"lywj"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="update call_ldjl set lywj=?";
	ls_sql+=" where xh='"+xh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lywj);
	ps.executeUpdate();
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



