<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgflbm=null;
String fgflmc=null;
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
fgflmc=cf.GB2Uni(request.getParameter("fgflmc"));
String wherefgflbm=null;
wherefgflbm=cf.GB2Uni(request.getParameter("wherefgflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_fgflbm set fgflbm=?,fgflmc=? ";
	ls_sql+=" where  (fgflbm='"+wherefgflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgflbm);
	ps.setString(2,fgflmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
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