<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double yqkje=0;
java.sql.Date eqksj=null;
double eqkje=0;
double sjysje=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("yqkje");
try{
	if (!(ls.equals("")))  yqkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yqkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[һ�ڿ�ʵ�ս��]����ת����������:"+e);
	return;
}
ls=request.getParameter("eqksj");
try{
	if (!(ls.equals("")))  eqksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����eqksj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڿ�Ӧ��ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("eqkje");
try{
	if (!(ls.equals("")))  eqkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����eqkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڿ�Ӧ�ս��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjysje");
try{
	if (!(ls.equals("")))  sjysje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjysje������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ��Ӧ�ս��]����ת����������:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_zqkzjxdj set yqkje=?,eqksj=?,eqkje=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,yqkje);
	ps.setDate(2,eqksj);
	ps.setDouble(3,eqkje);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,lrbm);
	ps.setString(7,bz);
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