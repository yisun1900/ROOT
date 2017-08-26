<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date fksj=null;
String fkr=null;
double fkje=0;
String fkyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("fksj");
try{
	if (!(ls.equals("")))  fksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fksj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[罚款时间]类型转换发生意外:"+e);
	return;
}
fkr=cf.GB2Uni(request.getParameter("fkr"));
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fkje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[罚款金额]类型转换发生意外:"+e);
	return;
}
fkyy=cf.GB2Uni(request.getParameter("fkyy"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String fdbh=cf.GB2Uni(request.getParameter("fdbh"));

String fkjlh=null;
fkjlh=cf.GB2Uni(request.getParameter("fkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_sgdfkjl set fksj=?,fkr=?,fkje=?,fkyy=?,lrr=?,lrsj=?,lrbm=?,bz=?,sgbz=?,fdbh=? ";
	ls_sql+=" where  fkjlh='"+fkjlh+"' and zt='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fksj);
	ps.setString(2,fkr);
	ps.setDouble(3,fkje);
	ps.setString(4,fkyy);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,bz);
	ps.setString(9,sgbz);
	ps.setString(10,fdbh);
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