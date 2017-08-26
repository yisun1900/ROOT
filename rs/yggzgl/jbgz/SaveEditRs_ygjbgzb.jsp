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
	out.println("<BR>����[ygbh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ա�����]����ת����������:"+e);
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
	out.println("<BR>����[khgz]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч���ʻ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("jbgz");
try{
	if (!(ls.equals("")))  jbgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jbgz]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("gwgz");
try{
	if (!(ls.equals("")))  gwgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gwgz]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��λ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("glgz");
try{
	if (!(ls.equals("")))  glgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[glgz]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���乤��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jtbt");
try{
	if (!(ls.equals("")))  jtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jtbt]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͨ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("dhbt");
try{
	if (!(ls.equals("")))  dhbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dhbt]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ͨѶ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("cb");
try{
	if (!(ls.equals("")))  cb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("buzhu");
try{
	if (!(ls.equals("")))  buzhu=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[buzhu]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
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
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("<BR>����:" + e);
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