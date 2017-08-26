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
long ygbh=0;
String yhmc=null;
String xzzwbm=null;

String yysm=null;

String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date sqrq=null;
String lrbm=null;
String bz=null;
sqxh=cf.GB2Uni(request.getParameter("sqxh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));


yysm=cf.GB2Uni(request.getParameter("yysm"));


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


String gzbx=cf.GB2Uni(request.getParameter("gzbx"));
String bianhao=cf.GB2Uni(request.getParameter("bianhao"));
String sfzh=cf.GB2Uni(request.getParameter("sfzh"));
java.sql.Date rzsj=null;
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职日期]类型转换发生意外:"+e);
	return;
}
String wpjjqk=cf.GB2Uni(request.getParameter("wpjjqk"));



Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="insert into rs_thrysq ( sqxh,fgsbh,dwbh,ygbh,yhmc,bianhao,sfzh,xzzwbm,rzsj,gzbx   ,yysm,wpjjqk,sqrq,lrr,lrsj,lrbm,bz,clzt,ztbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,'01','1401') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqxh);
	ps.setString(2,fgsbh);
	ps.setString(3,dwbh);
	ps.setLong(4,ygbh);
	ps.setString(5,yhmc);
	ps.setString(6,bianhao);
	ps.setString(7,sfzh);
	ps.setString(8,xzzwbm);
	ps.setDate(9,rzsj);
	ps.setString(10,gzbx);

	ps.setString(11,yysm);
	ps.setString(12,wpjjqk);
	ps.setDate(13,sqrq);
	ps.setString(14,lrr);
	ps.setDate(15,lrsj);
	ps.setString(16,lrbm);
	ps.setString(17,bz);
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