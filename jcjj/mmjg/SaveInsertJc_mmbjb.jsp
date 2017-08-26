<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmxh=null;
String ysbm=null;
String qhjgqjbm=null;
double ztmdj=0;
double dmsjg=0;
double dmtjg=0;
double mtjg=0;
double dkmtjg=0;
double zmmjg=0;
double zdmjjl=0;
double yksmjjl=0;
double ysbljjl=0;
mmxh=cf.GB2Uni(request.getParameter("mmxh"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
qhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
String bz=cf.GB2Uni(request.getParameter("bz"));
ls=request.getParameter("ztmdj");
try{
	if (!(ls.equals("")))  ztmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ztmdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[整樘门单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dmsjg");
try{
	if (!(ls.equals("")))  dmsjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dmsjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单门扇价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dmtjg");
try{
	if (!(ls.equals("")))  dmtjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dmtjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单门套价格]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("mtjg");
try{
	if (!(ls.equals("")))  mtjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mtjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[双口门套每米单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dkmtjg");
try{
	if (!(ls.equals("")))  dkmtjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dkmtjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单口门套每米单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zmmjg");
try{
	if (!(ls.equals("")))  zmmjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zmmjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[子母门加价率]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("zdmjjl");
try{
	if (!(ls.equals("")))  zdmjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdmjjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折叠门加价率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yksmjjl");
try{
	if (!(ls.equals("")))  yksmjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yksmjjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[哑口松木集成材加价率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ysbljjl");
try{
	if (!(ls.equals("")))  ysbljjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysbljjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[艺术玻璃加价率]类型转换发生意外:"+e);
	return;
}

double tlmpmdj=0;
ls=request.getParameter("tlmpmdj");
try{
	if (!(ls.equals("")))  tlmpmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tlmpmdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[推拉门每平米单价]类型转换发生意外:"+e);
	return;
}

String dqbm=request.getParameter("dqbm");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
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
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  jc_mmxhb";
	ls_sql+=" where  mmxh='"+mmxh+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count<1)
	{
		out.println("错误！没有该木门型号："+mmxh);
		return;
	}
	
	ls_sql="insert into jc_mmbjb ( mmxh,ysbm,qhjgqjbm,ztmdj,dmsjg,dmtjg,mtjg,zdmjjl,zmmjg,yksmjjl,ysbljjl,bz,dkmtjg  ,tlmpmdj,dqbm,lrr,lrsj,lrbm  ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?  ,?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmxh);
	ps.setString(2,ysbm);
	ps.setString(3,qhjgqjbm);
	ps.setDouble(4,ztmdj);
	ps.setDouble(5,dmsjg);
	ps.setDouble(6,dmtjg);
	ps.setDouble(7,mtjg);
	ps.setDouble(8,zdmjjl);
	ps.setDouble(9,zmmjg);
	ps.setDouble(10,yksmjjl);
	ps.setDouble(11,ysbljjl);
	ps.setString(12,bz);
	ps.setDouble(13,dkmtjg);

	ps.setDouble(14,tlmpmdj);
	ps.setString(15,dqbm);
	ps.setString(16,lrr);
	ps.setString(17,lrbm);
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
