<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String clbm=null;
double cj=0;
double cjjsj=0;
double fgsdj=0;
double gdj=0;
String ckmc=null;
String sfrk=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
clbm=cf.GB2Uni(request.getParameter("clbm"));
ls=request.getParameter("cj");
try{
	if (!(ls.equals("")))  cj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("cjjsj");
try{
	if (!(ls.equals("")))  cjjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�볧�ҽ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("fgsdj");
try{
	if (!(ls.equals("")))  fgsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fgsdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ֹ�˾���ϵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("gdj");
try{
	if (!(ls.equals("")))  gdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ӽ�]����ת����������:"+e);
	return;
}
ckmc=cf.GB2Uni(request.getParameter("ckmc"));
sfrk=cf.GB2Uni(request.getParameter("sfrk"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cl_jgmx ( dwbh,clbm,cj,cjjsj,fgsdj,gdj,ckmc,sfrk ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,clbm);
	ps.setDouble(3,cj);
	ps.setDouble(4,cjjsj);
	ps.setDouble(5,fgsdj);
	ps.setDouble(6,gdj);
	ps.setString(7,ckmc);
	ps.setString(8,sfrk);
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
	out.print("<BR>����ʧ��,��������: " + e);
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