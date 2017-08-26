<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmsysbm=null;
String mmsysmc=null;
mmsysbm=cf.GB2Uni(request.getParameter("mmsysbm"));
mmsysmc=cf.GB2Uni(request.getParameter("mmsysmc"));
String wheremmsysbm=null;
wheremmsysbm=cf.GB2Uni(request.getParameter("wheremmsysbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mmsysbm set mmsysbm=?,mmsysmc=? ";
	ls_sql+=" where  (mmsysbm='"+wheremmsysbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmsysbm);
	ps.setString(2,mmsysmc);
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