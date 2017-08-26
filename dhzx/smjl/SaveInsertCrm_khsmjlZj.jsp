<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jlh=null;
String khbh=null;
java.sql.Date smsj=null;
String smmd=null;
long jdrbh=0;
String jdrbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
jlh=cf.GB2Uni(request.getParameter("jlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
String lfcs=request.getParameter("lfcs");
ls=request.getParameter("smsj");
try{
	if (!(ls.equals("")))  smsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[smsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上门时间]类型转换发生意外:"+e);
	return;
}
smmd=cf.GB2Uni(request.getParameter("smmd"));
ls=request.getParameter("jdrbh");
try{
	if (!(ls.equals("")))  jdrbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jdrbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[接待人编号]类型转换发生意外:"+e);
	return;
}
jdrbm=cf.GB2Uni(request.getParameter("jdrbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String sjjdqk=cf.GB2Uni(request.getParameter("sjjdqk"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jdr=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+jdrbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jdr=rs.getString(1);
	}
	rs.close();
	ps.close();
	
	conn.setAutoCommit(false);

	ls_sql="insert into crm_khsmjl ( jlh,khbh,smsj,smmd,jdr,jdrbh,jdrbm,lrr,lrsj,lrbm,ssfgs,bz,zt,lfcs,sfhf,sjjdqk ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,SYSDATE,?,?,?,'2',?,'N',?) ";//1：未录结果；2：已录结果；3：已审核
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jlh);
	ps.setString(2,khbh);
	ps.setDate(3,smsj);
	ps.setString(4,smmd);
	ps.setString(5,jdr);
	ps.setLong(6,jdrbh);
	ps.setString(7,jdrbm);
	ps.setString(8,lrr);
	ps.setString(9,lrbm);
	ps.setString(10,ssfgs);
	ps.setString(11,bz);
	ps.setString(12,lfcs);
	ps.setString(13,sjjdqk);
	ps.executeUpdate();
	ps.close();

	java.sql.Date scsmsj=null;//首次上门时间
	ls_sql="select min(smsj)";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scsmsj=rs.getDate(1);
	}
	rs.close();
	ps.close();
		
	ls_sql =" update crm_zxkhxx set smcs='"+lfcs+"',scsmsj=?,zjsmsj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,scsmsj);
	ps.setDate(2,smsj);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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