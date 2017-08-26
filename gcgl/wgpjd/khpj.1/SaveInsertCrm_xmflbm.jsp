<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xmflbm=null;
String xmfl=null;
xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));
xmfl=cf.GB2Uni(request.getParameter("xmfl"));
int xskd=0;
xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));
xmfl=cf.GB2Uni(request.getParameter("xmfl"));
ls=cf.GB2Uni(request.getParameter("xskd"));
try{
	if (!(ls.equals("")))  xskd=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xskd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[显示宽度]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into crm_xmflbm ( xmflbm,xmfl,xskd) ";
	ls_sql+=" values( ?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmflbm);
	ps.setString(2,xmfl);
	ps.setInt(3,xskd);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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