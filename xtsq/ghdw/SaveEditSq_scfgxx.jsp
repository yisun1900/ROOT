<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String fgflbm=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
String wheredwbh=null;
String wherefgflbm=null;
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
wherefgflbm=cf.GB2Uni(request.getParameter("wherefgflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_scfgxx set dwbh=?,fgflbm=? ";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (fgflbm='"+wherefgflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,fgflbm);
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