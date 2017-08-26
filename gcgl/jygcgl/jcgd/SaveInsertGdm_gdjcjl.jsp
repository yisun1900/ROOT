<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jcjlh=request.getParameter("jcjlh");
String jclxbm=request.getParameter("jclxbm");
String jcjgbm=request.getParameter("jcjgbm");
String lrdw=request.getParameter("lrdw");
String khbh=null;
String xjr=null;
java.sql.Date xjsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
xjr=cf.GB2Uni(request.getParameter("xjr"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("xjsj");
try{
	if (!(ls.equals("")))  xjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处罚时间]类型转换发生意外:"+e);
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
bz=cf.GB2Uni(request.getParameter("bz"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String jcwtflbm=cf.GB2Uni(request.getParameter("jcwtflbm"));
double jlje=0;
ls=request.getParameter("jlje");
try{
	if (!(ls.equals("")))  jlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jlje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖励金额]类型转换发生意外:"+e);
	return;
}
String xxlybm=cf.GB2Uni(request.getParameter("xxlybm"));
String sffszg=cf.GB2Uni(request.getParameter("sffszg"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String zrr=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrr=rs.getString("yhmc");
	}
	rs.close();
	ps.close();

	


	ls_sql="insert into gdm_gdjcjl ( jcjlh,khbh,jclxbm,xjr,xjsj,lrr,lrsj,bz,cfspbz,kpbz,jsbz,fkze,kfzs,lrdw,jcjgbm,sgd,jcwtflbm,jlje,xxlybm,sffszg,dwbh,zrr,ygbh,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,'1','N','N',0,0,?,?,?,?,?,?,?,?,?,?,'1') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jcjlh);
	ps.setString(2,khbh);
	ps.setString(3,jclxbm);
	ps.setString(4,xjr);
	ps.setDate(5,xjsj);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,bz);
	ps.setString(9,lrdw);
	ps.setString(10,jcjgbm);
	ps.setString(11,sgd);
	ps.setString(12,jcwtflbm);
	ps.setDouble(13,jlje);
	ps.setString(14,xxlybm);
	ps.setString(15,sffszg);
	ps.setString(16,dwbh);
	ps.setString(17,zrr);
	ps.setString(18,ygbh);
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL= " + ls_sql);
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