<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpcfbm=null;
String kpcfmc=null;
kpcfbm=cf.GB2Uni(request.getParameter("kpcfbm"));
kpcfmc=cf.GB2Uni(request.getParameter("kpcfmc"));
String wherekpcfbm=null;
wherekpcfbm=cf.GB2Uni(request.getParameter("wherekpcfbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_kpcfbm set kpcfbm=?,kpcfmc=? ";
	ls_sql+=" where  (kpcfbm='"+wherekpcfbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpcfbm);
	ps.setString(2,kpcfmc);
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