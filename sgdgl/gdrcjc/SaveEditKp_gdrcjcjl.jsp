<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sgd=null;
String jcr=null;
java.sql.Date jcsj=null;
String rcjclxbm=null;
String rcjcjgbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String lrbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
jcr=cf.GB2Uni(request.getParameter("jcr"));
ls=request.getParameter("jcsj");
try{
	if (!(ls.equals("")))  jcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jcsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[检查时间]类型转换发生意外:"+e);
	return;
}
rcjclxbm=cf.GB2Uni(request.getParameter("rcjclxbm"));
rcjcjgbm=cf.GB2Uni(request.getParameter("rcjcjgbm"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String jcjlh=null;
jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_gdrcjcjl set jcjlh=?,khbh=?,sgd=?,jcr=?,jcsj=?,rcjclxbm=?,rcjcjgbm=?,lrr=?,lrsj=?,bz=?,lrbm=? ";
	ls_sql+=" where  (jcjlh='"+jcjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jcjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,jcr);
	ps.setDate(5,jcsj);
	ps.setString(6,rcjclxbm);
	ps.setString(7,rcjcjgbm);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,bz);
	ps.setString(11,lrbm);
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