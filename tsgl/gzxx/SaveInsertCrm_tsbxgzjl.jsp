<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gzjlh=null;
String tsjlh=null;
String khbh=null;
String qksm=null;
java.sql.Date lrsj=null;
String lrr=null;
String lrbm=null;
String lx=null;
gzjlh=cf.GB2Uni(request.getParameter("gzjlh"));
tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
qksm=cf.GB2Uni(request.getParameter("qksm"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
lx=cf.GB2Uni(request.getParameter("lx"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into crm_tsbxgzjl ( gzjlh,tsjlh,khbh,qksm,lrsj,lrr,lrbm,lx,zt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,'1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gzjlh);
	ps.setString(2,tsjlh);
	ps.setString(3,khbh);
	ps.setString(4,qksm);
	ps.setDate(5,lrsj);
	ps.setString(6,lrr);
	ps.setString(7,lrbm);
	ps.setString(8,lx);
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