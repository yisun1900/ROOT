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
double zdzk=0;
ls=request.getParameter("zdzk");
try{
	if (!(ls.equals("")))  zdzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[整单折扣]类型转换发生意外:"+e);
	return;
}

double gcfqdzk=0;
ls=request.getParameter("gcfqdzk");
try{
	if (!(ls.equals("")))  gcfqdzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcfqdzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程费折扣]类型转换发生意外:"+e);
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

String zjxzklx=cf.GB2Uni(request.getParameter("zjxzklx"));
String bfxmdldz=cf.GB2Uni(request.getParameter("bfxmdldz"));



double clfzk=0;
ls=request.getParameter("clfzk");
try{
	if (!(ls.equals("")))  clfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[辅材费折扣]类型转换发生意外:"+e);
	return;
}

double zcfzk=0;
ls=request.getParameter("zcfzk");
try{
	if (!(ls.equals("")))  zcfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材费折扣]类型转换发生意外:"+e);
	return;
}

double rgfzk=0;
ls=request.getParameter("rgfzk");
try{
	if (!(ls.equals("")))  rgfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rgfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人工费折扣]类型转换发生意外:"+e);
	return;
}

double ysfzk=0;
ls=request.getParameter("ysfzk");
try{
	if (!(ls.equals("")))  ysfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运输费折扣]类型转换发生意外:"+e);
	return;
}

double jxfzk=0;
ls=request.getParameter("jxfzk");
try{
	if (!(ls.equals("")))  jxfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jxfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机械费折扣]类型转换发生意外:"+e);
	return;
}

double shfzk=0;
ls=request.getParameter("shfzk");
try{
	if (!(ls.equals("")))  shfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[损耗费折扣]类型转换发生意外:"+e);
	return;
}

double qtfzk=0;
ls=request.getParameter("qtfzk");
try{
	if (!(ls.equals("")))  qtfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费折扣]类型转换发生意外:"+e);
	return;
}

String xcxxy=cf.GB2Uni(request.getParameter("xcxxy"));
double zjjmje=0;
ls=request.getParameter("zjjmje");
try{
	if (!(ls.equals("")))  zjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直接减免金额]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	String clzt="1";//1：未完成；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过

	if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		//单项打折
		gcfqdzk=10;
		glfzk=10;
		sjzk=10;
		sjfzk=10;
		qtsfxmzk=10;

		zjxzklx="1";//增减项折扣类型  1：同合同；2：独立折扣
		bfxmdldz="N";//部分项目独立打折  Y：是；N：否

		//部分费用打折
		clfzk=10;
		zcfzk=10;
		rgfzk=10;
		ysfzk=10;
		jxfzk=10;
		shfzk=10;
		qtfzk=10;
	}
	else if (zklx.equals("2"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		//整单打折
		zdzk=10;

		//部分费用打折
		clfzk=10;
		zcfzk=10;
		rgfzk=10;
		ysfzk=10;
		jxfzk=10;
		shfzk=10;
		qtfzk=10;
	}
	else{
		//整单打折
		zdzk=10;

		//单项打折
		gcfqdzk=10;

		zjxzklx="1";//增减项折扣类型  1：同合同；2：独立折扣
		bfxmdldz="N";//部分项目独立打折  Y：是；N：否
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_tzzkjl (tzjlh,khbh,zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk,zjxzklx   ,bfxmdldz,hdzsjz,djjbfb,djjje,tzyy,lrr,lrsj,lrbm,clzt,tzhmll,zjjmje,xcxxy) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,SYSDATE,?,?,0 ,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzjlh);
	ps.setString(2,khbh);
	ps.setString(3,zklx);
	ps.setDouble(4,zdzk);
	ps.setDouble(5,gcfqdzk);
	ps.setDouble(6,glfzk);
	ps.setDouble(7,sjzk);
	ps.setDouble(8,sjfzk);
	ps.setDouble(9,qtsfxmzk);
	ps.setString(10,zjxzklx);


	ps.setString(11,bfxmdldz);
	ps.setDouble(12,hdzsjz);
	ps.setDouble(13,djjbfb);
	ps.setDouble(14,djjje);
	ps.setString(15,tzyy);

	ps.setString(16,lrr);
	ps.setString(17,lrbm);
	ps.setString(18,clzt);
	ps.setDouble(19,zjjmje);
	ps.setString(20,xcxxy);
	ps.executeUpdate();
	ps.close();

	if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		ls_sql="delete from crm_bfxmtzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_gcdxtzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_qtxmtzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_tzzjxzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_tzbffyzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (zklx.equals("2"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		ls_sql="delete from crm_tzbffyzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (zklx.equals("3"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		ls_sql="delete from crm_bfxmtzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_gcdxtzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_qtxmtzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_tzzjxzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_tzbffyzk";
		ls_sql+=" where tzjlh='"+tzjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//调整部分费用折扣（crm_tzbffyzk）
		ls_sql="insert into crm_tzbffyzk (tzjlh,khbh,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,tzjlh);
		ps.setString(2,khbh);
		ps.setDouble(3,clfzk);
		ps.setDouble(4,zcfzk);
		ps.setDouble(5,rgfzk);
		ps.setDouble(6,ysfzk);
		ps.setDouble(7,jxfzk);
		ps.setDouble(8,shfzk);
		ps.setDouble(9,qtfzk);
		ps.executeUpdate();
		ps.close();
	}

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
	out.print("<BR>存盘失败,发生意外: " + e);
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