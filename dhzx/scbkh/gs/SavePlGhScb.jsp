<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] scbkhbh=request.getParameterValues("scbkhbh");
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String ywybm=cf.GB2Uni(request.getParameter("ywybm"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<scbkhbh.length ;i++ )
	{

		ls_sql="update crm_scbkhxx set ywybm=?,ywy=null,ywyssxz=null";
		ls_sql+=" where  (scbkhbh='"+scbkhbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ywybm);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("¸ü»»³É¹¦£¡");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>