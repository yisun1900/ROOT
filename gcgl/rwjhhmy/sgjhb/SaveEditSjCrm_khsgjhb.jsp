<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String rwbm=request.getParameter("rwbm");

String ls=null;
java.sql.Date sjkssj=null;
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
java.sql.Date sjjssj=null;
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
double sjgzr=0;
ls=request.getParameter("sjgzr");
try{
	if (!(ls.equals("")))  sjgzr=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjgzr]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʹ�����]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_khsgjhb set rwsfwc='Y',sjkssj=?,sjjssj=?,sjgzr=?,sfyq='N'";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjkssj);
	ps.setDate(2,sjjssj);
	ps.setDouble(3,sjgzr);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khsgjhb set sfyq='Y'";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and rwbm='"+rwbm+"'";
	ls_sql+=" and zxjhjssj<sjjssj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>