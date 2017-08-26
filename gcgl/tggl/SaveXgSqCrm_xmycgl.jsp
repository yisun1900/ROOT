<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date tgsqsj=null;
String tgsqr=null;
String tgsqyy=null;

ls=request.getParameter("tgsqsj");
try{
	if (!(ls.equals("")))  tgsqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tgsqsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停工申请时间]类型转换发生意外:"+e);
	return;
}
tgsqr=cf.GB2Uni(request.getParameter("tgsqr"));
tgsqyy=cf.GB2Uni(request.getParameter("tgsqyy"));

String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_xmycgl set tgsqsj=?,tgsqr=?,tgsqyy=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='5' and sjcljg='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tgsqsj);
	ps.setString(2,tgsqr);
	ps.setString(3,tgsqyy);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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