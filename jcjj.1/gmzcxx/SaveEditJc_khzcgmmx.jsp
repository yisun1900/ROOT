<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double yj=0;
double zhj=0;
double dj=0;
double ssk=0;
java.sql.Date rq=null;
String bz=null;
ls=request.getParameter("yj");
try{
	if (!(ls.equals("")))  yj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zhj");
try{
	if (!(ls.equals("")))  zhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zhj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ssk");
try{
	if (!(ls.equals("")))  ssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ssk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实收款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rq");
try{
	if (!(ls.equals("")))  rq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[日期]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekhbh=null;
String whereppgys=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
whereppgys=cf.GB2Uni(request.getParameter("whereppgys"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	
	ls_sql="update jc_khzcgmmx set yj=?,zhj=?,dj=?,ssk=?,rq=?,bz=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (ppgys='"+whereppgys+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,yj);
	ps.setDouble(2,zhj);
	ps.setDouble(3,dj);
	ps.setDouble(4,ssk);
	ps.setDate(5,rq);
	ps.setString(6,bz);
	ps.executeUpdate();
	ps.close();

	
	double zje=0;

	ls_sql =" select sum(zhj)";
	ls_sql+=" from jc_khzcgmmx";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_khzcgmxx set zje="+zje;
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>