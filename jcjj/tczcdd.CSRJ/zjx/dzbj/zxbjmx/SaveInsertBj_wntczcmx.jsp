<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
double ydj=0;
double tcdj=0;
double sjzj=0;
double jsj=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("ydj");
try{
	if (!(ls.equals("")))  ydj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ydj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tcdj");
try{
	if (!(ls.equals("")))  tcdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjzj");
try{
	if (!(ls.equals("")))  sjzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级折价]类型转换发生意外:"+e);
	return;
}
//ls=request.getParameter("jsj");
//try{
//	if (!(ls.equals("")))  jsj=Double.parseDouble(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量[jsj]不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[结算价]类型转换发生意外:"+e);
//	return;
//}
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
bz=cf.GB2Uni(request.getParameter("bz"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

String dqbm=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));

String lx=cf.GB2Uni(request.getParameter("lx"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zjxxh=request.getParameter("zjxxh");

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}
	
	//生成材料编码
	String cpbm=null;
	int count=0;
	ls_sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
	ls_sql+=" from  bj_khwntcmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	count++;

	cpbm="SD"+cf.addZero(count,11);
	

	ls_sql="insert into bj_khwntcmxh (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh   ,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh   ,lrr,lrsj,lx,sfbpx,bz)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.setString(3,cpmc);
	ps.setInt(4,1);
	ps.setString(5,cpbm);
	ps.setString(6,dqbm);
	ps.setString(7,hxbm);
	ps.setString(8,tcmc);
	ps.setString(9,jgwzbm);
	ps.setString(10,xh);

	ps.setString(11,gg);
	ps.setString(12,ppmc);
	ps.setString(13,gysmc);
	ps.setString(14,jldw);
	ps.setDouble(15,ydj);
	ps.setDouble(16,tcdj);
	ps.setDouble(17,sjzj);
	ps.setDouble(18,jsj);
	ps.setDouble(19,sl);
	ps.setString(20,"");

	ps.setString(21,lrr);
	ps.setDate(22,lrsj);
	ps.setString(23,lx);
	ps.setString(24,"N");//是否标配项 
	ps.setString(25,bz);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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