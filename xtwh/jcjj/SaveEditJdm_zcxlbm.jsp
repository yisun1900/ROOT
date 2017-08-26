<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zcxlbm=null;
String zcxlmc=null;
String zcdlmc=null;
zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
zcxlmc=cf.GB2Uni(request.getParameter("zcxlmc"));
zcdlmc=cf.GB2Uni(request.getParameter("zcdlmc"));
String wherezcxlbm=null;
wherezcxlbm=cf.GB2Uni(request.getParameter("wherezcxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_zcxlbm set zcxlbm=?,zcxlmc=?,zcdlmc=? ";
	ls_sql+=" where  (zcxlbm='"+wherezcxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcxlbm);
	ps.setString(2,zcxlmc);
	ps.setString(3,zcdlmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
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