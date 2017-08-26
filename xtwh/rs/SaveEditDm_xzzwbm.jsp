<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xzzwbm=null;
String xzzwmc=null;
String gzbm=null;
String gwzz=null;
String zwflbm=null;
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
xzzwmc=cf.GB2Uni(request.getParameter("xzzwmc"));
gzbm=cf.GB2Uni(request.getParameter("gzbm"));
gwzz=cf.GB2Uni(request.getParameter("gwzz"));
zwflbm=cf.GB2Uni(request.getParameter("zwflbm"));
String wherexzzwbm=null;
wherexzzwbm=cf.GB2Uni(request.getParameter("wherexzzwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="update dm_xzzwbm set xzzwbm=?,xzzwmc=?,gzbm=?,gwzz=?,zwflbm=? ";
	ls_sql+=" where xzzwbm='"+wherexzzwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xzzwbm);
	ps.setString(2,xzzwmc);
	ps.setString(3,gzbm);
	ps.setString(4,gwzz);
	ps.setString(5,zwflbm);
	ps.executeUpdate();
	ps.close();


	ls_sql="update sq_yhxx set zwbm=?";
	ls_sql+=" where xzzwbm='"+xzzwmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gzbm);
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