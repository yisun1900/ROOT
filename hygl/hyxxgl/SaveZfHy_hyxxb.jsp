<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sfzf=null;
java.sql.Date yxrq=null;
sfzf=cf.GB2Uni(request.getParameter("sfzf"));
ls=request.getParameter("yxrq");
try{
	if (!(ls.equals("")))  yxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效日期]类型转换发生意外:"+e);
	return;
}

String wherehybh=cf.GB2Uni(request.getParameter("wherehybh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update hy_hyxxb set sfzf=?,yxrq=?";
	ls_sql+=" where  (hybh='"+wherehybh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfzf);
	ps.setDate(2,yxrq);
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