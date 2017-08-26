<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
java.sql.Date fssj=null;
String sgd=null;
long gsrs=0;
long gwrs=0;
String sgsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("fssj");
try{
	if (!(ls.equals("")))  fssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发生时间]类型转换发生意外:"+e);
	return;
}
sgd=cf.GB2Uni(request.getParameter("sgd"));
ls=request.getParameter("gsrs");
try{
	if (!(ls.equals("")))  gsrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gsrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工伤人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gwrs");
try{
	if (!(ls.equals("")))  gwrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gwrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工亡人数]类型转换发生意外:"+e);
	return;
}
sgsm=cf.GB2Uni(request.getParameter("sgsm"));
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
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into crm_aqsgjl ( khbh,fssj,sgd,gsrs,gwrs,sgsm,lrr,lrsj,lrbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setDate(2,fssj);
	ps.setString(3,sgd);
	ps.setLong(4,gsrs);
	ps.setLong(5,gwrs);
	ps.setString(6,sgsm);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
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