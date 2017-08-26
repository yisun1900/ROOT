<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zzzsbm=null;
String zzzs=null;
zzzsbm=cf.GB2Uni(request.getParameter("zzzsbm"));
zzzs=cf.GB2Uni(request.getParameter("zzzs"));
String zsfl=cf.GB2Uni(request.getParameter("zsfl"));
String zsjb=cf.GB2Uni(request.getParameter("zsjb"));
String fzdw=cf.GB2Uni(request.getParameter("fzdw"));

String wherezzzsbm=null;
wherezzzsbm=cf.GB2Uni(request.getParameter("wherezzzsbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zzzs set zzzsbm=?,zzzs=?,zsfl=?,zsjb=?,fzdw=? ";
	ls_sql+=" where  (zzzsbm='"+wherezzzsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zzzsbm);
	ps.setString(2,zzzs);
	ps.setString(3,zsfl);
	ps.setString(4,zsjb);
	ps.setString(5,fzdw);
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
	out.print("<BR>³ö´í:" + e);
	out.print("<BR>SQL=" + ls_sql);
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