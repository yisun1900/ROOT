<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String jslxfs=cf.GB2Uni(request.getParameter("jslxfs"));
String lxsm=cf.GB2Uni(request.getParameter("lxsm"));
java.sql.Date ykhlxsj=null;
ls=request.getParameter("ykhlxsj");
try{
	if (!(ls.equals("")))  ykhlxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͻ���ϵʱ��]����ת����������:"+e);
	return;
}

String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_khxx set ykhlxsj=?,jslxfs=?,lxsm=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,ykhlxsj);
	ps.setString(2,jslxfs);
	ps.setString(3,lxsm);
	if (ps.executeUpdate()!=1)
	{
		out.println("���󣡴���ʧ��");
		return;
	}

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
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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