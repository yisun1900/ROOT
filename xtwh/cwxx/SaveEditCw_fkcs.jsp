<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long fkcs=0;
String fkcsmc=null;
ls=request.getParameter("fkcs");
try{
	if (!(ls.equals("")))  fkcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fkcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�տ���������]����ת����������:"+e);
	return;
}
fkcsmc=cf.GB2Uni(request.getParameter("fkcsmc"));
String wherefkcs=null;
wherefkcs=cf.GB2Uni(request.getParameter("wherefkcs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_fkcs set fkcs=?,fkcsmc=? ";
	ls_sql+=" where  (fkcs="+wherefkcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,fkcs);
	ps.setString(2,fkcsmc);
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