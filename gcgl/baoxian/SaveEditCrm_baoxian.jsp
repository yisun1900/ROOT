<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double cdbxje=0;
double rybxje=0;
java.sql.Date baokssj=null;
java.sql.Date baozzsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("cdbxje");
try{
	if (!(ls.equals("")))  cdbxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cdbxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ر��ս��]����ת����������:"+e);
	return;
}
ls=request.getParameter("rybxje");
try{
	if (!(ls.equals("")))  rybxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rybxje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ա���ս��]����ת����������:"+e);
	return;
}
ls=request.getParameter("baokssj");
try{
	if (!(ls.equals("")))  baokssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[baokssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���տ�ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("baozzsj");
try{
	if (!(ls.equals("")))  baozzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[baozzsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ֹʱ��]����ת����������:"+e);
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
bz=cf.GB2Uni(request.getParameter("bz"));
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="update crm_baoxian set rybxje=?,cdbxje=?,baokssj=?,baozzsj=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,rybxje);
	ps.setDouble(2,cdbxje);
	ps.setDate(3,baokssj);
	ps.setDate(4,baozzsj);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,bz);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="update crm_khxx set sfysbx='2' ";//1��δ�ϱ��գ�2���ѱ���
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
		
		
	conn.commit();

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
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>