<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date sazrq=null;
String azbz=null;
String ysqk=null;
ysqk=cf.GB2Uni(request.getParameter("ysqk"));
azbz=cf.GB2Uni(request.getParameter("azbz"));
ls=request.getParameter("sazrq");
try{
	if (!(ls.equals("")))  sazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sazrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际安装日期]类型转换发生意外:"+e);
	return;
}

String wherekhbh=null;
String wherecpbm=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wherecpbm=cf.GB2Uni(request.getParameter("wherecpbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_dgqk set ysqk=?,sazrq=?,azbz=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysqk);
	ps.setDate(2,sazrq);
	ps.setString(3,azbz);
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