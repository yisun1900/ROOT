<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjazwzbm=null;
String jjazwzmc=null;
jjazwzbm=cf.GB2Uni(request.getParameter("jjazwzbm"));
jjazwzmc=cf.GB2Uni(request.getParameter("jjazwzmc"));
String wherejjazwzbm=null;
wherejjazwzbm=cf.GB2Uni(request.getParameter("wherejjazwzbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jjazwzbm set jjazwzbm=?,jjazwzmc=? ";
	ls_sql+=" where  (jjazwzbm='"+wherejjazwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjazwzbm);
	ps.setString(2,jjazwzmc);
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
