<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zpzw=null;
long zprs=0;
String bz=null;
zpzw=cf.GB2Uni(request.getParameter("zpzw"));
ls=request.getParameter("zprs");
try{
	if (!(ls.equals("")))  zprs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zprs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ƹ����]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherezpmxbh=null;
wherezpmxbh=cf.GB2Uni(request.getParameter("wherezpmxbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_zpjhmx set zpzw=?,zprs=?,bz=? ";
	ls_sql+=" where  (zpmxbh='"+wherezpmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zpzw);
	ps.setLong(2,zprs);
	ps.setString(3,bz);
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