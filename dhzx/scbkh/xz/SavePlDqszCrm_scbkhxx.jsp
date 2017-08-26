<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] scbkhbh = request.getParameterValues("scbkhbh");

String ls=null;
int hfjg=0;
ls=request.getParameter("hfjg");
try{
	if (!(ls.equals("")))  hfjg=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hfjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访间隔 ]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<scbkhbh.length ;i++ )
	{
		ls_sql="update crm_scbkhxx set hfjg=?";
		ls_sql+=" where scbkhbh='"+scbkhbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,hfjg);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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