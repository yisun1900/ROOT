<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String lbmc=null;
String sfbx=null;
double lbzqj=0;
double lbyhj=0;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
lbmc=cf.GB2Uni(request.getParameter("lbmc"));
sfbx=cf.GB2Uni(request.getParameter("sfbx"));
ls=request.getParameter("lbzqj");
try{
	if (!(ls.equals("")))  lbzqj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lbzqj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ǰ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("lbyhj");
try{
	if (!(ls.equals("")))  lbyhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lbyhj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Żݼ�]����ת����������:"+e);
	return;
}
String wheredqbm=null;
String wherebjjbbm=null;
String wherelbmc=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
wherelbmc=cf.GB2Uni(request.getParameter("wherelbmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tc_yhlb set dqbm=?,bjjbbm=?,lbmc=?,sfbx=?,lbzqj=?,lbyhj=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (lbmc='"+wherelbmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,lbmc);
	ps.setString(4,sfbx);
	ps.setDouble(5,lbzqj);
	ps.setDouble(6,lbyhj);
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