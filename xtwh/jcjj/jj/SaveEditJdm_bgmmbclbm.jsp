<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgmmbclbm=null;
String bgmmbclmc=null;
bgmmbclbm=cf.GB2Uni(request.getParameter("bgmmbclbm"));
bgmmbclmc=cf.GB2Uni(request.getParameter("bgmmbclmc"));
String wherebgmmbclbm=null;
wherebgmmbclbm=cf.GB2Uni(request.getParameter("wherebgmmbclbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_bgmmbclbm set bgmmbclbm=?,bgmmbclmc=? ";
	ls_sql+=" where  (bgmmbclbm='"+wherebgmmbclbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgmmbclbm);
	ps.setString(2,bgmmbclmc);
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