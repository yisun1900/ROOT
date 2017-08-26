<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
up.initialize();

String newdqbm=request.getParameter("newdqbm");
String newbjbbh=cf.GB2Uni(request.getParameter("newbjbbh"));
String newbjjbbm=request.getParameter("newbjjbbm");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from bj_jzbjb ";
	ls_sql+=" where bjbbh='"+newbjbbh+"' and dqbm='"+newdqbm+"' and bjjbbm='"+newbjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_glxmb ";
	ls_sql+=" where bjbbh='"+newbjbbh+"' and dqbm='"+newdqbm+"' and bjjbbm='"+newbjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_jzglfxb ";
	ls_sql+=" where bjbbh='"+newbjbbh+"' and dqbm='"+newdqbm+"' and bjjbbm='"+newbjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>