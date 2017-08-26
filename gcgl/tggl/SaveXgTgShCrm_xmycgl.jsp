<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date tgshsj=null;
String tgshr=null;
String tgshsm=null;

ls=request.getParameter("tgshsj");
try{
	if (!(ls.equals("")))  tgshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tgshsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停工申请时间]类型转换发生意外:"+e);
	return;
}
tgshr=cf.GB2Uni(request.getParameter("tgshr"));
tgshsm=cf.GB2Uni(request.getParameter("tgshsm"));
String tgshjg=cf.GB2Uni(request.getParameter("tgshjg"));

String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_xmycgl set tgshsj=?,tgshr=?,tgshjg=?,tgshsm=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='6' and sjcljg='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tgshsj);
	ps.setString(2,tgshr);
	ps.setString(3,tgshjg);
	ps.setString(4,tgshsm);
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