<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String cpflbm=null;
String cplx=null;
String cpazlx=null;
String ghf=null;
String jgpp=null;
java.sql.Date ghfhzsj=null;
String sfxdd=null;
String sfxhxgl=null;
String zxsfwz=null;
String cpsjs=null;
String sfxtx=null;
java.sql.Date txrq=null;
long txxs=0;
String txnr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
cplx=cf.GB2Uni(request.getParameter("cplx"));
cpazlx=cf.GB2Uni(request.getParameter("cpazlx"));
ghf=cf.GB2Uni(request.getParameter("ghf"));
jgpp=cf.GB2Uni(request.getParameter("jgpp"));
ls=request.getParameter("ghfhzsj");
try{
	if (!(ls.equals("")))  ghfhzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ghfhzsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������֪ʱ��]����ת����������:"+e);
	return;
}
sfxdd=cf.GB2Uni(request.getParameter("sfxdd"));
sfxhxgl=cf.GB2Uni(request.getParameter("sfxhxgl"));
zxsfwz=cf.GB2Uni(request.getParameter("zxsfwz"));
cpsjs=cf.GB2Uni(request.getParameter("cpsjs"));
sfxtx=cf.GB2Uni(request.getParameter("sfxtx"));
ls=request.getParameter("txrq");
try{
	if (!(ls.equals("")))  txrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[txrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("txxs");
try{
	if (!(ls.equals("")))  txxs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����txxs������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Сʱ]����ת����������:"+e);
	return;
}
txnr=cf.GB2Uni(request.getParameter("txnr"));
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

java.sql.Date zwyjcrq=null;
java.sql.Date jhrksj=null;
java.sql.Date jhshsj=null;
java.sql.Date jhazsj=null;
ls=request.getParameter("zwyjcrq");
try{
	if (!(ls.equals("")))  zwyjcrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zwyjcrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ӧ��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhrksj");
try{
	if (!(ls.equals("")))  jhrksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhrksj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhshsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ��ͻ�ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhazsj");
try{
	if (!(ls.equals("")))  jhazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhazsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���װʱ��]����ת����������:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into crm_cpgzjl ( khbh,cpflbm,cplx,cpazlx,ghf,jgpp,ghfhzsj,sfxdd,sfxhxgl,zxsfwz   ,cpsjs,sfxtx,txrq,txxs,txnr,ztfssj,lrr,lrsj,lrbm,bz  ,zwyjcrq,jhrksj,jhshsj,jhazsj    ,sfxfb,sfyyc,cpztbm) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?    ,'N','N','01') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,cpflbm);
	ps.setString(3,cplx);
	ps.setString(4,cpazlx);
	ps.setString(5,ghf);
	ps.setString(6,jgpp);
	ps.setDate(7,ghfhzsj);
	ps.setString(8,sfxdd);
	ps.setString(9,sfxhxgl);
	ps.setString(10,zxsfwz);

	ps.setString(11,cpsjs);
	ps.setString(12,sfxtx);
	ps.setDate(13,txrq);
	ps.setLong(14,txxs);
	ps.setString(15,txnr);
	ps.setDate(16,lrsj);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,lrbm);
	ps.setString(20,bz);

	ps.setDate(21,zwyjcrq);
	ps.setDate(22,jhrksj);
	ps.setDate(23,jhshsj);
	ps.setDate(24,jhazsj);
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