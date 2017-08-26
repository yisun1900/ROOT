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
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String zpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
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
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into rs_zpjhjg ( sjzprs,sjzpfy,sjkssj,sjjssj,bz,zpjhbh,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,sjzprs);
	ps.setDouble(2,sjzpfy);
	ps.setDate(3,sjkssj);
	ps.setDate(4,sjjssj);
	ps.setString(5,bz);	
	ps.setString(6,zpjhbh);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);

	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_zpjh set jhzt='3' ";
	ls_sql+=" where zpjhbh='"+zpjhbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("����ɹ�!");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>