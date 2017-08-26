<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double jzssk=0;
double cxhddj=0;
double jrhdje=0;
double ybkje=0;
double yfkje=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
String blr=null;
java.sql.Date blsj=null;
ls=request.getParameter("jzssk");
try{
	if (!(ls.equals("")))  jzssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzssk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家装实收款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxhddj");
try{
	if (!(ls.equals("")))  cxhddj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhddj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销活动订金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jrhdje");
try{
	if (!(ls.equals("")))  jrhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jrhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入活动金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ybkje");
try{
	if (!(ls.equals("")))  ybkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ybkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应补（扣）款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yfkje");
try{
	if (!(ls.equals("")))  yfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yfkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应返款金额]类型转换发生意外:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
blr=cf.GB2Uni(request.getParameter("blr"));
ls=request.getParameter("blsj");
try{
	if (!(ls.equals("")))  blsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量blsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[办理时间]类型转换发生意外:"+e);
	return;
}
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jcfkd set jzssk=?,cxhddj=?,jrhdje=?,ybkje=?,yfkje=?,lrr=?,lrsj=?,lrbm=?,bz=?,blr=?,blsj=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jzssk);
	ps.setDouble(2,cxhddj);
	ps.setDouble(3,jrhdje);
	ps.setDouble(4,ybkje);
	ps.setDouble(5,yfkje);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,bz);
	ps.setString(10,blr);
	ps.setDate(11,blsj);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>