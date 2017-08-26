<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String zjxxh=null;
String khbh=null;
String mmzjxyybm=null;
String lrr=null;
java.sql.Date jhazsj=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
yddbh=request.getParameter("yddbh");
zjxxh=request.getParameter("zjxxh");
khbh=request.getParameter("khbh");
mmzjxyybm=cf.GB2Uni(request.getParameter("mmzjxyybm"));
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

double mmzkl=0;
ls=request.getParameter("mmzkl");
try{
	if (!(ls.equals("")))  mmzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mmzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单折扣]类型转换发生意外:"+e);
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
	String mmcljs=null;
	ls_sql=" select kjxsj-SYSDATE,pdgc,pdgcmc,gys,ppmc,clgw,ztjjgw,xmzy,mmcljs";
	ls_sql+=" from jc_mmydd";
	ls_sql+=" where yddbh='"+yddbh+"'";
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
		mmcljs=rs.getString("mmcljs");
	}
	rs.close();
	ps.close();

	if (count<0)
	{
		out.println("提醒！已超出可减项截止时间");
	}


	ls_sql="insert into jc_mmzjx ( yddbh,zjxxh,khbh,mmzjxyybm,lrr,lrsj,dwbh,bz,jhazsj,zjxfssj ";
	ls_sql+=" ,fgsbh,qddm,jzsjs,pdgc,pdgcmc,gys,ppmc,clgw,ztjjgw,xmzy ";
	ls_sql+=" ,mmcljs,mmzkl,dzyy,khjl ";
	ls_sql+=" ,mmzjxje,wjzjxje,blzjxje,zjxze  ,zqmmzjxje,zqwjzjxje,zqblzjxje,zqzjxze  ,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,? ";
	ls_sql+=" ,0,0,0,0  ,0,0,0,0  ,'00' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setString(2,zjxxh);
	ps.setString(3,khbh);
	ps.setString(4,mmzjxyybm);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,dwbh);
	ps.setString(8,bz);
	ps.setDate(9,jhazsj);
	ps.setDate(10,zjxfssj);

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

	ps.setString(21,mmcljs);
	ps.setDouble(22,mmzkl);
	ps.setString(23,dzyy);
	ps.setString(24,khjl);

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