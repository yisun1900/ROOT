<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String smbm=null;
String smmc=null;
smbm=cf.GB2Uni(request.getParameter("smbm"));
smmc=cf.GB2Uni(request.getParameter("smmc"));
String wheresmbm=null;
wheresmbm=cf.GB2Uni(request.getParameter("wheresmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bdm_smbm set smbm=?,smmc=? ";
	ls_sql+=" where  (smbm='"+wheresmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,smbm);
	ps.setString(2,smmc);
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