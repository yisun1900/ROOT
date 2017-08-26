<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zqysxmbm=null;
String zqysxmmc=null;
zqysxmbm=cf.GB2Uni(request.getParameter("zqysxmbm"));
zqysxmmc=cf.GB2Uni(request.getParameter("zqysxmmc"));
String wherezqysxmbm=null;
wherezqysxmbm=cf.GB2Uni(request.getParameter("wherezqysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zqysxmbm set zqysxmbm=?,zqysxmmc=? ";
	ls_sql+=" where  (zqysxmbm='"+wherezqysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zqysxmbm);
	ps.setString(2,zqysxmmc);
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