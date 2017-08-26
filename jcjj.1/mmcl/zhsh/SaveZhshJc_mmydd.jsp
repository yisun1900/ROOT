<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String zhshyj=cf.GB2Uni(request.getParameter("zhshyj"));
String zhshr=cf.GB2Uni(request.getParameter("zhshr"));

String ls=null;
java.sql.Date zhshsj=null;
ls=request.getParameter("zhshsj");
try{
	if (!(ls.equals("")))  zhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zhshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[综合经营审核时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("01"))
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}
	
	ls_sql="update jc_mmydd set zhshr=?,zhshsj=?,zhshyj=?,clzt='02'";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='01' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zhshr);
	ps.setDate(2,zhshsj);
	ps.setString(3,zhshyj);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>