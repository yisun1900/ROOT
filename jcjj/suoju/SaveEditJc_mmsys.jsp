<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjjbm=null;
String mmsysbm=null;
String bm=null;
wjjbm=cf.GB2Uni(request.getParameter("wjjbm"));
mmsysbm=cf.GB2Uni(request.getParameter("mmsysbm"));
bm=cf.GB2Uni(request.getParameter("bm"));
String wherewjjbm=null;
String wheremmsysbm=null;
wherewjjbm=cf.GB2Uni(request.getParameter("wherewjjbm"));
wheremmsysbm=cf.GB2Uni(request.getParameter("wheremmsysbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mmsys set wjjbm=?,mmsysbm=?,bm=? ";
	ls_sql+=" where  (wjjbm='"+wherewjjbm+"') and  (mmsysbm='"+wheremmsysbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wjjbm);
	ps.setString(2,mmsysbm);
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