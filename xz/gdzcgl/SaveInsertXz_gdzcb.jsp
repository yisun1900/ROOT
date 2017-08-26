<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gsbh=null;
String bmbh=null;
String gdzcmc=null;
String xh=null;
String pp=null;
int sl=0;
java.sql.Date grsj=null;
java.sql.Date lrsj=null;
java.sql.Date yjsj=null;
double grj=0;
String gzd=null;
String dwbh=null;
String sfybf=null;
String bz=null;
String lrr=null;
gsbh=cf.GB2Uni(request.getParameter("gsbh"));
bmbh=cf.GB2Uni(request.getParameter("bmbh"));
gdzcmc=cf.GB2Uni(request.getParameter("gdzcmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
pp=cf.GB2Uni(request.getParameter("pp"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("grsj");
try{
	if (!(ls.equals("")))  grsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量grsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[购入时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjsj");
try{
	if (!(ls.equals("")))  yjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[移交保管人时间]类型转换发生意外:"+e);
	return;
}
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
ls=request.getParameter("grj");
try{
	if (!(ls.equals("")))  grj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量grj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[购入价]类型转换发生意外:"+e);
	return;
}
gzd=cf.GB2Uni(request.getParameter("gzd"));
lrr=cf.GB2Uni(request.getParameter("lrr"));

dwbh=cf.GB2Uni(request.getParameter("dwbh"));
sfybf=cf.GB2Uni(request.getParameter("sfybf"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String bgr=cf.GB2Uni(request.getParameter("bgr"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String gdzcflbm=cf.GB2Uni(request.getParameter("gdzcflbm"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String[] ssfgsbh=request.getParameterValues("ssfgsbh");

String pz1=cf.GB2Uni(request.getParameter("pz1"));
String pz2=cf.GB2Uni(request.getParameter("pz2"));
String pz3=cf.GB2Uni(request.getParameter("pz3"));
String pz4=cf.GB2Uni(request.getParameter("pz4"));
String pz5=cf.GB2Uni(request.getParameter("pz5"));
String pz6=cf.GB2Uni(request.getParameter("pz6"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="insert into xz_gdzcb ( gsbh,bmbh,gdzcmc,xh,pp,sl,grsj,grj,gzd,ygbh,bgr,dwbh,sfybf,fgsbh,bz,lrr,lrsj,gdzcflbm,yjsj,lrbm,pz1,pz2,pz3,pz4,pz5,pz6) ";
	ls_sql+=" values( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gsbh);
	ps.setString(2,bmbh);
	ps.setString(3,gdzcmc);
	ps.setString(4,xh);
	ps.setString(5,pp);
	ps.setInt(6,sl);
	ps.setDate(7,grsj);
	ps.setDouble(8,grj);
	ps.setString(9,gzd);
	ps.setString(10,ygbh);
	ps.setString(11,bgr);
	ps.setString(12,dwbh);
	ps.setString(13,sfybf);
	ps.setString(14,fgsbh);
	ps.setString(15,bz);
	ps.setString(16,lrr);
	ps.setDate(17,lrsj);
	ps.setString(18,gdzcflbm);
	ps.setDate(19,yjsj);
	ps.setString(20,lrbm);
	ps.setString(21,pz1);
	ps.setString(22,pz2);
	ps.setString(23,pz3);
	ps.setString(24,pz4);
	ps.setString(25,pz5);
	ps.setString(26,pz6);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<ssfgsbh.length ;i++ )
	{
		ls_sql="insert into xz_gdzcssfw ( gsbh,fgsbh)";
		ls_sql+=" values ( ?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gsbh);
		ps.setString(2,ssfgsbh[i]);
		ps.executeUpdate();
		ps.close();
	}

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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>