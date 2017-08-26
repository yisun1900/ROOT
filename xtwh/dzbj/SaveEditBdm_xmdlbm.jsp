<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xmdlbm=null;
String xmdlmc=null;
String sftsxm=null;
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmdlmc=cf.GB2Uni(request.getParameter("xmdlmc"));
sftsxm=cf.GB2Uni(request.getParameter("sftsxm"));
String wherexmdlbm=null;
wherexmdlbm=cf.GB2Uni(request.getParameter("wherexmdlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bdm_xmdlbm set xmdlbm=?,xmdlmc=?,sftsxm=? ";
	ls_sql+=" where  (xmdlbm='"+wherexmdlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmdlbm);
	ps.setString(2,xmdlmc);
	ps.setString(3,sftsxm);
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