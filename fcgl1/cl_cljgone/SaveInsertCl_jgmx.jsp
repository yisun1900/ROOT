<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String clbm=null;
double cjjsj=0;
double gdj=0;
String ckmc=null;
String sfrk=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
clbm=cf.GB2Uni(request.getParameter("clbm"));
ls=request.getParameter("cjjsj");
try{
	if (!(ls.equals("")))  cjjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[与厂家结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdj");
try{
	if (!(ls.equals("")))  gdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工队价]类型转换发生意外:"+e);
	return;
}
ckmc=cf.GB2Uni(request.getParameter("ckmc"));
sfrk=cf.GB2Uni(request.getParameter("sfrk"));

String tzr=cf.GB2Uni(request.getParameter("tzr"));
java.sql.Date tzsj=null;
ls=request.getParameter("tzsj");
try{
	if (!(ls.equals("")))  tzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[调整时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from cl_jgmx ";
	ls_sql+=" where cl_jgmx.dwbh='"+dwbh+"' and cl_jgmx.clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cl_jgmx ( dwbh,clbm,cjjsj,gdj,ckmc,sfrk,tzr,tzsj   ,cj,fgsdj,sfycx) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,SYSDATE    ,0,0,'N') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,clbm);
	ps.setDouble(3,cjjsj);
	ps.setDouble(4,gdj);
	ps.setString(5,ckmc);
	ps.setString(6,sfrk); 
	ps.setString(7,tzr);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>