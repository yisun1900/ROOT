<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fklxbm=null;
String fklxmc=null;
String fkdl=null;
String pzfl=null;
fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
fklxmc=cf.GB2Uni(request.getParameter("fklxmc"));
fkdl=cf.GB2Uni(request.getParameter("fkdl"));
pzfl=cf.GB2Uni(request.getParameter("pzfl"));
String wherefklxbm=null;
wherefklxbm=cf.GB2Uni(request.getParameter("wherefklxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_fklxbm set fklxbm=?,fklxmc=?,fkdl=?,pzfl=? ";
	ls_sql+=" where  (fklxbm='"+wherefklxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fklxbm);
	ps.setString(2,fklxmc);
	ps.setString(3,fkdl);
	ps.setString(4,pzfl);
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