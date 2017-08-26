<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxbh=request.getParameter("zjxbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update jc_zczjx set jsr='"+yhmc+"',jssj=SYSDATE,clzt='04'";
	ls_sql+=" where zjxbh='"+zjxbh+"' and  clzt='02'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	response.sendRedirect("/jcjj/dygl/zcfjzjx.jsp?zjxbh="+zjxbh);

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>