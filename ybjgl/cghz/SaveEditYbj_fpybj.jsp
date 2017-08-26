<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cgmyd=null;
String sbyy=null;
cgmyd=cf.GB2Uni(request.getParameter("cgmyd"));
sbyy=cf.GB2Uni(request.getParameter("sbyy"));

String wheresqbh=null;
String wherekhbh=null;
wheresqbh=cf.GB2Uni(request.getParameter("wheresqbh"));
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update ybj_fpybj set cgmyd=?,sbyy=?,clzt='Y' ";
	ls_sql+=" where  (sqbh="+wheresqbh+") and  (khbh='"+wherekhbh+"')  and clzt!='H'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgmyd);
	ps.setString(2,sbyy);
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