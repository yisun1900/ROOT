<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xqbh=0;
String xqmc=null;
String ggtfxs=null;
String tfsj=null;
String ggfy=null;
String xcmd=null;
String xcxg=null;
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
ggtfxs=cf.GB2Uni(request.getParameter("ggtfxs"));
tfsj=cf.GB2Uni(request.getParameter("tfsj"));
ggfy=cf.GB2Uni(request.getParameter("ggfy"));
xcmd=cf.GB2Uni(request.getParameter("xcmd"));
xcxg=cf.GB2Uni(request.getParameter("xcxg"));
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
	ls_sql="insert into yx_lpggxcqk ( xqbh,xqmc,ggtfxs,tfsj,ggfy,xcmd,xcxg,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xqbh);
	ps.setString(2,xqmc);
	ps.setString(3,ggtfxs);
	ps.setString(4,tfsj);
	ps.setString(5,ggfy);
	ps.setString(6,xcmd);
	ps.setString(7,xcxg);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
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