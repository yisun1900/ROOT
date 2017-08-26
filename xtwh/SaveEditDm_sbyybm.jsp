<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sbyybm=null;
String sbyymc=null;
String dmzxzt=null;
String fgszxzt=null;
sbyybm=cf.GB2Uni(request.getParameter("sbyybm"));
sbyymc=cf.GB2Uni(request.getParameter("sbyymc"));
dmzxzt=cf.GB2Uni(request.getParameter("dmzxzt"));
fgszxzt=cf.GB2Uni(request.getParameter("fgszxzt"));
String wheresbyybm=null;
wheresbyybm=cf.GB2Uni(request.getParameter("wheresbyybm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_sbyybm set sbyybm=?,sbyymc=?,dmzxzt=?,fgszxzt=? ";
	ls_sql+=" where  (sbyybm='"+wheresbyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sbyybm);
	ps.setString(2,sbyymc);
	ps.setString(3,dmzxzt);
	ps.setString(4,fgszxzt);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
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