<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
int jlh= Integer.parseInt(request.getParameter("jlh").trim());
String ls=null;
String khbh=null;
String damxbm=null;
String bz=null;
String jsr=null;
String jsrdw=null;
String jsrfgs=null;
String lrr=null;
java.sql.Date lrsj=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
damxbm=cf.GB2Uni(request.getParameter("damxbm"));
java.sql.Date yjsj=null;
ls=request.getParameter("yjsj");
try{
	if (!(ls.equals("")))  yjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[移交时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

bz=cf.GB2Uni(request.getParameter("bz"));
jsr=cf.GB2Uni(request.getParameter("jsr"));
jsrdw=cf.GB2Uni(request.getParameter("jsrdw"));
jsrfgs=cf.GB2Uni(request.getParameter("jsrfgs"));
lrr=cf.GB2Uni(request.getParameter("lrr"));

Connection conn  = null;
PreparedStatement ps=null;

String ls_sql=null;
	

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_gcdayjjl set jsr=?,jsrdw=?,jsrfgs=?,lrr=?,lrsj=?,bz=?,yjsj=?  ";
	ls_sql+=" where jlh='"+jlh+"' ";
	ps= conn.prepareStatement(ls_sql);

	ps.setString(1,jsr);
	ps.setString(2,jsrdw);
	ps.setString(3,jsrfgs);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,bz);
	ps.setDate(7,yjsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_gcdagl set bgr='"+jsr+"', bgrdw='"+jsrdw+"',bgrfgs='"+jsrfgs+"',bgsj=TO_DATE('"+yjsj+"','yyyy-mm-dd') ";
	ls_sql+=" where khbh='"+khbh+"' and damxbm='"+damxbm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e );
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