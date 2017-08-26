<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date skksj=null;
String skkr=null;
String skksm=null;

ls=request.getParameter("skksj");
try{
	if (!(ls.equals("")))  skksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[skksj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}
skkr=cf.GB2Uni(request.getParameter("skkr"));
skksm=cf.GB2Uni(request.getParameter("skksm"));

String fkjlh=null;
fkjlh=cf.GB2Uni(request.getParameter("fkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_sgdfkjl set zt='3',skksj=?,skkr=?,skksm=? ";
	ls_sql+=" where  fkjlh='"+fkjlh+"' and zt='2'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,skksj);
	ps.setString(2,skkr);
	ps.setString(3,skksm);
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