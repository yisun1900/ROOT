<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pfjecdf=null;
double pfje=0;
String shr=null;
java.sql.Date shsj=null;
String shyj=null;

pfjecdf=cf.GB2Uni(request.getParameter("pfjecdf"));
ls=request.getParameter("pfje");
try{
	if (!(ls.equals("")))  pfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[pfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�⸶���]����ת����������:"+e);
	return;
}

shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[shsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}
shyj=cf.GB2Uni(request.getParameter("shyj"));

String pfjlh=request.getParameter("pfjlh");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update crm_khpfd set pfzt='2',pfjecdf=?,pfje=?,shr=?,shsj=?,shyj=? ";
	ls_sql+=" where pfjlh='"+pfjlh+"' and pfzt='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pfjecdf);
	ps.setDouble(2,pfje);
	ps.setString(3,shr);
	ps.setDate(4,shsj);
	ps.setString(5,shyj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>���ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("��˳ɹ���");
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