<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String zt=null;

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String cqbm=null;
String jiedao=null;
String xqbm=null;
String louhao=null;
String ywyssxz=null;
String xqlx=null;
long fwmj=0;
String hxbm=null;
long fj=0;
String khzyxz=null;
java.sql.Date yjzxsj=null;
String jzdsmc=null;
String sfxhf=null;
java.sql.Date xchfsj=null;

khxm=cf.GB2Uni(request.getParameter("khxm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
ywy=cf.GB2Uni(request.getParameter("ywy"));
zt=cf.GB2Uni(request.getParameter("zt"));

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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
bz=cf.GB2Uni(request.getParameter("bz"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
jiedao=cf.GB2Uni(request.getParameter("jiedao"));
xqbm=cf.GB2Uni(request.getParameter("xqbm"));
louhao=cf.GB2Uni(request.getParameter("louhao"));
ywyssxz=cf.GB2Uni(request.getParameter("ywyssxz"));
xqlx=cf.GB2Uni(request.getParameter("xqlx"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fwmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[建筑面积]类型转换发生意外:"+e);
	return;
}
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房价]类型转换发生意外:"+e);
	return;
}
khzyxz=cf.GB2Uni(request.getParameter("khzyxz"));
ls=request.getParameter("yjzxsj");
try{
	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjzxsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预计装修时间]类型转换发生意外:"+e);
	return;
}
jzdsmc=cf.GB2Uni(request.getParameter("jzdsmc"));
sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("xchfsj");
try{
	if (!(ls.equals("")))  xchfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xchfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下次回访时间]类型转换发生意外:"+e);
	return;
}
String ywybm=cf.GB2Uni(request.getParameter("ywybm"));

String scbkhbh=request.getParameter("scbkhbh");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_scbkhxx set khxm=?,fwdz=?,lxfs=?,ywy=?,zt=?,lrr=?,lrsj=?,lrbm=?,ssfgs=?,bz=?   ,cqbm=?,jiedao=?,xqbm=?,louhao=?,ywyssxz=?,ywybm=?,xqlx=?,fwmj=?,hxbm=?,fj=?  ,khzyxz=?,yjzxsj=?,jzdsmc=?,sfxhf=?,xchfsj=? ";
	ls_sql+=" where  scbkhbh='"+scbkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,fwdz);
	ps.setString(3,lxfs);
	ps.setString(4,ywy);
	ps.setString(5,zt);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,ssfgs);
	ps.setString(10,bz);

	ps.setString(11,cqbm);
	ps.setString(12,jiedao);
	ps.setString(13,xqbm);
	ps.setString(14,louhao);
	ps.setString(15,ywyssxz);
	ps.setString(16,ywybm);
	ps.setString(17,xqlx);
	ps.setLong(18,fwmj);
	ps.setString(19,hxbm);
	ps.setLong(20,fj);

	ps.setString(21,khzyxz);
	ps.setDate(22,yjzxsj);
	ps.setString(23,jzdsmc);
	ps.setString(24,sfxhf);
	ps.setDate(25,xchfsj);
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