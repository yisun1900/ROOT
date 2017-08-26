<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zprs=0;
double zpfy=0;
String fgs=null;
java.sql.Date jhkssj=null;
java.sql.Date jhjssj=null;
String bz=null;
ls=request.getParameter("zprs");
try{
	if (!(ls.equals("")))  zprs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zprs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[招聘人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zpfy");
try{
	if (!(ls.equals("")))  zpfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zpfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[招聘费用]类型转换发生意外:"+e);
	return;
}
fgs=cf.GB2Uni(request.getParameter("fgs"));
ls=request.getParameter("jhkssj");
try{
	if (!(ls.equals("")))  jhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhjssj");
try{
	if (!(ls.equals("")))  jhjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划结束时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherezpjhbh=null;
wherezpjhbh=cf.GB2Uni(request.getParameter("wherezpjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String ztbm=null;
String jhzt=null;
String shjl=null;
String xyztbm=null;

try {
	conn=cf.getConnection();

	ls_sql=" SELECT ztbm,shjl,jhzt ";
	ls_sql+=" FROM rs_zpjh ";
    ls_sql+=" where zpjhbh='"+wherezpjhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztbm=rs.getString(1);
		shjl=rs.getString(2);
		jhzt=rs.getString(3);
	}
	rs.close();
	ps.close();

if(jhzt.equals("5")){
	ls_sql=" SELECT xyztbm ";
	ls_sql+=" FROM rs_zpztkz ";
    ls_sql+=" where shjl='"+shjl+"' and ztbm='"+ztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xyztbm=rs.getString(1);
	}
	rs.close();
	ps.close();
	shjl="x";
	ztbm=xyztbm;
	jhzt="1";
}
	conn.setAutoCommit(false);

	ls_sql="update rs_zpjh set zprs=?,zpfy=?,fgs=?,jhkssj=?,jhjssj=?,bz=?,shjl=?,ztbm=?,jhzt=? ";
	ls_sql+=" where  (zpjhbh='"+wherezpjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zprs);
	ps.setDouble(2,zpfy);
	ps.setString(3,fgs);
	ps.setDate(4,jhkssj);
	ps.setDate(5,jhjssj);
	ps.setString(6,bz);
	ps.setString(7,shjl);
	ps.setString(8,ztbm);
	ps.setString(9,jhzt);

	ps.executeUpdate();
	ps.close();

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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>