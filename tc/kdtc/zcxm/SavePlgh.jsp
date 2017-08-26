<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String chooseitem=cf.GB2Uni(request.getParameter("chooseitem"));
String sfkgh=null;
double khzdsl=0;
double ghzj=0;
sfkgh=cf.GB2Uni(request.getParameter("sfkgh"));
ls=request.getParameter("khzdsl");
try{
	if (!(ls.equals("")))  khzdsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khzdsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可换最大数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ghzj");
try{
	if (!(ls.equals("")))  ghzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ghzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更换折价]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update bj_tcbzzcxm set sfkgh=?,khzdsl=?,ghzj=? ";
	ls_sql+=" where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfkgh);
	ps.setDouble(2,khzdsl);
	ps.setDouble(3,ghzj);
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