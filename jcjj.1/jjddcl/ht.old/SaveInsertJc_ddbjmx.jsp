<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long gtxh=0;
String ddbh=null;
String jjbjmcbm=null;
long bjcd=0;
long bjkd=0;
long sl=0;
long dj=0;
long je=0;
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
jjbjmcbm=cf.GB2Uni(request.getParameter("jjbjmcbm"));
ls=request.getParameter("bjcd");
try{
	if (!(ls.equals("")))  bjcd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bjcd������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ȣ�mm��]����ת����������:"+e);
	return;
}
ls=request.getParameter("bjkd");
try{
	if (!(ls.equals("")))  bjkd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bjkd������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ȣ�mm��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����je������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
int bjxh=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(bjxh),0)";
	ls_sql+=" from  jc_ddbjmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	bjxh++;
	
	ls_sql="insert into jc_ddbjmx ( bjxh,gtxh,ddbh,jjbjmcbm,bjcd,bjkd,sl,dj,je,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,bjxh);
	ps.setLong(2,gtxh);
	ps.setString(3,ddbh);
	ps.setString(4,jjbjmcbm);
	ps.setLong(5,bjcd);
	ps.setLong(6,bjkd);
	ps.setLong(7,sl);
	ps.setLong(8,dj);
	ps.setLong(9,je);
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
	out.print("����ʧ��,��������: " + e);
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