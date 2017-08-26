<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String djxh=null;
String khbh=null;
String zpnr=null;
String jsr=null;
String bz=null;
java.sql.Date djrq=null;
djxh=cf.GB2Uni(request.getParameter("djxh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
zpnr=cf.GB2Uni(request.getParameter("zpnr"));
jsr=cf.GB2Uni(request.getParameter("jsr"));
bz=cf.GB2Uni(request.getParameter("bz"));
ls=request.getParameter("djrq");
try{
	if (!(ls.equals("")))  djrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[登记日期]类型转换发生意外:"+e);
	return;
}
String wheredjxh=null;
wheredjxh=cf.GB2Uni(request.getParameter("wheredjxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update qh_lfcxdjb set djxh=?,khbh=?,zpnr=?,jsr=?,djrq=?,bz=? ";
	ls_sql+=" where  (djxh='"+wheredjxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djxh);
	ps.setString(2,khbh);
	ps.setString(3,zpnr);
	ps.setString(4,jsr);
	ps.setDate(5,djrq);
	ps.setString(6,bz);
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
	out.print("Exception: " + e);
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