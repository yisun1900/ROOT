<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long sjfy=0;
long sjcc=0;
ls=request.getParameter("sjfy");
try{
	if (!(ls.equals("")))  sjfy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjcc");
try{
	if (!(ls.equals("")))  sjcc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjcc不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际产出]类型转换发生意外:"+e);
	return;
}

String wherecxhdmc=null;
String wherefgsbh=null;
wherecxhdmc=cf.GB2Uni(request.getParameter("wherecxhdmc"));
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yx_xqcxhdgl set sjfy=?,sjcc=?";
	ls_sql+=" where  (cxhdmc='"+wherecxhdmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,sjfy);
	ps.setLong(2,sjcc);
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