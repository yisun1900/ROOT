<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String tckd_tczcbj_dqbm=null;
String tckd_tczcbj_bjjbbm=null;
String tccplbbm=null;

tckd_tczcbj_dqbm=request.getParameter("tckd_tczcbj_dqbm");
tckd_tczcbj_bjjbbm=request.getParameter("tckd_tczcbj_bjjbbm");
tccplbbm=request.getParameter("tccplbbm");

double sh=0;
ls=request.getParameter("sh");
try{
	if (!(ls.equals("")))  sh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update tckd_tczcbj set sh=? ";
	ls_sql+=" where dqbm='"+tckd_tczcbj_dqbm+"' and bjjbbm='"+tckd_tczcbj_bjjbbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sh);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>