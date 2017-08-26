<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String khbh=null;
String clgw=null;
String ddshbz=null;
double hkze=0;
double wdzje=0;
double htcxhdje=0;
java.sql.Date jhtzshsj=null;
java.sql.Date kjxsj=null;
java.sql.Date htshsj=null;
String xmzy=null;
java.sql.Date qhtsj=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));
ls=request.getParameter("wdzje");
try{
	if (!(ls.equals("")))  wdzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未打折金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hkze");
try{
	if (!(ls.equals("")))  hkze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hkze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htcxhdje");
try{
	if (!(ls.equals("")))  htcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htcxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动金额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("jhtzshsj");
try{
	if (!(ls.equals("")))  jhtzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhtzshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划通知送货时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可减项截止时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同送货时间]类型转换发生意外:"+e);
	return;
}
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qhtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签合同时间]类型转换发生意外:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));

String lrr=null;
String dwbh=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));

String sfyyh=null;
java.sql.Date yhkssj=null;
java.sql.Date yhjzsj=null;
sfyyh=request.getParameter("sfyyh");
ls=request.getParameter("yhkssj");
try{
	if (!(ls.equals("")))  yhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhjzsj");
try{
	if (!(ls.equals("")))  yhjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠截至时间]类型转换发生意外:"+e);
	return;
}
String yhnr=cf.GB2Uni(request.getParameter("yhnr"));
double zczkl=0;
ls=request.getParameter("zczkl");
try{
	if (!(ls.equals("")))  zczkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zczkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单折扣]类型转换发生意外:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));

/*
String jkxz=cf.GB2Uni(request.getParameter("jkxz"));
String jkdd=cf.GB2Uni(request.getParameter("jkdd"));
*/

String whereddbh=cf.GB2Uni(request.getParameter("whereddbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String xclbz=null;
	ls_sql =" select clzt,xclbz";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+whereddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		xclbz=rs.getString("xclbz");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00") && !clzt.equals("02") && !clzt.equals("03") && !clzt.equals("05") && !clzt.equals("25") && !clzt.equals("26"))
	{
		out.println("<BR>错误！处理状态不正确");
		return;
	}
	if (!xclbz.equals("2") )
	{
		out.println("<BR>错误！非定制式产品");
		return;
	}

	ls_sql="update jc_zcdd set clgw=?,ztjjgw=?,ddshbz=?,kjxsj=?,htshsj=?,xmzy=?,qhtsj=?,bz=?,hkze=?,jhtzshsj=?,wdzje=?,htcxhdje=?,clzt='07',jjsjs=?,lrr=?,lrsj=SYSDATE,dwbh=?,zczkl=?,dzyy=?,sfyyh=?,yhkssj=?,yhjzsj=?,yhnr=?,ddlx='1' ";
	ls_sql+=" where ddbh='"+whereddbh+"' and clzt in('00','02','03','05','25','26')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clgw);
	ps.setString(2,ztjjgw);
	ps.setString(3,ddshbz);
	ps.setDate(4,kjxsj);
	ps.setDate(5,htshsj);
	ps.setString(6,xmzy);
	ps.setDate(7,qhtsj);
	ps.setString(8,bz);
	ps.setDouble(9,hkze);
	ps.setDate(10,jhtzshsj);
	ps.setDouble(11,wdzje);
	ps.setDouble(12,htcxhdje);
	ps.setString(13,jjsjs);
	ps.setString(14,lrr);
	ps.setString(15,dwbh);

	ps.setDouble(16,zczkl);
	ps.setString(17,dzyy);
	ps.setString(18,sfyyh);
	ps.setDate(19,yhkssj);
	ps.setDate(20,yhjzsj);
	ps.setString(21,yhnr);
	
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>