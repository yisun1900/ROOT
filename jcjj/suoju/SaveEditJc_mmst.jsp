<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjjbm=null;
String mmstbm=null;
String bm=null;
wjjbm=cf.GB2Uni(request.getParameter("wjjbm"));
mmstbm=cf.GB2Uni(request.getParameter("mmstbm"));
bm=cf.GB2Uni(request.getParameter("bm"));
String wherewjjbm=null;
String wheremmstbm=null;
wherewjjbm=cf.GB2Uni(request.getParameter("wherewjjbm"));
wheremmstbm=cf.GB2Uni(request.getParameter("wheremmstbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mmst set wjjbm=?,mmstbm=?,bm=? ";
	ls_sql+=" where  (wjjbm='"+wherewjjbm+"') and  (mmstbm='"+wheremmstbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wjjbm);
	ps.setString(2,mmstbm);
	ps.setString(3,bm);
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