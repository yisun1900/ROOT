<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

String dybjjb=(String)session.getAttribute("bjjb");
String zcjldwbm=null;
zcjldwbm=cf.GB2Uni(request.getParameter("zcjldwbm"));
String ls=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double bj=0;
double bbj=0;
double cbj=0;
int xh=0;
String gycl=null;
String bgycl=null;
String cgycl=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
//************************************************************************
double sgdbj=0;
ls=request.getParameter("sgdbj");


try{
	if (!(ls.equals("")))  sgdbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队报价]类型转换发生意外:"+e);
	return;
}
double cbenj=0;
ls=request.getParameter("cbenj");
try{
	if (!(ls.equals("")))  cbenj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbenj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}
//*************************************************************************
double clf=0;
double zcf=0;//A级主材费
double rgf=0;//A级人工费
double jjf=0;//A级机械费
double glfbl=0;//A级管理费百分比
double lrbl=0;//A级利润百分比
String zcmc=null;//A级主材名称
String zcgg=null;//A级主材规格

double bclf=0;
double bzcf=0;//级主材费
double brgf=0;//级人工费
double bjjf=0;//级机械费
double bglfbl=0;//级管理费百分比
double blrbl=0;//级利润百分比
String bzcmc=null;//级主材名称
String bzcgg=null;//级主材规格

double cclf=0;
double czcf=0;//级主材费
double crgf=0;//级人工费
double cjjf=0;//级机械费
double cglfbl=0;//级管理费百分比
double clrbl=0;//级利润百分比
String czcmc=null;//级主材名称
String czcgg=null;//级主材规格





//************************************************************************************


if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
{
		zcmc=cf.GB2Uni(request.getParameter("zcmc"));
		zcgg=cf.GB2Uni(request.getParameter("zcgg"));
		ls=request.getParameter("bj");
		try{
			if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量bj不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[普通报价]类型转换发生意外:"+e);
			return;
		}
		ls=request.getParameter("zcf");
		try{
			if (!(ls.equals("")))  zcf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量zcf不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[zcf]类型转换发生意外:"+e);
			return;
		}

		ls=request.getParameter("rgf");
		try{
			if (!(ls.equals("")))  rgf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量rgf不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[rgf]类型转换发生意外:"+e);
			return;
		}
		ls=request.getParameter("jjf");
		try{
			if (!(ls.equals("")))  jjf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量jjf不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[jjf]类型转换发生意外:"+e);
			return;
		}

		ls=request.getParameter("glfbl");
		try{
			if (!(ls.equals("")))  glfbl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量glfbl不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[glfbl]类型转换发生意外:"+e);
			return;
		}
		ls=request.getParameter("lrbl");
		try{
			if (!(ls.equals("")))  lrbl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量glfbl不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[lrbl]类型转换发生意外:"+e);
			return;
		}
		ls=request.getParameter("clf");
		try{
			if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量clf不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>["+dzbjzjmc+"材料费]类型转换发生意外:"+e);
			return;
		}
			gycl=cf.GB2Uni(request.getParameter("gycl"));
}

	if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
	{
		bzcmc=cf.GB2Uni(request.getParameter("bzcmc"));
		bzcgg=cf.GB2Uni(request.getParameter("bzcgg"));
		ls=request.getParameter("bbj");
		try{
			if (!(ls.equals("")))  bbj=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量bbj不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[精品报价]类型转换发生意外:"+e);
			return;
		}
		ls=request.getParameter("bzcf");
		try{
			if (!(ls.equals("")))  bzcf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量bzcf不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[bzcf]类型转换发生意外:"+e);
			return;
		}

		ls=request.getParameter("brgf");
		try{
			if (!(ls.equals("")))  brgf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量brgf不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[brgf]类型转换发生意外:"+e);
			return;
		}
		ls=request.getParameter("bjjf");
		try{
			if (!(ls.equals("")))  bjjf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量bjjf不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[bjjf]类型转换发生意外:"+e);
			return;
		}

		ls=request.getParameter("bglfbl");
		try{
			if (!(ls.equals("")))  bglfbl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量bglfbl不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[bglfbl]类型转换发生意外:"+e);
			return;
		}
		ls=request.getParameter("blrbl");
		try{
			if (!(ls.equals("")))  blrbl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量bglfbl不存在");
			return;
		}
		catch (Exception e){
			out.println("<BR>[blrbl]类型转换发生意外:"+e);
			return;
		}
		ls=request.getParameter("bclf");
		try{
			if (!(ls.equals("")))  bclf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量bclf不存在");
			return;
		}
		bgycl=cf.GB2Uni(request.getParameter("bgycl"));
	}

if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
{
	czcmc=cf.GB2Uni(request.getParameter("czcmc"));
	czcgg=cf.GB2Uni(request.getParameter("czcgg"));
	ls=request.getParameter("cbj");
	try{
		if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量cbj不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[乐华梅兰单价]类型转换发生意外:"+e);
		return;
	}
	ls=request.getParameter("czcf");
	try{
		if (!(ls.equals("")))  czcf=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量czcf不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[czcf]类型转换发生意外:"+e);
		return;
	}

	ls=request.getParameter("crgf");
	try{
		if (!(ls.equals("")))  crgf=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量crgf不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[crgf]类型转换发生意外:"+e);
		return;
	}
	ls=request.getParameter("cjjf");
	try{
		if (!(ls.equals(""))) cjjf=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量cjjf不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[cjjf]类型转换发生意外:"+e);
		return;
	}

	ls=request.getParameter("cglfbl");
	try{
		if (!(ls.equals("")))  cglfbl=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量cglfbl不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[cglfbl]类型转换发生意外:"+e);
		return;
	}
	ls=request.getParameter("clrbl");
	try{
		if (!(ls.equals("")))  clrbl=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量bglfbl不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[clrbl]类型转换发生意外:"+e);
		return;
	}
	ls=request.getParameter("cclf");
	try{
		if (!(ls.equals("")))  cclf=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量cclf不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>["+dzbjgjmc+"材料费]类型转换发生意外:"+e);
		return;
	}
	cgycl=cf.GB2Uni(request.getParameter("cgycl"));
}

ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}

String bjlx=cf.GB2Uni(request.getParameter("bjlx"));
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String shbz=cf.GB2Uni(request.getParameter("shbz"));
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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String wybh=null;
int count=0;

try {
	conn=cf.getConnection();


	ls_sql="select NVL(max(TO_NUMBER(wybh)),0)";
	ls_sql+=" from  bj_gzbjb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	wybh=cf.addZero(count+1,6);

	if (xmbh.equals(""))
	{
		int aa=0;
		ls_sql="select max(TO_NUMBER(NVL(substr(xmbh,5,4),0)))";
		ls_sql+=" from  bj_gzbjb";
		ls_sql+=" where dqbm='"+dqbm+"'  and bjlx='2'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			aa=rs.getInt(1);
		}
		rs.close();
		ps.close();

		aa++;
		
		xmbh="ZDY-"+cf.addZero(aa,4);
	}

	ls_sql="select count(*)";
	ls_sql+=" from  bj_gzbjb";
	ls_sql+=" where dqbm='"+dqbm+"'  and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！项目编号已存在");
		return;
	}


	ls_sql="insert into bj_gzbjb ( dqbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bj,bbj,cbj,gycl,bgycl,cgycl,xh,wybh,bjlx,lrr,lrsj,shbz,cbenj,sgdbj,clf,bclf,cclf,zcmc,zcgg,zcf,rgf,jjf,glfbl,lrbl,bzcmc,bzcgg,bzcf,brgf,bjjf,bglfbl,blrbl,czcmc,czcgg,czcf,crgf,cjjf,cglfbl,clrbl,zcjldwbm) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,xmbh);
	ps.setString(3,xmmc);
	ps.setString(4,xmdlbm);
	ps.setString(5,xmxlbm);
	ps.setString(6,smbm);
	ps.setString(7,jldwbm);
	ps.setDouble(8,bj);
	ps.setDouble(9,bbj);
	ps.setDouble(10,cbj);
	ps.setString(11,gycl);
	ps.setString(12,bgycl);
	ps.setString(13,cgycl);
	ps.setInt(14,xh);
	ps.setString(15,wybh);
	ps.setString(16,bjlx);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,shbz);
	ps.setDouble(20,cbenj);
	ps.setDouble(21,sgdbj);


	ps.setDouble(22,clf);

	ps.setDouble(23,bclf);

	ps.setDouble(24,cclf);
	ps.setString(25,zcmc);
	ps.setString(26,zcgg);


	ps.setDouble(27,zcf);
	ps.setDouble(28,rgf);
	ps.setDouble(29,jjf);
	ps.setDouble(30,glfbl);
	ps.setDouble(31,lrbl);
	ps.setString(32,bzcmc);
	ps.setString(33,bzcgg);


	ps.setDouble(34,bzcf);
	ps.setDouble(35,brgf);
	ps.setDouble(36,bjjf);
	ps.setDouble(37,bglfbl);
	ps.setDouble(38,blrbl);
	ps.setString(39,czcmc);
	ps.setString(40,czcgg);

	ps.setDouble(41,czcf);
	ps.setDouble(42,crgf);
	ps.setDouble(43,cjjf);
	ps.setDouble(44,cglfbl);
	ps.setDouble(45,clrbl);
	ps.setString(46,zcjldwbm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>