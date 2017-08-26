<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double dj=0;
String clgw=null;
String xmzy=null;
String bz=null;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金]类型转换发生意外:"+e);
	return;
}
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
bz=cf.GB2Uni(request.getParameter("bz"));
java.sql.Date jhccsj=null;
java.sql.Date jhfcsj=null;
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhccsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划初测时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhfcsj");
try{
	if (!(ls.equals("")))  jhfcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhfcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划复测时间]类型转换发生意外:"+e);
	return;
}
String khxm=cf.GB2Uni(request.getParameter("khxm"));
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));
String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
String hth=cf.GB2Uni(request.getParameter("hth"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_cgdd set dj=?,clgw=?,ztjjgw=?,xmzy=?,bz=?,jhccsj=?,jhfcsj=?,khxm=?,fwdz=?,lxfs=?,hth=?";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dj);
	ps.setString(2,clgw);
	ps.setString(3,ztjjgw);
	ps.setString(4,xmzy);
	ps.setString(5,bz);
	ps.setDate(6,jhccsj);
	ps.setDate(7,jhfcsj);
	ps.setString(8,khxm);
	ps.setString(9,fwdz);
	ps.setString(10,lxfs);
	ps.setString(11,hth);
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