<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jtjgbm=null;
String jtjgmc=null;
jtjgbm=cf.GB2Uni(request.getParameter("jtjgbm"));
jtjgmc=cf.GB2Uni(request.getParameter("jtjgmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into dm_jtjgbm ( jtjgbm,jtjgmc ) ";
	ls_sql+=" values ( ?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jtjgbm);
	ps.setString(2,jtjgmc);
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
	out.print("����ʧ��,��������: " + e);
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