<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] sgd =request.getParameterValues("sgd");

String ls=null;
double rgfbfb=0;
ls=request.getParameter("rgfbfb");
try{
	if (!(ls.equals("")))  rgfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[rgfbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˹��Ѱٷֱ�]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
double cpbqj=0;

try {
	conn=cf.getConnection();    //�õ�����

	conn.setAutoCommit(false);

	for (int i=0;i<sgd.length ;i++ )
	{
		ls_sql = " update sq_sgd set rgfbfb="+rgfbfb;
		ls_sql+= " where sgd='"+sgd[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("��������: " + e);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
