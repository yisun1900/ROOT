<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ybysxmbm=null;
String ybysxmmc=null;
ybysxmbm=cf.GB2Uni(request.getParameter("ybysxmbm"));
ybysxmmc=cf.GB2Uni(request.getParameter("ybysxmmc"));
String whereybysxmbm=null;
whereybysxmbm=cf.GB2Uni(request.getParameter("whereybysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_ybysxmbm set ybysxmbm=?,ybysxmmc=? ";
	ls_sql+=" where  (ybysxmbm='"+whereybysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ybysxmbm);
	ps.setString(2,ybysxmmc);
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