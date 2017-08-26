<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjazwzbm=null;
String wjazwzmc=null;
wjazwzbm=cf.GB2Uni(request.getParameter("wjazwzbm"));
wjazwzmc=cf.GB2Uni(request.getParameter("wjazwzmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_wjazwzbm ( wjazwzbm,wjazwzmc ) ";
	ls_sql+=" values ( ?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wjazwzbm);
	ps.setString(2,wjazwzmc);
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
	out.print("´æÅÌÊ§°Ü,·¢ÉúÒâÍâ: " + e);
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