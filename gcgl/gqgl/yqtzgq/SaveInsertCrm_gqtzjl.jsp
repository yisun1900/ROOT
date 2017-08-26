<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String djjlh=null;
String khbh=null;
String tzlx=null;
java.sql.Date tzsjd=null;
long tzts=0;
String gqtzyybm=null;
String tzyysm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
djjlh=cf.GB2Uni(request.getParameter("djjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
tzlx=cf.GB2Uni(request.getParameter("tzlx"));
ls=request.getParameter("tzsjd");
try{
	if (!(ls.equals("")))  tzsjd=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tzsjd������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("tzts");
try{
	if (!(ls.equals("")))  tzts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tzts������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
gqtzyybm=cf.GB2Uni(request.getParameter("gqtzyybm"));
tzyysm=cf.GB2Uni(request.getParameter("tzyysm"));
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
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
String yqlx=cf.GB2Uni(request.getParameter("yqlx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into crm_gqtzjl ( djjlh,khbh,tzlx,tzsjd,tzts,gqtzyybm,tzyysm,lrr,lrsj,lrdw,yqlx ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djjlh);
	ps.setString(2,khbh);
	ps.setString(3,tzlx);
	ps.setDate(4,tzsjd);
	ps.setLong(5,tzts);
	ps.setString(6,gqtzyybm);
	ps.setString(7,tzyysm);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,lrdw);
	ps.setString(11,yqlx);
	ps.executeUpdate();
	ps.close();



	int yqts=0;
	ls_sql=" select sum(tzts)";
	ls_sql+=" from  crm_gqtzjl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yqts=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ls_sql="update crm_khxx set gcsfyq='2',yqts=?,yqsm=?,yqlrr=?,yqlrsj=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,yqts);
	ps.setString(2,tzyysm);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>