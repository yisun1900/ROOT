<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fkfabm=null;
String fkfamc=null;
fkfabm=cf.GB2Uni(request.getParameter("fkfabm"));
fkfamc=cf.GB2Uni(request.getParameter("fkfamc"));
String wherefkfabm=null;
wherefkfabm=cf.GB2Uni(request.getParameter("wherefkfabm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update cw_fkfabm set fkfabm=?,fkfamc=? ";
	ls_sql+=" where  (fkfabm='"+wherefkfabm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fkfabm);
	ps.setString(2,fkfamc);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_fkfamx set fkfabm=? ";
	ls_sql+=" where  (fkfabm='"+wherefkfabm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fkfabm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_fgsfkfa set fkfabm=? ";
	ls_sql+=" where  (fkfabm='"+wherefkfabm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fkfabm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_khfkfa set fkfabm=? ";
	ls_sql+=" where  (fkfabm='"+wherefkfabm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fkfabm);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>³ö´í:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>