<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bjbbh=null;
String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tcsjflbm=null;
String jldw=null;
double sjcj=0;
bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("sjcj");
try{
	if (!(ls.equals("")))  sjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjcj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}


String sjsfycx=null;
double cxsjcj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjssj=null;

sjsfycx=request.getParameter("sjsfycx");
ls=request.getParameter("cxsjcj");
try{
	if (!(ls.equals("")))  cxsjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxsjcj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxkssj");
try{
	if (!(ls.equals("")))  cxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxjssj");
try{
	if (!(ls.equals("")))  cxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ʱ��]����ת����������:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="insert into bj_tcsjcjb ( bjbbh,dqbm,bjjbbm,bjjbbm1,tcsjflbm,jldw,sjcj,sjsfycx,cxkssj,cxjssj,cxsjcj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,bjjbbm1);
	ps.setString(5,tcsjflbm);
	ps.setString(6,jldw);
	ps.setDouble(7,sjcj);
	ps.setString(8,sjsfycx);
	ps.setDate(9,cxkssj);
	ps.setDate(10,cxjssj);
	ps.setDouble(11,cxsjcj);
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