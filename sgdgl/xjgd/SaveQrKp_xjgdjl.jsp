<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String qrr=null;
java.sql.Date qrsj=null;
String qrsm=cf.GB2Uni(request.getParameter("qrsm"));

qrr=cf.GB2Uni(request.getParameter("qrr"));
ls=request.getParameter("qrsj");
try{
	if (!(ls.equals("")))  qrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[确认时间]类型转换发生意外:"+e);
	return;
}
String wherexjjlh=null;
wherexjjlh=cf.GB2Uni(request.getParameter("wherexjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_xjgdjl set qrr=?,qrsj=?,qrsm=?,cfspbz='5' ";
	ls_sql+=" where  (xjjlh='"+wherexjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qrr);
	ps.setDate(2,qrsj);
	ps.setString(3,qrsm);
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