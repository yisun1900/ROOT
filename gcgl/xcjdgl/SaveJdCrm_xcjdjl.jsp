<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

java.sql.Date sjjdsj=null;
String jdsfcg=null;
String sfkkg=null;
String tzsfqr=null;
String fasfkx=null;
String khsfqr=null;
String xcfzrqr=null;
String qtczdqr=null;

ls=request.getParameter("sjjdsj");
try{
	if (!(ls.equals("")))  sjjdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjjdsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʽ���ʱ��]����ת����������:"+e);
	return;
}
jdsfcg=cf.GB2Uni(request.getParameter("jdsfcg"));
sfkkg=cf.GB2Uni(request.getParameter("sfkkg"));
tzsfqr=cf.GB2Uni(request.getParameter("tzsfqr"));
fasfkx=cf.GB2Uni(request.getParameter("fasfkx"));
khsfqr=cf.GB2Uni(request.getParameter("khsfqr"));
xcfzrqr=cf.GB2Uni(request.getParameter("xcfzrqr"));
qtczdqr=cf.GB2Uni(request.getParameter("qtczdqr"));

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String jdqrjg=null;
	ls_sql="SELECT khbh,clzt,jdqrjg";
	ls_sql+=" FROM crm_xcjdjl";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		clzt=rs.getString("clzt");
		jdqrjg=rs.getString("jdqrjg");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("5"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
	{
		out.println("����״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_xcjdjl set sjjdsj=?,jdsfcg=?,sfkkg=?,tzsfqr=?,fasfkx=?,khsfqr=?,xcfzrqr=?,qtczdqr=?,clzt='6' ";
	ls_sql+=" where  (jdjlh='"+jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjjdsj);
	ps.setString(2,jdsfcg);
	ps.setString(3,sfkkg);
	ps.setString(4,tzsfqr);
	ps.setString(5,fasfkx);
	ps.setString(6,khsfqr);
	ps.setString(7,xcfzrqr);
	ps.setString(8,qtczdqr);
	ps.executeUpdate();
	ps.close();

	String setxcjdbz="";//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����
	if (jdsfcg.equals("Y"))//Y���ɹ���N��ʧ�ܣ�M��ʧ���ѳ�����
	{
		setxcjdbz="9";
	}
	else{
		setxcjdbz="A";
	}

	
	ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
	ls_sql+=" where khbh='"+khbh+"'";
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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