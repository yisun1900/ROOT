<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long sjpxrs=0;
//long hgrs=0;
//
double sjpxfy=0;
//java.sql.Date sjkssj=null;
//java.sql.Date sjjssj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String pxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
String jhjg=cf.GB2Uni(request.getParameter("jhjg"));

//ls=request.getParameter("sjpxrs");
//try{
//	if (!(ls.equals("")))  sjpxrs=Long.parseLong(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量sjpxrs不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[实际培训人数]类型转换发生意外:"+e);
//	return;
//}
//ls=request.getParameter("hgrs");
//try{
//	if (!(ls.equals("")))  hgrs=Long.parseLong(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量hgrs不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[合格人数]类型转换发生意外:"+e);
//	return;
//}
//
//ls=request.getParameter("sjpxfy");
//try{
//	if (!(ls.equals("")))  sjpxfy=Double.parseDouble(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量sjpxfy不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[实际培训费用]类型转换发生意外:"+e);
//	return;
//}
//ls=request.getParameter("sjkssj");
//try{
//	if (!(ls.equals("")))  sjkssj=java.sql.Date.valueOf(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量sjkssj不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[实际培训开始时间]类型转换发生意外:"+e);
//	return;
//}
//ls=request.getParameter("sjjssj");
//try{
//	if (!(ls.equals("")))  sjjssj=java.sql.Date.valueOf(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量sjjssj不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[实际培训结束时间]类型转换发生意外:"+e);
//	return;
//}
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into rs_pxjhjg ( bz,pxjhbh,lrr,lrsj,jhjg,sjpxrs,sjpxfy ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bz);	
	ps.setString(2,pxjhbh);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,jhjg);
	ps.setLong(6,sjpxrs);
	ps.setDouble(7,sjpxfy);

	ps.executeUpdate();
	ps.close();
//中间状态录入未完成
	ls_sql="update rs_pxjh set jhzt='7' ";
	ls_sql+=" where pxjhbh='"+pxjhbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("保存成功!");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>