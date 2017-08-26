<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String yjdz=null;
String yb=null;
String sjr=null;
String dh=null;
String bz=null;
String lrr=null;
java.sql.Date lrsj=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
yjdz=cf.GB2Uni(request.getParameter("yjdz"));
yb=cf.GB2Uni(request.getParameter("yb"));
sjr=cf.GB2Uni(request.getParameter("sjr"));
dh=cf.GB2Uni(request.getParameter("dh"));
bz=cf.GB2Uni(request.getParameter("bz"));
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
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="insert into crm_bdxx ( khbh,yjdz,yb,sjr,dh,bz,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,yjdz);
	ps.setString(3,yb);
	ps.setString(4,sjr);
	ps.setString(5,dh);
	ps.setString(6,bz);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set fwdz='"+fwdz+"'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>