<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssdwbh=(String)session.getAttribute("dwbh");

String ls=null;
String bgypbm=null;
String slr=null;
String sqrqstr=null;
java.sql.Date sqrq=null;
long jhlqsl=0;
String jhlqrqstr=null;
java.sql.Date jhlqrq=null;
String lqzt=null;
String bz=null;
bgypbm=cf.GB2Uni(request.getParameter("bgypbm"));
slr=cf.GB2Uni(request.getParameter("slr"));
ls=request.getParameter("sqrq");
sqrqstr=ls;
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhlqsl");
try{
	if (!(ls.equals("")))  jhlqsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhlqsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划领取数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhlqrq");
jhlqrqstr=ls;
try{
	if (!(ls.equals("")))  jhlqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhlqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划领取日期]类型转换发生意外:"+e);
	return;
}
lqzt=cf.GB2Uni(request.getParameter("lqzt"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherexh=cf.GB2Uni(request.getParameter("wherexh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double bzjebz=0;
	ls_sql="select jebz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssdwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzjebz=rs.getDouble(1);
	}
	ps.close();
	rs.close();

	ls_sql="update oa_lqsq set bgypbm=?,slr=?,sqrq=?,jhlqsl=?,jhlqrq=?,lqzt=?,bz=? ";
	ls_sql+=" where  xh="+wherexh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgypbm);
	ps.setString(2,slr);
	ps.setDate(3,sqrq);
	ps.setLong(4,jhlqsl);
	ps.setDate(5,jhlqrq);
	ps.setString(6,lqzt);
	ps.setString(7,bz);
	ps.executeUpdate();
	ps.close();

	out.println("存盘成功！<P>");

	double ylqje=0;
	double wlqje=0;
	double alllqje=0;
	ls_sql="select sum(dj*slqsl)";
	ls_sql+=" from  oa_lqsq,oa_bgypbm";
	ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and slr='"+slr+"' and lqzt='Y' and TO_CHAR(lqsj,'MM')=TO_CHAR(TO_DATE('"+jhlqrqstr+"','YYYY-MM-DD'),'MM')";
	ps= conn.prepareStatement(ls_sql);
//	ps.setDate(1,sqrq);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ylqje=rs.getDouble(1);
	}
	ps.close();
	rs.close();

	ls_sql="select sum(dj*jhlqsl)";
	ls_sql+=" from  oa_lqsq,oa_bgypbm";
	ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and slr='"+slr+"' and lqzt='N' and TO_CHAR(jhlqrq,'MM')=TO_CHAR(TO_DATE('"+jhlqrqstr+"','YYYY-MM-DD'),'MM')";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqrq);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wlqje=rs.getDouble(1);
	}
	ps.close();
	rs.close();


	alllqje=ylqje+wlqje;

	if (alllqje>bzjebz)
	{
		out.println("！！！警告！本月领取已超标，标准为："+bzjebz);
		out.println("<BR>目前累计："+alllqje+",其中已领:"+ylqje+";未领:"+wlqje);
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
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