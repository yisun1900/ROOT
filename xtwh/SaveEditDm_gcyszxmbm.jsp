<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcyszxmbm=null;
String gcyszxmmc=null;
String gcjdbm=null;
gcyszxmbm=cf.GB2Uni(request.getParameter("gcyszxmbm"));
gcyszxmmc=cf.GB2Uni(request.getParameter("gcyszxmmc"));
gcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));

String dygcjdbm=request.getParameter("dygcjdbm");
String sfhf=request.getParameter("sfhf");

String wheregcyszxmbm=null;
wheregcyszxmbm=cf.GB2Uni(request.getParameter("wheregcyszxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_gcyszxmbm set gcyszxmbm=?,gcyszxmmc=?,gcjdbm=?,dygcjdbm=?,sfhf=? ";
	ls_sql+=" where  (gcyszxmbm='"+wheregcyszxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcyszxmbm);
	ps.setString(2,gcyszxmmc);
	ps.setString(3,gcjdbm);
	ps.setString(4,dygcjdbm);
	ps.setString(5,sfhf);
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