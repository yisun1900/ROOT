<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgypbm=null;
String bgypmc=null;
String flbm=null;
String jldw=null;
double dj=0;
String pp=null;
String xh=null;
String ghs=null;
bgypbm=cf.GB2Uni(request.getParameter("bgypbm"));
bgypmc=cf.GB2Uni(request.getParameter("bgypmc"));
flbm=cf.GB2Uni(request.getParameter("flbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
pp=cf.GB2Uni(request.getParameter("pp"));
xh=cf.GB2Uni(request.getParameter("xh"));
ghs=cf.GB2Uni(request.getParameter("ghs"));
String wherebgypbm=null;
wherebgypbm=cf.GB2Uni(request.getParameter("wherebgypbm"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update oa_bgypbm set bgypbm=?,bgypmc=?,flbm=?,jldw=?,dj=?,pp=?,xh=?,ghs=? ";
	ls_sql+=" where bgypbm='"+wherebgypbm+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgypbm);
	ps.setString(2,bgypmc);
	ps.setString(3,flbm);
	ps.setString(4,jldw);
	ps.setDouble(5,dj);
	ps.setString(6,pp);
	ps.setString(7,xh);
	ps.setString(8,ghs);
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