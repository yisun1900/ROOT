<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwlx=(String)session.getAttribute("dwlx");
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
long fwmj=0;
String fgyqbm=null;
String zxysbm=null;
String sfxhf=null;
java.sql.Date hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;
String rddqbm=cf.GB2Uni(request.getParameter("rddqbm"));
String hxwzbm=cf.GB2Uni(request.getParameter("hxwzbm"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
fwlxbm=cf.GB2Uni(request.getParameter("fwlxbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套内建筑面积]类型转换发生意外:"+e);
	return;
}
fgyqbm=cf.GB2Uni(request.getParameter("fgyqbm"));
zxysbm=cf.GB2Uni(request.getParameter("zxysbm"));
sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("hfrq");
try{
	if (!(ls.equals("")))  hfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访日期]类型转换发生意外:"+e);
	return;
}
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String cqbm=null;
String cgdz=null;
String yzxxbz=null;
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
yzxxbz=cf.GB2Uni(request.getParameter("yzxxbz"));

java.sql.Date yjzxsj=null;
String zybm=request.getParameter("zybm");
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String nlqjbm=request.getParameter("nlqjbm");
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
int fj=0;

ls=request.getParameter("yjzxsj");
try{
	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjzxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预计装修时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房价]类型转换发生意外:"+e);
	return;
}

String ywy=cf.GB2Uni(request.getParameter("ywy"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));

java.sql.Date jhjfsj=null;
String hdr=null;
hdr=cf.GB2Uni(request.getParameter("hdr"));
ls=request.getParameter("jhjfsj");
try{
	if (!(ls.equals("")))  jhjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhjfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划交房时间]类型转换发生意外:"+e);
	return;
}

String louhao=cf.GB2Uni(request.getParameter("louhao"));

String hdsfss=null;
if (hdbz.equals("1"))
{
	hdsfss=null;
}
else{
	hdsfss="0";
}

String zxkhlrjc=cf.GB2Uni(request.getParameter("zxkhlrjc"));
String qdkhbljc=cf.GB2Uni(request.getParameter("qdkhbljc"));
String dzbjjc=cf.GB2Uni(request.getParameter("dzbjjc"));


String[] xxlybm=request.getParameterValues("xxlybm");


String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yzxdm=null;
String ysjs=null;
java.sql.Date ysjsfpsj=null;
java.sql.Date yzxdmfpsj=null;

try {
	conn=cf.getConnection();

	int count=0;


	conn.setAutoCommit(false);

	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where  khlx='2' and khbh='"+wherekhbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'2')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherekhbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_zxkhxx set khxm=?,xb=?,fwdz=?,lxfs=?,fwlxbm=?,hxbm=?,fwmj=?,fgyqbm=?,zxysbm=?,sfxhf=?,hfrq=?,hdbz=?,khlxbm=?,bz=?,cqbm=?        ,cgdz=?,yzxxbz=?,xqbm=?,nlqjbm=?,zybm=?,fj=?,yjzxsj=?,ywy=?   ,jhjfsj=?,hdr=?,hdsfss=?,jzbz=?,rddqbm=?,hxwzbm=?,ysrbm=?,louhao=?,shbz='Y',shr=?,shsj=TRUNC(SYSDATE),zxkhlrjc=?,qdkhbljc=?,dzbjjc=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  and zxzt not in('3','4')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,fwlxbm);
	ps.setString(6,hxbm);
	ps.setLong(7,fwmj);
	ps.setString(8,fgyqbm);
	ps.setString(9,zxysbm);
	ps.setString(10,sfxhf);
	ps.setDate(11,hfrq);
	ps.setString(12,hdbz);
	ps.setString(13,khlxbm);
	ps.setString(14,bz);
	ps.setString(15,cqbm);

	ps.setString(16,cgdz);
	ps.setString(17,yzxxbz);
	ps.setString(18,xqbm);
	ps.setString(19,nlqjbm);
	ps.setString(20,zybm);
	ps.setInt(21,fj);
	ps.setDate(22,yjzxsj);
	ps.setString(23,ywy);

	ps.setDate(24,jhjfsj);
	ps.setString(25,hdr);
	ps.setString(26,hdsfss);
	ps.setString(27,jzbz);
	ps.setString(28,rddqbm);
	ps.setString(29,hxwzbm);
	ps.setString(30,ysrbm);
	ps.setString(31,louhao);
	ps.setString(32,yhmc);
	ps.setString(33,zxkhlrjc);
	ps.setString(34,qdkhbljc);
	ps.setString(35,dzbjjc);

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