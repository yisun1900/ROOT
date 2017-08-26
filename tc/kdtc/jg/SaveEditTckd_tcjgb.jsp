<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String tcmc=null;
long fwmj=0;
double tcjg=0;
double pmzjdj=0;
double tlgbzjj=0;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fwmj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڻ�׼���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tcjg");
try{
	if (!(ls.equals("")))  tcjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcjg]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײͼ۸�]����ת����������:"+e);
	return;
}
ls=request.getParameter("pmzjdj");
try{
	if (!(ls.equals("")))  pmzjdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[pmzjdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ�����ӵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tlgbzjj");
try{
	if (!(ls.equals("")))  tlgbzjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tlgbzjj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ϳ�ϸ�Ϊ��ֽ�Ӽ�]����ת����������:"+e);
	return;
}

double dbhddzjj=0;
ls=request.getParameter("dbhddzjj");
try{
	if (!(ls.equals("")))  dbhddzjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dbhddzjj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ذ廻���ש�շ�]����ת����������:"+e);
	return;
}
String wheredqbm=null;
String wherebjjbbm=null;
String wherehxbm=null;
String wheretcmc=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
wherehxbm=cf.GB2Uni(request.getParameter("wherehxbm"));
wheretcmc=cf.GB2Uni(request.getParameter("wheretcmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tckd_tcjgb set dqbm=?,bjjbbm=?,hxbm=?,tcmc=?,fwmj=?,tcjg=?,pmzjdj=?,tlgbzjj=?,dbhddzjj=? ";
	ls_sql+=" where  (tcmc='"+wheretcmc+"') and  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,hxbm);
	ps.setString(4,tcmc);
	ps.setLong(5,fwmj);
	ps.setDouble(6,tcjg);
	ps.setDouble(7,pmzjdj);
	ps.setDouble(8,tlgbzjj);
	ps.setDouble(9,dbhddzjj);
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