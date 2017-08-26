<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double zjsl=0;
double zjycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
String bz=null;
ls=request.getParameter("zjsl");
try{
	if (!(ls.equals("")))  zjsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减数量]类型转换发生意外:"+e);
	return;
}
double zqzjje=0;
ls=request.getParameter("zqzjje");
try{
	if (!(ls.equals("")))  zqzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqzjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前材料费]类型转换发生意外:"+e);
	return;
}
double zjje=0;
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjycf");
try{
	if (!(ls.equals("")))  zjycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减远程费]类型转换发生意外:"+e);
	return;
}
zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));
zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
cxhdbz=cf.GB2Uni(request.getParameter("cxhdbz"));
bz=cf.GB2Uni(request.getParameter("bz"));

String xzjg=cf.GB2Uni(request.getParameter("xzjg"));
String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
if (qtfy.equals("W"))
{
	qtfy="";
}
double zjqtfy=0;
ls=request.getParameter("zjqtfy");
try{
	if (!(ls.equals("")))  zjqtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjqtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减其它费用]类型转换发生意外:"+e);
	return;
}
double cxhdbl=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动比率]类型转换发生意外:"+e);
	return;
}



double zjcxhdje=0;
ls=request.getParameter("zjcxhdje");
try{
	if (!(ls.equals("")))  zjcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjcxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减计入活动金额]类型转换发生意外:"+e);
	return;
}

double zjcbje=0;
ls=request.getParameter("zjcbje");
try{
	if (!(ls.equals("")))  zjcbje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjcbje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减成本金额]类型转换发生意外:"+e);
	return;
}

double zqdj=0;
ls=request.getParameter("zqdj");
try{
	if (!(ls.equals("")))  zqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前实销单价]类型转换发生意外:"+e);
	return;
}
double dpzk=0;
double dj=0;
ls=request.getParameter("dpzk");
try{
	if (!(ls.equals("")))  dpzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dpzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单品折扣]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后实销单价]类型转换发生意外:"+e);
	return;
}

String sfzp=cf.GB2Uni(request.getParameter("sfzp"));
double zsdj=0;
ls=request.getParameter("zsdj");
try{
	if (!(ls.equals("")))  zsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zsdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠送单价]类型转换发生意外:"+e);
	return;
}


String ddbh=request.getParameter("ddbh");
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=request.getParameter("xh");

double zjxze=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}

	double yjjrbl=0;
	ls_sql =" select yjjrbl";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjrbl=rs.getDouble("yjjrbl");
	}
	rs.close();
	ps.close();

	double zjyjjrje=cf.round(zjje*yjjrbl/100,2);

	conn.setAutoCommit(false);


	ls_sql="update jc_zcddmx set zcpzwzbm=?,zcysbm=?,cxhdbz=?,xzjg=?,qtfy=?,cxhdbl=?,bz=?,dpzk=?,dj=?,sfzp=?,zsdj=? ";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcpzwzbm);
	ps.setString(2,zcysbm);
	ps.setString(3,cxhdbz);
	ps.setString(4,xzjg);
	ps.setString(5,qtfy);
	ps.setDouble(6,cxhdbl);
	ps.setString(7,bz);
	ps.setDouble(8,dpzk);
	ps.setDouble(9,dj);
	ps.setString(10,sfzp);
	ps.setDouble(11,zsdj);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update jc_zczjxmx set zjsl=?,zqzjje=?,zjje=?,zjycf=?,zjqtfy=?,zjcxhdje=?,zjcbje=?,bz=?,zqsxdj=?,dpzkl=?,zhsxdj=?,zjyjjrje=?";
	ls_sql+=" where zjxbh='"+zjxbh+"' and xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjsl);
	ps.setDouble(2,zqzjje);
	ps.setDouble(3,zjje);
	ps.setDouble(4,zjycf);
	ps.setDouble(5,zjqtfy);
	ps.setDouble(6,zjcxhdje);
	ps.setDouble(7,zjcbje);
	ps.setString(8,bz);
	ps.setDouble(9,zqdj);
	ps.setDouble(10,dpzk);
	ps.setDouble(11,dj);
	ps.setDouble(12,zjyjjrje);
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
	out.print("Exception: " + e);
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