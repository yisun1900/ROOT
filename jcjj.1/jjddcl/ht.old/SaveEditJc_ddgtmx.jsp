<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long gtxh=0;
String ddbh=null;
String jjlbbm=null;
String jjgtmcbm=null;
long gtcd=0;
long gtkd=0;
long gtgd=0;
long gtbcysbm=0;
long zj=0;
String bz=null;
ls=request.getParameter("gtxh");
try{
	if (!(ls.equals("")))  gtxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gtxh������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
jjlbbm=cf.GB2Uni(request.getParameter("jjlbbm"));
jjgtmcbm=cf.GB2Uni(request.getParameter("jjgtmcbm"));
ls=request.getParameter("gtcd");
try{
	if (!(ls.equals("")))  gtcd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gtcd������");
	return;
}
catch (Exception e){
	out.println("<BR>[���峤��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gtkd");
try{
	if (!(ls.equals("")))  gtkd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gtkd������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("gtgd");
try{
	if (!(ls.equals("")))  gtgd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gtgd������");
	return;
}
catch (Exception e){
	out.println("<BR>[����߶�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gtbcysbm");
try{
	if (!(ls.equals("")))  gtbcysbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gtbcysbm������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ɫ]����ת����������:"+e);
	return;
}
ls=request.getParameter("zj");
try{
	if (!(ls.equals("")))  zj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ܼ�]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wheregtxh=null;
wheregtxh=cf.GB2Uni(request.getParameter("wheregtxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_ddgtmx set gtxh=?,ddbh=?,jjlbbm=?,jjgtmcbm=?,gtcd=?,gtkd=?,gtgd=?,gtbcysbm=?,zj=?,bz=? ";
	ls_sql+=" where  (gtxh="+wheregtxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,gtxh);
	ps.setString(2,ddbh);
	ps.setString(3,jjlbbm);
	ps.setString(4,jjgtmcbm);
	ps.setLong(5,gtcd);
	ps.setLong(6,gtkd);
	ps.setLong(7,gtgd);
	ps.setLong(8,gtbcysbm);
	ps.setLong(9,zj);
	ps.setString(10,bz);
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
	out.print("Exception: " + e);
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