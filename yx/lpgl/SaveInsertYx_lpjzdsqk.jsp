<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xqbh=0;
String xqmc=null;
String jzdsmc=null;
String ggtfxs=null;
String xcmd=null;
long ggtrje=0;
String rltr=null;
String khzwqk=null;
double zyl=0;
String ykfsgx=null;
String lrr=null;
java.sql.Date lrsj=null;
ls=request.getParameter("xqbh");
try{
	if (!(ls.equals("")))  xqbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xqbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区编号]类型转换发生意外:"+e);
	return;
}
xqmc=cf.GB2Uni(request.getParameter("xqmc"));
jzdsmc=cf.GB2Uni(request.getParameter("jzdsmc"));
ggtfxs=cf.GB2Uni(request.getParameter("ggtfxs"));
xcmd=cf.GB2Uni(request.getParameter("xcmd"));
ls=request.getParameter("ggtrje");
try{
	if (!(ls.equals("")))  ggtrje=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ggtrje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[广告投入金额]类型转换发生意外:"+e);
	return;
}
rltr=cf.GB2Uni(request.getParameter("rltr"));
khzwqk=cf.GB2Uni(request.getParameter("khzwqk"));
ls=request.getParameter("zyl");
try{
	if (!(ls.equals("")))  zyl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zyl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[占有率]类型转换发生意外:"+e);
	return;
}
ykfsgx=cf.GB2Uni(request.getParameter("ykfsgx"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into yx_lpjzdsqk ( xqbh,xqmc,jzdsmc,ggtfxs,xcmd,ggtrje,rltr,khzwqk,zyl,ykfsgx,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xqbh);
	ps.setString(2,xqmc);
	ps.setString(3,jzdsmc);
	ps.setString(4,ggtfxs);
	ps.setString(5,xcmd);
	ps.setLong(6,ggtrje);
	ps.setString(7,rltr);
	ps.setString(8,khzwqk);
	ps.setDouble(9,zyl);
	ps.setString(10,ykfsgx);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
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