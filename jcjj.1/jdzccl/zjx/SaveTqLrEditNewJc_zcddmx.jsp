<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;

String zcmc=cf.GB2Uni(request.getParameter("zcmc"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String zclbbm=cf.GB2Uni(request.getParameter("zclbbm"));
String jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
String xinghao=cf.GB2Uni(request.getParameter("xinghao"));
String gg=cf.GB2Uni(request.getParameter("gg"));

double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实销单价]类型转换发生意外:"+e);
	return;
}
String zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
String zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
double je=0;
double ycf=0;
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费]类型转换发生意外:"+e);
	return;
}
String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
if (qtfy.equals("W"))
{
	qtfy="";
}
double qtfyje=0;
ls=request.getParameter("qtfyje");
try{
	if (!(ls.equals("")))  qtfyje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfyje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费金额]类型转换发生意外:"+e);
	return;
}

String cxhdbz=null;
String bz=null;
cxhdbz=cf.GB2Uni(request.getParameter("cxhdbz"));
bz=cf.GB2Uni(request.getParameter("bz"));

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
double cxhdje=0;
ls=request.getParameter("cxhdje");
try{
	if (!(ls.equals("")))  cxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动金额]类型转换发生意外:"+e);
	return;
}

String sfycx=null;
sfycx=request.getParameter("sfycx");

String sxhtyy=cf.GB2Uni(request.getParameter("sxhtyy"));


String ddbh=request.getParameter("ddbh");
String xh=request.getParameter("xh");
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));


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

	conn.setAutoCommit(false);

	ls_sql ="update jc_zcddmx set zcmc=?,zcdlbm=?,zcxlbm=?,zclbbm=?,xinghao=?,gg=?,zcysbm=?,jldwbm=?,dj=?,qtfy=?   ,cxhdbl=?,zcpzwzbm=?,cxhdbz=?,sfycx=?,sxhtyy=?   ,bz=?,lrr=?,lrsj=SYSDATE";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcmc);
	ps.setString(2,zcdlbm);
	ps.setString(3,zcxlbm);
	ps.setString(4,zclbbm);
	ps.setString(5,xinghao);
	ps.setString(6,gg);
	ps.setString(7,zcysbm);
	ps.setString(8,jldwbm);
	ps.setDouble(9,dj);
	ps.setString(10,qtfy);

	ps.setDouble(11,cxhdbl);
	ps.setString(12,zcpzwzbm);
	ps.setString(13,cxhdbz);
	ps.setString(14,sfycx);
	ps.setString(15,sxhtyy);

	ps.setString(16,bz);
	ps.setString(17,yhmc);
	ps.executeUpdate();
	ps.close();


	
	ls_sql="update jc_zczjxmx set zjsl=?,zjje=?,zjycf=?,zjqtfy=?,zjcxhdje=?,bz=?";
	ls_sql+=" where zjxbh='"+zjxbh+"' and xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sl);
	ps.setDouble(2,je);
	ps.setDouble(3,ycf);
	ps.setDouble(4,qtfyje);
	ps.setDouble(5,cxhdje);
	ps.setString(6,bz);
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