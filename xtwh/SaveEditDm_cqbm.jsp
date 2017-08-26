<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cqbm=null;
String cqmc=null;
String dqbm=null;
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
cqmc=cf.GB2Uni(request.getParameter("cqmc"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherecqbm=null;
wherecqbm=cf.GB2Uni(request.getParameter("wherecqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_cqbm set cqbm=?,cqmc=?,dqbm=? ";
	ls_sql+=" where  (cqbm='"+wherecqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cqbm);
	ps.setString(2,cqmc);
	ps.setString(3,dqbm);
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