<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String fgsbh=null;
String ckbh=null;
String cklx=null;
String ckfs=null;
String psfs=null;
java.sql.Date jhshsj=null;
String lydh=null;
String jsr=null;
String ckr=null;
java.sql.Date cksj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
cklx=cf.GB2Uni(request.getParameter("cklx"));
ckfs=cf.GB2Uni(request.getParameter("ckfs"));
psfs=cf.GB2Uni(request.getParameter("psfs"));
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhshsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划送货时间]类型转换发生意外:"+e);
	return;
}
lydh=cf.GB2Uni(request.getParameter("lydh"));
jsr=cf.GB2Uni(request.getParameter("jsr"));
ckr=cf.GB2Uni(request.getParameter("ckr"));
ls=request.getParameter("cksj");
try{
	if (!(ls.equals("")))  cksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cksj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库时间]类型转换发生意外:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ckph=request.getParameter("ckph");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_ckd set ckph=?,dqbm=?,fgsbh=?,ckbh=?,cklx=?,ckfs=?,psfs=?,jhshsj=?,lydh=?,jsr=?,ckr=?,cksj=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (ckph='"+ckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ckph);
	ps.setString(2,dqbm);
	ps.setString(3,fgsbh);
	ps.setString(4,ckbh);
	ps.setString(5,cklx);
	ps.setString(6,ckfs);
	ps.setString(7,psfs);
	ps.setDate(8,jhshsj);
	ps.setString(9,lydh);
	ps.setString(10,jsr);
	ps.setString(11,ckr);
	ps.setDate(12,cksj);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,bz);
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