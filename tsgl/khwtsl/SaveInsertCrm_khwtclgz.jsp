<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String wtbh=null;
String wtflbm=null;
String wtsm=null;
java.sql.Date yqjjsj=null;
String slr=null;
java.sql.Date slsj=null;
String slbm=null;
String lxfs=null;
String bz=null;
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
wtbh=cf.GB2Uni(request.getParameter("wtbh"));
wtflbm=cf.GB2Uni(request.getParameter("wtflbm"));
wtsm=cf.GB2Uni(request.getParameter("wtsm"));
ls=request.getParameter("yqjjsj");
try{
	if (!(ls.equals("")))  yqjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[要求解决时间]类型转换发生意外:"+e);
	return;
}
slr=cf.GB2Uni(request.getParameter("slr"));
ls=request.getParameter("slsj");
try{
	if (!(ls.equals("")))  slsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量slsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客服受理时间]类型转换发生意外:"+e);
	return;
}
slbm=cf.GB2Uni(request.getParameter("slbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set lxfs=? where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lxfs);
	ps.executeUpdate();
	ps.close();
	
	
	ls_sql="insert into crm_khwtclgz ( khbh,wtbh,wtflbm,wtsm,yqjjsj,slr,slsj,slbm,bz,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,'1') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,wtbh);
	ps.setString(3,wtflbm);
	ps.setString(4,wtsm);
	ps.setDate(5,yqjjsj);
	ps.setString(6,slr);
	ps.setDate(7,slsj);
	ps.setString(8,slbm);
	ps.setString(9,bz);
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
	out.print("存盘失败,发生意外: " + e);
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