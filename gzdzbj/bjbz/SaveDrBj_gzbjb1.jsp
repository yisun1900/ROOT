<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dybjjb=(String)session.getAttribute("bjjb");

String ls=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double bj=0;
double bbj=0;
double cbj=0;
int xh=0;
String gycl=null;
String bgycl=null;
String cgycl=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));

if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
{
	ls=request.getParameter("bj");
	try{
		if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����bj������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[��ͨ����]����ת����������:"+e);
		return;
	}
	gycl=cf.GB2Uni(request.getParameter("gycl"));
}
if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
{
	ls=request.getParameter("bbj");
	try{
		if (!(ls.equals("")))  bbj=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����bbj������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[��Ʒ����]����ת����������:"+e);
		return;
	}
	bgycl=cf.GB2Uni(request.getParameter("bgycl"));
}
if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
{
	ls=request.getParameter("cbj");
	try{
		if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����cbj������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[�ֻ�÷������]����ת����������:"+e);
		return;
	}
	cgycl=cf.GB2Uni(request.getParameter("cgycl"));
}

ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xh������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}

String bjlx=cf.GB2Uni(request.getParameter("bjlx"));
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String shbz=cf.GB2Uni(request.getParameter("shbz"));
java.sql.Date lrsj=null;
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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int wybh=0;
int count=0;
try {
	conn=cf.getConnection();


	ls_sql="select NVL(max(TO_NUMBER(wybh)),0)";
	ls_sql+=" from  bj_gzbjb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wybh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	wybh++;

	ls_sql="select count(*)";
	ls_sql+=" from  bj_gzbjb";
	ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("������Ŀ����Ѵ���");
		return;
	}

	ls_sql="insert into bj_gzbjb ( dqbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bj,gycl,bbj,bgycl,cbj,cgycl,xh,wybh,bjlx,lrr,lrsj,shbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,xmbh);
	ps.setString(3,xmmc);
	ps.setString(4,xmdlbm);
	ps.setString(5,xmxlbm);
	ps.setString(6,smbm);
	ps.setString(7,jldwbm);
	ps.setDouble(8,bj);
	ps.setString(9,gycl);
	ps.setDouble(10,bbj);
	ps.setString(11,bgycl);
	ps.setDouble(12,cbj);
	ps.setString(13,cgycl);
	ps.setInt(14,xh);
	ps.setInt(15,wybh);
	ps.setString(16,bjlx);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,shbz);
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
	out.print("����ʧ��,��������: " + e);
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