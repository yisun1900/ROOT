<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgfjlh=null;
String bfcs=null;
String khbh=null;
String sgd=null;
String sgbz=null;
double zqgcf=0;
double zhgcf=0;
double gcfzk=0;
java.sql.Date bfrq=null;
String bfjs=null;
double bfbl=0;
double bfje=0;
double yfgf=0;
double sjbk=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
bgfjlh=cf.GB2Uni(request.getParameter("bgfjlh"));
bfcs=cf.GB2Uni(request.getParameter("bfcs"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
ls=request.getParameter("zqgcf");
try{
	if (!(ls.equals("")))  zqgcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqgcf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ���̷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zhgcf");
try{
	if (!(ls.equals("")))  zhgcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhgcf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ󹤳̷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("gcfzk");
try{
	if (!(ls.equals("")))  gcfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcfzk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̷��ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("bfrq");
try{
	if (!(ls.equals("")))  bfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bfrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
bfjs=cf.GB2Uni(request.getParameter("bfjs"));
ls=request.getParameter("bfbl");
try{
	if (!(ls.equals("")))  bfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bfbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bfje");
try{
	if (!(ls.equals("")))  bfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bfje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yfgf");
try{
	if (!(ls.equals("")))  yfgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yfgf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ѹ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjbk");
try{
	if (!(ls.equals("")))  sjbk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjbk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʵ�ʲ���]����ת����������:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String sfkclk=cf.GB2Uni(request.getParameter("sfkclk"));
String sfkybgf=cf.GB2Uni(request.getParameter("sfkybgf"));
double clkzdbl=0;
ls=request.getParameter("clkzdbl");
try{
	if (!(ls.equals("")))  clkzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clkzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ͽ���ͱ���]����ת����������:"+e);
	return;
}
double clk=0;
ls=request.getParameter("clk");
try{
	if (!(ls.equals("")))  clk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ͽ�]����ת����������:"+e);
	return;
}
double ssk=0;
ls=request.getParameter("ssk");
try{
	if (!(ls.equals("")))  ssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ssk������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�տ�]����ת����������:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
try {
	conn=cf.getConnection();

	String getbfcs=null;
	ls_sql="select bfcs";
	ls_sql+=" from cw_lfbgfjl";
	ls_sql+=" where bgfjlh='"+bgfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getbfcs=cf.fillNull(rs.getString("bfcs"));
	}
	else{
		out.println("<BR>���������󣬼�¼�Ų�����");
		return;
	}
	rs.close();
	ps.close();

	String gdjsjd=null;
	ls_sql="select gdjsjd";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	if (gdjsjd.equals("B"))
	{
		out.println("<BR>�������������깤����");
		return;
	}

	if (!getbfcs.equals(gdjsjd))
	{
		out.println("<BR>����������ֻ���޸����²����Ѽ�¼");
		return;
	}

	
	ls_sql="update cw_lfbgfjl set bfrq=?,bfjs=?,bfbl=?,bfje=?,yfgf=?,sjbk=?,lrr=?,lrsj=?,lrbm=?,bz=?,sfkclk=?,sfkybgf=?,clkzdbl=?,ssk=?,clk=? ";
	ls_sql+=" where bgfjlh='"+bgfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,bfrq);
	ps.setString(2,bfjs);
	ps.setDouble(3,bfbl);
	ps.setDouble(4,bfje);
	ps.setDouble(5,yfgf);
	ps.setDouble(6,sjbk);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	ps.setString(11,sfkclk);
	ps.setString(12,sfkybgf);
	ps.setDouble(13,clkzdbl);
	ps.setDouble(14,ssk);
	ps.setDouble(15,clk);
	ps.executeUpdate();
	ps.close();


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