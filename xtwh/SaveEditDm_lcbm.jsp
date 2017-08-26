<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lcbm=null;
String lcmc=null;
lcbm=cf.GB2Uni(request.getParameter("lcbm"));
lcmc=cf.GB2Uni(request.getParameter("lcmc"));
String wherelcbm=null;
wherelcbm=cf.GB2Uni(request.getParameter("wherelcbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_lcbm set lcbm=?,lcmc=? ";
	ls_sql+=" where  (lcbm='"+wherelcbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lcbm);
	ps.setString(2,lcmc);
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