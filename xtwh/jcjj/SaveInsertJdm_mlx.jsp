<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mlx=null;
String mlxmc=null;
mlx=cf.GB2Uni(request.getParameter("mlx"));
mlxmc=cf.GB2Uni(request.getParameter("mlxmc"));
int gdbxy=0;
ls=request.getParameter("gdbxy");
try{
	if (!(ls.equals("")))  gdbxy=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gdbxy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�߶Ȳ�С��]����ת����������:"+e);
	return;
}
int gdbdy=0;
ls=request.getParameter("gdbdy");
try{
	if (!(ls.equals("")))  gdbdy=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gdbdy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�߶Ȳ�����]����ת����������:"+e);
	return;
}
int kdbxy=0;
ls=request.getParameter("kdbxy");
try{
	if (!(ls.equals("")))  kdbxy=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kdbxy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ȳ�С��]����ת����������:"+e);
	return;
}
int kdbdy=0;
ls=request.getParameter("kdbdy");
try{
	if (!(ls.equals("")))  kdbdy=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kdbdy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ȳ�����]����ת����������:"+e);
	return;
}
String tx=cf.GB2Uni(request.getParameter("tx"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_mlx ( mlx,mlxmc,gdbxy,gdbdy,kdbxy,kdbdy,tx) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mlx);
	ps.setString(2,mlxmc);
	ps.setInt(3,gdbxy);
	ps.setInt(4,gdbdy);
	ps.setInt(5,kdbxy);
	ps.setInt(6,kdbdy);
	ps.setString(7,tx);
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