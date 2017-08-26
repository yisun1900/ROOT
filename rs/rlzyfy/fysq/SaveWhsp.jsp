<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String spjl=null;
String yspjl=null;//原审批结论，保留
String spyj=null;
String spr=null;
String yshz=null;
java.sql.Date spsj=null;
spjl=cf.GB2Uni(request.getParameter("spjl"));
yspjl=cf.GB2Uni(request.getParameter("yspjl"));
spyj=cf.GB2Uni(request.getParameter("spyj"));
spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}

String hzbh=cf.GB2Uni(request.getParameter("hzbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
if (spjl.equals("1"))
{
	yshz="03";
}
else if (spjl.equals("2"))
{
	yshz="01";
}
else
{
	yshz="05";
}
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	ls_sql="update rs_fysh set spjl=?,spyj=?,spr=?,spsj=?,yshz=? ";
	ls_sql+=" where hzbh='"+hzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,spjl);
	ps.setString(2,spyj);
	ps.setString(3,spr);
	ps.setDate(4,spsj);
	ps.setString(5,yshz);
	ps.executeUpdate();
	ps.close();

//	if (spjl.equals("2"))
//	{
//	ls_sql="update rs_fysq set sfkg='Y' ";
//	ls_sql+=" where hzbh='"+hzbh+"' ";
//	ps= conn.prepareStatement(ls_sql);
//	ps.executeUpdate();
//	ps.close();
//	}
//
//	if ((spjl.equals("1")) || (spjl.equals("0")))
//	{
//	ls_sql="update rs_fysq set sfkg='N' ";
//	ls_sql+=" where hzbh='"+hzbh+"' ";
//	ps= conn.prepareStatement(ls_sql);
//	ps.executeUpdate();
//	ps.close();
//	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功!");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e+ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>