<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jfjlh=null;
String khbh=null;
jfjlh=cf.GB2Uni(request.getParameter("jfjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));

String xmjfr=null;
java.sql.Date xmjfsj=null;
String xmjfsm=null;
xmjfr=cf.GB2Uni(request.getParameter("xmjfr"));
ls=request.getParameter("xmjfsj");
try{
	if (!(ls.equals("")))  xmjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xmjfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ŀ����ʱ��]����ת����������:"+e);
	return;
}
xmjfsm=cf.GB2Uni(request.getParameter("xmjfsm"));
String wherejfjlh=null;
wherejfjlh=cf.GB2Uni(request.getParameter("wherejfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  crm_xmjfjl";
	ls_sql+=" where  (jfjlh='"+wherejfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();
	if (!clzt.equals("W"))//S��Ԥ������Y���طóɹ���X���ط�ʧ�ܣ�W����Ŀ����
	{
		out.println("����״̬����ȷ");
		return;
	}
	
	conn.setAutoCommit(false);
	
	ls_sql="update crm_xmjfjl set xmjfr=?,xmjfsj=?,xmjfsm=? ";
	ls_sql+=" where  (jfjlh='"+wherejfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmjfr);
	ps.setDate(2,xmjfsj);
	ps.setString(3,xmjfsm);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="update crm_khxx set xmjfzt=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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