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
	out.println("<BR>[折后实销单价]类型转换发生意外:"+e);
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
double zqje=0;
ls=request.getParameter("zqje");
try{
	if (!(ls.equals("")))  zqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前合同材料费]类型转换发生意外:"+e);
	return;
}
double je=0;
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后合同材料费]类型转换发生意外:"+e);
	return;
}
double ycf=0;
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
String sftjcp=request.getParameter("sftjcp");

String sfzp=request.getParameter("sfzp");
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("07"))
	{
		out.println("<BR>错误，不能再进行修改！合同已完成");
		return;
	}


	ls_sql ="update jc_zcddmx set zcmc=?,zcdlbm=?,zcxlbm=?,zclbbm=?,xinghao=?,gg=?,zcysbm=?,jldwbm=?,zqdj=?,dpzk=?   ,dj=?,sl=?,zqje=?,je=?,ycf=?,qtfy=?,qtfyje=?,zjhsl=?,zqzjhje=?,zjhje=?   ,zjhycf=?,zjhqtfy=?,zcpzwzbm=?,cxhdbz=?,cxhdbl=?,cxhdje=?,sfycx=?,sxhtyy=?,bz=?,lrr=?,sftjcp=?,lrsj=SYSDATE,sfzp=?,zsdj=?,htyjjrje=yjjrbl/100*?,zjhyjjrje=yjjrbl/100*?";
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
	ps.setDouble(9,zqdj);
	ps.setDouble(10,dpzk);


	ps.setDouble(11,dj);
	ps.setDouble(12,sl);
	ps.setDouble(13,zqje);
	ps.setDouble(14,je);
	ps.setDouble(15,ycf);
	ps.setString(16,qtfy);
	ps.setDouble(17,qtfyje);
	ps.setDouble(18,sl);
	ps.setDouble(19,zqje);
	ps.setDouble(20,je);

	ps.setDouble(21,ycf);
	ps.setDouble(22,qtfyje);
	ps.setString(23,zcpzwzbm);
	ps.setString(24,cxhdbz);
	ps.setDouble(25,cxhdbl);
	ps.setDouble(26,cxhdje);
	ps.setString(27,sfycx);
	ps.setString(28,sxhtyy);
	ps.setString(29,bz);
	ps.setString(30,yhmc);
	ps.setString(31,sftjcp);
	ps.setString(32,sfzp);
	ps.setDouble(33,zsdj);
	ps.setDouble(34,je);
	ps.setDouble(35,je);

	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
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