<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sglb=null;
String ssfgs=null;
String sgr=null;
java.sql.Date sgrq=null;
String psfs=null;
java.sql.Date jhshsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String ssbm=null;
String bz=null;
sglb=cf.GB2Uni(request.getParameter("sglb"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
sgr=cf.GB2Uni(request.getParameter("sgr"));
ls=request.getParameter("sgrq");
try{
	if (!(ls.equals("")))  sgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sgrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�깺����]����ת����������:"+e);
	return;
}
psfs=cf.GB2Uni(request.getParameter("psfs"));
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhshsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ��ͻ�ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
ssbm=cf.GB2Uni(request.getParameter("ssbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String sgph=null;
sgph=cf.GB2Uni(request.getParameter("sgph"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_clsgd set sgph=?,sglb=?,ssfgs=?,sgr=?,sgrq=?,psfs=?,jhshsj=?,lrr=?,lrsj=SYSDATE,ssbm=?,bz=? ";
	ls_sql+=" where  (sgph='"+sgph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgph);
	ps.setString(2,sglb);
	ps.setString(3,ssfgs);
	ps.setString(4,sgr);
	ps.setDate(5,sgrq);
	ps.setString(6,psfs);
	ps.setDate(7,jhshsj);
	ps.setString(8,lrr);
	ps.setString(9,ssbm);
	ps.setString(10,bz);
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