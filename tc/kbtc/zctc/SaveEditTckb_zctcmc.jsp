<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long tcbm=0;
String dqbm=null;
String tcmc=null;
double yj=0;
double tcj=0;
String bz=null;
ls=request.getParameter("tcbm");
try{
	if (!(ls.equals("")))  tcbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcbm]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
ls=request.getParameter("yj");
try{
	if (!(ls.equals("")))  yj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("tcj");
try{
	if (!(ls.equals("")))  tcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ����]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String bjjbbm=request.getParameter("bjjbbm");

String wheretcbm=null;
wheretcbm=cf.GB2Uni(request.getParameter("wheretcbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tckb_zctcmc set tcbm=?,dqbm=?,tcmc=?,yj=?,tcj=?,bz=?,bjjbbm=? ";
	ls_sql+=" where  (tcbm="+wheretcbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,tcbm);
	ps.setString(2,dqbm);
	ps.setString(3,tcmc);
	ps.setDouble(4,yj);
	ps.setDouble(5,tcj);
	ps.setString(6,bz);
	ps.setString(7,bjjbbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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