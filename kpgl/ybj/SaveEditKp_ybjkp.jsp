<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long tsjjf=0;
long ybjpf=0;
ls=request.getParameter("tsjjf");
try{
	if (!(ls.equals("")))  tsjjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsjjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特殊加减分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ybjpf");
try{
	if (!(ls.equals("")))  ybjpf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ybjpf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[样板间评分]类型转换发生意外:"+e);
	return;
}

String wheresgd=null;
wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_ybjkp set tsjjf=?,ybjpf=?";
	ls_sql+=" where  (sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,tsjjf);
	ps.setLong(2,ybjpf);
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