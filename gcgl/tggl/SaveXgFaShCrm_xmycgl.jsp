<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jjfashsj=null;
String jjfashr=null;
String jjfa=null;

ls=request.getParameter("jjfashsj");
try{
	if (!(ls.equals("")))  jjfashsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jjfashsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����������ʱ��]����ת����������:"+e);
	return;
}
jjfashr=cf.GB2Uni(request.getParameter("jjfashr"));
jjfa=cf.GB2Uni(request.getParameter("jjfa"));

String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_xmycgl set jjfashsj=?,jjfashr=?,jjfa=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='3'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jjfashsj);
	ps.setString(2,jjfashr);
	ps.setString(3,jjfa);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
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