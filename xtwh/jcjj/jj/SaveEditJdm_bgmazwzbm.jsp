<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgmazwzbm=null;
String bgmazwzmc=null;
bgmazwzbm=cf.GB2Uni(request.getParameter("bgmazwzbm"));
bgmazwzmc=cf.GB2Uni(request.getParameter("bgmazwzmc"));
String wherebgmazwzbm=null;
wherebgmazwzbm=cf.GB2Uni(request.getParameter("wherebgmazwzbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_bgmazwzbm set bgmazwzbm=?,bgmazwzmc=? ";
	ls_sql+=" where  (bgmazwzbm='"+wherebgmazwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgmazwzbm);
	ps.setString(2,bgmazwzmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>