<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjjbm=null;
String mmsmbbm=null;
String bm=null;
wjjbm=cf.GB2Uni(request.getParameter("wjjbm"));
mmsmbbm=cf.GB2Uni(request.getParameter("mmsmbbm"));
bm=cf.GB2Uni(request.getParameter("bm"));
String wherewjjbm=null;
String wheremmsmbbm=null;
wherewjjbm=cf.GB2Uni(request.getParameter("wherewjjbm"));
wheremmsmbbm=cf.GB2Uni(request.getParameter("wheremmsmbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mmsmb set wjjbm=?,mmsmbbm=?,bm=? ";
	ls_sql+=" where  (wjjbm='"+wherewjjbm+"') and  (mmsmbbm='"+wheremmsmbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wjjbm);
	ps.setString(2,mmsmbbm);
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