<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lfjlh=request.getParameter("lfjlh");
String khbh=request.getParameter("khbh");

java.sql.Date sjlfsj=null;
ls=request.getParameter("sjlfsj");
try{
	if (!(ls.equals("")))  sjlfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjlfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际量房时间]类型转换发生意外:"+e);
	return;
}
String sjlfr=null;
sjlfr=cf.GB2Uni(request.getParameter("sjlfr"));


java.sql.Date jhctsj=null;
ls=request.getParameter("jhctsj");
try{
	if (!(ls.equals("")))  jhctsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhctsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出平面图时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhcxgtsj=null;
ls=request.getParameter("jhcxgtsj");
try{
	if (!(ls.equals("")))  jhcxgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhcxgtsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出效果图时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhcsgtsj=null;
ls=request.getParameter("jhcsgtsj");
try{
	if (!(ls.equals("")))  jhcsgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhcsgtsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出施工图时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhzbjsj=null;
ls=request.getParameter("jhzbjsj");
try{
	if (!(ls.equals("")))  jhzbjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhzbjsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划做电子报价时间]类型转换发生意外:"+e);
	return;
}


String qtzl=cf.GB2Uni(request.getParameter("qtzl"));
String hxgngzd=cf.GB2Uni(request.getParameter("hxgngzd"));
String gzngfj=cf.GB2Uni(request.getParameter("gzngfj"));
String gzdms=cf.GB2Uni(request.getParameter("gzdms"));
String dxgzd=cf.GB2Uni(request.getParameter("dxgzd"));
String cfwsjcs=cf.GB2Uni(request.getParameter("cfwsjcs"));

double zxysje=0;
ls=request.getParameter("zxysje");
try{
	if (!(ls.equals("")))  zxysje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zxysje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[装修预算金额]类型转换发生意外:"+e);
	return;
}


String lrr=null;
String lrbm=null;
java.sql.Date lrsj=null;
String bz=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
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
bz=cf.GB2Uni(request.getParameter("bz"));




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="insert into crm_lfjl(lfjlh,khbh,sjlfsj,sjlfr,qtzl,zxysje,hxgngzd,gzngfj,gzdms,dxgzd   ,cfwsjcs,sczpsl,jhctsj,jhcxgtsj,jhcsgtsj,jhzbjsj,zt,lrr,lrsj,lrbm,bz) ";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,?) ";
 	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lfjlh);
	ps.setString(2,khbh);
	ps.setDate(3,sjlfsj);
	ps.setString(4,sjlfr);
	ps.setString(5,qtzl);
	ps.setDouble(6,zxysje);
	ps.setString(7,hxgngzd);
	ps.setString(8,gzngfj);
	ps.setString(9,gzdms);
	ps.setString(10,dxgzd);

	ps.setString(11,cfwsjcs);
	ps.setInt(12,0);
	ps.setDate(13,jhctsj);
	ps.setDate(14,jhcxgtsj);
	ps.setDate(15,jhcsgtsj);
	ps.setDate(16,jhzbjsj);
	ps.setString(17,"4");//1：录入计划；2：计划确认；3：计划取消；4：上门量房；5：已审核
	ps.setString(18,lrr);
	ps.setDate(19,lrsj);
	ps.setString(20,lrbm);
	ps.setString(21,bz);
	ps.executeUpdate();
	ps.close();

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
	out.print("存盘失败,发生意外: " + e);
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