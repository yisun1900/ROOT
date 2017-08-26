<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcjdbm=null;
String gcjdmc=null;
String ysgcjdmc=null;
gcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));
gcjdmc=cf.GB2Uni(request.getParameter("gcjdmc"));
ysgcjdmc=cf.GB2Uni(request.getParameter("ysgcjdmc"));
String wheregcjdbm=null;
wheregcjdbm=cf.GB2Uni(request.getParameter("wheregcjdbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_gcjdbm set gcjdbm=?,gcjdmc=?,ysgcjdmc=? ";
	ls_sql+=" where  (gcjdbm='"+wheregcjdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcjdbm);
	ps.setString(2,gcjdmc);
	ps.setString(3,ysgcjdmc);
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