<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String rwbm=request.getParameter("rwbm");

String ls=null;
java.sql.Date zxjhkssj=null;
ls=request.getParameter("zxjhkssj");
try{
	if (!(ls.equals("")))  zxjhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxjhkssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���ʼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date zxjhjssj=null;
ls=request.getParameter("zxjhjssj");
try{
	if (!(ls.equals("")))  zxjhjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxjhjssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���¼ƻ�����ʱ��]����ת����������:"+e);
	return;
}
double zxjhgzr=0;
ls=request.getParameter("zxjhgzr");
try{
	if (!(ls.equals("")))  zxjhgzr=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxjhgzr]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�������]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update crm_khsgjhb set zxjhkssj=?,zxjhjssj=?,zxjhgzr=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,zxjhkssj);
	ps.setDate(2,zxjhjssj);
	ps.setDouble(3,zxjhgzr);
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