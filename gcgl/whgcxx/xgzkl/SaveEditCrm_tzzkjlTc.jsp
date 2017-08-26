<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String tzyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;


String tzjlh=cf.GB2Uni(request.getParameter("tzjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
tzyy=cf.GB2Uni(request.getParameter("tzyy"));
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

String zklx=cf.GB2Uni(request.getParameter("zklx"));




double bzjgzk=0;
ls=request.getParameter("bzjgzk");
try{
	if (!(ls.equals("")))  bzjgzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzjgzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐标准价格折扣]类型转换发生意外:"+e);
	return;
}

double mjzjzk=0;
ls=request.getParameter("mjzjzk");
try{
	if (!(ls.equals("")))  mjzjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mjzjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面积增加金额折扣]类型转换发生意外:"+e);
	return;
}

double zcsjzk=0;
ls=request.getParameter("zcsjzk");
try{
	if (!(ls.equals("")))  zcsjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcsjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材升级差价折扣]类型转换发生意外:"+e);
	return;
}

double zcclzk=0;
ls=request.getParameter("zcclzk");
try{
	if (!(ls.equals("")))  zcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcclzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材超量加价折扣]类型转换发生意外:"+e);
	return;
}

double zcsfzk=0;
ls=request.getParameter("zcsfzk");
try{
	if (!(ls.equals("")))  zcsfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcsfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[需收费主材折扣]类型转换发生意外:"+e);
	return;
}

double zcjmzk=0;
ls=request.getParameter("zcjmzk");
try{
	if (!(ls.equals("")))  zcjmzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcjmzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材减免折扣]类型转换发生意外:"+e);
	return;
}

double ddzccjzk=0;
ls=request.getParameter("ddzccjzk");
try{
	if (!(ls.equals("")))  ddzccjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ddzccjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[顶配主材折扣]类型转换发生意外:"+e);
	return;
}

double ddzcclzk=0;
ls=request.getParameter("ddzcclzk");
try{
	if (!(ls.equals("")))  ddzcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ddzcclzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[选配主材折扣]类型转换发生意外:"+e);
	return;
}

double tcwgczk=0;
ls=request.getParameter("tcwgczk");
try{
	if (!(ls.equals("")))  tcwgczk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcwgczk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐外施工项折扣]类型转换发生意外:"+e);
	return;
}

double tcgcclzk=0;
ls=request.getParameter("tcgcclzk");
try{
	if (!(ls.equals("")))  tcgcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcgcclzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程超量加价折扣]类型转换发生意外:"+e);
	return;
}



double glfzk=0;
ls=request.getParameter("glfzk");
try{
	if (!(ls.equals("")))  glfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费折扣]类型转换发生意外:"+e);
	return;
}

double sjzk=0;
ls=request.getParameter("sjzk");
try{
	if (!(ls.equals("")))  sjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金折扣]类型转换发生意外:"+e);
	return;
}
double sjfzk=0;
ls=request.getParameter("sjfzk");
try{
	if (!(ls.equals("")))  sjfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费折扣]类型转换发生意外:"+e);
	return;
}
double qtsfxmzk=0;
ls=request.getParameter("qtsfxmzk");
try{
	if (!(ls.equals("")))  qtsfxmzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtsfxmzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费项目折扣]类型转换发生意外:"+e);
	return;
}




double djjbfb=0;
ls=request.getParameter("djjbfb");
try{
	if (!(ls.equals("")))  djjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[djjbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代金券百分比]类型转换发生意外:"+e);
	return;
}
double djjje=0;
ls=request.getParameter("djjje");
try{
	if (!(ls.equals("")))  djjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代金券金额]类型转换发生意外:"+e);
	return;
}

double hdzsjz=0;
ls=request.getParameter("hdzsjz");
try{
	if (!(ls.equals("")))  hdzsjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hdzsjz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[活动赠送净值]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("2") || clzt.equals("4") || clzt.equals("5"))//1：未改折扣；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过
	{
		out.println("错误！调整折扣已完成，不能再修改");
		return;
	}

	conn.setAutoCommit(false);
	
	
	ls_sql="update crm_tzzkjl set zklx=?,glfzk=?,sjzk=?,sjfzk=?,qtsfxmzk=?,tzyy=?   ,lrr=?,lrsj=SYSDATE,lrbm=? ";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zklx);
	ps.setDouble(2,glfzk);
	ps.setDouble(3,sjzk);
	ps.setDouble(4,sjfzk);
	ps.setDouble(5,qtsfxmzk);
	ps.setString(6,tzyy);

	ps.setString(7,lrr);
	ps.setString(8,lrbm);
	ps.executeUpdate();
	ps.close();

	//套餐调折扣记录
	ls_sql="delete from crm_tctzk  ";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_tctzk ( tzjlh,khbh,bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzjlh);
	ps.setString(2,khbh);
	ps.setDouble(3,bzjgzk);
	ps.setDouble(4,mjzjzk);
	ps.setDouble(5,zcsjzk);
	ps.setDouble(6,zcclzk);
	ps.setDouble(7,zcsfzk);
	ps.setDouble(8,zcjmzk);
	ps.setDouble(9,ddzccjzk);
	ps.setDouble(10,ddzcclzk);
	ps.setDouble(11,tcwgczk);
	ps.setDouble(12,tcgcclzk);

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