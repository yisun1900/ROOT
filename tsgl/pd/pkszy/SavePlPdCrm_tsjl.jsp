<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String[] tsjlh = request.getParameterValues("tsjlh");
String kszy=cf.GB2Uni(request.getParameter("kszy"));
String kszypdr=cf.GB2Uni(request.getParameter("kszypdr"));
java.sql.Date kszypdsj=null;
ls=request.getParameter("kszypdsj");
try{
	if (!(ls.equals("")))  kszypdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kszypdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派单时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<tsjlh.length ;i++ )
	{
		ls_sql="update crm_tsjl set kszy=?,kszypdr=?,kszypdsj=? ";
		ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,kszy);
		ps.setString(2,kszypdr);
		ps.setDate(3,kszypdsj);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("派单成功！");
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