<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String shjg=null;
String shnr=null;
shjg=cf.GB2Uni(request.getParameter("shjg"));
shnr=cf.GB2Uni(request.getParameter("shnr"));

String cgjhph=null;
cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_clcgjh set shjg=?,shnr=?,shr=?,shsj=SYSDATE,jhdzt='2' ";
	ls_sql+=" where  (cgjhph='"+cgjhph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjg);
	ps.setString(2,shnr);
	ps.setString(3,yhmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		window.location.href="SelectCxJxc_clcgjh.jsp";
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<center>��˳ɹ����뽫�ƻ��ֽ�ɶ���</center>
		<%
	}
		if (ps != null) ps.close();
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