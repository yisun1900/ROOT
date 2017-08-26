<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
long tccplbbm=0;
long tccpdlbm=0;
String sfyqxtpp=null;
String jldw=null;
String sfkjm=null;
double jmdj=0;
String lrr=null;
java.sql.Date lrsj=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
ls=request.getParameter("tccplbbm");
try{
	if (!(ls.equals("")))  tccplbbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tccplbbm]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[产品类别]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tccpdlbm");
try{
	if (!(ls.equals("")))  tccpdlbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tccpdlbm]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[产品大类]类型转换发生意外:"+e);
	return;
}
sfyqxtpp=cf.GB2Uni(request.getParameter("sfyqxtpp"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("dypm");
sfkjm=cf.GB2Uni(request.getParameter("sfkjm"));
ls=request.getParameter("jmdj");
try{
	if (!(ls.equals("")))  jmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jmdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减免单价]类型转换发生意外:"+e);
	return;
}
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

double fjbzmj=0;
ls=request.getParameter("fjbzmj");
try{
	if (!(ls.equals("")))  fjbzmj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fjbzmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房间标准面积]类型转换发生意外:"+e);
	return;
}
int dypm=0;
ls=request.getParameter("dypm");
try{
	if (!(ls.equals("")))  dypm=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dypm]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[对应平米]类型转换发生意外:"+e);
	return;
}
double pmzjmj=0;
ls=request.getParameter("pmzjmj");
try{
	if (!(ls.equals("")))  pmzjmj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[pmzjmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每平米增加面积]类型转换发生意外:"+e);
	return;
}

String sfxzsl=request.getParameter("sfxzsl");
String tcnbz=request.getParameter("tcnbz");
String sfbxx=request.getParameter("sfbxx");


String wheredqbm=null;
String wherebjjbbm=null;
String wheretccplbbm=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
wheretccplbbm=cf.GB2Uni(request.getParameter("wheretccplbbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update tc_csrjgmsjmj set dqbm=?,bjjbbm=?,tccplbbm=?,tccpdlbm=?,sfyqxtpp=?,jldw=?,sfkjm=?,jmdj=?,lrr=?,lrsj=?,fjbzmj=?,dypm=?,pmzjmj=?,sfxzsl=?,tcnbz=?,sfbxx=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (tccplbbm="+wheretccplbbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setLong(3,tccplbbm);
	ps.setLong(4,tccpdlbm);
	ps.setString(5,sfyqxtpp);
	ps.setString(6,jldw);
	ps.setString(7,sfkjm);
	ps.setDouble(8,jmdj);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setDouble(11,fjbzmj);
	ps.setInt(12,dypm);
	ps.setDouble(13,pmzjmj);
	ps.setString(14,sfxzsl);
	ps.setString(15,tcnbz);
	ps.setString(16,sfbxx);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>