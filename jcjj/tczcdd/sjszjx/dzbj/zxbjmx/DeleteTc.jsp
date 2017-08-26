<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=request.getParameter("fgsbh");
String tcmc=cf.GB2Uni(request.getParameter("sctcmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_tcbjxmmx ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<1)
	{
		out.println("<BR>´íÎó£¬Ì×²ÍÃû³Æ["+tcmc+"]²»´æÔÚ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql=" delete from bj_tcbjxmmx ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_tcfjxx ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_tcgclmx ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
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
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>