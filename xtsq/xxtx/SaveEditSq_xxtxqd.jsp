<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xxlx=null;
String yhdlm=null;
String qdbz=null;
xxlx=cf.GB2Uni(request.getParameter("xxlx"));
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
qdbz=cf.GB2Uni(request.getParameter("qdbz"));
String wherexxlx=null;
String whereyhdlm=null;
wherexxlx=cf.GB2Uni(request.getParameter("wherexxlx"));
whereyhdlm=cf.GB2Uni(request.getParameter("whereyhdlm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_xxtxqd set xxlx=?,yhdlm=?,qdbz=? ";
	ls_sql+=" where  (xxlx='"+wherexxlx+"') and  (yhdlm='"+whereyhdlm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xxlx);
	ps.setString(2,yhdlm);
	ps.setString(3,qdbz);
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