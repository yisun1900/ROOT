<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xmbm=null;
String xmmc=null;
String rcjcdlbm=null;
String jcnr=null;
String rcjclxbm=null;
xmbm=cf.GB2Uni(request.getParameter("xmbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
rcjcdlbm=cf.GB2Uni(request.getParameter("rcjcdlbm"));
jcnr=cf.GB2Uni(request.getParameter("jcnr"));
rcjclxbm=cf.GB2Uni(request.getParameter("rcjclxbm"));
String wherexmbm=null;
wherexmbm=cf.GB2Uni(request.getParameter("wherexmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_rcjcxm set xmbm=?,xmmc=?,rcjcdlbm=?,jcnr=?,rcjclxbm=? ";
	ls_sql+=" where  (xmbm='"+wherexmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmbm);
	ps.setString(2,xmmc);
	ps.setString(3,rcjcdlbm);
	ps.setString(4,jcnr);
	ps.setString(5,rcjclxbm);
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