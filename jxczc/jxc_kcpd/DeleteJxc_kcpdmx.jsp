<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String pdph=request.getParameter("pdph");
String[] pdxh =request.getParameterValues("pdxh");
//////////////////////////////////////////////////////  

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

int i=0;

try {
	conn=cf.getConnection();    //�õ�����
	
	String pdzt="";
	ls_sql=" select pdzt";
	ls_sql+=" from jxc_kcpdjl ";
	ls_sql+=" where pdph='"+pdph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pdzt=rs.getString("pdzt");
	}
	rs.close();
	ps.close();

	if (pdzt.equals("2"))//1�������̵㣻2���̵����
	{
		out.println("�����̵��ѽ�����������ɾ��");
		return;
	}

	conn.setAutoCommit(false);

	for (i=0;i<pdxh.length ;i++ )
	{
		ls_sql="delete from jxc_kcpdmx ";
		ls_sql+=" where pdph="+pdph+" and pdxh="+pdxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close(); 
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("ɾ���ɹ�����");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>����ʧ��,��������: " + e);
	out.print("<P>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
