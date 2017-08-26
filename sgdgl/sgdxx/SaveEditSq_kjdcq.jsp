<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sgd=null;
String cqbm=null;
sgd=cf.GB2Uni(request.getParameter("sgd"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String wheresgd=null;
String wherecqbm=null;
wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
wherecqbm=cf.GB2Uni(request.getParameter("wherecqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_kjdcq set sgd=?,cqbm=? ";
	ls_sql+=" where  (sgd='"+wheresgd+"') and  (cqbm='"+wherecqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,cqbm);
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