<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zydm=null;
String xm=null;
String dwbh=null;
zydm=cf.GB2Uni(request.getParameter("zydm"));
xm=cf.GB2Uni(request.getParameter("xm"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String wherezydm=null;
wherezydm=cf.GB2Uni(request.getParameter("wherezydm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_zydm set zydm=?,xm=?,dwbh=? ";
	ls_sql+=" where  (zydm='"+wherezydm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zydm);
	ps.setString(2,xm);
	ps.setString(3,dwbh);
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