<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long yjfy=0;
long yjcc=0;
String lrr=null;
java.sql.Date lrsj=null;
String fgsbh=null;
String bz=null;
String scbfzr=null;
String scbfzrdh=null;
long scbzrs=0;
String scbsffz=null;
long gjjzgwrs=0;
double ryydl=0;
String kfql=null;
String kfxs=null;
ls=request.getParameter("yjfy");
try{
	if (!(ls.equals("")))  yjfy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ�Ʒ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjcc");
try{
	if (!(ls.equals("")))  yjcc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjcc������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ�Ʋ���]����ת����������:"+e);
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
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
scbfzr=cf.GB2Uni(request.getParameter("scbfzr"));
scbfzrdh=cf.GB2Uni(request.getParameter("scbfzrdh"));
ls=request.getParameter("scbzrs");
try{
	if (!(ls.equals("")))  scbzrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scbzrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г���������]����ת����������:"+e);
	return;
}
scbsffz=cf.GB2Uni(request.getParameter("scbsffz"));
ls=request.getParameter("gjjzgwrs");
try{
	if (!(ls.equals("")))  gjjzgwrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gjjzgwrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�߼���װ��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("ryydl");
try{
	if (!(ls.equals("")))  ryydl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ryydl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ա�춯��]����ת����������:"+e);
	return;
}
kfql=cf.GB2Uni(request.getParameter("kfql"));
kfxs=cf.GB2Uni(request.getParameter("kfxs"));
String wherexqmc=null;
String wherefgsbh=null;
wherexqmc=cf.GB2Uni(request.getParameter("wherexqmc"));
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yx_xqcxhdgl set yjfy=?,yjcc=?,lrr=?,lrsj=?,fgsbh=?,bz=?,scbfzr=?,scbfzrdh=?,scbzrs=?,scbsffz=?,gjjzgwrs=?,ryydl=?,kfql=?,kfxs=? ";
	ls_sql+=" where  (xqmc='"+wherexqmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,yjfy);
	ps.setLong(2,yjcc);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,fgsbh);
	ps.setString(6,bz);
	ps.setString(7,scbfzr);
	ps.setString(8,scbfzrdh);
	ps.setLong(9,scbzrs);
	ps.setString(10,scbsffz);
	ps.setLong(11,gjjzgwrs);
	ps.setDouble(12,ryydl);
	ps.setString(13,kfql);
	ps.setString(14,kfxs);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>