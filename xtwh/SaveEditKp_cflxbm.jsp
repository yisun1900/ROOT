<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cflxbm=null;
String cflxmc=null;
cflxbm=cf.GB2Uni(request.getParameter("cflxbm"));
cflxmc=cf.GB2Uni(request.getParameter("cflxmc"));
String wherecflxbm=null;
wherecflxbm=cf.GB2Uni(request.getParameter("wherecflxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_cflxbm set cflxbm=?,cflxmc=? ";
	ls_sql+=" where  (cflxbm='"+wherecflxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cflxbm);
	ps.setString(2,cflxmc);
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