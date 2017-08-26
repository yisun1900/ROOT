<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
String bianhao=null;
String yhmc=null;
String gzlb=null;
double khgz=0;
double jbgz=0;
double gwgz=0;
double glgz=0;
double jtbt=0;
double dhbt=0;
double cb=0;
double buzhu=0;
String bz=null;
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ygbh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
gzlb=cf.GB2Uni(request.getParameter("gzlb"));
ls=request.getParameter("khgz");
try{
	if (!(ls.equals("")))  khgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[绩效工资基数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jbgz");
try{
	if (!(ls.equals("")))  jbgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jbgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[基本工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gwgz");
try{
	if (!(ls.equals("")))  gwgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gwgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[岗位工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("glgz");
try{
	if (!(ls.equals("")))  glgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[glgz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工龄工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jtbt");
try{
	if (!(ls.equals("")))  jtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jtbt]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交通补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dhbt");
try{
	if (!(ls.equals("")))  dhbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dhbt]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[通讯补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cb");
try{
	if (!(ls.equals("")))  cb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[餐饮补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("buzhu");
try{
	if (!(ls.equals("")))  buzhu=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[buzhu]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它补贴]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String whereygbh=null;
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select  count(*) ";
	ls_sql+=" from  rs_ygjbgzb";
	ls_sql+=" where ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		ls_sql="update rs_ygjbgzb set ygbh=?,bianhao=?,yhmc=?,gzlb=?,khgz=?,jbgz=?,gwgz=?,glgz=?,jtbt=?,dhbt=?,cb=?,buzhu=?,bz=? ";
		ls_sql+=" where ygbh="+whereygbh;
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,ygbh);
		ps.setString(2,bianhao);
		ps.setString(3,yhmc);
		ps.setString(4,gzlb);
		ps.setDouble(5,khgz);
		ps.setDouble(6,jbgz);
		ps.setDouble(7,gwgz);
		ps.setDouble(8,glgz);
		ps.setDouble(9,jtbt);
		ps.setDouble(10,dhbt);
		ps.setDouble(11,cb);
		ps.setDouble(12,buzhu);
		ps.setString(13,bz);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="insert into rs_ygjbgzb (ygbh,bianhao,yhmc,gzlb,khgz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,bz)";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,ygbh);
		ps.setString(2,bianhao);
		ps.setString(3,yhmc);
		ps.setString(4,gzlb);
		ps.setDouble(5,khgz);
		ps.setDouble(6,jbgz);
		ps.setDouble(7,gwgz);
		ps.setDouble(8,glgz);
		ps.setDouble(9,jtbt);
		ps.setDouble(10,dhbt);
		ps.setDouble(11,cb);
		ps.setDouble(12,buzhu);
		ps.setString(13,bz);
		ps.executeUpdate();
		ps.close();
	}


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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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