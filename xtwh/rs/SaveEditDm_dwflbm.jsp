<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwflbm=null;
String dwflmc=null;
String dwdl=null;
String zzfw=null;
dwflbm=cf.GB2Uni(request.getParameter("dwflbm"));
dwflmc=cf.GB2Uni(request.getParameter("dwflmc"));
dwdl=cf.GB2Uni(request.getParameter("dwdl"));
zzfw=cf.GB2Uni(request.getParameter("zzfw"));
String dwtjflbm=cf.GB2Uni(request.getParameter("dwtjflbm"));

String wheredwflbm=null;
wheredwflbm=cf.GB2Uni(request.getParameter("wheredwflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_dwflbm set dwflbm=?,dwflmc=?,dwtjflbm=?,dwdl=?,zzfw=? ";
	ls_sql+=" where  (dwflbm='"+wheredwflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwflbm);
	ps.setString(2,dwflmc);
	ps.setString(3,dwtjflbm);
	ps.setString(4,dwdl);
	ps.setString(5,zzfw);
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
	out.print("<BR>³ö´í:" + e);
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