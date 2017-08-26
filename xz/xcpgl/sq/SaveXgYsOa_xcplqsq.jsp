<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yjspr=null;
java.sql.Date yjspsj=null;
String yjspjl=null;
String yjspsm=null;

yjspr=cf.GB2Uni(request.getParameter("yjspr"));
ls=request.getParameter("yjspsj");
try{
	if (!(ls.equals("")))  yjspsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjspsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}
yjspjl=cf.GB2Uni(request.getParameter("yjspjl"));
yjspsm=cf.GB2Uni(request.getParameter("yjspsm"));

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

	if (!lqzt.equals("3"))//1：未完成；2：完成申请；3：一级审批；4：二级审批；5：三级审批；6：已领取
	{
		out.println("错误！审批状态不正确");
		return;
	}


	ls_sql="update oa_xcplqsq set lqzt='3',yjspr=?,yjspsj=?,yjspjl=?,yjspsm=? ";
    ls_sql+=" where sqxh="+sqxh+" and lqzt='3'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yjspr);
	ps.setDate(2,yjspsj);
	ps.setString(3,yjspjl);
	ps.setString(4,yjspsm);
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