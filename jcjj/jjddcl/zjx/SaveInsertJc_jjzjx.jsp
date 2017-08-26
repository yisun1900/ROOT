<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String khbh=null;
String zjxyybm=null;
String lrr=null;
java.sql.Date jhazsj=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
zjxyybm=cf.GB2Uni(request.getParameter("zjxyybm"));
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

double jjzkl=0;
ls=request.getParameter("jjzkl");
try{
	if (!(ls.equals("")))  jjzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jjzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项折扣]类型转换发生意外:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	String pdgc=null;
	String pdgcmc=null;
	String jjgys=null;
	String jjppmc=null;
	String xcmgc=null;
	String xcmgcmc=null;
	String xcmgys=null;
	String xcmppmc=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String jjsjs=null;
	ls_sql=" select kjxsj-SYSDATE,pdgc,pdgcmc,jjgys,jjppmc,xcmgc,xcmgcmc,xcmgys,xcmppmc,clgw,ztjjgw,xmzy,jjsjs";
	ls_sql+=" from jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
		pdgc=rs.getString("pdgc");
		pdgcmc=rs.getString("pdgcmc");
		jjgys=rs.getString("jjgys");
		jjppmc=rs.getString("jjppmc");
		xcmgc=rs.getString("xcmgc");
		xcmgcmc=rs.getString("xcmgcmc");
		xcmgys=rs.getString("xcmgys");
		xcmppmc=rs.getString("xcmppmc");
		clgw=rs.getString("clgw");
		ztjjgw=rs.getString("ztjjgw");
		xmzy=rs.getString("xmzy");
		jjsjs=rs.getString("jjsjs");
	}
	rs.close();
	ps.close();
	if (count<0)
	{
		out.println("提醒！已超出可减项截止时间");
	}


	ls_sql="insert into jc_jjzjx ( ddbh,zjxxh,khbh,zjxyybm,jhazsj,zjxfssj,lrr,lrsj,dwbh,bz ";
	ls_sql+=" ,fgsbh,qddm,jzsjs,pdgc,pdgcmc,jjgys,jjppmc,xcmgc,xcmgcmc,xcmgys ";
	ls_sql+=" ,xcmppmc,clgw,ztjjgw,xmzy,jjsjs,jjzkl,dzyy,khjl ";
	ls_sql+=" ,jjzjxje,xcmzjxje,cpjjzjxje,zjxze,zqjjzjxje,zqxcmzjxje,zqcpjjzjxje,zqzjxze,clzt) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,0,0,0,0,0,0,0,0,'00' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,zjxxh);
	ps.setString(3,khbh);
	ps.setString(4,zjxyybm);
	ps.setDate(5,jhazsj);
	ps.setDate(6,zjxfssj);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,dwbh);
	ps.setString(10,bz);
	
	ps.setString(11,fgsbh);
	ps.setString(12,qddm);
	ps.setString(13,jzsjs);
	ps.setString(14,pdgc);
	ps.setString(15,pdgcmc);
	ps.setString(16,jjgys);
	ps.setString(17,jjppmc);
	ps.setString(18,xcmgc);
	ps.setString(19,xcmgcmc);
	ps.setString(20,xcmgys);

	ps.setString(21,xcmppmc);
	ps.setString(22,clgw);
	ps.setString(23,ztjjgw);
	ps.setString(24,xmzy);
	ps.setString(25,jjsjs);
	ps.setDouble(26,jjzkl);
	ps.setString(27,dzyy);
	ps.setString(28,khjl);

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