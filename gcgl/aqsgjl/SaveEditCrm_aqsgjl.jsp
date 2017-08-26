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
	out.println("<BR>变量[gsrs]不存在");
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
	out.println("<BR>变量[gwrs]不存在");
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
String wherekhbh=null;
String wherefssj=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wherefssj=cf.GB2Uni(request.getParameter("wherefssj"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update crm_aqsgjl set fssj=?,gsrs=?,gwrs=?,sgsm=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (fssj=TO_DATE('"+wherefssj+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fssj);
	ps.setLong(2,gsrs);
	ps.setLong(3,gwrs);
	ps.setString(4,sgsm);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
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