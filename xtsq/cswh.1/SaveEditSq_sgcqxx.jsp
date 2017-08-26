<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String cqbm=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String wheredwbh=null;
String wherecqbm=null;
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
wherecqbm=cf.GB2Uni(request.getParameter("wherecqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_sgcqxx set dwbh=?,cqbm=? ";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (cqbm='"+wherecqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,cqbm);
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