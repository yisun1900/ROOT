<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpdlbm=null;
String kpdlmc=null;
kpdlbm=cf.GB2Uni(request.getParameter("kpdlbm"));
kpdlmc=cf.GB2Uni(request.getParameter("kpdlmc"));
String wherekpdlbm=null;
wherekpdlbm=cf.GB2Uni(request.getParameter("wherekpdlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_kpdlbm set kpdlbm=?,kpdlmc=? ";
	ls_sql+=" where  (kpdlbm='"+wherekpdlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpdlbm);
	ps.setString(2,kpdlmc);
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