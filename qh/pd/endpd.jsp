<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String hfr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");

String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql="update crm_khxx set pdclzt='4' ";
		ls_sql+=" where  khbh='"+khbh[i]+"' and pdclzt='2' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update pd_pdjl set hfsj=TRUNC(SYSDATE),dwbh=?,hfr=?,hfjl='4'";
		ls_sql+=" where  khbh='"+khbh[i]+"' and hfjl='0' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dwbh);
		ps.setString(2,hfr);
		ps.executeUpdate();
		ps.close();
	}

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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>