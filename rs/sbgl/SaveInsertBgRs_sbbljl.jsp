<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sbbljlh=null;
String shbxh=null;
java.sql.Date sbblsj=null;
long ygbh=0;
String bianhao=null;
String yhmc=null;
String ylbx=null;
String jylbx=null;
String sybx=null;
String gsby=null;
String syx=null;
String jbxdd=null;
double yjsxe=0;
double gsjbfe=0;
double grjbfe=0;
String sfjgjj=null;
double gsjgjj=0;
double grjgjj=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
sbbljlh=cf.GB2Uni(request.getParameter("sbbljlh"));
shbxh=cf.GB2Uni(request.getParameter("shbxh"));
ls=request.getParameter("sbblsj");
try{
	if (!(ls.equals("")))  sbblsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sbblsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�籣����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ygbh������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ա�����]����ת����������:"+e);
	return;
}
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
ylbx=cf.GB2Uni(request.getParameter("ylbx"));
jylbx=cf.GB2Uni(request.getParameter("jylbx"));
sybx=cf.GB2Uni(request.getParameter("sybx"));
gsby=cf.GB2Uni(request.getParameter("gsby"));
syx=cf.GB2Uni(request.getParameter("syx"));
jbxdd=cf.GB2Uni(request.getParameter("jbxdd"));
ls=request.getParameter("yjsxe");
try{
	if (!(ls.equals("")))  yjsxe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjsxe������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ɻ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("gsjbfe");
try{
	if (!(ls.equals("")))  gsjbfe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gsjbfe������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾�����Ѷ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("grjbfe");
try{
	if (!(ls.equals("")))  grjbfe=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����grjbfe������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˽����Ѷ�]����ת����������:"+e);
	return;
}
sfjgjj=cf.GB2Uni(request.getParameter("sfjgjj"));
ls=request.getParameter("gsjgjj");
try{
	if (!(ls.equals("")))  gsjgjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gsjgjj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾��ס��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("grjgjj");
try{
	if (!(ls.equals("")))  grjgjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����grjgjj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˽�ס��������]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

java.sql.Date bxtjsj=null;
ls=request.getParameter("bxtjsj");
try{
	if (!(ls.equals("")))  bxtjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bxtjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ͣ��ʱ��]����ת����������:"+e);
	return;
}
java.sql.Date bxzcsj=null;
ls=request.getParameter("bxzcsj");
try{
	if (!(ls.equals("")))  bxzcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bxzcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ת��ʱ��]����ת����������:"+e);
	return;
}
double jndbtc=0;
ls=request.getParameter("jndbtc");
try{
	if (!(ls.equals("")))  jndbtc=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jndbtc������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ɴ�ͳ��]����ת����������:"+e);
	return;
}


String ysbbljlh=cf.GB2Uni(request.getParameter("ysbbljlh"));
String lx=cf.GB2Uni(request.getParameter("lx"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="insert into rs_sbbljl ( sbbljlh,shbxh,sbblsj,ygbh,bianhao,yhmc,ylbx,jylbx,sybx,gsby   ,syx,jbxdd,yjsxe,gsjbfe,grjbfe,sfjgjj,gsjgjj,grjgjj,lrr,lrsj   ,lrbm,bz,lx,ysbbljlh,bxtjsj,bxzcsj,jndbtc ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?) ";//1������2�������2��ͣ����3��ת��
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sbbljlh);
	ps.setString(2,shbxh);
	ps.setDate(3,sbblsj);
	ps.setLong(4,ygbh);
	ps.setString(5,bianhao);
	ps.setString(6,yhmc);
	ps.setString(7,ylbx);
	ps.setString(8,jylbx);
	ps.setString(9,sybx);
	ps.setString(10,gsby);

	ps.setString(11,syx);
	ps.setString(12,jbxdd);
	ps.setDouble(13,yjsxe);
	ps.setDouble(14,gsjbfe);
	ps.setDouble(15,grjbfe);
	ps.setString(16,sfjgjj);
	ps.setDouble(17,gsjgjj);
	ps.setDouble(18,grjgjj);
	ps.setString(19,lrr);
	ps.setDate(20,lrsj);

	ps.setString(21,lrbm);
	ps.setString(22,bz);
	ps.setString(23,lx);
	ps.setString(24,ysbbljlh);
	ps.setDate(25,bxtjsj);
	ps.setDate(26,bxzcsj);
	ps.setDouble(27,jndbtc);
	ps.executeUpdate();
	ps.close();

	String sfcjbx="";//Y���α���N��δ����T��ͣ����Z��ת��

	if (lx.equals("2"))//1������2�������3��ͣ����4��ת��
	{
		sfcjbx="Y";

		ls_sql="update rs_ygsbxx set shbxh=?,sbblsj=?,ylbx=?,jylbx=?,sybx=?,gsby=?,syx=?,jbxdd=?,yjsxe=?,gsjbfe=?  ,grjbfe=?,sfjgjj=?,gsjgjj=?,grjgjj=?,sbbljlh=?,sfcjbx=?,jndbtc=?";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,shbxh);
		ps.setDate(2,sbblsj);
		ps.setString(3,ylbx);
		ps.setString(4,jylbx);
		ps.setString(5,sybx);
		ps.setString(6,gsby);
		ps.setString(7,syx);
		ps.setString(8,jbxdd);
		ps.setDouble(9,yjsxe);
		ps.setDouble(10,gsjbfe);

		ps.setDouble(11,grjbfe);
		ps.setString(12,sfjgjj);
		ps.setDouble(13,gsjgjj);
		ps.setDouble(14,grjgjj);
		ps.setString(15,sbbljlh);
		ps.setString(16,sfcjbx);
		ps.setDouble(17,jndbtc);
		ps.executeUpdate();
		ps.close();
	}
	else if (lx.equals("3"))
	{
		sfcjbx="T";

		ls_sql="update rs_ygsbxx set bxtjsj=?,sfcjbx=?,sbbljlh=?";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,bxtjsj);
		ps.setString(2,sfcjbx);
		ps.setString(3,sbbljlh);
		ps.executeUpdate();
		ps.close();
	}
	else if (lx.equals("4"))
	{
		sfcjbx="Z";

		ls_sql="update rs_ygsbxx set bxzcsj=?,sfcjbx=?,sbbljlh=?";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,bxzcsj);
		ps.setString(2,sfcjbx);
		ps.setString(3,sbbljlh);
		ps.executeUpdate();
		ps.close();
	}



	conn.commit();
		
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
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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