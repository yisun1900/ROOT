<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmycyybm=null;
String mmycyymc=null;
mmycyybm=cf.GB2Uni(request.getParameter("mmycyybm"));
mmycyymc=cf.GB2Uni(request.getParameter("mmycyymc"));
String wheremmycyybm=null;
wheremmycyybm=cf.GB2Uni(request.getParameter("wheremmycyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mmycyybm set mmycyybm=?,mmycyymc=? ";
	ls_sql+=" where  (mmycyybm='"+wheremmycyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmycyybm);
	ps.setString(2,mmycyymc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
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