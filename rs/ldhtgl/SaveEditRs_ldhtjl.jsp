<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ldhtbh=null;
long ygbh=0;
String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
String dwbh=null;
String ssfgs=null;
java.sql.Date rzsj=null;
String ldhtlx=null;
String ldhtqx=null;
java.sql.Date htksrq=null;
java.sql.Date htdqrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ldhtbh=cf.GB2Uni(request.getParameter("ldhtbh"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职日期]类型转换发生意外:"+e);
	return;
}
ldhtlx=cf.GB2Uni(request.getParameter("ldhtlx"));
ldhtqx=cf.GB2Uni(request.getParameter("ldhtqx"));
ls=request.getParameter("htksrq");
try{
	if (!(ls.equals("")))  htksrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htksrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同开始日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htdqrq");
try{
	if (!(ls.equals("")))  htdqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htdqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同到期日期]类型转换发生意外:"+e);
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
String whereldhtbh=null;
whereldhtbh=cf.GB2Uni(request.getParameter("whereldhtbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getldhtbh="";
	ls_sql="select ldhtbh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getldhtbh=cf.fillNull(rs.getString("ldhtbh"));
	}
	rs.close();
	ps.close();

	if (!getldhtbh.equals(whereldhtbh))
	{
		out.println("错误！『劳动合同编号』已改变为："+getldhtbh);
		return;
	}

	conn.setAutoCommit(false);
	
	
	ls_sql="update rs_ldhtjl set ldhtbh=?,ygbh=?,yhmc=?,bianhao=?,sfzh=?,xzzwbm=?,dwbh=?,ssfgs=?,rzsj=?,ldhtlx=?,ldhtqx=?,htksrq=?,htdqrq=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (ldhtbh='"+whereldhtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ldhtbh);
	ps.setLong(2,ygbh);
	ps.setString(3,yhmc);
	ps.setString(4,bianhao);
	ps.setString(5,sfzh);
	ps.setString(6,xzzwbm);
	ps.setString(7,dwbh);
	ps.setString(8,ssfgs);
	ps.setDate(9,rzsj);
	ps.setString(10,ldhtlx);
	ps.setString(11,ldhtqx);
	ps.setDate(12,htksrq);
	ps.setDate(13,htdqrq);
	ps.setString(14,lrr);
	ps.setDate(15,lrsj);
	ps.setString(16,lrbm);
	ps.setString(17,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_yhxx set ldhtbh=?,ldhtlx=?,ldhtqx=?,htksrq=?,htdqrq=?";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ldhtbh);
	ps.setString(2,ldhtlx);
	ps.setString(3,ldhtqx);
	ps.setDate(4,htksrq);
	ps.setDate(5,htdqrq);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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