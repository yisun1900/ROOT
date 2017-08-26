<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjbjmcbm=null;
String jjbjmc=null;
jjbjmcbm=cf.GB2Uni(request.getParameter("jjbjmcbm"));
jjbjmc=cf.GB2Uni(request.getParameter("jjbjmc"));
String wherejjbjmcbm=null;
wherejjbjmcbm=cf.GB2Uni(request.getParameter("wherejjbjmcbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_jjbjmcbm set jjbjmcbm=?,jjbjmc=? ";
	ls_sql+=" where  (jjbjmcbm='"+wherejjbjmcbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjbjmcbm);
	ps.setString(2,jjbjmc);
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