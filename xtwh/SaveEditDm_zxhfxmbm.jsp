<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hfxmbm=null;
String hfxmmc=null;
String lx=null;
hfxmbm=cf.GB2Uni(request.getParameter("hfxmbm"));
hfxmmc=cf.GB2Uni(request.getParameter("hfxmmc"));
lx=cf.GB2Uni(request.getParameter("lx"));
String wherehfxmbm=null;
wherehfxmbm=cf.GB2Uni(request.getParameter("wherehfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zxhfxmbm set hfxmbm=?,hfxmmc=?,lx=? ";
	ls_sql+=" where  (hfxmbm='"+wherehfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfxmbm);
	ps.setString(2,hfxmmc);
	ps.setString(3,lx);
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