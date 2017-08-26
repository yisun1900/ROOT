<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;

double cdbxje=0;
double rybxje=0;
java.sql.Date baokssj=null;
java.sql.Date baozzsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));

ls=request.getParameter("cdbxje");
try{
	if (!(ls.equals("")))  cdbxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cdbxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[场地保险金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rybxje");
try{
	if (!(ls.equals("")))  rybxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[rybxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人员保险金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("baokssj");
try{
	if (!(ls.equals("")))  baokssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[baokssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[保险开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("baozzsj");
try{
	if (!(ls.equals("")))  baozzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[baozzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[保险终止时间]类型转换发生意外:"+e);
	return;
}
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
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into crm_baoxian ( khbh,rybxje,cdbxje,baokssj,baozzsj,lrr,lrsj,lrbm,bz,zt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,'2' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setDouble(2,rybxje);
	ps.setDouble(3,cdbxje);
	ps.setDate(4,baokssj);
	ps.setDate(5,baozzsj);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,bz);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="update crm_khxx set sfysbx='2' ";//1：未上保险；2：已保险
	ls_sql+=" where khbh='"+khbh+"' ";
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>