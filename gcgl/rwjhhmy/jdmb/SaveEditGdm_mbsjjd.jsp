<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mbbm=null;
String rwbm=null;
int rwsfsj=0;
int rwts=0;
int rwxh=0;
mbbm=cf.GB2Uni(request.getParameter("mbbm"));
rwbm=cf.GB2Uni(request.getParameter("rwbm"));
ls=request.getParameter("rwsfsj");
try{
	if (!(ls.equals("")))  rwsfsj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rwsfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("rwts");
try{
	if (!(ls.equals("")))  rwts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rwts������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("rwxh");
try{
	if (!(ls.equals("")))  rwxh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rwxh������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}

String wherembbm=null;
String whererwbm=null;
wherembbm=cf.GB2Uni(request.getParameter("wherembbm"));
whererwbm=cf.GB2Uni(request.getParameter("whererwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update gdm_mbsjjd set mbbm=?,rwbm=?,rwsfsj=?,rwts=?,rwxh=? ";
	ls_sql+=" where  (mbbm='"+wherembbm+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mbbm);
	ps.setString(2,rwbm);
	ps.setInt(3,rwsfsj);
	ps.setInt(4,rwts);
	ps.setInt(5,rwxh);
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