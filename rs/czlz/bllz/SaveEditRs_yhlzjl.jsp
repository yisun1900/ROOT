<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
java.sql.Date lzrq=null;
String lzyy=null;
String dwbh=null;
String ssfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
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
ls=request.getParameter("lzrq");
try{
	if (!(ls.equals("")))  lzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lzrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[离职日期]类型转换发生意外:"+e);
	return;
}
lzyy=cf.GB2Uni(request.getParameter("lzyy"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
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
String lzyyflbm=cf.GB2Uni(request.getParameter("lzyyflbm"));
String lzlx=cf.GB2Uni(request.getParameter("lzlx"));

String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lzxh="";
	String sfzszg="";
	ls_sql="select lzxh,sfzszg";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh='"+ygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lzxh=cf.fillNull(rs.getString(1));
		sfzszg=cf.fillNull(rs.getString(2));
	}
	rs.close();
	ps.close();

	if (!sfzszg.equals("S") && !sfzszg.equals("T"))
	{
		out.println("错误！员工未离职");
		return;
	}
	if (!lzxh.equals(wherexh))
	{
		out.println("错误！只能修改最新的离职信息："+lzxh);
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update rs_yhlzjl set ygbh=?,yhmc=?,bianhao=?,sfzh=?,xzzwbm=?,lzrq=?,lzyy=?,dwbh=?,ssfgs=?,lrr=?,lrsj=?,lzyyflbm=?,lzlx=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ygbh);
	ps.setString(2,yhmc);
	ps.setString(3,bianhao);
	ps.setString(4,sfzh);
	ps.setString(5,xzzwbm);
	ps.setDate(6,lzrq);
	ps.setString(7,lzyy);
	ps.setString(8,dwbh);
	ps.setString(9,ssfgs);
	ps.setString(10,lrr);
	ps.setDate(11,lrsj);
	ps.setString(12,lzyyflbm);
	ps.setString(13,lzlx);
	ps.executeUpdate();
	ps.close();


	ls_sql="update sq_yhxx set lzrq=?,lzyyflbm=?,lzyy=?,sfzszg=?";
	ls_sql+=" where  (ygbh='"+ygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,lzrq);
	ps.setString(2,lzyyflbm);
	ps.setString(3,lzyy);
	ps.setString(4,lzlx);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>