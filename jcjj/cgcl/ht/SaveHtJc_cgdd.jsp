<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sdks=cf.GB2Uni(request.getParameter("sdks"));
String xtbc=cf.GB2Uni(request.getParameter("xtbc"));
String cghs=cf.GB2Uni(request.getParameter("cghs"));
String tmpp=cf.GB2Uni(request.getParameter("tmpp"));
String tmhs=cf.GB2Uni(request.getParameter("tmhs"));
String blcz=cf.GB2Uni(request.getParameter("blcz"));
String jiaolian=cf.GB2Uni(request.getParameter("jiaolian"));
String htbz=cf.GB2Uni(request.getParameter("htbz"));
String qhtr=cf.GB2Uni(request.getParameter("qhtr"));
String dqpp=cf.GB2Uni(request.getParameter("dqpp"));
String dqxh=cf.GB2Uni(request.getParameter("dqxh"));
java.sql.Date qhtsj=null;
java.sql.Date kjxsj=null;
java.sql.Date jhazrq=null;
ls=request.getParameter("jhazrq");
try{
	if (!(ls.equals("")))  jhazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhazrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[安装日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qhtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签合同时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可减项截止时间]类型转换发生意外:"+e);
	return;
}

double tmbfje=0;
double gtbfje=0;
ls=request.getParameter("tmbfje");
try{
	if (!(ls.equals("")))  tmbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tmbfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[台面部分金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gtbfje");
try{
	if (!(ls.equals("")))  gtbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gtbfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[柜体部分金额]类型转换发生意外:"+e);
	return;
}
double wjhtze=0;
ls=request.getParameter("wjhtze");
try{
	if (!(ls.equals("")))  wjhtze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjhtze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金合同总额]类型转换发生意外:"+e);
	return;
}
double dqhtze=0;
ls=request.getParameter("dqhtze");
try{
	if (!(ls.equals("")))  dqhtze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dqhtze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电器合同总额]类型转换发生意外:"+e);
	return;
}
double htze=0;
ls=request.getParameter("htze");
try{
	if (!(ls.equals("")))  htze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同总额]类型转换发生意外:"+e);
	return;
}

double zqtmbfje=0;
double zqgtbfje=0;
ls=request.getParameter("zqtmbfje");
try{
	if (!(ls.equals("")))  zqtmbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqtmbfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[台面部分金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqgtbfje");
try{
	if (!(ls.equals("")))  zqgtbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqgtbfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[柜体部分金额]类型转换发生意外:"+e);
	return;
}
double zqwjhtze=0;
ls=request.getParameter("zqwjhtze");
try{
	if (!(ls.equals("")))  zqwjhtze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqwjhtze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金合同总额]类型转换发生意外:"+e);
	return;
}
double zqdqhtze=0;
ls=request.getParameter("zqdqhtze");
try{
	if (!(ls.equals("")))  zqdqhtze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqdqhtze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电器合同总额]类型转换发生意外:"+e);
	return;
}
double wdzje=0;
ls=request.getParameter("wdzje");
try{
	if (!(ls.equals("")))  wdzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未打折金额]类型转换发生意外:"+e);
	return;
}

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

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String sfpsjs=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,sfpsjs";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		sfpsjs=rs.getString("sfpsjs");
	}
	rs.close();
	ps.close();

	if (sfpsjs.equals("1"))//1：是；2：否
	{
		if (!clzt.equals("11"))
		{
			out.println("！错误，处理状态不正确");
			return;
		}
	}
	else{
		if (!clzt.equals("01"))
		{
			out.println("！错误，处理状态不正确");
			return;
		}
	}


	conn.setAutoCommit(false);

	ls_sql="update jc_cgdd set qhtsj=?,jhazrq=?,kjxsj=?,qhtr=?,htbz=?  ,sdks=?,xtbc=?,cghs=?,tmpp=?,tmhs=?,blcz=?,jiaolian=?";
	ls_sql+=" ,zqgtbfje=?,zqtmbfje=?,zqwjhtze=?,zqdqhtze=?,wdzje=?    ,gtbfje=?,tmbfje=?,wjhtze=?,dqhtze=?,htze=?";
	ls_sql+=" ,zqgtzjje=?,zqtmzjje=?,zqwjzjje=?,zqdqzjje=?,zqzjhze=?  ,gtzjje=?,tmzjje=?,wjzjje=?,dqzjje=?,zjhze=?";
	ls_sql+=" ,cgzkl=?,tmzkl=?,wjzkl=?,dqzkl=?,dzyy=?,lsclzt1=?,dqpp=?,dqxh=?,clzt='13'";
	ls_sql+="  where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qhtsj);
	ps.setDate(2,jhazrq);
	ps.setDate(3,kjxsj);
	ps.setString(4,qhtr);
	ps.setString(5,htbz);

	ps.setString(6,sdks);
	ps.setString(7,xtbc);
	ps.setString(8,cghs);
	ps.setString(9,tmpp);
	ps.setString(10,tmhs);
	ps.setString(11,blcz);
	ps.setString(12,jiaolian);

	ps.setDouble(13,zqgtbfje);
	ps.setDouble(14,zqtmbfje);
	ps.setDouble(15,zqwjhtze);
	ps.setDouble(16,zqdqhtze);
	ps.setDouble(17,wdzje);

	ps.setDouble(18,gtbfje);
	ps.setDouble(19,tmbfje);
	ps.setDouble(20,wjhtze);
	ps.setDouble(21,dqhtze);
	ps.setDouble(22,htze);

	ps.setDouble(23,zqgtbfje);
	ps.setDouble(24,zqtmbfje);
	ps.setDouble(25,zqwjhtze);
	ps.setDouble(26,zqdqhtze);
	ps.setDouble(27,wdzje);

	ps.setDouble(28,gtbfje);
	ps.setDouble(29,tmbfje);
	ps.setDouble(30,wjhtze);
	ps.setDouble(31,dqhtze);
	ps.setDouble(32,htze);
	
	ps.setDouble(33,cgzkl);
	ps.setDouble(34,tmzkl);
	ps.setDouble(35,wjzkl);
	ps.setDouble(36,dqzkl);
	ps.setString(37,dzyy);
	ps.setString(38,clzt);
	ps.setString(39,dqpp);
	ps.setString(40,dqxh);
	ps.executeUpdate();
	ps.close();


	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,jjsjs ,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc  ,zqje ,zhje,cbje,fssj)";
	ls_sql+=" select ddbh,'2','1',ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,cgsjs            ,'',''        ,pdgc,pdgcmc,gys,ppmc  ,wdzje,htze,cbze,qhtsj";
	ls_sql+=" from jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("SQL: " + ls_sql);
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