<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bjbbh=null;
String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tcsjflbm=null;
String jldw=null;
double sjcj=0;
bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("sjcj");
try{
	if (!(ls.equals("")))  sjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjcj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级差价]类型转换发生意外:"+e);
	return;
}
String wherebjbbh=null;
String wheredqbm=null;
String wherebjjbbm=null;
String wherebjjbbm1=null;
String wheretcsjflbm=null;
wherebjbbh=cf.GB2Uni(request.getParameter("wherebjbbh"));
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
wherebjjbbm1=cf.GB2Uni(request.getParameter("wherebjjbbm1"));
wheretcsjflbm=cf.GB2Uni(request.getParameter("wheretcsjflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bj_tcsjcjb set bjbbh=?,dqbm=?,bjjbbm=?,bjjbbm1=?,tcsjflbm=?,jldw=?,sjcj=? ";
	ls_sql+=" where  (bjbbh='"+wherebjbbh+"') and  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (bjjbbm1='"+wherebjjbbm1+"') and  (tcsjflbm='"+wheretcsjflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,bjjbbm1);
	ps.setString(5,tcsjflbm);
	ps.setString(6,jldw);
	ps.setDouble(7,sjcj);
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