<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tdjxh=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String dh=null;
String sjs=null;
String tdjyybm=null;
String tdjyysm=null;
double ytje=0;
double stje=0;
String dwbh=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
tdjxh=cf.GB2Uni(request.getParameter("tdjxh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
dh=cf.GB2Uni(request.getParameter("dh"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
tdjyybm=cf.GB2Uni(request.getParameter("tdjyybm"));
tdjyysm=cf.GB2Uni(request.getParameter("tdjyysm"));
ls=request.getParameter("ytje");
try{
	if (!(ls.equals("")))  ytje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ytje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应退金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("stje");
try{
	if (!(ls.equals("")))  stje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量stje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实退金额]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
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
String wheretdjxh=null;
wheretdjxh=cf.GB2Uni(request.getParameter("wheretdjxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_tdjdj set tdjxh=?,khbh=?,khxm=?,fwdz=?,dh=?,sjs=?,tdjyybm=?,tdjyysm=?,ytje=?,stje=?,dwbh=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (tdjxh='"+wheretdjxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tdjxh);
	ps.setString(2,khbh);
	ps.setString(3,khxm);
	ps.setString(4,fwdz);
	ps.setString(5,dh);
	ps.setString(6,sjs);
	ps.setString(7,tdjyybm);
	ps.setString(8,tdjyysm);
	ps.setDouble(9,ytje);
	ps.setDouble(10,stje);
	ps.setString(11,dwbh);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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
	out.print("Exception: " + e);
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