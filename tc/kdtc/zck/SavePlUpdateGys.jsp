<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String tckd_tczcbj_dqbm=null;
String oldgysmc=null;
String newgysmc=null;

tckd_tczcbj_dqbm=request.getParameter("tckd_tczcbj_dqbm");
oldgysmc=cf.GB2Uni(request.getParameter("oldgysmc"));
newgysmc=cf.GB2Uni(request.getParameter("newgysmc"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update tckd_tczcbj set gysmc='"+newgysmc+"'";
	ls_sql+=" where dqbm='"+tckd_tczcbj_dqbm+"' and gysmc='"+oldgysmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



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
	out.print("<BR>³ö´í:" + e);
	out.print("<BR>SQL=" + ls_sql);
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