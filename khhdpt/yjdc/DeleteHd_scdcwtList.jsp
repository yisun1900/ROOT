<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>

<%


String wherewtbh[]=request.getParameterValues("wtbh");
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);
	for(int i=0;i<wherewtbh.length;i++)
	{
		ls_sql="delete  from hd_scdcwt ";
		ls_sql+=" where  (wtbh='"+wherewtbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete  from hd_scdcwt ";
		ls_sql+=" where  (wtbh='"+wherewtbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	}
	conn.commit();

	%>
	<script language="javascript" >
	<!--
	alert("É¾³ý³É¹¦!");
	window.close();
	//-->
	</script>
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