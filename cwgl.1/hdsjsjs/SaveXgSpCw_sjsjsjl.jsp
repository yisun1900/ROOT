<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String spr=null;
java.sql.Date spsj=null;
String spbz=null;
String spyj=null;
spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����spsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
spbz=cf.GB2Uni(request.getParameter("spbz"));
spyj=cf.GB2Uni(request.getParameter("spyj"));
String jsjlh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cw_sjsjsjl set spr=?,spsj=?,spbz=?,spyj=? ";
	ls_sql+=" where  jsjlh='"+jsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,spr);
	ps.setDate(2,spsj);
	ps.setString(3,spbz);
	ps.setString(4,spyj);
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