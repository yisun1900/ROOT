<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bjbbh=null;
String dqbm=null;
String bjjbbm=null;
String xmbh=null;
String glfxclbm=null;
String glfxclmc=null;
String glflbm=null;
double dj=0;
String jldwbm=null;
double xhl=0;
double jqsfl=0;
double bsfl=0;
double tvocsfl=0;
String lx=null;
String wlllbz=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;

bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
glfxclbm=cf.GB2Uni(request.getParameter("glfxclbm"));
glfxclmc=cf.GB2Uni(request.getParameter("glfxclmc"));
glflbm=cf.GB2Uni(request.getParameter("glflbm"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
ls=request.getParameter("xhl");
try{
	if (!(ls.equals("")))  xhl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xhl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[消耗量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jqsfl");
try{
	if (!(ls.equals("")))  jqsfl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jqsfl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[甲醛释放量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bsfl");
try{
	if (!(ls.equals("")))  bsfl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bsfl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[苯释放量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tvocsfl");
try{
	if (!(ls.equals("")))  tvocsfl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tvocsfl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[TVOC释放量]类型转换发生意外:"+e);
	return;
}
lx=cf.GB2Uni(request.getParameter("lx"));
wlllbz=cf.GB2Uni(request.getParameter("wlllbz"));
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	int glbxh=0;
	ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
	ls_sql+=" from  bj_jzglfxb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		glbxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	glbxh++;

	ls_sql="insert into bj_jzglfxb ( glbxh,bjbbh,dqbm,bjjbbm,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,glbxh);
	ps.setString(2,bjbbh);
	ps.setString(3,dqbm);
	ps.setString(4,bjjbbm);
	ps.setString(5,xmbh);
	ps.setString(6,glfxclbm);
	ps.setString(7,glfxclmc);
	ps.setString(8,glflbm);
	ps.setDouble(9,dj);
	ps.setString(10,jldwbm);
	ps.setDouble(11,xhl);
	ps.setDouble(12,jqsfl);
	ps.setDouble(13,bsfl);
	ps.setDouble(14,tvocsfl);
	ps.setString(15,lx);
	ps.setString(16,wlllbz);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,bz);
	ps.executeUpdate();
	ps.close();

	//更新报价成本＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double clcb=0;//材料成本
	double rgcb=0;//人工成本
	double jxcb=0;//机械成本
	double cbenj=0;//成本价
	ls_sql="select ROUND(sum(dj*xhl),2)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='1'";//1:材料
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select ROUND(sum(dj*xhl),2)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='2'";//2:人工
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rgcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select ROUND(sum(dj*xhl),2)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='3'";//3:机械
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jxcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	cbenj=cf.round(clcb+rgcb+jxcb,2);

	ls_sql="update bj_jzbjb set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,clcb);
	ps.setDouble(2,rgcb);
	ps.setDouble(3,jxcb);
	ps.setDouble(4,cbenj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_jzbjb1 set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,clcb);
	ps.setDouble(2,rgcb);
	ps.setDouble(3,jxcb);
	ps.setDouble(4,cbenj);
	ps.executeUpdate();
	ps.close();
	//更新报价成本＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	conn.commit();

	response.sendRedirect("InsertBj_jzglfxb.jsp?xmbh="+xmbh+"&dqbm="+dqbm+"&bjjbbm="+bjjbbm+"&bjbbh="+java.net.URLEncoder.encode(bjbbh,"UTF-8")+"&save=Y");

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
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