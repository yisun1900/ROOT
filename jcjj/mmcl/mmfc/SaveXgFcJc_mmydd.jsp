<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String fcsm=cf.GB2Uni(request.getParameter("fcsm"));
String fclrr=cf.GB2Uni(request.getParameter("fclrr"));

String ls=null;
java.sql.Date sfcsj=null;
ls=request.getParameter("sfcsj");
try{
	if (!(ls.equals("")))  sfcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sfcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实复测时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date fclrsj=null;
ls=request.getParameter("fclrsj");
try{
	if (!(ls.equals("")))  fclrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fclrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[复测录入时间]类型转换发生意外:"+e);
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
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	String bclzt=null;
	ls_sql="select bclzt";
	ls_sql+=" from  jdm_mmclzt";
	ls_sql+=" where cdmc='木门复测' and jgclzt='"+clzt+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bclzt=rs.getString("bclzt");
	}
	rs.close();
	ps.close();
	
	if (bclzt==null)
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}


	ls_sql="update jc_mmydd set sfcsj=?,fcsm=?,fclrr=?,fclrsj=?";
	ls_sql+=" where  yddbh='"+yddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sfcsj);
	ps.setString(2,fcsm);
	ps.setString(3,fclrr);
	ps.setDate(4,fclrsj);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
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