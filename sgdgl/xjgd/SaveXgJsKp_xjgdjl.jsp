<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String jsr=null;
java.sql.Date jssj=null;
String jssm=cf.GB2Uni(request.getParameter("jsyj"));

jsr=cf.GB2Uni(request.getParameter("jsr"));
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[接收时间]类型转换发生意外:"+e);
	return;
}
String zgcljlh=null;
zgcljlh=cf.GB2Uni(request.getParameter("zgcljlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	ls_sql="update kp_zgclgdmx set jsr=?,jssj=?,jssm=?  ";
	ls_sql+=" where zgcljlh='"+zgcljlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsr);
	ps.setDate(2,jssj);
	ps.setString(3,jssm);
	ps.executeUpdate();
	ps.close();

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
	out.print("Exception: " + e);
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