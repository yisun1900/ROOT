<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long sjpxrs=0;
//long hgrs=0;
//
double sjpxfy=0;
//java.sql.Date sjkssj=null;
//java.sql.Date sjjssj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String pxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
String jhjg=cf.GB2Uni(request.getParameter("jhjg"));

//ls=request.getParameter("sjpxrs");
//try{
//	if (!(ls.equals("")))  sjpxrs=Long.parseLong(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>����sjpxrs������");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[ʵ����ѵ����]����ת����������:"+e);
//	return;
//}
//ls=request.getParameter("hgrs");
//try{
//	if (!(ls.equals("")))  hgrs=Long.parseLong(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>����hgrs������");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[�ϸ�����]����ת����������:"+e);
//	return;
//}
//
//ls=request.getParameter("sjpxfy");
//try{
//	if (!(ls.equals("")))  sjpxfy=Double.parseDouble(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>����sjpxfy������");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[ʵ����ѵ����]����ת����������:"+e);
//	return;
//}
//ls=request.getParameter("sjkssj");
//try{
//	if (!(ls.equals("")))  sjkssj=java.sql.Date.valueOf(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>����sjkssj������");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[ʵ����ѵ��ʼʱ��]����ת����������:"+e);
//	return;
//}
//ls=request.getParameter("sjjssj");
//try{
//	if (!(ls.equals("")))  sjjssj=java.sql.Date.valueOf(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>����sjjssj������");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[ʵ����ѵ����ʱ��]����ת����������:"+e);
//	return;
//}
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

	ls_sql="insert into rs_pxjhjg ( bz,pxjhbh,lrr,lrsj,jhjg,sjpxrs,sjpxfy ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bz);	
	ps.setString(2,pxjhbh);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,jhjg);
	ps.setLong(6,sjpxrs);
	ps.setDouble(7,sjpxfy);

	ps.executeUpdate();
	ps.close();
//�м�״̬¼��δ���
	ls_sql="update rs_pxjh set jhzt='7' ";
	ls_sql+=" where pxjhbh='"+pxjhbh+"' ";
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
	out.print("����ʧ��,��������: " + e+ls_sql);
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