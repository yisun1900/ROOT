<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zcdlbm=null;
String zcdlmc=null;
zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
zcdlmc=cf.GB2Uni(request.getParameter("zcdlmc"));
String wherezcdlbm=null;
wherezcdlbm=cf.GB2Uni(request.getParameter("wherezcdlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_zcdlbm set zcdlbm=?,zcdlmc=? ";
	ls_sql+=" where  (zcdlbm='"+wherezcdlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcdlbm);
	ps.setString(2,zcdlmc);
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
	out.print("Exception: " + e);
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