<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date clqklrsj=null;
String clqklrr=null;
String sjclqk=null;

ls=request.getParameter("clqklrsj");
try{
	if (!(ls.equals("")))  clqklrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clqklrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理情况录入时间]类型转换发生意外:"+e);
	return;
}
clqklrr=cf.GB2Uni(request.getParameter("clqklrr"));
sjclqk=cf.GB2Uni(request.getParameter("sjclqk"));
String sjcljg=cf.GB2Uni(request.getParameter("sjcljg"));

String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_xmycgl set clqklrsj=?,clqklrr=?,sjcljg=?,sjclqk=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='4'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,clqklrsj);
	ps.setString(2,clqklrr);
	ps.setString(3,sjcljg);
	ps.setString(4,sjclqk);
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