<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String yhmc=null;
String zw=null;
double byrw=0;

String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
zw=cf.GB2Uni(request.getParameter("zw"));
ls=request.getParameter("byrw");
try{
	if (!(ls.equals("")))  byrw=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[byrw]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本月任务]类型转换发生意外:"+e);
	return;
}


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
bz=cf.GB2Uni(request.getParameter("bz"));

String wherekhzq=cf.GB2Uni(request.getParameter("wherekhzq"));
String whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cw_jryjkh set byrw=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where khzq='"+wherekhzq+"' and ygbh='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,byrw);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,bz);
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