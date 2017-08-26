<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
long bfcs=0;
String bfjs=null;
double bfbl=0;
double dzld=0;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("bfcs");
try{
	if (!(ls.equals("")))  bfcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bfcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拨付次数]类型转换发生意外:"+e);
	return;
}
bfjs=cf.GB2Uni(request.getParameter("bfjs"));
ls=request.getParameter("bfbl");
try{
	if (!(ls.equals("")))  bfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bfbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拨付比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dzld");
try{
	if (!(ls.equals("")))  dzld=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzld]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[打折力度]类型转换发生意外:"+e);
	return;
}
String sfkclk=cf.GB2Uni(request.getParameter("sfkclk"));
String sfkybgf=cf.GB2Uni(request.getParameter("sfkybgf"));
double clkzdbl=0;
ls=request.getParameter("clkzdbl");
try{
	if (!(ls.equals("")))  clkzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clkzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料款最低比例]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_lfbgfcsb ( fgsbh,bfcs,bfjs,bfbl,dzld,sfkclk,sfkybgf,clkzdbl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setLong(2,bfcs);
	ps.setString(3,bfjs);
	ps.setDouble(4,bfbl);
	ps.setDouble(5,dzld);
	ps.setString(6,sfkclk);
	ps.setString(7,sfkybgf);
	ps.setDouble(8,clkzdbl);
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