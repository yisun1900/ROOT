<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jhbh=null;
String khbh=null;
String xjr=null;
java.sql.Date jhxjsj=null;
String xjlx=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
jhbh=cf.GB2Uni(request.getParameter("jhbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
xjr=cf.GB2Uni(request.getParameter("xjr"));
ls=request.getParameter("jhxjsj");
try{
	if (!(ls.equals("")))  jhxjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhxjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�Ѳ��ʱ��]����ת����������:"+e);
	return;
}
xjlx=cf.GB2Uni(request.getParameter("xjlx"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into kp_xjgdjh ( jhbh,khbh,xjr,jhxjsj,xjlx,lrr,lrsj,bz,wcbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,'1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jhbh);
	ps.setString(2,khbh);
	ps.setString(3,xjr);
	ps.setDate(4,jhxjsj);
	ps.setString(5,xjlx);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,bz);
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
	out.print("����ʧ��,��������: " + e);
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