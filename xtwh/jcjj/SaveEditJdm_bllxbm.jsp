<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bllxbm=null;
String bllxmc=null;
bllxbm=cf.GB2Uni(request.getParameter("bllxbm"));
bllxmc=cf.GB2Uni(request.getParameter("bllxmc"));
String wherebllxbm=null;
wherebllxbm=cf.GB2Uni(request.getParameter("wherebllxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_bllxbm set bllxbm=?,bllxmc=? ";
	ls_sql+=" where  (bllxbm='"+wherebllxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bllxbm);
	ps.setString(2,bllxmc);
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