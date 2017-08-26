<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String blxhbm=null;
double dj=0;
long sl=0;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
blxhbm=cf.GB2Uni(request.getParameter("blxhbm"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订购数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String lrxh=request.getParameter("lrxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double blzxje=0;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update jc_blddmx set yddbh=?,blxhbm=?,dj=?,sl=?,bz=? ";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setString(2,blxhbm);
	ps.setDouble(3,dj);
	ps.setLong(4,sl);
	ps.setString(5,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="select sum(dj*sl)";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  yddbh='"+yddbh+"' and  lx='2' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		blzxje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_mmydd set blzxje=?";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,blzxje);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！玻璃增项总额=<%=blzxje%>");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>