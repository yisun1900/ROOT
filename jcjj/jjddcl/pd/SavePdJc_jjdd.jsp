<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));
String pdr=cf.GB2Uni(request.getParameter("pdr"));
String pdsm=cf.GB2Uni(request.getParameter("pdsm"));
java.sql.Date pdsj=null;

ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɵ�ʱ��]����ת����������:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("01"))
	{
		out.println("�����󣬴���״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_jjdd set jjsjs=?,pdr=?,pdsj=?,pdsm=?,clzt='03'";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjsjs);
	ps.setString(2,pdr);
	ps.setDate(3,pdsj);
	ps.setString(4,pdsm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jjzjx set jjsjs=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjsjs);
	ps.executeUpdate();
	ps.close();

	//���ɶ���
	ls_sql="update jc_jcdd set jjsjs=? ";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='3'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjsjs);
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
	out.print("Exception: " + e);
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