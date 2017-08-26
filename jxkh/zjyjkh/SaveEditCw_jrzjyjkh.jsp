<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String yhmc=null;
double khfs=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
ls=request.getParameter("khfs");
try{
	if (!(ls.equals("")))  khfs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khfs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核分数]类型转换发生意外:"+e);
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
String wherekhzq=null;
String wheredwbh=null;
String whereyhmc=null;
wherekhzq=cf.GB2Uni(request.getParameter("wherekhzq"));
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
whereyhmc=cf.GB2Uni(request.getParameter("whereyhmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jrzjyjkh set dwbh=?,yhmc=?,khfs=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (khzq='"+wherekhzq+"') and  (dwbh='"+wheredwbh+"') and  (yhmc='"+whereyhmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,yhmc);
	ps.setDouble(3,khfs);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,bz);
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