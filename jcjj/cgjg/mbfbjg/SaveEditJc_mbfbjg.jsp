<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mbfbbm=null;
double jg=0;
mbfbbm=cf.GB2Uni(request.getParameter("mbfbbm"));
ls=request.getParameter("jg");
try{
	if (!(ls.equals("")))  jg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[价格]类型转换发生意外:"+e);
	return;
}
String wherembfbbm=null;
wherembfbbm=cf.GB2Uni(request.getParameter("wherembfbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mbfbjg set mbfbbm=?,jg=? ";
	ls_sql+=" where  (mbfbbm='"+wherembfbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mbfbbm);
	ps.setDouble(2,jg);
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