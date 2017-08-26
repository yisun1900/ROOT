<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String bj_tczcbj_dqbm=null;
String bj_tczcbj_bjjbbm=null;
String bj_tczcjxc_clxlbm=null;

bj_tczcbj_dqbm=request.getParameter("bj_tczcbj_dqbm");
bj_tczcbj_bjjbbm=request.getParameter("bj_tczcbj_bjjbbm");
bj_tczcjxc_clxlbm=request.getParameter("bj_tczcjxc_clxlbm");

double xdb=0;
ls=request.getParameter("xdb");
try{
	if (!(ls.equals("")))  xdb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xdb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下单比]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update bj_tczcbj set xdb=? ";
	ls_sql+=" where dqbm='"+bj_tczcbj_dqbm+"' and bjjbbm='"+bj_tczcbj_bjjbbm+"' and tccplbbm='"+bj_tczcjxc_clxlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,xdb);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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