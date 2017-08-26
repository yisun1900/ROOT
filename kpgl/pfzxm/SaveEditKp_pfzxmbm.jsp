<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pfxmbm=null;
String xjlxbm=null;
long fz=0;
pfxmbm=cf.GB2Uni(request.getParameter("pfxmbm"));
xjlxbm=cf.GB2Uni(request.getParameter("xjlxbm"));
ls=request.getParameter("fz");
try{
	if (!(ls.equals("")))  fz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[分值]类型转换发生意外:"+e);
	return;
}
String wherepfxmbm=null;
String wherexjlxbm=null;
wherepfxmbm=cf.GB2Uni(request.getParameter("wherepfxmbm"));
wherexjlxbm=cf.GB2Uni(request.getParameter("wherexjlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_pfzxmbm set pfxmbm=?,xjlxbm=?,fz=? ";
	ls_sql+=" where  (pfxmbm='"+wherepfxmbm+"') and  (xjlxbm='"+wherexjlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pfxmbm);
	ps.setString(2,xjlxbm);
	ps.setLong(3,fz);
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