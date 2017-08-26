<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gsbh=null;
String gdzcmc=null;
long yjrxh=0;
java.sql.Date yjsj=null;
long jsrxh=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
gsbh=cf.GB2Uni(request.getParameter("gsbh"));
gdzcmc=cf.GB2Uni(request.getParameter("gdzcmc"));
ls=request.getParameter("yjrxh");
try{
	if (!(ls.equals("")))  yjrxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjrxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[移交人序号]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjsj");
try{
	if (!(ls.equals("")))  yjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[移交时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsrxh");
try{
	if (!(ls.equals("")))  jsrxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsrxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[接收人序号]类型转换发生意外:"+e);
	return;
}
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String yjrssbm=cf.GB2Uni(request.getParameter("yjrssbm"));
String jsrssbm=cf.GB2Uni(request.getParameter("jsrssbm"));
String yjrssfgs=cf.GB2Uni(request.getParameter("yjrssfgs"));
String jsrssfgs=cf.GB2Uni(request.getParameter("jsrssfgs"));
String yjr=cf.GB2Uni(request.getParameter("yjr"));
String jsr=cf.GB2Uni(request.getParameter("jsr"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	java.sql.Date oldyjsj=null;
	ls_sql="select yjsj";
	ls_sql+=" from  xz_gdzcb";
	ls_sql+=" where  (gsbh='"+gsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldyjsj=rs.getDate("yjsj");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="insert into xz_gdzcyjjl ( gsbh,gdzcmc,yjrxh,yjr,yjsj,jsrxh,jsr,lrr,lrsj,lrbm,bz,yjrssbm,jsrssbm,oldyjsj,yjrssfgs,jsrssfgs ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gsbh);
	ps.setString(2,gdzcmc);
	ps.setLong(3,yjrxh);
	ps.setString(4,yjr);
	ps.setDate(5,yjsj);
	ps.setLong(6,jsrxh);
	ps.setString(7,jsr);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,lrbm);
	ps.setString(11,bz);
	ps.setString(12,yjrssbm);
	ps.setString(13,jsrssbm);
	ps.setDate(14,oldyjsj);
	ps.setString(15,yjrssfgs);
	ps.setString(16,jsrssfgs);
	ps.executeUpdate();
	ps.close();


	ls_sql="update xz_gdzcb set ygbh=?,bgr=?,dwbh=?,fgsbh=?,yjsj=? ";
	ls_sql+=" where  (gsbh='"+gsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,jsrxh);
	ps.setString(2,jsr);
	ps.setString(3,jsrssbm);
	ps.setString(4,jsrssfgs);
	ps.setDate(5,yjsj);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>