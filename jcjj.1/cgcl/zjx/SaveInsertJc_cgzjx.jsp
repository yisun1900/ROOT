<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String zjxxh=null;
String khbh=null;
String cgzjxyybm=null;
String lrr=null;
java.sql.Date jhazsj=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

khbh=cf.GB2Uni(request.getParameter("khbh"));
cgzjxyybm=cf.GB2Uni(request.getParameter("cgzjxyybm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("jhazsj");
try{
	if (!(ls.equals("")))  jhazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划安装时间]类型转换发生意外:"+e);
	return;
}
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
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));

java.sql.Date zjxfssj=null;
ls=request.getParameter("zjxfssj");
try{
	if (!(ls.equals("")))  zjxfssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxfssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生时间]类型转换发生意外:"+e);
	return;
}
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String qddm=cf.GB2Uni(request.getParameter("qddm"));
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));

double cgzkl=0;
ls=request.getParameter("cgzkl");
try{
	if (!(ls.equals("")))  cgzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cgzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[柜体折扣率]类型转换发生意外:"+e);
	return;
}
double tmzkl=0;
ls=request.getParameter("tmzkl");
try{
	if (!(ls.equals("")))  tmzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tmzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[台面折扣率]类型转换发生意外:"+e);
	return;
}
double wjzkl=0;
ls=request.getParameter("wjzkl");
try{
	if (!(ls.equals("")))  wjzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金折扣率]类型转换发生意外:"+e);
	return;
}
double dqzkl=0;
ls=request.getParameter("dqzkl");
try{
	if (!(ls.equals("")))  dqzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dqzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电器折扣率]类型转换发生意外:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	String pdgc=null;
	String pdgcmc=null;
	String gys=null;
	String ppmc=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String cgsjs=null;
	ls_sql=" select kjxsj-SYSDATE,pdgc,pdgcmc,gys,ppmc,clgw,ztjjgw,xmzy,cgsjs";
	ls_sql+=" from jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
		pdgc=rs.getString("pdgc");
		pdgcmc=rs.getString("pdgcmc");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
		clgw=rs.getString("clgw");
		ztjjgw=rs.getString("ztjjgw");
		xmzy=rs.getString("xmzy");
		cgsjs=rs.getString("cgsjs");
	}
	rs.close();
	ps.close();
	if (count<0)
	{
		out.println("提醒！已超出可减项截止时间");
	}


	ls_sql="insert into jc_cgzjx ( zjxxh,ddbh,khbh,cgzjxyybm,zjxfssj,jhazsj,lrr,lrsj,dwbh,bz ";
	ls_sql+=" ,fgsbh,qddm,jzsjs,pdgc,pdgcmc,gys,ppmc,clgw,ztjjgw,xmzy ";
	ls_sql+=" ,cgsjs,cgzkl,tmzkl,wjzkl,dqzkl,dzyy,khjl  ";
	ls_sql+=" ,gtzjxje,tmzjxje,wjzjxje,dqzjxje,zjxze  ,zqgtzjxje,zqtmzjxje,zqwjzjxje,zqdqzjxje,zqzjxze   ,clzt)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,? ";
	ls_sql+=" ,0,0,0,0,0 ,0,0,0,0,0  ,'00' )";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,ddbh);
	ps.setString(3,khbh);
	ps.setString(4,cgzjxyybm);
	ps.setDate(5,zjxfssj);
	ps.setDate(6,jhazsj);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,dwbh);
	ps.setString(10,bz);

	ps.setString(11,fgsbh);
	ps.setString(12,qddm);
	ps.setString(13,jzsjs);
	ps.setString(14,pdgc);
	ps.setString(15,pdgcmc);
	ps.setString(16,gys);
	ps.setString(17,ppmc);
	ps.setString(18,clgw);
	ps.setString(19,ztjjgw);
	ps.setString(20,xmzy);

	ps.setString(21,cgsjs);
	ps.setDouble(22,cgzkl);
	ps.setDouble(23,tmzkl);
	ps.setDouble(24,wjzkl);
	ps.setDouble(25,dqzkl);
	ps.setString(26,dzyy);
	ps.setString(27,khjl);

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
	out.print("存盘失败,发生意外: " + e);
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