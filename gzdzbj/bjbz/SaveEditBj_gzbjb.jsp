<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String ls=null;
String dqbm=null;
String xmbh=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double bj=0;
double cbenj=0;
double sgdbj=0;

//***********************************************************************************2006-3-31
double zcf=0;//A级主材费
double clf=0;
double rgf=0;//A级人工费
double jjf=0;//A级机械费
double glfbl=0;//A级管理费百分比
String zcmc=null;//A级主材名称
String zcgg=null;//A级主材规格

zcmc=cf.GB2Uni(request.getParameter("zcmc"));
zcgg=cf.GB2Uni(request.getParameter("zcgg"));
ls=request.getParameter("zcf");
try{
	if (!(ls.equals("")))  zcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量azcf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[zcf]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量aclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("rgf");
try{
	if (!(ls.equals("")))  rgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量argf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[rgf]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jjf");
try{
	if (!(ls.equals("")))  jjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ajjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[jjf]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("glfbl");
try{
	if (!(ls.equals("")))  glfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量aglfbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[glfbl]类型转换发生意外:"+e);
	return;
}



//**************888888888888888888888888888888888
int xh=0;
String gycl=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
ls=request.getParameter("cbenj");
try{
	if (!(ls.equals("")))  cbenj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbenj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdbj");
try{
	if (!(ls.equals("")))  sgdbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队报价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bj");
try{
	if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户报价]类型转换发生意外:"+e);
	return;
}


ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
gycl=cf.GB2Uni(request.getParameter("gycl"));
String sfxycl=request.getParameter("sfxycl");

String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
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

String sfbxx=request.getParameter("sfbxx");


String wheredqbm=request.getParameter("wheredqbm");
String wherexmbh=request.getParameter("wherexmbh");
String wherebjjbbm=request.getParameter("wherebjjbbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	if (!wherexmbh.equals(xmbh) || !wherebjjbbm.equals(bjjbbm))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_gzbjb";
		ls_sql+=" where xmbh='"+xmbh+"'  and dqbm='"+dqbm+"'  and bjjbbm='"+bjjbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			out.println("错误！[项目编号]在该报价级别已存在");
			return;
		}
	}

	ls_sql="update bj_gzbjb set dqbm=?,xmbh=?,bjjbbm=?,xmmc=?,xmdlbm=?,xmxlbm=?,smbm=?,jldwbm=?,bj=?,gycl=?,xh=?,cbenj=?,sgdbj=?,clf=?,zcmc=?,zcgg=?,zcf=?,rgf=?,jjf=?,glfbl=?,sfxycl=?,lrr=?,lrsj=?,sfbxx=?";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and xmbh='"+wherexmbh+"' and bjjbbm='"+wherebjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,xmbh);
	ps.setString(3,bjjbbm);
	ps.setString(4,xmmc);
	ps.setString(5,xmdlbm);
	ps.setString(6,xmxlbm);
	ps.setString(7,smbm);
	ps.setString(8,jldwbm);
	ps.setDouble(9,bj);
	ps.setString(10,gycl);
	ps.setInt(11,xh);
	ps.setDouble(12,cbenj);
	ps.setDouble(13,sgdbj);
	ps.setDouble(14,clf);
	ps.setString(15,zcmc);
	ps.setString(16,zcgg);
	ps.setDouble(17,zcf);
	ps.setDouble(18,rgf);
	ps.setDouble(19,jjf);
	ps.setDouble(20,glfbl);
	ps.setString(21,sfxycl);
	ps.setString(22,lrr);
	ps.setDate(23,lrsj);
	ps.setString(24,sfbxx);
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
	out.print("Exception: " + e);
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