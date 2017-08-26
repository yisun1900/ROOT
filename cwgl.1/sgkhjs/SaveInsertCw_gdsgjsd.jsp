<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
double wdzje=0;
double wtj=0;
java.sql.Date wtjrq=null;
double ssk=0;
double zxje=0;
double jxje=0;
double jsk=0;
java.sql.Date jsrq=null;


String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("wdzje");
try{
	if (!(ls.equals("")))  wdzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程预算款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wtj");
try{
	if (!(ls.equals("")))  wtj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wtj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[委托金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wtjrq");
try{
	if (!(ls.equals("")))  wtjrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wtjrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[委托金日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ssk");
try{
	if (!(ls.equals("")))  ssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ssk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实收款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zxje");
try{
	if (!(ls.equals("")))  zxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zxje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增项金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jxje");
try{
	if (!(ls.equals("")))  jxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jxje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减项金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsk");
try{
	if (!(ls.equals("")))  jsk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算日期]类型转换发生意外:"+e);
	return;
}




lrr=cf.GB2Uni(request.getParameter("lrr"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String jsyh=cf.GB2Uni(request.getParameter("jsyh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into cw_gdsgjsd ( khbh,wdzje,wtj,wtjrq,ssk,zxje,jxje,jsk,jsrq,lrr,lrsj,lrbm,bz,fyze,ye,mll,jsyh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,0,0,0,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setDouble(2,wdzje);
	ps.setDouble(3,wtj);
	ps.setDate(4,wtjrq);
	ps.setDouble(5,ssk);
	ps.setDouble(6,zxje);
	ps.setDouble(7,jxje);
	ps.setDouble(8,jsk);
	ps.setDate(9,jsrq);

	ps.setString(10,lrr);
	ps.setDate(11,lrsj);
	ps.setString(12,lrbm);
	ps.setString(13,bz);
	ps.setString(14,jsyh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set khjsbz='Y',khjsje=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jsk);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>