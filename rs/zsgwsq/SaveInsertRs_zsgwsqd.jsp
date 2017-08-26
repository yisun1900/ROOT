<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqxh=null;
String fgsbh=null;
String dwbh=null;
String zsgwmc=cf.GB2Uni(request.getParameter("zsgwmc"));
int zbrs=0;
java.sql.Date slrq=null;
String sqzbly=cf.GB2Uni(request.getParameter("sqzbly"));
String bmryjg=cf.GB2Uni(request.getParameter("bmryjg"));
String zbgwzn=cf.GB2Uni(request.getParameter("zbgwzn"));
String zbgwxcfw=cf.GB2Uni(request.getParameter("zbgwxcfw"));
String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date sqrq=null;
String lrbm=null;
String bz=null;
sqxh=cf.GB2Uni(request.getParameter("sqxh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));

ls=request.getParameter("zbrs");
try{
	if (!(ls.equals("")))  zbrs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zbrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增补人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("slrq");
try{
	if (!(ls.equals("")))  slrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量slrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设立日期]类型转换发生意外:"+e);
	return;
}

lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into rs_zsgwsqd (sqxh,fgsbh,dwbh,zsgwmc,zbrs,slrq,sqzbly,bmryjg,zbgwzn,zbgwxcfw   ,sqrq,lrr,lrsj,lrbm,bz,clzt,ztbm) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,'01','1201') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqxh);
	ps.setString(2,fgsbh);
	ps.setString(3,dwbh);
	ps.setString(4,zsgwmc);
	ps.setInt(5,zbrs);
	ps.setDate(6,slrq);
	ps.setString(7,sqzbly);
	ps.setString(8,bmryjg);
	ps.setString(9,zbgwzn);
	ps.setString(10,zbgwxcfw);

	ps.setDate(11,sqrq);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,lrbm);
	ps.setString(15,bz);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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