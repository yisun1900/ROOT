<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
long tccplbbm=0;
long tccpdlbm=0;
String sfyqxtpp=null;
String jldw=null;
String sfkjm=null;
double jmdj=0;
String lrr=null;
java.sql.Date lrsj=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
ls=request.getParameter("tccplbbm");
try{
	if (!(ls.equals("")))  tccplbbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tccplbbm������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tccpdlbm");
try{
	if (!(ls.equals("")))  tccpdlbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tccpdlbm������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ����]����ת����������:"+e);
	return;
}
sfyqxtpp=cf.GB2Uni(request.getParameter("sfyqxtpp"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
sfkjm=cf.GB2Uni(request.getParameter("sfkjm"));
ls=request.getParameter("jmdj");
try{
	if (!(ls.equals("")))  jmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jmdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ⵥ��]����ת����������:"+e);
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
String tcnbz=request.getParameter("tcnbz");
String sfbxx=request.getParameter("sfbxx");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into tc_csrjdbjmj ( dqbm,bjjbbm,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setLong(3,tccplbbm);
	ps.setLong(4,tccpdlbm);
	ps.setString(5,sfyqxtpp);
	ps.setString(6,jldw);
	ps.setString(7,sfkjm);
	ps.setDouble(8,jmdj);
	ps.setString(9,tcnbz);
	ps.setString(10,sfbxx);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
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