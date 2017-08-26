<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jzgl" scope="page" class="jxc.kcjz.Kcjz"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String rkph=cf.GB2Uni(request.getParameter("rkph"));

double yf = 0;
ls=request.getParameter("yf");
try{
	if (!(ls.equals("")))  yf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运费]类型转换发生意外:"+e);
	return;
}
double qtfy = 0;
ls=request.getParameter("qtfy");
try{
	if (!(ls.equals("")))  qtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费用]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update jxc_rkd set yf=?,qtfy=?";
	ls_sql+=" where rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,yf);
	ps.setDouble(2,qtfy);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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