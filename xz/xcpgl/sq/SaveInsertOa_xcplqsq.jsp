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

String sfxsp="N";//N：不需要；Y：需要

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int sqxh=0;	
	ls_sql="select NVL(max(sqxh),0)";
	ls_sql+=" from  oa_xcplqsq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sqxh++;
	
	
	ls_sql="insert into oa_xcplqsq ( dwbh,fgsbh,slr,jhlqrq,lrr,lrrq,sfxsp,bz,sqxh,lqzt,jhlqsl,jhlqje,slqsl,slqje ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,'1',0,0,0,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,fgsbh);
	ps.setString(3,slr);
	ps.setDate(4,jhlqrq);
	ps.setString(5,lrr);
	ps.setDate(6,lrrq);
	ps.setString(7,sfxsp);
	ps.setString(8,bz);
	ps.setInt(9,sqxh);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！请录入领取明细");
		window.location="EditOa_xcplqsq.jsp?sqxh=<%=sqxh%>";
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>