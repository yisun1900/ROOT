<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmsbsbm=null;
String mmsbsmc=null;
String bm=null;
mmsbsbm=cf.GB2Uni(request.getParameter("mmsbsbm"));
mmsbsmc=cf.GB2Uni(request.getParameter("mmsbsmc"));
bm=cf.GB2Uni(request.getParameter("bm"));
String wheremmsbsbm=null;
wheremmsbsbm=cf.GB2Uni(request.getParameter("wheremmsbsbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mmsbsbm set mmsbsbm=?,mmsbsmc=?,bm=? ";
	ls_sql+=" where  (mmsbsbm='"+wheremmsbsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmsbsbm);
	ps.setString(2,mmsbsmc);
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