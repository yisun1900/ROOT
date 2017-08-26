<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String djbh=null;
String khbh=null;
String gtr=null;
java.sql.Date gtsj=null;
String qksm=null;
String sfxcl=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
djbh=cf.GB2Uni(request.getParameter("djbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
gtr=cf.GB2Uni(request.getParameter("gtr"));
ls=request.getParameter("gtsj");
try{
	if (!(ls.equals("")))  gtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gtsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[沟通时间]类型转换发生意外:"+e);
	return;
}
qksm=cf.GB2Uni(request.getParameter("qksm"));
sfxcl=cf.GB2Uni(request.getParameter("sfxcl"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into crm_khgtjl ( djbh,khbh,gtr,gtsj,qksm,sfxcl,lrr,lrsj,lrbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djbh);
	ps.setString(2,khbh);
	ps.setString(3,gtr);
	ps.setDate(4,gtsj);
	ps.setString(5,qksm);
	ps.setString(6,sfxcl);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
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