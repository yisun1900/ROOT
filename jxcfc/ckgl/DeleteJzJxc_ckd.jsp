<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ckph=request.getParameterValues("ckph");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ckph.length;i++ )
	{
		ls_sql=" update jxc_ckd set jzr=null,jzsj=null,sfjz='N' ";
		ls_sql+=" where ckph='"+ckph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}  

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("É¾³ý³É¹¦£¡");
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