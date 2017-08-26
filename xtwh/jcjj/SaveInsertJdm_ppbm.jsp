<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ppbm=null;
String ppmc=null;
String dwbh=null;
ppbm=cf.GB2Uni(request.getParameter("ppbm"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));

String zclb=cf.GB2Uni(request.getParameter("zclb"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_ppbm ( ppbm,ppmc,dwbh,zclb ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,dwbh);
	ps.setString(4,zclb);
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