<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmsmbbm=null;
String mmsmbmc=null;
mmsmbbm=cf.GB2Uni(request.getParameter("mmsmbbm"));
mmsmbmc=cf.GB2Uni(request.getParameter("mmsmbmc"));
String wheremmsmbbm=null;
wheremmsmbbm=cf.GB2Uni(request.getParameter("wheremmsmbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mmsmbbm set mmsmbbm=?,mmsmbmc=? ";
	ls_sql+=" where  (mmsmbbm='"+wheremmsmbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmsmbbm);
	ps.setString(2,mmsmbmc);
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