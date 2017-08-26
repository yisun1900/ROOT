<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tsjlh=null;
long xtdxh=0;
String khbh=null;
String xtyy=null;
java.sql.Date xtrq=null;
String xtfgs=null;
String xtbm=null;
String xtr=null;
double xtfy=0;
long lrr=0;
java.sql.Date lrsj=null;
String lrrbm=null;
String bz=null;
tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
xtyy=cf.GB2Uni(request.getParameter("xtyy"));
ls=request.getParameter("xtrq");
try{
	if (!(ls.equals("")))  xtrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xtrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[协调日期]类型转换发生意外:"+e);
	return;
}
xtfgs=cf.GB2Uni(request.getParameter("xtfgs"));
xtbm=cf.GB2Uni(request.getParameter("xtbm"));
xtr=cf.GB2Uni(request.getParameter("xtr"));
ls=request.getParameter("xtfy");
try{
	if (!(ls.equals("")))  xtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[协调费用]类型转换发生意外:"+e);
	return;
}

lrrbm=cf.GB2Uni(request.getParameter("lrrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wheretsjlh=null;
String wherextdxh=null;
wheretsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
wherextdxh=cf.GB2Uni(request.getParameter("xtdxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_tsbxxtd set xtyy=?,xtrq=?,xtfgs=?,xtbm=?,xtr=?,xtfy=? ";
	ls_sql+=" where  (tsjlh='"+wheretsjlh+"') and (xtdxh="+wherextdxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtyy);
	ps.setDate(2,xtrq);
	ps.setString(3,xtfgs);
	ps.setString(4,xtbm);
	ps.setString(5,xtr);
	ps.setDouble(6,xtfy);

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