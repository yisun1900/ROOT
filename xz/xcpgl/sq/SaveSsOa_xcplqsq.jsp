<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sjspr=null;
java.sql.Date sjspsj=null;
String sjspjl=null;
String sjspsm=null;

sjspr=cf.GB2Uni(request.getParameter("sjspr"));
ls=request.getParameter("sjspsj");
try{
	if (!(ls.equals("")))  sjspsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjspsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}
sjspjl=cf.GB2Uni(request.getParameter("sjspjl"));
sjspsm=cf.GB2Uni(request.getParameter("sjspsm"));

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lqzt=null;
	ls_sql=" SELECT lqzt";
	ls_sql+=" FROM oa_xcplqsq ";
    ls_sql+=" where sqxh="+sqxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lqzt=rs.getString("lqzt");
	}
	rs.close();
	ps.close();

	if (!lqzt.equals("4"))//1：未完成；2：完成申请；3：一级审批；4：二级审批；5：三级审批；6：已领取
	{
		out.println("错误！审批状态不正确");
		return;
	}


	ls_sql="update oa_xcplqsq set lqzt='5',sjspr=?,sjspsj=?,sjspjl=?,sjspsm=? ";
    ls_sql+=" where sqxh="+sqxh+" and lqzt='4'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjspr);
	ps.setDate(2,sjspsj);
	ps.setString(3,sjspjl);
	ps.setString(4,sjspsm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>