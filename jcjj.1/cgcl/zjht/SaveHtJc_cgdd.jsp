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



	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_cgddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="update jc_cgdd set qhtsj=?,jhazrq=?,kjxsj=?,qhtr=?,htbz=?,sdks=?,tmpp=?,xtbc=?,blcz=?,jiaolian=?,clzt='13'";
	ls_sql+=" ,gtbfje=?,tmbfje=?,wjhtze=?,dqhtze=?,wdzje=?,htze=?,gtzjje=?,tmzjje=?,wjzjje=?,dqzjje=?,zjhze=?,lsclzt1=?,cghs=?,tmhs=?";
	ls_sql+="  where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qhtsj);
	ps.setDate(2,jhazrq);
	ps.setDate(3,kjxsj);
	ps.setString(4,qhtr);
	ps.setString(5,htbz);
	ps.setString(6,sdks);
	ps.setString(7,tmpp);
	ps.setString(8,xtbc);
	ps.setString(9,blcz);
	ps.setString(10,jiaolian);

	ps.setDouble(11,gtbfje);
	ps.setDouble(12,tmbfje);
	ps.setDouble(13,wjhtze);
	ps.setDouble(14,dqhtze);
	ps.setDouble(15,wdzje);
	ps.setDouble(16,htze);

	ps.setDouble(17,gtbfje);
	ps.setDouble(18,tmbfje);
	ps.setDouble(19,wjhtze);
	ps.setDouble(20,dqhtze);
	ps.setDouble(21,htze);
	
	ps.setString(22,clzt);
	ps.setString(23,cghs);
	ps.setString(24,tmhs);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cgddmx ( xh,ddbh,cgbm,dgcd,dggd,dgjs,dgdj,dgfbxs,tdcd,tggd,tgjs,tgdj,tgfbxs,tmbm,tmcd,tmdj,tmfbxs,mbmj,mbdj,mbbm,mbfbbm,mbfbjg,xtbm,xtjg,lsbm,lsjg,tjbbm,tjbjg,ctbm,ctjg,jlbm,jljg,sjzj,lx,jxbz,bz) ";
	ls_sql+=" select "+xh+"+rownum,ddbh,cgbm,dgcd,dggd,dgjs,dgdj,dgfbxs,tdcd,tggd,tgjs,tgdj,tgfbxs,tmbm,tmcd,tmdj,tmfbxs,mbmj,mbdj,mbbm,mbfbbm,mbfbjg,xtbm,xtjg,lsbm,lsjg,tjbbm,tjbjg,ctbm,ctjg,jlbm,jljg,sjzj,'1','N',bz";
	ls_sql+=" from jc_cgfcdmx ";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cgwjddmx(ddbh,wjbm,dj,sl,je,lx,jxbz,bz)";
	ls_sql+=" select ddbh,wjbm,dj,sl,je,'1','N',bz";
	ls_sql+=" from jc_cgwjfcdmx ";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cgdqddmx(ddbh,dqbm,dj,sl,je,lx,jxbz,bz)";
	ls_sql+=" select ddbh,dqbm,dj,sl,je,'1','N',bz";
	ls_sql+=" from jc_cgdqfcdmx ";
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