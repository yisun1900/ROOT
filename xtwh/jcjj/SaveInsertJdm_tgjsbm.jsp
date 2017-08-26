<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tgjsbm=null;
String tgjsmc=null;
long dy=0;
long xydy=0;
tgjsbm=cf.GB2Uni(request.getParameter("tgjsbm"));
tgjsmc=cf.GB2Uni(request.getParameter("tgjsmc"));
ls=request.getParameter("dy");
try{
	if (!(ls.equals("")))  dy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[大于（mm）]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xydy");
try{
	if (!(ls.equals("")))  xydy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xydy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小于等于（mm）]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_tgjsbm ( tgjsbm,tgjsmc,dy,xydy ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tgjsbm);
	ps.setString(2,tgjsmc);
	ps.setLong(3,dy);
	ps.setLong(4,xydy);
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
	out.print("存盘失败,发生意外: " + e);
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