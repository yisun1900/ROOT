<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long kpjlh=0;
java.sql.Date qssj=null;
java.sql.Date jzsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String kpfgs=null;
ls=request.getParameter("kpjlh");
try{
	if (!(ls.equals("")))  kpjlh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kpjlh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考评记录号]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qssj");
try{
	if (!(ls.equals("")))  qssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考评起始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzsj");
try{
	if (!(ls.equals("")))  jzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考评截止时间]类型转换发生意外:"+e);
	return;
}
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
bz=cf.GB2Uni(request.getParameter("bz"));
kpfgs=cf.GB2Uni(request.getParameter("kpfgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into kp_zjkpjl ( kpjlh,qssj,jzsj,lrr,lrsj,bz,kpfgs ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,kpjlh);
	ps.setDate(2,qssj);
	ps.setDate(3,jzsj);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,bz);
	ps.setString(7,kpfgs);
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