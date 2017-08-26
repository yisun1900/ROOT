<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String tckb_zck_dqbm=null;
String tckb_zck_bjjbbm=null;
String cpxl=null;

tckb_zck_dqbm=request.getParameter("tckb_zck_dqbm");
tckb_zck_bjjbbm=request.getParameter("tckb_zck_bjjbbm");
cpxl=request.getParameter("cpxl");

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

	ls_sql="update tckb_zck set xdb=? ";
	ls_sql+=" where dqbm='"+tckb_zck_dqbm+"' and bjjbbm='"+tckb_zck_bjjbbm+"' and cpxl='"+cpxl+"'";
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