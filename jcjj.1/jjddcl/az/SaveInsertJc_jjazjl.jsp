<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
java.sql.Date smrq=null;
String zcsmyybm=null;
String azqk=null;
String lrr=null;
java.sql.Date lrsj=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
ls=request.getParameter("smrq");
try{
	if (!(ls.equals("")))  smrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量smrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上门日期]类型转换发生意外:"+e);
	return;
}
zcsmyybm=cf.GB2Uni(request.getParameter("zcsmyybm"));
azqk=cf.GB2Uni(request.getParameter("azqk"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
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
	ls_sql="insert into jc_jjazjl ( ddbh,smrq,zcsmyybm,azqk,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setDate(2,smrq);
	ps.setString(3,zcsmyybm);
	ps.setString(4,azqk);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
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