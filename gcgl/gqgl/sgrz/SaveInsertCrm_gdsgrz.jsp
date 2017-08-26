<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String djbh=null;
String khbh=null;
String qksm=null;
String lrr=null;
java.sql.Date lrsj=null;
djbh=cf.GB2Uni(request.getParameter("djbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
qksm=cf.GB2Uni(request.getParameter("qksm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into crm_gdsgrz ( djbh,khbh,qksm,lrr,lrsj,sybz ) ";
	ls_sql+=" values ( ?,?,?,?,?,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djbh);
	ps.setString(2,khbh);
	ps.setString(3,qksm);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
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