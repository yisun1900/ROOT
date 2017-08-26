<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmdglxbm=null;
String qhjgqjbm=null;
double mmjjl=0;
mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
qhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
ls=request.getParameter("mmjjl");
try{
	if (!(ls.equals("")))  mmjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mmjjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每米加价率]类型转换发生意外:"+e);
	return;
}
String wheremmdglxbm=null;
String whereqhjgqjbm=null;
wheremmdglxbm=cf.GB2Uni(request.getParameter("wheremmdglxbm"));
whereqhjgqjbm=cf.GB2Uni(request.getParameter("whereqhjgqjbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_qhcbjjb set mmdglxbm=?,qhjgqjbm=?,mmjjl=? ";
	ls_sql+=" where  (mmdglxbm='"+wheremmdglxbm+"') and  (qhjgqjbm='"+whereqhjgqjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmdglxbm);
	ps.setString(2,qhjgqjbm);
	ps.setDouble(3,mmjjl);
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