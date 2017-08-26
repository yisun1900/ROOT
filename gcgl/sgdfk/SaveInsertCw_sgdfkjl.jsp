<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fkjlh=null;
String sgd=null;
java.sql.Date fksj=null;
String fkr=null;
double fkje=0;
String fkyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
fkjlh=cf.GB2Uni(request.getParameter("fkjlh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
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

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into cw_sgdfkjl ( fkjlh,sgd,fksj,fkr,fkje,fkyy,lrr,lrsj,lrbm,bz,zt,scbz,sgbz,fdbh,jsbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,'1','N',?,?,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fkjlh);
	ps.setString(2,sgd);
	ps.setDate(3,fksj);
	ps.setString(4,fkr);
	ps.setDouble(5,fkje);
	ps.setString(6,fkyy);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	ps.setString(11,sgbz);
	ps.setString(12,fdbh);
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