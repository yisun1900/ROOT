<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String fgsbh=null;
String slr=null;
java.sql.Date jhlqrq=null;
String lrr=null;
java.sql.Date lrrq=null;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
slr=cf.GB2Uni(request.getParameter("slr"));
ls=request.getParameter("jhlqrq");
try{
	if (!(ls.equals("")))  jhlqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhlqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划领取日期]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrrq");
try{
	if (!(ls.equals("")))  lrrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入日期]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String sqxh=null;
sqxh=cf.GB2Uni(request.getParameter("sqxh"));
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

	if (lqzt.equals("2"))//1：未完成；2：完成申请；3：一级审批；4：二级审批；5：三级审批；6：已领取
	{
		out.println("错误！已完成，不能再修改，若想修改，在维护中删除完成状态");
		return;
	}

	ls_sql="update oa_xcplqsq set dwbh=?,fgsbh=?,slr=?,jhlqrq=?,lrr=?,lrrq=?,bz=?,lqzt='1' ";
	ls_sql+=" where  (sqxh="+sqxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,fgsbh);
	ps.setString(3,slr);
	ps.setDate(4,jhlqrq);
	ps.setString(5,lrr);
	ps.setDate(6,lrrq);
	ps.setString(7,bz);
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