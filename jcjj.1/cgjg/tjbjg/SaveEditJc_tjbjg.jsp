<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tjbbm=null;
double jg=0;
tjbbm=cf.GB2Uni(request.getParameter("tjbbm"));
ls=request.getParameter("jg");
try{
	if (!(ls.equals("")))  jg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jg������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۸�]����ת����������:"+e);
	return;
}
String wheretjbbm=null;
wheretjbbm=cf.GB2Uni(request.getParameter("wheretjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_tjbjg set tjbbm=?,jg=? ";
	ls_sql+=" where  (tjbbm='"+wheretjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tjbbm);
	ps.setDouble(2,jg);
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