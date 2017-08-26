<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String lbmc=null;
String sfbx=null;
double lbzqj=0;
double lbyhj=0;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
lbmc=cf.GB2Uni(request.getParameter("lbmc"));
sfbx=cf.GB2Uni(request.getParameter("sfbx"));
ls=request.getParameter("lbzqj");
try{
	if (!(ls.equals("")))  lbzqj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lbzqj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[礼包折前价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lbyhj");
try{
	if (!(ls.equals("")))  lbyhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lbyhj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[礼包优惠价]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into tc_yhlb ( dqbm,bjjbbm,lbmc,sfbx,lbzqj,lbyhj ) ";
	ls_sql+=" values ( ?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,lbmc);
	ps.setString(4,sfbx);
	ps.setDouble(5,lbzqj);
	ps.setDouble(6,lbyhj);
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