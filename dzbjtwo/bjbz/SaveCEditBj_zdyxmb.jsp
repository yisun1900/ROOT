<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String ls=null;
String dqbm=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;

String gycl=cf.GB2Uni(request.getParameter("gycl"));


dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));


ls=request.getParameter("clbj");
try{
	if (!(ls.equals("")))  clbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ķ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("rgbj");
try{
	if (!(ls.equals("")))  rgbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rgbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("jxbj");
try{
	if (!(ls.equals("")))  jxbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jxbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��е��]����ת����������:"+e);
	return;
}
ls=request.getParameter("bj");
try{
	if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ԥ���]����ת����������:"+e);
	return;
}

java.sql.Date zdyxmyxq=null;
ls=request.getParameter("zdyxmyxq");
try{
	if (!(ls.equals("")))  zdyxmyxq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zdyxmyxq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Զ�����Ŀ��Ч��]����ת����������:"+e);
	return;
}

String flmcgg=cf.GB2Uni(request.getParameter("flmcgg"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String sfxycl=cf.GB2Uni(request.getParameter("sfxycl"));
String sfxyyjd=cf.GB2Uni(request.getParameter("sfxyyjd"));

double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
ls=request.getParameter("zcf");
try{
	if (!(ls.equals("")))  zcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zcf������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ķ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("shf");
try{
	if (!(ls.equals("")))  shf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����shf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ķ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ysf");
try{
	if (!(ls.equals("")))  ysf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ysf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("qtf");
try{
	if (!(ls.equals("")))  qtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtf������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
String xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));

String xmbh=request.getParameter("xmbh");
String lrr=request.getParameter("lrr");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getshbz=null;
	ls_sql="select shbz";
	ls_sql+=" from  bj_zdyxmb";
	ls_sql+=" where lrr='"+lrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getshbz=rs.getString("shbz");
	}
	rs.close();
	ps.close();
	if (!getshbz.equals("N") && !getshbz.equals("C") && !getshbz.equals("W"))//N; ������ˣ�S:�������룻Y:���ͨ����W:���δͨ����C:��������
	{
		out.println("�����ѿ�ʼ��ˣ��������޸�");
		return;
	}


	double gcjcbjxs=0;//���̻�������ϵ��
	double sgcbbjxs=0;//ʩ���ɱ�����ϵ�� 
	ls_sql="select gcjcbjxs,sgcbbjxs";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dqbm='"+dqbm+"' and dwlx='F0'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjcbjxs=rs.getDouble("gcjcbjxs");
		sgcbbjxs=rs.getDouble("sgcbbjxs");
	}
	rs.close();
	ps.close();

	if (gcjcbjxs==0)
	{
		out.println("���󣡡����̻�������ϵ����δ��ʼ��");
		return;
	}
	if (sgcbbjxs==0)
	{
		out.println("���󣡡�ʩ���ɱ�����ϵ����δ��ʼ��");
		return;
	}

	double sgcbj=bj*sgcbbjxs;
	double sgdbj=bj/gcjcbjxs;

	conn.setAutoCommit(false);


	int sqjl=0;
	ls_sql="select max(sqjl)";
	ls_sql+=" from  bj_zdyshjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqjl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sqjl++;

	ls_sql="insert into bj_zdyshjl (sqjl,zdyxmlrr,xmbh,dqbm,bjjbbm,lrsj,shbz) ";
	ls_sql+=" values ( ?,?,?,?,?,SYSDATE,'N') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,sqjl);
	ps.setString(2,lrr);
	ps.setString(3,xmbh);
	ps.setString(4,dqbm);
	ps.setString(5,bjjbbm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update bj_zdyxmb set xmmc=?,xmdlbm=?,xmxlbm=?,smbm=?,jldwbm=?,clbj=?,rgbj=?,jxbj=?,zcf=?,shf=?   ,ysf=?,qtf=?,bj=?,gycl=?,zdyxmyxq=?,flmcgg=?,bz=?,sfxycl=?,sfxyyjd=?,xmflbm=?,sgdbj=?,sgcbj=?,shbz='C' ";
	ls_sql+=" where lrr='"+lrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmmc);
	ps.setString(2,xmdlbm);
	ps.setString(3,xmxlbm);
	ps.setString(4,smbm);
	ps.setString(5,jldwbm);
	ps.setDouble(6,clbj);
	ps.setDouble(7,rgbj);
	ps.setDouble(8,jxbj);
	ps.setDouble(9,zcf);
	ps.setDouble(10,shf);

	ps.setDouble(11,ysf);
	ps.setDouble(12,qtf);
	ps.setDouble(13,bj);
	ps.setString(14,gycl);
	ps.setDate(15,zdyxmyxq);
	ps.setString(16,flmcgg);
	ps.setString(17,bz);
	ps.setString(18,sfxycl);
	ps.setString(19,sfxyyjd);
	ps.setString(20,xmflbm);
	ps.setDouble(21,sgdbj);
	ps.setDouble(22,sgcbj);

	ps.executeUpdate();
	ps.close();

		
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