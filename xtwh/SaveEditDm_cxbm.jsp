<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cxbm=null;
String cxmc=null;
cxbm=cf.GB2Uni(request.getParameter("cxbm"));
cxmc=cf.GB2Uni(request.getParameter("cxmc"));
String wherecxbm=null;
wherecxbm=cf.GB2Uni(request.getParameter("wherecxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_cxbm set cxbm=?,cxmc=? ";
	ls_sql+=" where  (cxbm='"+wherecxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxbm);
	ps.setString(2,cxmc);
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