<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String shjl=null;
String shyj=null;
String shr=null;
String yshz=null;
java.sql.Date shsj=null;
shjl=cf.GB2Uni(request.getParameter("shjl"));
shyj=cf.GB2Uni(request.getParameter("shyj"));
shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}

String hzbh=cf.GB2Uni(request.getParameter("hzbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
if (shjl.equals("1"))
{
	yshz="02";
}
else if (shjl.equals("2"))
{
	yshz="04";
}
else
{
	yshz="05";
}
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	ls_sql="update rs_fysh set shjl=?,shyj=?,shr=?,shsj=?,yshz=? ";
	ls_sql+=" where hzbh='"+hzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjl);
	ps.setString(2,shyj);
	ps.setString(3,shr);
	ps.setDate(4,shsj);
	ps.setString(5,yshz);
	ps.executeUpdate();
	ps.close();

	if (shjl.equals("2"))
	{
	ls_sql="update rs_fysq set sfkg='Y' ";
	ls_sql+=" where hzbh='"+hzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	}

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