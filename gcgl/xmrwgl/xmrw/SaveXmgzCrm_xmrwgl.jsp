<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long jddf=0;
java.sql.Date sjkssj=null;
java.sql.Date sjjssj=null;
long sjgzr=0;
String sfyq=null;
long yqts=0;
String sfybgd=null;
String sfyfbd=null;
String sffszg=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("jddf");
try{
	if (!(ls.equals("")))  jddf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jddf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ڵ�÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjkssj");
try{
	if (!(ls.equals("")))  sjkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjkssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʿ�ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjjssj");
try{
	if (!(ls.equals("")))  sjjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjjssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʽ���ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjgzr");
try{
	if (!(ls.equals("")))  sjgzr=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjgzr]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʹ�����]����ת����������:"+e);
	return;
}
sfyq=cf.GB2Uni(request.getParameter("sfyq"));
ls=request.getParameter("yqts");
try{
	if (!(ls.equals("")))  yqts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yqts]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
sfybgd=cf.GB2Uni(request.getParameter("sfybgd"));
sfyfbd=cf.GB2Uni(request.getParameter("sfyfbd"));
sffszg=cf.GB2Uni(request.getParameter("sffszg"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String khbh=null;
String rwbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
rwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_xmrwgl set jddf=?,sjkssj=?,sjjssj=?,sjgzr=?,sfyq=?,yqts=?,sfybgd=?,sfyfbd=?,sffszg=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (khbh='"+khbh+"') and  (rwbm='"+rwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,jddf);
	ps.setDate(2,sjkssj);
	ps.setDate(3,sjjssj);
	ps.setLong(4,sjgzr);
	ps.setString(5,sfyq);
	ps.setLong(6,yqts);
	ps.setString(7,sfybgd);
	ps.setString(8,sfyfbd);
	ps.setString(9,sffszg);
	ps.setString(10,lrr);
	ps.setDate(11,lrsj);
	ps.setString(12,lrbm);
	ps.setString(13,bz);
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