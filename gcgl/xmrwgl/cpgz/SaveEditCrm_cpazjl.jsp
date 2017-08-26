<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String azjlh=null;
String khbh=null;
String cpflbm=null;
String azjg=null;
java.sql.Date smsj=null;
String smr=null;
String azsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
azjlh=cf.GB2Uni(request.getParameter("azjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
azjg=cf.GB2Uni(request.getParameter("azjg"));
ls=request.getParameter("smsj");
try{
	if (!(ls.equals("")))  smsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[smsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上门时间]类型转换发生意外:"+e);
	return;
}
smr=cf.GB2Uni(request.getParameter("smr"));
azsm=cf.GB2Uni(request.getParameter("azsm"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String whereazjlh=null;
whereazjlh=cf.GB2Uni(request.getParameter("whereazjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_cpazjl set azjlh=?,khbh=?,cpflbm=?,azjg=?,smsj=?,smr=?,azsm=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where  (azjlh='"+whereazjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,azjlh);
	ps.setString(2,khbh);
	ps.setString(3,cpflbm);
	ps.setString(4,azjg);
	ps.setDate(5,smsj);
	ps.setString(6,smr);
	ps.setString(7,azsm);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,lrbm);
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