<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));

double glf=0;
double clf=0;
double zgclf=0;
double sj=0;
double ksdf=0;

double kwxf=0;
double jkje=0;
double fakuan=0;
double kqtk=0;
double gdjskze=0;
double sqgz=0;


ls=request.getParameter("glf");
try{
	if (!(ls.equals("")))  glf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[物流材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zgclf");
try{
	if (!(ls.equals("")))  zgclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zgclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[自购材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sj");
try{
	if (!(ls.equals("")))  sj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ksdf");
try{
	if (!(ls.equals("")))  ksdf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ksdf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣水电费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kwxf");
try{
	if (!(ls.equals("")))  kwxf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kwxf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣维修费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jkje");
try{
	if (!(ls.equals("")))  jkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[借款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fakuan");
try{
	if (!(ls.equals("")))  fakuan=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fakuan不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[罚款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kqtk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣其它款]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("gdjskze");
try{
	if (!(ls.equals("")))  gdjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gdjskze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工队结算款总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqgz");
try{
	if (!(ls.equals("")))  sqgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sqgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税前工资]类型转换发生意外:"+e);
	return;
}


String cwjsr=null;
java.sql.Date cwjssj=null;
String jsdw=null;
String cwjssm=null;
cwjsr=cf.GB2Uni(request.getParameter("cwjsr"));
ls=request.getParameter("cwjssj");
try{
	if (!(ls.equals("")))  cwjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}
cwjssm=cf.GB2Uni(request.getParameter("cwjssm"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jsjd=null;
	String spjl=null;
	ls_sql="select jsjd,spjl";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjd=cf.fillNull(rs.getString("jsjd"));
		spjl=cf.fillNull(rs.getString("spjl"));
	}
	rs.close();
	ps.close();

	if (!jsjd.equals("3"))//1：结算部结算；2：结算审批；3：财务结算
	{
		out.println("错误！财务未结算");
		return;
	}

	ls_sql="update cw_gdjsjl set glf=?,clf=?,zgclf=?,sj=?,ksdf=?,gdjskze=?,kwxf=?,jkje=?,fakuan=?,kqtk=?,sqgz=?,cwjsr=?,cwjssj=?,cwjssm=?,jsjd='3' ";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,glf);
	ps.setDouble(2,clf);
	ps.setDouble(3,zgclf);
	ps.setDouble(4,sj);
	ps.setDouble(5,ksdf);
	ps.setDouble(6,gdjskze);
	ps.setDouble(7,kwxf);
	ps.setDouble(8,jkje);
	ps.setDouble(9,fakuan);
	ps.setDouble(10,kqtk);
	ps.setDouble(11,sqgz);
	ps.setString(12,cwjsr);
	ps.setDate(13,cwjssj);
	ps.setString(14,cwjssm);

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