<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sjsxmbm=null;
String sjsxmmc=null;
sjsxmbm=cf.GB2Uni(request.getParameter("sjsxmbm"));
sjsxmmc=cf.GB2Uni(request.getParameter("sjsxmmc"));
String wheresjsxmbm=null;
wheresjsxmbm=cf.GB2Uni(request.getParameter("wheresjsxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_sjsjszjfy set sjsxmbm=?,sjsxmmc=? ";
	ls_sql+=" where  (sjsxmbm='"+wheresjsxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjsxmbm);
	ps.setString(2,sjsxmmc);
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
	out.print("<BR>����:" + e);
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