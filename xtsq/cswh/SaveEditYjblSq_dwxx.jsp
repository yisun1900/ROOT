<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010116")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String ls=null;
double jryjbfb=0;
double sjjryjbfb=0;
double yjjzcs=0;
ls=request.getParameter("jryjbfb");
try{
	if (!(ls.equals("")))  jryjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jryjbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家装签单计入业绩收款比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjjryjbfb");
try{
	if (!(ls.equals("")))  sjjryjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjjryjbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费计入业绩收款比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjjzcs");
try{
	if (!(ls.equals("")))  yjjzcs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjjzcs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业绩净值参数]类型转换发生意外:"+e);
	return;
}

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	ls_sql="update sq_dwxx set jryjbfb=?,sjjryjbfb=?,yjjzcs=?";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jryjbfb);
	ps.setDouble(2,sjjryjbfb);
	ps.setDouble(3,yjjzcs);
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
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






