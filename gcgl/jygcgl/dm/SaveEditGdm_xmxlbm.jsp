<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xmxlbm=null;
String xmxlmc=null;
String xmdlbm=null;
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
xmxlmc=cf.GB2Uni(request.getParameter("xmxlmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
String wherexmxlbm=null;
wherexmxlbm=cf.GB2Uni(request.getParameter("wherexmxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update gdm_xmxlbm set xmxlbm=?,xmxlmc=?,xmdlbm=? ";
	ls_sql+=" where  (xmxlbm='"+wherexmxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmxlbm);
	ps.setString(2,xmxlmc);
	ps.setString(3,xmdlbm);
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