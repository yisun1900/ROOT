<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tmbm=null;
String tmmc=null;
String tmxlbm=null;
String xh=null;
double ymjg=0;
double pmjg=0;
String ppbm=null;
String zp=null;
String bz=null;
tmbm=cf.GB2Uni(request.getParameter("tmbm"));
tmmc=cf.GB2Uni(request.getParameter("tmmc"));
tmxlbm=cf.GB2Uni(request.getParameter("tmxlbm"));
xh=cf.GB2Uni(request.getParameter("xh"));
ls=request.getParameter("ymjg");
try{
	if (!(ls.equals("")))  ymjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ymjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[延米价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pmjg");
try{
	if (!(ls.equals("")))  pmjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pmjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平米价格]类型转换发生意外:"+e);
	return;
}
ppbm=cf.GB2Uni(request.getParameter("ppbm"));
zp=cf.GB2Uni(request.getParameter("zp"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jc_tmbj ( tmbm,tmmc,tmxlbm,xh,ymjg,pmjg,ppbm,zp,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tmbm);
	ps.setString(2,tmmc);
	ps.setString(3,tmxlbm);
	ps.setString(4,xh);
	ps.setDouble(5,ymjg);
	ps.setDouble(6,pmjg);
	ps.setString(7,ppbm);
	ps.setString(8,zp);
	ps.setString(9,bz);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>