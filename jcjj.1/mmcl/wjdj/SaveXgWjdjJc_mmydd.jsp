<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));

String wjlrr=cf.GB2Uni(request.getParameter("wjlrr"));


String ls=null;
java.sql.Date wjsj=null;
ls=request.getParameter("wjsj");
try{
	if (!(ls.equals("")))  wjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完结时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("20"))
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}
	
	ls_sql="update jc_mmydd set wjsj=?,wjlrr=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='20' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,wjsj);
	ps.setString(2,wjlrr);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>