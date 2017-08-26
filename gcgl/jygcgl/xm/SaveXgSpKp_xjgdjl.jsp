<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String spr=null;
java.sql.Date spsj=null;
String cfspbz=cf.GB2Uni(request.getParameter("cfspbz"));
String spyj=cf.GB2Uni(request.getParameter("spyj"));

spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}
String wherexjjlh=null;
wherexjjlh=cf.GB2Uni(request.getParameter("wherexjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_xjgdjl set cfspbz=?,spr=?,spsj=?,spyj=? ";
	ls_sql+=" where  (xjjlh='"+wherexjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cfspbz);
	ps.setString(2,spr);
	ps.setDate(3,spsj);
	ps.setString(4,spyj);
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