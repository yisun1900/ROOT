<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long sjzprs=0;
double sjzpfy=0;
java.sql.Date sjkssj=null;
java.sql.Date sjjssj=null;
String bz=null;
ls=request.getParameter("sjzprs");
try{
	if (!(ls.equals("")))  sjzprs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjzprs������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ����Ƹ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzpfy");
try{
	if (!(ls.equals("")))  sjzpfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjzpfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ����Ƹ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjkssj");
try{
	if (!(ls.equals("")))  sjkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ����Ƹ��ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjjssj");
try{
	if (!(ls.equals("")))  sjjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ����Ƹ����ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherezpjhbh=null;
wherezpjhbh=cf.GB2Uni(request.getParameter("wherezpjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_zpjhjg set sjzprs=?,sjzpfy=?,sjkssj=?,sjjssj=?,bz=? ";
	ls_sql+=" where  (zpjhbh='"+wherezpjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,sjzprs);
	ps.setDouble(2,sjzpfy);
	ps.setDate(3,sjkssj);
	ps.setDate(4,sjjssj);
	ps.setString(5,bz);
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