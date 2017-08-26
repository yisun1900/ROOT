<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgph=cf.GB2Uni(request.getParameter("sgph"));
Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps2=null;
ResultSet rs=null;
String ls_sql=null;
double sgzsl = 0;
try {
	conn=cf.getConnection();
	ls_sql="delete from cl_clsgmx ";
	ls_sql+=" where (sgph='"+sgph+"')  ";
	ps2= conn.prepareStatement(ls_sql); 
	if (ps2.executeUpdate()!=1)
	{
		out.println("<BR>É¾³ýÉê¹ºÃ÷Ï¸Ê§°Ü,¿ÉÄÜÃ»ÓÐÂ¼ÈëÊý¾Ý£¡");
//		return;
	}
	conn=cf.getConnection();
	ls_sql="delete from cl_clsgd ";
	ls_sql+=" where (sgph='"+sgph+"')  ";
	ps= conn.prepareStatement(ls_sql);   
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>É¾³ýÉê¹ºµ¥Ê§°Ü£¡");
		return;
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("Éê¹ºµ¥É¾³ý³É¹¦£¡");
		window.opener.location.reload();
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>