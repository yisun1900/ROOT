<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zxkhyxbm=null;
String zxkhyxmc=null;
zxkhyxbm=cf.GB2Uni(request.getParameter("zxkhyxbm"));
zxkhyxmc=cf.GB2Uni(request.getParameter("zxkhyxmc"));
String wherezxkhyxbm=null;
wherezxkhyxbm=cf.GB2Uni(request.getParameter("wherezxkhyxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zxkhyxbm set zxkhyxbm=?,zxkhyxmc=? ";
	ls_sql+=" where  (zxkhyxbm='"+wherezxkhyxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxkhyxbm);
	ps.setString(2,zxkhyxmc);
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