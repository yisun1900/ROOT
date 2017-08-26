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


double zqdj=0;
ls=request.getParameter("zqdj");
try{
	if (!(ls.equals("")))  zqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前实销单价]类型转换发生意外:"+e);
	return;
}
double dpzk=0;
ls=request.getParameter("dpzk");
try{
	if (!(ls.equals("")))  dpzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dpzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单品折扣]类型转换发生意外:"+e);
	return;
}
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
	out.println("<BR>[折后实销单价]类型转换发生意外:"+e);
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
double zqje=0;
ls=request.getParameter("zqje");
try{
	if (!(ls.equals("")))  zqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前合同材料费]类型转换发生意外:"+e);
	return;
}
double je=0;
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后合同材料费]类型转换发生意外:"+e);
	return;
}
double ycf=0;
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
String sftjcp=request.getParameter("sftjcp");
String sfzp=request.getParameter("sfzp");
double zsdj=0;
ls=request.getParameter("zsdj");
try{
	if (!(ls.equals("")))  zsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zsdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠送单价]类型转换发生意外:"+e);
	return;
}

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
	ls_sql+=" ,zcysbm,jldwbm,cbj,lsj,yhj,xzjg,zqdj,dpzk,dj,sl";
	ls_sql+=" ,zqje,je,ycf,qtfy,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy   ";
	ls_sql+=" ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,sfbhpj,pjts,sfycx,cxj,bz,lrr  ";
	ls_sql+=" ,lrsj,lx,sxbz,sxhtyy,gys,ppmc,khbh,fgsbh,qddm,jzsjs,zjhcxhdje,jsbl,sftjcp,cksl,ckje,shsl,sfzp,zsdj                                              ,jsfs,bzcbj,bzjsbl,bzcxhdbl,zdxsj,bzyjjrbl,yjjrbl,htyjjrje,zjhyjjrje) ";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,SYSDATE,'2','2',?,?,?,?,?,?,?,?,0,?,0,0,0,?,? ,'1' ,0    ,0     ,0       ,0    ,0       ,100   ,?       ,?)";
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
	ps.setDouble(17,zqdj);
	ps.setDouble(18,dpzk);
	ps.setDouble(19,dj);
	ps.setDouble(20,0);

	ps.setDouble(21,0);
	ps.setDouble(22,0);
	ps.setDouble(23,0);
	ps.setString(24,qtfy);
	ps.setDouble(25,0);
	ps.setDouble(26,0);
	ps.setDouble(27,0);
	ps.setDouble(28,0);
	ps.setDouble(29,0);
	ps.setDouble(30,0);

	ps.setString(31,zcpzwzbm);
	ps.setString(32,cxhdbz);
	ps.setDouble(33,cxhdbl);
	ps.setDouble(34,0);
	ps.setString(35,sfbhpj);
	ps.setInt(36,pjts);
	ps.setString(37,sfycx);
	ps.setDouble(38,cxj);
	ps.setString(39,bz);
	ps.setString(40,yhmc);

	ps.setString(41,sxhtyy);
	ps.setString(42,gys);
	ps.setString(43,ppmc);
	ps.setString(44,khbh);
	ps.setString(45,fgsbh);
	ps.setString(46,qddm);
	ps.setString(47,jzsjs);
	ps.setDouble(48,0);
	ps.setString(49,sftjcp);
	ps.setString(50,sfzp);
	ps.setDouble(51,zsdj);
	ps.setDouble(52,0);
	ps.setDouble(53,0);
	ps.executeUpdate();
	ps.close();


	ls_sql ="insert into jc_zczjxmx (ddbh,zjxbh,xh   ,zjsl,zqzjje,zjje,zjcxhdje,zjycf,zjqtfy,zjcbje,bz,zqsxdj,dpzkl,zhsxdj  ,lx,sxbz,cksl,ckje,shsl,zjyjjrje) ";
	ls_sql+=" values( ?,?,?   ,?,?,?,?,?,?,?,?,?,?,?  ,'2','2',0,0,0,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,zjxbh);
	ps.setLong(3,xh);

	ps.setDouble(4,sl);
	ps.setDouble(5,zqje);
	ps.setDouble(6,je);
	ps.setDouble(7,cxhdje);
	ps.setDouble(8,ycf);
	ps.setDouble(9,qtfyje);
	ps.setDouble(10,0);
	ps.setString(11,bz);
	ps.setDouble(12,zqdj);
	ps.setDouble(13,dpzk);
	ps.setDouble(14,dj);
	ps.setDouble(15,je);
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