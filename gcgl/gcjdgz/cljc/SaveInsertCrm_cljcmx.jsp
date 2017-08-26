<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xh=0;
String ysjlh=null;
String clflbm=null;
String clbm=null;
String clmc=null;
String pp=null;
String gg=null;
String jldwbm=null;
double sl=0;
String bz=null;
ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
clflbm=cf.GB2Uni(request.getParameter("clflbm"));
clbm=cf.GB2Uni(request.getParameter("clbm"));
clmc=cf.GB2Uni(request.getParameter("clmc"));
pp=cf.GB2Uni(request.getParameter("pp"));
gg=cf.GB2Uni(request.getParameter("gg"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  crm_cljcmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	xh++;
	
	
	ls_sql="insert into crm_cljcmx ( xh,ysjlh,clflbm,clbm,clmc,pp,gg,jldwbm,sl,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,ysjlh);
	ps.setString(3,clflbm);
	ps.setString(4,clbm);
	ps.setString(5,clmc);
	ps.setString(6,pp);
	ps.setString(7,gg);
	ps.setString(8,jldwbm);
	ps.setDouble(9,sl);
	ps.setString(10,bz);
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
	out.print("存盘失败,发生意外: " + e);
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