<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zclbbm=null;
String zclbmc=null;
String ppbm=null;
zclbbm=cf.GB2Uni(request.getParameter("zclbbm"));
zclbmc=cf.GB2Uni(request.getParameter("zclbmc"));
ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String wherezclbbm=null;
wherezclbbm=cf.GB2Uni(request.getParameter("wherezclbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_zclbbm set zclbbm=?,zclbmc=?,ppbm=? ";
	ls_sql+=" where  (zclbbm='"+wherezclbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zclbbm);
	ps.setString(2,zclbmc);
	ps.setString(3,ppbm);
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