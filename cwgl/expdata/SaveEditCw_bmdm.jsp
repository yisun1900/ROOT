<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bmdm=null;
String bmbh=null;
String dwbh=null;
bmdm=cf.GB2Uni(request.getParameter("bmdm"));
bmbh=cf.GB2Uni(request.getParameter("bmbh"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String ls_sql2=null;
String bmmc=null;
ls_sql2="select dwmc from sq_dwxx where dwbh='"+bmbh+"'";
bmmc=cf.executeQuery(ls_sql2);

String wherebmdm=null;
wherebmdm=cf.GB2Uni(request.getParameter("wherebmdm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_bmdm set bmdm=?,bmbh=?,dwbh=?,bmmc=? ";
	ls_sql+=" where  (bmdm='"+wherebmdm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bmdm);
	ps.setString(2,bmbh);
	ps.setString(3,dwbh);
	ps.setString(4,bmmc);
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