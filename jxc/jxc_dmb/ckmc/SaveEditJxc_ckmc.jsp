<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ckmc=null;
String dqbm=null;
ckmc=cf.GB2Uni(request.getParameter("ckmc"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String cksslx=null;
cksslx=cf.GB2Uni(request.getParameter("cksslx"));
String whereckbh=null;
whereckbh=cf.GB2Uni(request.getParameter("whereckbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_ckmc set ckmc=?,dqbm=?,cksslx=? ";
	ls_sql+=" where  (ckbh='"+whereckbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ckmc);
	ps.setString(2,dqbm);
	ps.setString(3,cksslx);
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