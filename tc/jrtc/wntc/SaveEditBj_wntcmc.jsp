<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String dqbm=null;
String tcmc=null;
String hxbm=null;
long bzmj=0;
double tcjg=0;
double pmzjdj=0;

dqbm=cf.GB2Uni(request.getParameter("dqbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
ls=request.getParameter("bzmj");
try{
	if (!(ls.equals("")))  bzmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tcjg");
try{
	if (!(ls.equals("")))  tcjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pmzjdj");
try{
	if (!(ls.equals("")))  pmzjdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[pmzjdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平米增加单价]类型转换发生意外:"+e);
	return;
}
String mjsfkzj=request.getParameter("mjsfkzj");
String zcsfxxz=request.getParameter("zcsfxxz");
String lx=request.getParameter("lx");

String wheredqbm=null;
String wheretcmc=null;
String wherehxbm=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wheretcmc=cf.GB2Uni(request.getParameter("wheretcmc"));
wherehxbm=cf.GB2Uni(request.getParameter("wherehxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="update bj_wntcmc set dqbm=?,tcmc=?,hxbm=?,bzmj=?,tcjg=?,pmzjdj=?,mjsfkzj=?,zcsfxxz=?,lx=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (tcmc='"+wheretcmc+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,tcmc);
	ps.setString(3,hxbm);
	ps.setLong(4,bzmj);
	ps.setDouble(5,tcjg);
	ps.setDouble(6,pmzjdj);
	ps.setString(7,mjsfkzj);
	ps.setString(8,zcsfxxz);
	ps.setString(9,lx);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_wntczcmx set dqbm=?,tcmc=?,hxbm=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (tcmc='"+wheretcmc+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,tcmc);
	ps.setString(3,hxbm);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>