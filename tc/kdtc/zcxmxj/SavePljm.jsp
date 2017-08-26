<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String chooseitem=cf.GB2Uni(request.getParameter("chooseitem"));
String sfkjm=null;
double yxjmzdsl=0;
double jmdj=0;
sfkjm=cf.GB2Uni(request.getParameter("sfkjm"));
ls=request.getParameter("yxjmzdsl");
try{
	if (!(ls.equals("")))  yxjmzdsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxjmzdsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[允许减免最大数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jmdj");
try{
	if (!(ls.equals("")))  jmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jmdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减免单价]类型转换发生意外:"+e);
	return;
}



Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update tckd_tcfgzcxmxj set sfkjm=?,yxjmzdsl=?,jmdj=? ";
	ls_sql+=" where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfkjm);
	ps.setDouble(2,yxjmzdsl);
	ps.setDouble(3,jmdj);
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