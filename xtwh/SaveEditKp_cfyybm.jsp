<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cfyybm=null;
String cfyymc=null;
cfyybm=cf.GB2Uni(request.getParameter("cfyybm"));
cfyymc=cf.GB2Uni(request.getParameter("cfyymc"));
String wherecfyybm=null;
wherecfyybm=cf.GB2Uni(request.getParameter("wherecfyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_cfyybm set cfyybm=?,cfyymc=? ";
	ls_sql+=" where  (cfyybm='"+wherecfyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cfyybm);
	ps.setString(2,cfyymc);
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