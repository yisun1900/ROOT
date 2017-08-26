<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date sjqd=null;
java.sql.Date sjzd=null;
String gzsm=null;
String lrr=null;
java.sql.Date lrsj=null;
ls=request.getParameter("sjqd");
try{
	if (!(ls.equals("")))  sjqd=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjqd������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzd");
try{
	if (!(ls.equals("")))  sjzd=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjzd������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ���յ�]����ת����������:"+e);
	return;
}
gzsm=cf.GB2Uni(request.getParameter("gzsm"));
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
String whereygbh=null;
String wheresjqd=null;
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
wheresjqd=cf.GB2Uni(request.getParameter("wheresjqd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_yggzbg set sjqd=?,sjzd=?,gzsm=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (sjqd=TO_DATE('"+wheresjqd+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjqd);
	ps.setDate(2,sjzd);
	ps.setString(3,gzsm);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
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