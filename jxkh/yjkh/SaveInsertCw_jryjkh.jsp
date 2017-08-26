<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khzq=null;
java.sql.Date khqssj=null;
java.sql.Date khjzsj=null;
String fgsbh=null;
String dwbh=null;
String yhmc=null;
String zw=null;
double byrw=0;
long byqds=0;
double byyj=0;
double dzkhbl=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
khzq=cf.GB2Uni(request.getParameter("khzq"));
ls=request.getParameter("khqssj");
try{
	if (!(ls.equals("")))  khqssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khqssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjzsj");
try{
	if (!(ls.equals("")))  khjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khjzsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˽���ʱ��]����ת����������:"+e);
	return;
}
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
zw=cf.GB2Uni(request.getParameter("zw"));
ls=request.getParameter("byrw");
try{
	if (!(ls.equals("")))  byrw=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[byrw]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("byqds");
try{
	if (!(ls.equals("")))  byqds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����byqds������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ǩ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("byyj");
try{
	if (!(ls.equals("")))  byyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[byyj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dzkhbl");
try{
	if (!(ls.equals("")))  dzkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dzkhbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˱���]����ת����������:"+e);
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
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_jryjkh ( khzq,khqssj,khjzsj,fgsbh,dwbh,yhmc,zw,byrw,byqds,byyj,dzkhbl,lrr,lrsj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khzq);
	ps.setDate(2,khqssj);
	ps.setDate(3,khjzsj);
	ps.setString(4,fgsbh);
	ps.setString(5,dwbh);
	ps.setString(6,yhmc);
	ps.setString(7,zw);
	ps.setDouble(8,byrw);
	ps.setLong(9,byqds);
	ps.setDouble(10,byyj);
	ps.setDouble(11,dzkhbl);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,bz);
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>