<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mbbm=null;
String mbmc=null;
mbbm=cf.GB2Uni(request.getParameter("mbbm"));
mbmc=cf.GB2Uni(request.getParameter("mbmc"));
String wherembbm=null;
wherembbm=cf.GB2Uni(request.getParameter("wherembbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_mbbm set mbbm=?,mbmc=? ";
	ls_sql+=" where  (mbbm='"+wherembbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mbbm);
	ps.setString(2,mbmc);
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