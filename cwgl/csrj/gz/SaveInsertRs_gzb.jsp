<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khzq=null;
String ssfgs=null;
java.sql.Date fxrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
khzq=cf.GB2Uni(request.getParameter("khzq"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("fxrq");
try{
	if (!(ls.equals("")))  fxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fxrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发薪日期]类型转换发生意外:"+e);
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	java.sql.Date khqssj=null;
	java.sql.Date khjzsj=null;
	double qqts=0;
	ls_sql="select khqssj,khjzsj,qqts";
	ls_sql+=" from  cw_jrkhzq";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khqssj=rs.getDate("khqssj");
		khjzsj=rs.getDate("khjzsj");
		qqts=rs.getDouble("qqts");
	}
	rs.close();
	ps.close();

	ls_sql="insert into rs_gzb ( khzq,ssfgs,fxrq,ksrq,zzrq,qqts,lrr,lrsj,lrbm,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khzq);
	ps.setString(2,ssfgs);
	ps.setDate(3,fxrq);
	ps.setDate(4,khqssj);
	ps.setDate(5,khjzsj);
	ps.setDouble(6,qqts);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		response.sendRedirect("EditRs_gzb.jsp?ssfgs="+ssfgs+"&khzq="+khzq);
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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