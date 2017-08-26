<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cldlmc=null;
cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
String cldllb=null;
cldllb=cf.GB2Uni(request.getParameter("cldllb"));
String wherecldlbm=null;
wherecldlbm=cf.GB2Uni(request.getParameter("wherecldlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_cldlbm set cldlmc=?,cldllb=? ";
	ls_sql+=" where  (cldlbm='"+wherecldlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cldlmc);
	ps.setString(2,cldllb);
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
		if (ps != null) ps.close();
}
catch (Exception e) {
	out.print("<BR>³ö´í:" + e);
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