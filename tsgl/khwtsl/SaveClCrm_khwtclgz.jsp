<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clzt=null;
String clr=null;
java.sql.Date clkssj=null;
java.sql.Date cljssj=null;
String clqk=null;
String bz=null;
clzt=cf.GB2Uni(request.getParameter("clzt"));
clr=cf.GB2Uni(request.getParameter("clr"));
ls=request.getParameter("clkssj");
try{
	if (!(ls.equals("")))  clkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cljssj");
try{
	if (!(ls.equals("")))  cljssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cljssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理结束时间]类型转换发生意外:"+e);
	return;
}
clqk=cf.GB2Uni(request.getParameter("clqk"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherewtbh=null;
wherewtbh=cf.GB2Uni(request.getParameter("wherewtbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_khwtclgz set clzt=?,clr=?,clkssj=?,cljssj=?,clqk=?,bz=? ";
	ls_sql+=" where  (wtbh='"+wherewtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,clr);
	ps.setDate(3,clkssj);
	ps.setDate(4,cljssj);
	ps.setString(5,clqk);
	ps.setString(6,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
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