<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mbbm=null;
String rwbm=null;
int rwsfsj=0;
int rwts=0;
int rwxh=0;
mbbm=cf.GB2Uni(request.getParameter("mbbm"));
rwbm=cf.GB2Uni(request.getParameter("rwbm"));
ls=request.getParameter("rwsfsj");
try{
	if (!(ls.equals("")))  rwsfsj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rwsfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[任务发生时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rwts");
try{
	if (!(ls.equals("")))  rwts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rwts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[任务天数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rwxh");
try{
	if (!(ls.equals("")))  rwxh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rwxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[任务序号]类型转换发生意外:"+e);
	return;
}

String wherembbm=null;
String whererwbm=null;
wherembbm=cf.GB2Uni(request.getParameter("wherembbm"));
whererwbm=cf.GB2Uni(request.getParameter("whererwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update gdm_mbsjjd set mbbm=?,rwbm=?,rwsfsj=?,rwts=?,rwxh=? ";
	ls_sql+=" where  (mbbm='"+wherembbm+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mbbm);
	ps.setString(2,rwbm);
	ps.setInt(3,rwsfsj);
	ps.setInt(4,rwts);
	ps.setInt(5,rwxh);
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