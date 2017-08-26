<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqr=null;
java.sql.Date bxrq=null;
java.sql.Date jhlqrq=null;
String sfyzysj=null;
String gzxxsm=null;
String lrr=null;
sqr=cf.GB2Uni(request.getParameter("sqr"));
ls=request.getParameter("bxrq");
try{
	if (!(ls.equals("")))  bxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bxrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[报修日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhlqrq");
try{
	if (!(ls.equals("")))  jhlqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhlqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[希望完成日期]类型转换发生意外:"+e);
	return;
}
sfyzysj=cf.GB2Uni(request.getParameter("sfyzysj"));
gzxxsm=cf.GB2Uni(request.getParameter("gzxxsm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));

String dnsbflmc=cf.GB2Uni(request.getParameter("dnsbflmc"));
String dnsbgzmc=cf.GB2Uni(request.getParameter("dnsbgzmc"));


String wherebxxh=null;
wherebxxh=cf.GB2Uni(request.getParameter("wherebxxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_dnsbbxsq set sqr=?,bxrq=?,jhlqrq=?,sfyzysj=?,gzxxsm=?,lrr=?,dnsbflmc=?,dnsbgzmc=? ";
	ls_sql+=" where  (bxxh="+wherebxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqr);
	ps.setDate(2,bxrq);
	ps.setDate(3,jhlqrq);
	ps.setString(4,sfyzysj);
	ps.setString(5,gzxxsm);
	ps.setString(6,lrr);
	ps.setString(7,dnsbflmc);
	ps.setString(8,dnsbgzmc);
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