<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String ppgys=null;
String zcdlbm=null;
String zcxlbm=null;
double yj=0;
double zhj=0;
double dj=0;
double ssk=0;
java.sql.Date rq=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ppgys=cf.GB2Uni(request.getParameter("ppgys"));
zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="insert into jc_khzcgmmx ( khbh,ppgys,zcdlbm,zcxlbm,yj,zhj,dj,ssk,rq,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,ppgys);
	ps.setString(3,zcdlbm);
	ps.setString(4,zcxlbm);
	ps.setDouble(5,yj);
	ps.setDouble(6,zhj);
	ps.setDouble(7,dj);
	ps.setDouble(8,ssk);
	ps.setDate(9,rq);
	ps.setString(10,bz);
	ps.executeUpdate();
	ps.close();

	
	double zje=0;

	ls_sql =" select sum(zhj)";
	ls_sql+=" from jc_khzcgmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_khzcgmxx set zje="+zje;
	ls_sql+=" where khbh='"+khbh+"'";
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
	out.print("<BR>存盘失败,发生意外: " + e);
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