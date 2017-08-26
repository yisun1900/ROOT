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
double tcjg=0;

dqbm=cf.GB2Uni(request.getParameter("dqbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
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


	ls_sql="update bj_cltcmc set dqbm=?,tcmc=?,hxbm=?,tcjg=?,zcsfxxz=?,lx=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (tcmc='"+wheretcmc+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,tcmc);
	ps.setString(3,hxbm);
	ps.setDouble(4,tcjg);
	ps.setString(5,zcsfxxz);
	ps.setString(6,lx);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_cltczcmx set dqbm=?,tcmc=?,hxbm=? ";
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