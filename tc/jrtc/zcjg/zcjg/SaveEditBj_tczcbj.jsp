<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String cpbm=null;
String sku=null;
String tccpdlbm=null;
String tccplbbm=null;
String cpmc=null;
String ppmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
double xdb=0;
double dj=0;
double tccldj=0;
double jsj=0;
double sh=0;
String sfcscp=null;
double xuhao=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
sku=cf.GB2Uni(request.getParameter("sku"));
tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
xdjldw=cf.GB2Uni(request.getParameter("xdjldw"));
ls=request.getParameter("xdb");
try{
	if (!(ls.equals("")))  xdb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xdb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�µ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("tccldj");
try{
	if (!(ls.equals("")))  tccldj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tccldj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײͳ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsj");
try{
	if (!(ls.equals("")))  jsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sh");
try{
	if (!(ls.equals("")))  sh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}
sfcscp=cf.GB2Uni(request.getParameter("sfcscp"));
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xuhao]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));


String sfyx=cf.GB2Uni(request.getParameter("sfyx"));
java.sql.Date yxkssj=null;
ls=request.getParameter("yxkssj");
try{
	if (!(ls.equals("")))  yxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yxkssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч��ʼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date yxjzsj=null;
ls=request.getParameter("yxjzsj");
try{
	if (!(ls.equals("")))  yxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yxjzsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч����ʱ��]����ת����������:"+e);
	return;
}

String gysmc=cf.GB2Uni(request.getParameter("gysmc"));
String sfxclxs=cf.GB2Uni(request.getParameter("sfxclxs"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
String sfkgdj=cf.GB2Uni(request.getParameter("sfkgdj"));

if (xdb==0)
{
	out.println("�����µ��Ȳ���Ϊ0");
	return;
}

if (jsj==0)
{
	out.println("���ѣ������Ϊ0");
}

String wherecpbm=request.getParameter("wherecpbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (tccplbbm.equals("64"))//ǽ��ı�ֽ
	{
		String bjbbh=null;
		ls_sql="select bjbbh";
		ls_sql+=" from  bj_dzbjbb";
		ls_sql+=" where dqbm='"+dqbm+"' and sfzybb='2'";//2����ǰ��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bjbbh=rs.getString("bjbbh");
		}
		rs.close();
		ps.close();

		double tlgbzjj=0;//Ϳ�ϸ�Ϊ��ֽ�Ӽ�
		ls_sql="select tlgbzjj";
		ls_sql+=" from  bj_tcjgb";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tlgbzjj=rs.getDouble("tlgbzjj");
		}
		rs.close();
		ps.close();

		if (dj!=tlgbzjj)
		{
			out.println("����Ϳ�ϸı�ֽ�۸���ȷ�����汾:"+bjbbh+"�����ײͼ۸������Ϊ��"+tlgbzjj);
			return;
		}

		if (tccldj!=tlgbzjj)
		{
			out.println("����Ϳ�ϸı�ֽ�۸���ȷ�����汾:"+bjbbh+"�����ײͼ۸������Ϊ��"+tlgbzjj);
			return;
		}
	}


	ls_sql="update bj_tczcbj set sku=?,tccpdlbm=?,tccplbbm=?,cpmc=?,ppmc=?,xh=?,gg=?,jldw=?,xdjldw=?,xdb=?    ,dj=?,tccldj=?,jsj=?,sh=?,sfcscp=?,gysmc=?,xuhao=?,lrr=?,lrsj=?,bz=?   ,sfxclxs=?,tcsjflbm=?,sfyx=?,yxkssj=?,yxjzsj=?,sfkgdj=? ";
	ls_sql+=" where cpbm='"+wherecpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sku);
	ps.setString(2,tccpdlbm);
	ps.setString(3,tccplbbm);
	ps.setString(4,cpmc);
	ps.setString(5,ppmc);
	ps.setString(6,xh);
	ps.setString(7,gg);
	ps.setString(8,jldw);
	ps.setString(9,xdjldw);
	ps.setDouble(10,xdb);

	ps.setDouble(11,dj);
	ps.setDouble(12,tccldj);
	ps.setDouble(13,jsj);
	ps.setDouble(14,sh);
	ps.setString(15,sfcscp);
	ps.setString(16,gysmc);
	ps.setDouble(17,xuhao);
	ps.setString(18,lrr);
	ps.setDate(19,lrsj);
	ps.setString(20,bz);

	ps.setString(21,sfxclxs);
	ps.setString(22,tcsjflbm);
	ps.setString(23,sfyx);
	ps.setDate(24,yxkssj);
	ps.setDate(25,yxjzsj);
	ps.setString(26,sfkgdj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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