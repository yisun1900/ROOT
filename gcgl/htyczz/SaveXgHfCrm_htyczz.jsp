<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hfsm=null;
String hfr=null;
java.sql.Date hfsj=null;
hfsm=cf.GB2Uni(request.getParameter("hfsm"));
hfr=cf.GB2Uni(request.getParameter("hfr"));
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[hfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ط�ʱ��]����ת����������:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclzt=null;
	String ygcjdbm=null;
	ls_sql="select clzt,ygcjdbm";
	ls_sql+=" from  crm_htyczz";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
		ygcjdbm=cf.fillNull(rs.getString("ygcjdbm"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("4"))//1��δ������2������ͬ�⣻3��������ͬ��
	{
		out.println("����δ����ͨ��");
		return;
	}

	
	ls_sql="update crm_htyczz set hfsm=?,hfr=?,hfsj=?  ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfsm);
	ps.setString(2,hfr);
	ps.setDate(3,hfsj);
	ps.executeUpdate();
	ps.close();



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