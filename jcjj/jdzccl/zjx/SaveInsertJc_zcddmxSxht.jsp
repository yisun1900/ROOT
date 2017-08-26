<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;

String zcmc=cf.GB2Uni(request.getParameter("zcmc"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String zclbbm=cf.GB2Uni(request.getParameter("zclbbm"));
String jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
String xinghao=cf.GB2Uni(request.getParameter("xinghao"));
String gg=cf.GB2Uni(request.getParameter("gg"));


double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实销单价]类型转换发生意外:"+e);
	return;
}
String zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
String zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
double je=0;
double ycf=0;
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费]类型转换发生意外:"+e);
	return;
}
String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
if (qtfy.equals("W"))
{
	qtfy="";
}
double qtfyje=0;
ls=request.getParameter("qtfyje");
try{
	if (!(ls.equals("")))  qtfyje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfyje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费金额]类型转换发生意外:"+e);
	return;
}

String cxhdbz=null;
String bz=null;
cxhdbz=cf.GB2Uni(request.getParameter("cxhdbz"));
bz=cf.GB2Uni(request.getParameter("bz"));

double cxhdbl=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动比率]类型转换发生意外:"+e);
	return;
}
double cxhdje=0;
ls=request.getParameter("cxhdje");
try{
	if (!(ls.equals("")))  cxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动金额]类型转换发生意外:"+e);
	return;
}

String sfycx=null;
sfycx=request.getParameter("sfycx");
String sxhtyy=cf.GB2Uni(request.getParameter("sxhtyy"));


double lsj=0;
double yhj=0;
String sfbhpj="0";
int pjts=0;
double cxj=0;
double cbj=0;
String xzjg="0";

String ddbh=request.getParameter("ddbh");
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ppmc=null;
	String gys=null;
	String khbh=null;
	String fgsbh=null;
	String qddm=null;
	String jzsjs=null;
	ls_sql =" select gys,ppmc,khbh,fgsbh,qddm,jzsjs";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppmc = rs.getString("ppmc");			    
		gys = rs.getString("gys");			    
		khbh=rs.getString("khbh");
		fgsbh=rs.getString("fgsbh");
		qddm=rs.getString("qddm");
		jzsjs=rs.getString("jzsjs");
	}
	rs.close();
	ps.close();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}

	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_zcddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();
	xh++;

	conn.setAutoCommit(false);

	ls_sql ="insert into jc_zcddmx (xh,ddbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,zclbbm,xinghao,gg";
	ls_sql+=" ,zcysbm,jldwbm,cbj,lsj,yhj,xzjg,dj,sl,je,ycf";
	ls_sql+=" ,qtfy,qtfyje,zjhsl,zjhje,zjhycf,zjhqtfy,zcpzwzbm,cxhdbz,cxhdbl,cxhdje";
	ls_sql+=" , sfbhpj,pjts,sfycx,cxj,bz,lrr,lrsj,lx,sxbz,sxhtyy,gys,ppmc,khbh,fgsbh,qddm,jzsjs,zjhcxhdje) ";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,SYSDATE,'2','2',?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,ddbh);
	ps.setString(3,"000000");
	ps.setString(4,zcmc);
	ps.setString(5,zcdlbm);
	ps.setString(6,zcxlbm);
	ps.setString(7,dwbh);
	ps.setString(8,zclbbm);
	ps.setString(9,xinghao);
	ps.setString(10,gg);

	ps.setString(11,zcysbm);
	ps.setString(12,jldwbm);
	ps.setDouble(13,cbj);
	ps.setDouble(14,lsj);
	ps.setDouble(15,yhj);
	ps.setString(16,xzjg);
	ps.setDouble(17,dj);
	ps.setDouble(18,0);
	ps.setDouble(19,0);
	ps.setDouble(20,0);


	ps.setString(21,qtfy);
	ps.setDouble(22,0);
	ps.setDouble(23,0);
	ps.setDouble(24,0);
	ps.setDouble(25,0);
	ps.setDouble(26,0);
	ps.setString(27,zcpzwzbm);
	ps.setString(28,cxhdbz);
	ps.setDouble(29,cxhdbl);
	ps.setDouble(30,0);

	ps.setString(31,sfbhpj);
	ps.setInt(32,pjts);
	ps.setString(33,sfycx);
	ps.setDouble(34,cxj);
	ps.setString(35,bz);
	ps.setString(36,yhmc);
	ps.setString(37,sxhtyy);
	ps.setString(38,gys);
	ps.setString(39,ppmc);
	ps.setString(40,khbh);
	ps.setString(41,fgsbh);
	ps.setString(42,qddm);
	ps.setString(43,jzsjs);
	ps.setDouble(44,0);
	ps.executeUpdate();
	ps.close();


	ls_sql ="insert into jc_zczjxmx (ddbh,zjxbh,xh   ,zjsl,zjje,zjcxhdje,zjycf,zjqtfy,zjcbje,bz  ,lx,sxbz) ";
	ls_sql+=" values( ?,?,?   ,?,?,?,?,?,?,?  ,'2','2')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,zjxbh);
	ps.setLong(3,xh);

	ps.setDouble(4,sl);
	ps.setDouble(5,je);
	ps.setDouble(6,cxhdje);
	ps.setDouble(7,ycf);
	ps.setDouble(8,qtfyje);
	ps.setDouble(9,0);
	ps.setString(10,bz);
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
	out.print("Exception: " + e);
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