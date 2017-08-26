<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pdxh=null;
String bh=null;
String mc=null;
String dw=null;
long sl=0;
String xhjgg=null;
java.sql.Date grsj=null;
String dwbh=null;
double gryz=0;
String zrr=null;
String pdr=null;
java.sql.Date pdsj=null;
String bz=null;
pdxh=cf.GB2Uni(request.getParameter("pdxh"));
bh=cf.GB2Uni(request.getParameter("bh"));
mc=cf.GB2Uni(request.getParameter("mc"));
dw=cf.GB2Uni(request.getParameter("dw"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
xhjgg=cf.GB2Uni(request.getParameter("xhjgg"));
ls=request.getParameter("grsj");
try{
	if (!(ls.equals("")))  grsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量grsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[购入时间]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("gryz");
try{
	if (!(ls.equals("")))  gryz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gryz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[购入原值]类型转换发生意外:"+e);
	return;
}
zrr=cf.GB2Uni(request.getParameter("zrr"));
pdr=cf.GB2Uni(request.getParameter("pdr"));
ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[盘点时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherepdxh=null;
wherepdxh=cf.GB2Uni(request.getParameter("wherepdxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_dzyhppdmx set pdxh=?,bh=?,mc=?,dw=?,sl=?,xhjgg=?,grsj=?,dwbh=?,gryz=?,zrr=?,pdr=?,pdsj=?,bz=? ";
	ls_sql+=" where  (pdxh='"+wherepdxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdxh);
	ps.setString(2,bh);
	ps.setString(3,mc);
	ps.setString(4,dw);
	ps.setLong(5,sl);
	ps.setString(6,xhjgg);
	ps.setDate(7,grsj);
	ps.setString(8,dwbh);
	ps.setDouble(9,gryz);
	ps.setString(10,zrr);
	ps.setString(11,pdr);
	ps.setDate(12,pdsj);
	ps.setString(13,bz);
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
	out.print("Exception: " + e);
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