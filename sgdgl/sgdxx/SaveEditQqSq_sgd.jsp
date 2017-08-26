<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String sgd=null;
String oldsgdmc=null;
String sgdmc=null;
String sgdlx=null;
String dz=null;
String dh=null;
String cz=null;
String email=null;
String bz=null;
sgd=cf.GB2Uni(request.getParameter("sgd"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String cxbz=cf.GB2Uni(request.getParameter("cxbz"));
String jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
String lxrdh=cf.GB2Uni(request.getParameter("lxrdh"));
String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
String hjszd=cf.GB2Uni(request.getParameter("hjszd"));
String duihao=cf.GB2Uni(request.getParameter("duihao"));
String sgdjbbm=cf.GB2Uni(request.getParameter("sgdjbbm"));
String sfqldht=cf.GB2Uni(request.getParameter("sfqldht"));
String kjdsm=cf.GB2Uni(request.getParameter("kjdsm"));
oldsgdmc=cf.GB2Uni(request.getParameter("oldsgdmc"));
sgdmc=cf.GB2Uni(request.getParameter("sgdmc"));
sgdlx=cf.GB2Uni(request.getParameter("sgdlx"));
dz=cf.GB2Uni(request.getParameter("dz"));
dh=cf.GB2Uni(request.getParameter("dh"));
cz=cf.GB2Uni(request.getParameter("cz"));
email=cf.GB2Uni(request.getParameter("email"));
bz=cf.GB2Uni(request.getParameter("bz"));

String jcf=cf.GB2Uni(request.getParameter("jcf"));
String tdbz=cf.GB2Uni(request.getParameter("tdbz"));
int bzs=0;
ls=request.getParameter("bzs");
try{
	if (!(ls.equals("")))  bzs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[班组数]类型转换发生意外:"+e);
	return;
}

java.sql.Date tdkssj=null;
ls=request.getParameter("tdkssj");
try{
	if (!(ls.equals("")))  tdkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停单开始时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date tdzzsj=null;
ls=request.getParameter("tdzzsj");
try{
	if (!(ls.equals("")))  tdzzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdzzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停单终止时间]类型转换发生意外:"+e);
	return;
}


String jjlxrdz=cf.GB2Uni(request.getParameter("jjlxrdz"));

int grs=0;
ls=request.getParameter("grs");
try{
	if (!(ls.equals("")))  grs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量grs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工人数]类型转换发生意外:"+e);
	return;
}

java.sql.Date rzsj=null;
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date lzsj=null;
ls=request.getParameter("lzsj");
try{
	if (!(ls.equals("")))  lzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[离职时间]类型转换发生意外:"+e);
	return;
}


String wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
String kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where sgd='"+wheresgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0 && !wheresgd.equals(sgd))
	{
		out.println("警告！该施工队编号已被使用");
	}


	ls_sql="update sq_sgd set dh=?,sgdlx=?,dz=?,cz=?,email=?,bz=?,cxbz=?,jjlxr=?,lxrdh=?,sfzhm=?,hjszd=?,duihao=?,sgdjbbm=?,tdbz=?,tdkssj=?,tdzzsj=?,bzs=?,jcf=?,sgdmc=?,sgd=?,sfqldht=?,kjdsm=?,jjlxrdz=?,grs=?,rzsj=?,lzsj=?";
	ls_sql+=" where  (sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dh);
	ps.setString(2,sgdlx);
	ps.setString(3,dz);
	ps.setString(4,cz);
	ps.setString(5,email);
	ps.setString(6,bz);
	ps.setString(7,cxbz);
	ps.setString(8,jjlxr);
	ps.setString(9,lxrdh);
	ps.setString(10,sfzhm);
	ps.setString(11,hjszd);
	ps.setString(12,duihao);
	ps.setString(13,sgdjbbm);
	ps.setString(14,tdbz);
	ps.setDate(15,tdkssj);
	ps.setDate(16,tdzzsj);
	ps.setInt(17,bzs);
	ps.setString(18,jcf);
	ps.setString(19,sgdmc);
	ps.setString(20,sgd);
	ps.setString(21,sfqldht);
	ps.setString(22,kjdsm);
	ps.setString(23,jjlxrdz);
	ps.setInt(24,grs);
	ps.setDate(25,rzsj);
	ps.setDate(26,lzsj);
	ps.executeUpdate();
	ps.close();


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