<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bjjbbm=null;
String bjjbmc=null;
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbmc=cf.GB2Uni(request.getParameter("bjjbmc"));
String lx=cf.GB2Uni(request.getParameter("lx"));

int yxj=0;
ls=request.getParameter("yxj");
try{
	if (!(ls.equals("")))  yxj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[级别排序]类型转换发生意外:"+e);
	return;
}
String wherebjjbbm=null;
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bdm_bjjbbm set bjjbbm=?,bjjbmc=?,lx=?,yxj=? ";
	ls_sql+=" where  (bjjbbm='"+wherebjjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjjbbm);
	ps.setString(2,bjjbmc);
	ps.setString(3,lx);
	ps.setInt(4,yxj);
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