<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xqbm=null;
String xqmc=null;
String cqbm=null;
String dqbm=null;
String yhdlm=null;
String kfs=null;
String sldh=null;
long mpmjj=0;
java.sql.Date rzsj=null;
String bz=null;
xqbm=cf.GB2Uni(request.getParameter("xqbm"));
xqmc=cf.GB2Uni(request.getParameter("xqmc"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
kfs=cf.GB2Uni(request.getParameter("kfs"));
sldh=cf.GB2Uni(request.getParameter("sldh"));
ls=request.getParameter("mpmjj");
try{
	if (!(ls.equals("")))  mpmjj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mpmjj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每平米均价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入住时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

String wherexqbm=null;
wherexqbm=cf.GB2Uni(request.getParameter("wherexqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_xqbm set xqbm=?,xqmc=?,cqbm=?,dqbm=?,yhdlm=?,kfs=?,sldh=?,mpmjj=?,rzsj=?,bz=? ";
	ls_sql+=" where  (xqbm='"+wherexqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xqbm);
	ps.setString(2,xqmc);
	ps.setString(3,cqbm);
	ps.setString(4,dqbm);
	ps.setString(5,yhdlm);
	ps.setString(6,kfs);
	ps.setString(7,sldh);
	ps.setLong(8,mpmjj);
	ps.setDate(9,rzsj);
	ps.setString(10,bz);
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