<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String ssbm=null;
String ckph=null;
String bz=null;
String lsph=null;
int csph=0;
double yf=0;
double qtsf=0;

String khbh=null;
String psfs=null;
java.sql.Date jhshsj=null;
double fkje=0;
ls=request.getParameter("yf");
try{
	if (!(ls.equals("")))  yf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtsf");
try{
	if (!(ls.equals("")))  qtsf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtsf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划送货时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返款金额]类型转换发生意外:"+e);
	return;
}
khbh=cf.GB2Uni(request.getParameter("khbh"));
psfs=cf.GB2Uni(request.getParameter("psfs"));
ssbm=cf.GB2Uni(request.getParameter("ssbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

java.sql.Date lrrq=null;
ls=request.getParameter("lrrq");
try{
	if (!(ls.equals("")))  lrrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}


String psph=request.getParameter("psph");


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt="0";

	ls_sql="insert into jxc_clpsd ( psph,psdzt,khbh,yf,qtsf,fkje,psfs,jhshsj,lrr,lrrq,ssbm,bz,pszsl,pszje,cbze ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,0,0,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,psph);
	ps.setString(2,psdzt);
	ps.setString(3,khbh);
	ps.setDouble(4,yf);
	ps.setDouble(5,qtsf);
	ps.setDouble(6,fkje);
	ps.setString(7,psfs);
	ps.setDate(8,jhshsj);
	ps.setString(9,lrr);
	ps.setDate(10,lrrq);
	ps.setString(11,ssbm);
	ps.setString(12,bz);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>