<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String ysbm=null;
String hxmjbm=null;
long fwmj=0;
long pmjj=0;
String hth=null;
String sjs=null;
long qye=0;
String sfyyh=null;
String yhyy=null;
String fzxm=null;
java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
long skje=0;
java.sql.Date skrq=null;
java.sql.Date zkrq=null;
java.sql.Date jgrq=null;
long zkje=0;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cgdz=null;
String hdsgd=null;
String hdsgbz=null;
String hdsjs=null;
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdsgd=cf.GB2Uni(request.getParameter("hdsgd"));
hdsgbz=cf.GB2Uni(request.getParameter("hdsgbz"));
hdsjs=cf.GB2Uni(request.getParameter("hdsjs"));


String ybjbh=cf.GB2Uni(request.getParameter("ybjbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
zxjwbm=cf.GB2Uni(request.getParameter("zxjwbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
hxmjbm=cf.GB2Uni(request.getParameter("hxmjbm"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房屋面积]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pmjj");
try{
	if (!(ls.equals("")))  pmjj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pmjj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每平米均价]类型转换发生意外:"+e);
	return;
}
hth=cf.GB2Uni(request.getParameter("hth"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约额]类型转换发生意外:"+e);
	return;
}
sfyyh=cf.GB2Uni(request.getParameter("sfyyh"));
yhyy=cf.GB2Uni(request.getParameter("yhyy"));
fzxm=cf.GB2Uni(request.getParameter("fzxm"));
ls=request.getParameter("qyrq");
try{
	if (!(ls.equals("")))  qyrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qyrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kgrq");
try{
	if (!(ls.equals("")))  kgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应开工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zkrq");
try{
	if (!(ls.equals("")))  zkrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zkrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[中期款日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jgrq");
try{
	if (!(ls.equals("")))  jgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应竣工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("skje");
try{
	if (!(ls.equals("")))  skje=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量skje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[首款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("skrq");
try{
	if (!(ls.equals("")))  skrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量skrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[首款日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zkje");
try{
	if (!(ls.equals("")))  zkje=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[中款金额]类型转换发生意外:"+e);
	return;
}
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//参观样板间编号
	int count=0;
	if (!ybjbh.equals(""))
	{
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+ybjbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		ps.close();
		rs.close();

		if (count<1)
		{
			out.println("错误！不存在的参观样板间编号");
			return;
		}
	}

	ls_sql="update crm_khxx set khxm=?,xb=?,fwdz=?,cqbm=?,lxfs=?,hxbm=?,fgflbm=?,zxjwbm=?,ysbm=?,hxmjbm=?,fwmj=?,pmjj=?,hth=?,sjs=?,qye=?,sfyyh=?,yhyy=?,fzxm=?,qyrq=?,kgrq=?,skje=?,skrq=?,zkje=?,hdbz=?,khlxbm=?,bz=?,zkrq=?,jgrq=?,ybjbh=?,cgdz=?,hdsgd=?,hdsgbz=?,hdsjs=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,cqbm);
	ps.setString(5,lxfs);
	ps.setString(6,hxbm);
	ps.setString(7,fgflbm);
	ps.setString(8,zxjwbm);
	ps.setString(9,ysbm);
	ps.setString(10,hxmjbm);
	ps.setLong(11,fwmj);
	ps.setLong(12,pmjj);
	ps.setString(13,hth);
	ps.setString(14,sjs);
	ps.setLong(15,qye);
	ps.setString(16,sfyyh);
	ps.setString(17,yhyy);
	ps.setString(18,fzxm);
	ps.setDate(19,qyrq);
	ps.setDate(20,kgrq);
	ps.setLong(21,skje);
	ps.setDate(22,skrq);
	ps.setLong(23,zkje);
	ps.setString(24,hdbz);
	ps.setString(25,khlxbm);
	ps.setString(26,bz);
	ps.setDate(27,zkrq);
	ps.setDate(28,jgrq);
	ps.setString(29,ybjbh);
	ps.setString(30,cgdz);
	ps.setString(31,hdsgd);
	ps.setString(32,hdsgbz);
	ps.setString(33,hdsjs);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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
	out.print("Exception: " + e);
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