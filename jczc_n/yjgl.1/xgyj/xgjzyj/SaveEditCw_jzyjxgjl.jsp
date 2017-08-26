<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
java.sql.Date xgsj=null;
String xgr=null;
String zt=null;
String hth=null;
String khxm=null;
String xglx=null;
java.sql.Date yjzrq=null;
double ywdzgce=0;
double yqye=0;
java.sql.Date xjzrq=null;
double xwdzgce=0;
double xqye=0;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("xgsj");
try{
	if (!(ls.equals("")))  xgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改时间]类型转换发生意外:"+e);
	return;
}
xgr=cf.GB2Uni(request.getParameter("xgr"));
zt=cf.GB2Uni(request.getParameter("zt"));
hth=cf.GB2Uni(request.getParameter("hth"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xglx=cf.GB2Uni(request.getParameter("xglx"));
ls=request.getParameter("yjzrq");
try{
	if (!(ls.equals("")))  yjzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjzrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原业绩结转时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ywdzgce");
try{
	if (!(ls.equals("")))  ywdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ywdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原合同原报价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yqye");
try{
	if (!(ls.equals("")))  yqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原工程签约额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xjzrq");
try{
	if (!(ls.equals("")))  xjzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xjzrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后业绩结转时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xwdzgce");
try{
	if (!(ls.equals("")))  xwdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xwdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后合同原报价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xqye");
try{
	if (!(ls.equals("")))  xqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xqye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后工程签约额]类型转换发生意外:"+e);
	return;
}
String wherekhbh=null;
String wherexgsj=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wherexgsj=cf.GB2Uni(request.getParameter("wherexgsj"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jzyjxgjl set khbh=?,xgsj=?,xgr=?,zt=?,hth=?,khxm=?,xglx=?,yjzrq=?,ywdzgce=?,yqye=?,xjzrq=?,xwdzgce=?,xqye=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (xgsj=TO_DATE('"+wherexgsj+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setDate(2,xgsj);
	ps.setString(3,xgr);
	ps.setString(4,zt);
	ps.setString(5,hth);
	ps.setString(6,khxm);
	ps.setString(7,xglx);
	ps.setDate(8,yjzrq);
	ps.setDouble(9,ywdzgce);
	ps.setDouble(10,yqye);
	ps.setDate(11,xjzrq);
	ps.setDouble(12,xwdzgce);
	ps.setDouble(13,xqye);
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