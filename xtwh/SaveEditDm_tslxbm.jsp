<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tslxbm=null;
String tslxmc=null;
String tsdl=null;
long px=0;
tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
tslxmc=cf.GB2Uni(request.getParameter("tslxmc"));
tsdl=cf.GB2Uni(request.getParameter("tsdl"));
ls=request.getParameter("px");
try{
	if (!(ls.equals("")))  px=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量px不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[排序]类型转换发生意外:"+e);
	return;
}
String wheretslxbm=null;
wheretslxbm=cf.GB2Uni(request.getParameter("wheretslxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_tslxbm set tslxbm=?,tslxmc=?,tsdl=?,px=? ";
	ls_sql+=" where  (tslxbm='"+wheretslxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tslxbm);
	ps.setString(2,tslxmc);
	ps.setString(3,tsdl);
	ps.setLong(4,px);
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