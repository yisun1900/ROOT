<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgypbh=null;
String bgypmc=null;
String gg=null;
String pp=null;
double jg=0;
String ghr=null;
String bz=null;
String ssfgs=null;
bgypbh=cf.GB2Uni(request.getParameter("bgypbh"));
bgypmc=cf.GB2Uni(request.getParameter("bgypmc"));
gg=cf.GB2Uni(request.getParameter("gg"));
pp=cf.GB2Uni(request.getParameter("pp"));
ls=request.getParameter("jg");
try{
	if (!(ls.equals("")))  jg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[价格]类型转换发生意外:"+e);
	return;
}
ghr=cf.GB2Uni(request.getParameter("ghr"));
bz=cf.GB2Uni(request.getParameter("bz"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String wherebgypbh=null;
wherebgypbh=cf.GB2Uni(request.getParameter("wherebgypbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_bgypbm set bgypbh=?,bgypmc=?,gg=?,pp=?,jg=?,ghr=?,bz=?,ssfgs=? ";
	ls_sql+=" where  (bgypbh='"+wherebgypbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgypbh);
	ps.setString(2,bgypmc);
	ps.setString(3,gg);
	ps.setString(4,pp);
	ps.setDouble(5,jg);
	ps.setString(6,ghr);
	ps.setString(7,bz);
	ps.setString(8,ssfgs);
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