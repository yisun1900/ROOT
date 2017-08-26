<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String tcmc=null;
String hxbm=null;
long bzmj=0;
double tcjg=0;
double pmzjdj=0;

dqbm=cf.GB2Uni(request.getParameter("dqbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
ls=request.getParameter("bzmj");
try{
	if (!(ls.equals("")))  bzmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bzmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��׼���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tcjg");
try{
	if (!(ls.equals("")))  tcjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcjg]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײͼ۸�]����ת����������:"+e);
	return;
}
ls=request.getParameter("pmzjdj");
try{
	if (!(ls.equals("")))  pmzjdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[pmzjdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ�����ӵ���]����ת����������:"+e);
	return;
}
String mjsfkzj=request.getParameter("mjsfkzj");
String zcsfxxz=request.getParameter("zcsfxxz");
String lx=request.getParameter("lx");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into bj_wntcmc ( dqbm,tcmc,hxbm,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,tcmc);
	ps.setString(3,hxbm);
	ps.setLong(4,bzmj);
	ps.setDouble(5,tcjg);
	ps.setDouble(6,pmzjdj);
	ps.setString(7,mjsfkzj);
	ps.setString(8,zcsfxxz);
	ps.setString(9,lx);
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