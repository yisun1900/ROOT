<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String kgzr=cf.GB2Uni(request.getParameter("kgzr"));
String kgzsm=cf.GB2Uni(request.getParameter("kgzsm"));
java.sql.Date kgzsj=null;
double clf=0;
double sgebfb=0;

ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgebfb");
try{
	if (!(ls.equals("")))  sgebfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgebfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费百分比]类型转换发生意外:"+e);
	return;
}


ls=request.getParameter("kgzsj");
try{
	if (!(ls.equals("")))  kgzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kgzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

String jlh=cf.GB2Uni(request.getParameter("jlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String czkh=cf.GB2Uni(request.getParameter("czkh"));

double ysglk=0;
ls=request.getParameter("ysglk");
try{
	if (!(ls.equals("")))  ysglk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysglk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预算工料款]类型转换发生意外:"+e);
	return;
}

double fwmjcz=0;
ls=request.getParameter("fwmjcz");
try{
	if (!(ls.equals("")))  fwmjcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmjcz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地锢金额]类型转换发生意外:"+e);
	return;
}

double zccz=0;
ls=request.getParameter("zccz");
try{
	if (!(ls.equals("")))  zccz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zccz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工长套餐主材充值]类型转换发生意外:"+e);
	return;
}

double cfje=0;
ls=request.getParameter("cfje");
try{
	if (!(ls.equals("")))  cfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拆除金额]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set clf=?,sgebfb=?,kgzsj=?,kgzr=?,kgzbz='Y',kgzsm=?,fwmjcz=?,zccz=?,czkh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,clf);
	ps.setDouble(2,sgebfb);
	ps.setDate(3,kgzsj);
	ps.setString(4,kgzr);
	ps.setString(5,kgzsm);
	ps.setDouble(6,fwmjcz);
	ps.setDouble(7,zccz);
	ps.setString(8,czkh);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_cflkjl set ckrq=?,clfbfb=?,clf=?,fwmjcz=?,zccz=?,lrr=?,lrsj=?,lrbm=?,bz=?,czkh=?,cfje=?";
	ls_sql+=" where jlh='"+jlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,kgzsj);
	ps.setDouble(2,sgebfb);
	ps.setDouble(3,clf);
	ps.setDouble(4,fwmjcz);
	ps.setDouble(5,zccz);
	ps.setString(6,kgzr);
	ps.setDate(7,kgzsj);
	ps.setString(8,lrbm);
	ps.setString(9,kgzsm);
	ps.setString(10,czkh);
	ps.setDouble(11,cfje);
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
	out.print("Exception: " +e);
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