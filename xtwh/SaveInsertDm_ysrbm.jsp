<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ysrbm=null;
String ysrmc=null;
double ysrxx=0;
double ysrsx=0;
ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
ysrmc=cf.GB2Uni(request.getParameter("ysrmc"));
ls=request.getParameter("ysrxx");
try{
	if (!(ls.equals("")))  ysrxx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysrxx不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[月收入下限]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ysrsx");
try{
	if (!(ls.equals("")))  ysrsx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysrsx不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[月收入上限]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into dm_ysrbm ( ysrbm,ysrmc,ysrxx,ysrsx ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysrbm);
	ps.setString(2,ysrmc);
	ps.setDouble(3,ysrxx);
	ps.setDouble(4,ysrsx);
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
	out.print("存盘失败,发生意外: " + e);
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