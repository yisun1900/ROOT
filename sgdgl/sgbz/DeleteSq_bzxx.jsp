<%@ page contentType="text/html;charset=gbk" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem = cf.getParameter(request,"chooseitem");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String bzmc=null;
String sgd=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="select bzmc,sgd";
	ls_sql+=" from  sq_bzxx";
	ls_sql+=" where "+chooseitem;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		bzmc=cf.fillNull(rs.getString("bzmc"));
		sgd=cf.fillNull(rs.getString("sgd"));

		ls_sql="delete from sq_bzxx ";
		ls_sql+=" where  (bzmc='"+bzmc+"' and sgd='"+sgd+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update sq_sgd set bzs=(select count(*) from sq_bzxx where sgd='"+sgd+"')";
		ls_sql+=" where sgd='"+sgd+"'";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs.close();
	ps.close();

	
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