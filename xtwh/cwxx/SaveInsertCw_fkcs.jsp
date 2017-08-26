<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long fkcs=0;
String fkcsmc=null;
ls=request.getParameter("fkcs");
try{
	if (!(ls.equals("")))  fkcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fkcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收款期数编码]类型转换发生意外:"+e);
	return;
}
fkcsmc=cf.GB2Uni(request.getParameter("fkcsmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_fkcs ( fkcs,fkcsmc) ";
	ls_sql+=" values ( ?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,fkcs);
	ps.setString(2,fkcsmc);
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