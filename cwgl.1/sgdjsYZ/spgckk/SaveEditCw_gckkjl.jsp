<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
double spgckk=0;
double spsjsfy=0;
double spsgdfy=0;
double spzjfy=0;
double spgsfy=0;
double spqtfy=0;
String spyj=null;
ls=request.getParameter("spgckk");
try{
	if (!(ls.equals("")))  spgckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spgckk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̿ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("spsjsfy");
try{
	if (!(ls.equals("")))  spsjsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spsjsfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ�е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("spsgdfy");
try{
	if (!(ls.equals("")))  spsgdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spsgdfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӳе�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("spzjfy");
try{
	if (!(ls.equals("")))  spzjfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spzjfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ʼ�е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("spgsfy");
try{
	if (!(ls.equals("")))  spgsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spgsfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾�е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("spqtfy");
try{
	if (!(ls.equals("")))  spqtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spqtfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������е�����]����ת����������:"+e);
	return;
}
spyj=cf.GB2Uni(request.getParameter("spyj"));
String wherekkjlh=null;
wherekkjlh=cf.GB2Uni(request.getParameter("wherekkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cw_gckkjl set spgckk=?,spsjsfy=?,spsgdfy=?,spzjfy=?,spgsfy=?,spqtfy=?,spr=?,spsj=TRUNC(SYSDATE),spbz='3',spyj=? ";
	ls_sql+=" where  (kkjlh='"+wherekkjlh+"' )  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,spgckk);
	ps.setDouble(2,spsjsfy);
	ps.setDouble(3,spsgdfy);
	ps.setDouble(4,spzjfy);
	ps.setDouble(5,spgsfy);
	ps.setDouble(6,spqtfy);

	ps.setString(7,yhmc);
	ps.setString(8,spyj);
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