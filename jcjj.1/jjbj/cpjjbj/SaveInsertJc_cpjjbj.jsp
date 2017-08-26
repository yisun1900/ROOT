<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String cpjjbh=null;
String cpjjfg=null;
String cpjjmc=null;
String xh=null;
String gg=null;
String cpjjxl=null;
String cpjjcz=null;
double dj=0;
String cktp=null;
String cptp=null;
String cpsm=null;
String dqbm=null;
String bz=null;
cpjjbh=cf.GB2Uni(request.getParameter("cpjjbh"));
cpjjfg=cf.GB2Uni(request.getParameter("cpjjfg"));
cpjjmc=cf.GB2Uni(request.getParameter("cpjjmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
cpjjxl=cf.GB2Uni(request.getParameter("cpjjxl"));
cpjjcz=cf.GB2Uni(request.getParameter("cpjjcz"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
cktp=cf.GB2Uni(request.getParameter("cktp"));
cptp=cf.GB2Uni(request.getParameter("cptp"));
cpsm=cf.GB2Uni(request.getParameter("cpsm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jc_cpjjbj ( cpjjbh,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz,dj,cktp,cptp,cpsm,dqbm,bz,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,'"+yhmc+"',SYSDATE ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpjjbh);
	ps.setString(2,cpjjfg);
	ps.setString(3,cpjjmc);
	ps.setString(4,xh);
	ps.setString(5,gg);
	ps.setString(6,cpjjxl);
	ps.setString(7,cpjjcz);
	ps.setDouble(8,dj);
	ps.setString(9,cktp);
	ps.setString(10,cptp);
	ps.setString(11,cpsm);
	ps.setString(12,dqbm);
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