<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zrr=null;
long jddf=0;
long jdsyts=0;
java.sql.Date sjkssj=null;
java.sql.Date sjjssj=null;
long sjgzr=0;
String ysr=null;
java.sql.Date yssj=null;
String ysjl=null;
String yssm=null;
String sfyq=null;
long yqts=0;
String yqzrf=null;
String sfybgd=null;
String zgfa=null;
java.sql.Date yjzgwcsj=null;
String zgsfwc=null;
java.sql.Date zgwcsj=null;
String sjzgqk=null;
String sfyfbd=null;
String fbsfwc=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
zrr=cf.GB2Uni(request.getParameter("zrr"));
ls=request.getParameter("jddf");
try{
	if (!(ls.equals("")))  jddf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jddf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ڵ�÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("jdsyts");
try{
	if (!(ls.equals("")))  jdsyts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jdsyts]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ڵ�˳������]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjkssj");
try{
	if (!(ls.equals("")))  sjkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjkssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʿ�ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjjssj");
try{
	if (!(ls.equals("")))  sjjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjjssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʽ���ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjgzr");
try{
	if (!(ls.equals("")))  sjgzr=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjgzr]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʹ�����]����ת����������:"+e);
	return;
}
ysr=cf.GB2Uni(request.getParameter("ysr"));
ls=request.getParameter("yssj");
try{
	if (!(ls.equals("")))  yssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
ysjl=cf.GB2Uni(request.getParameter("ysjl"));
yssm=cf.GB2Uni(request.getParameter("yssm"));
sfyq=cf.GB2Uni(request.getParameter("sfyq"));
ls=request.getParameter("yqts");
try{
	if (!(ls.equals("")))  yqts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yqts]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
yqzrf=cf.GB2Uni(request.getParameter("yqzrf"));
sfybgd=cf.GB2Uni(request.getParameter("sfybgd"));
zgfa=cf.GB2Uni(request.getParameter("zgfa"));
ls=request.getParameter("yjzgwcsj");
try{
	if (!(ls.equals("")))  yjzgwcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjzgwcsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ���������ʱ��]����ת����������:"+e);
	return;
}
zgsfwc=cf.GB2Uni(request.getParameter("zgsfwc"));
ls=request.getParameter("zgwcsj");
try{
	if (!(ls.equals("")))  zgwcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zgwcsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʱ��]����ת����������:"+e);
	return;
}
sjzgqk=cf.GB2Uni(request.getParameter("sjzgqk"));
sfyfbd=cf.GB2Uni(request.getParameter("sfyfbd"));
fbsfwc=cf.GB2Uni(request.getParameter("fbsfwc"));
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
String wherekhbh=null;
String whererwbm=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
whererwbm=cf.GB2Uni(request.getParameter("whererwbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_xmrwgl set zrr=?,jddf=?,jdsyts=?,sjkssj=?,sjjssj=?,sjgzr=?,ysr=?,yssj=?,ysjl=?,yssm=?,sfyq=?,yqts=?,yqzrf=?,sfybgd=?,zgfa=?,yjzgwcsj=?,zgsfwc=?,zgwcsj=?,sjzgqk=?,sfyfbd=?,fbsfwc=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zrr);
	ps.setLong(2,jddf);
	ps.setLong(3,jdsyts);
	ps.setDate(4,sjkssj);
	ps.setDate(5,sjjssj);
	ps.setLong(6,sjgzr);
	ps.setString(7,ysr);
	ps.setDate(8,yssj);
	ps.setString(9,ysjl);
	ps.setString(10,yssm);
	ps.setString(11,sfyq);
	ps.setLong(12,yqts);
	ps.setString(13,yqzrf);
	ps.setString(14,sfybgd);
	ps.setString(15,zgfa);
	ps.setDate(16,yjzgwcsj);
	ps.setString(17,zgsfwc);
	ps.setDate(18,zgwcsj);
	ps.setString(19,sjzgqk);
	ps.setString(20,sfyfbd);
	ps.setString(21,fbsfwc);
	ps.setString(22,lrr);
	ps.setDate(23,lrsj);
	ps.setString(24,lrbm);
	ps.setString(25,bz);
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