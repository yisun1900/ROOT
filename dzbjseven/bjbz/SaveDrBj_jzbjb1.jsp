<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String dqbm=null;
String xmbh=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;
String gycl=null;


dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));

ls=request.getParameter("clbj");
try{
	if (!(ls.equals("")))  clbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[辅材费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rgbj");
try{
	if (!(ls.equals("")))  rgbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rgbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人工费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jxbj");
try{
	if (!(ls.equals("")))  jxbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jxbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机械费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bj");
try{
	if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程预算价]类型转换发生意外:"+e);
	return;
}
double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
ls=request.getParameter("zcf");
try{
	if (!(ls.equals("")))  zcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("shf");
try{
	if (!(ls.equals("")))  shf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[损耗费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ysf");
try{
	if (!(ls.equals("")))  ysf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运输费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtf");
try{
	if (!(ls.equals("")))  qtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费]类型转换发生意外:"+e);
	return;
}

String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
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
gycl=cf.GB2Uni(request.getParameter("gycl"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
java.sql.Date zdyxmyxq=null;
ls=request.getParameter("zdyxmyxq");
try{
	if (!(ls.equals("")))  zdyxmyxq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zdyxmyxq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[自定义项目有效期]类型转换发生意外:"+e);
	return;
}
String flmcgg=cf.GB2Uni(request.getParameter("flmcgg"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));

String wheredqbm=request.getParameter("wheredqbm");
String wherexmbh=request.getParameter("wherexmbh");
String wherebjjbbm=request.getParameter("wherebjjbbm");
String wherebjbbh=cf.GB2Uni(request.getParameter("wherebjbbh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


int count=0;
try {
	conn=cf.getConnection();

	String ssfgs="";
	ls_sql="select ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	//自定义项目
	String zdyxmshbz="";
	double gcjcbjxs=0;//工程基础报价系数
	double sgcbbjxs=0;//施工成本报价系数 
	double cbbfb=0;//自定义项成本百分比 
	ls_sql="select zdyxmshbz,gcjcbjxs,sgcbbjxs,cbbfb";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmshbz=cf.fillNull(rs.getString("zdyxmshbz"));
		gcjcbjxs=rs.getDouble("gcjcbjxs");
		sgcbbjxs=rs.getDouble("sgcbbjxs");
		cbbfb=rs.getDouble("cbbfb");
	}
	rs.close();
	ps.close();

	if (gcjcbjxs==0)
	{
		out.println("错误！【工程基础报价系数】未初始化");
		return;
	}
	if (sgcbbjxs==0)
	{
		out.println("错误！【施工成本报价系数】未初始化");
		return;
	}

	double sgdbj=bj/gcjcbjxs;
	double sgcbj=sgdbj*sgcbbjxs;

	double cbenj=bj*cbbfb/100;
	double clcb=cbenj;



	conn.setAutoCommit(false);


	int aa=0;
	ls_sql="select max(TO_NUMBER(NVL(substr(xmbh,4,6),0)))";
	ls_sql+=" from  bj_zdyxmbh";
	ls_sql+=" where lrr='"+lrr+"' and substr(xmbh,1,2)='DR'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		aa=rs.getInt(1);
	}
	rs.close();
	ps.close();

	aa++;

	
	xmbh="DR-"+cf.addZero(aa,6);

	//自定义项需审核
	int sqjl=0;
	if (zdyxmshbz.equals("Y"))
	{
		ls_sql="select max(sqjl)";
		ls_sql+=" from  bj_zdyshjl";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sqjl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		sqjl++;
		
		ls_sql="insert into bj_zdyshjl (sqjl,zdyxmlrr,xmbh,dqbm,bjjbbm,lrsj,shbz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,'N') ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,sqjl);
		ps.setString(2,lrr);
		ps.setString(3,xmbh);
		ps.setString(4,dqbm);
		ps.setString(5,bjjbbm);
		ps.setDate(6,lrsj);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="insert into bj_zdyxmb ( dqbm,xmbh      ,bjjbbm      ,xmmc      ,xmdlbm      ,xmxlbm      ,smbm      ,jldwbm      ,gycl      ,xh,lrr,lrsj,shbz,zdyxmyxq,sqjl,ckxm,flmcgg,bz  ,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,xmflbm,sgcbj,clcb,rgcb,jxcb,cbenj,sfxycl,sfxyyjd) ";
	ls_sql+=" select          '"+dqbm+"','"+xmbh+"','"+bjjbbm+"','"+xmmc+"','"+xmdlbm+"','"+xmxlbm+"','"+smbm+"','"+jldwbm+"','"+gycl+"',?,?,?,?,?,?,?,?,?                              ,?,?,?,?,?,?,?,?,?,?,?                      ,?,?,?,?,sfxycl,sfxyyjd";
	ls_sql+=" from  bj_jzbjb";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and xmbh='"+wherexmbh+"' and bjjbbm='"+wherebjjbbm+"' and bjbbh='"+wherebjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,0);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,"N");
	ps.setDate(5,zdyxmyxq);
	ps.setInt(6,sqjl);
	ps.setString(7,wherexmbh);
	ps.setString(8,flmcgg);
	ps.setString(9,bz);
	ps.setDouble(10,clbj);
	ps.setDouble(11,rgbj);
	ps.setDouble(12,jxbj);
	ps.setDouble(13,zcf);
	ps.setDouble(14,shf);
	ps.setDouble(15,ysf);
	ps.setDouble(16,qtf);
	ps.setDouble(17,bj);
	ps.setDouble(18,sgdbj);
	ps.setString(19,xmflbm);
	ps.setDouble(20,sgcbj);

	ps.setDouble(21,clcb);
	ps.setDouble(22,0);
	ps.setDouble(23,0);
	ps.setDouble(24,cbenj);
	
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_zdyxmbh ( lrr,xmbh) ";
	ls_sql+=" values ( ?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lrr);
	ps.setString(2,xmbh);
	ps.executeUpdate();
	ps.close();


	ls_sql =" delete from bj_zdyxmb ";
	ls_sql+=" where zdyxmyxq<SYSDATE-90";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	if (zdyxmshbz.equals("Y"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！项目编号：<%=xmbh%>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！项目编号：<%=xmbh%>");
		window.close();

		parent.menu.menuform.submit();

		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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