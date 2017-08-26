<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yhdlm=null;
long ygbh=0;
String yhmc=null;
String txfs=null;
String txlx=null;
String txgjz=null;
String txnr=null;
java.sql.Date kstxsj=null;
String txzt=null;
java.sql.Date txsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ygbh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ա�����]����ת����������:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
txfs=cf.GB2Uni(request.getParameter("txfs"));
txlx=cf.GB2Uni(request.getParameter("txlx"));
txgjz=cf.GB2Uni(request.getParameter("txgjz"));
txnr=cf.GB2Uni(request.getParameter("txnr"));
ls=request.getParameter("kstxsj");
try{
	if (!(ls.equals("")))  kstxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kstxsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʼ����ʱ��]����ת����������:"+e);
	return;
}
txzt=cf.GB2Uni(request.getParameter("txzt"));
ls=request.getParameter("txsj");
try{
	if (!(ls.equals("")))  txsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[txsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_txxxb set yhdlm=?,ygbh=?,yhmc=?,txfs=?,txlx=?,txgjz=?,txnr=?,kstxsj=?,txzt=?,txsj=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhdlm);
	ps.setLong(2,ygbh);
	ps.setString(3,yhmc);
	ps.setString(4,txfs);
	ps.setString(5,txlx);
	ps.setString(6,txgjz);
	ps.setString(7,txnr);
	ps.setDate(8,kstxsj);
	ps.setString(9,txzt);
	ps.setDate(10,txsj);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.setString(13,lrbm);
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