<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String ssfgs=null;
String sbr=null;
java.sql.Date sbsj=null;
String lrr=null;
String lrbm=null;
java.sql.Date lrsj=null;
java.sql.Date ybjyxq=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
sbr=cf.GB2Uni(request.getParameter("sbr"));
ls=request.getParameter("sbsj");
try{
	if (!(ls.equals("")))  sbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sbsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�걨ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
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
ls=request.getParameter("ybjyxq");
try{
	if (!(ls.equals("")))  ybjyxq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ybjyxq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������Ч��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into ybj_ybjsb ( khbh,ssfgs,sbr,sbsj,lrr,lrsj,lrbm,clzt,bz,ybjyxq ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,'1',?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,ssfgs);
	ps.setString(3,sbr);
	ps.setDate(4,sbsj);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,bz);
	ps.setDate(9,ybjyxq);
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
	out.print("����ʧ��,��������: " + e);
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