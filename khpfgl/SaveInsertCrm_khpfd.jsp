<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pfjlh=null;
String tsjlh=null;
String khbh=null;
String pfyy=null;
String khpfdah=null;
double khpfze=0;
pfjlh=cf.GB2Uni(request.getParameter("pfjlh"));
tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
pfyy=cf.GB2Uni(request.getParameter("pfyy"));
khpfdah=cf.GB2Uni(request.getParameter("khpfdah"));
ls=request.getParameter("khpfze");
try{
	if (!(ls.equals("")))  khpfze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khpfze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赔付总额]类型转换发生意外:"+e);
	return;
}


String sfsgd=null;
String dwbh=null;
String ygbh=null;
String pff=null;
String sgd=null;
double zrbl=0;
double pfje=0;

java.sql.Date lrsj=null;
String lrr=null;
String lrbm=null;
String bz=null;
sfsgd=cf.GB2Uni(request.getParameter("sfsgd"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ygbh=cf.GB2Uni(request.getParameter("ygbh"));
pff=cf.GB2Uni(request.getParameter("pff"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
ls=request.getParameter("zrbl");
try{
	if (!(ls.equals("")))  zrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zrbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[责任比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pfje");
try{
	if (!(ls.equals("")))  pfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[pfje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赔付金额]类型转换发生意外:"+e);
	return;
}
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
lrr=cf.GB2Uni(request.getParameter("lrr"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yhmc";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pff=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_tsjl set sfpfkh='3',pfyy=?,khpfdah=?,khpfze=?";//1：不需赔付；2：发生赔付；3：录入赔付；4：已赔付
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pfyy);
	ps.setString(2,khpfdah);
	ps.setDouble(3,khpfze);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_khpfd ( pfjlh,tsjlh,khbh,sfsgd,dwbh,ygbh,pff,sgd,zrbl,pfje   ,lrr,lrsj,lrbm,bz,pfzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,'1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pfjlh);
	ps.setString(2,tsjlh);
	ps.setString(3,khbh);
	ps.setString(4,sfsgd);
	ps.setString(5,dwbh);
	ps.setString(6,ygbh);
	ps.setString(7,pff);
	ps.setString(8,sgd);
	ps.setDouble(9,zrbl);
	ps.setDouble(10,pfje);

	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.setString(13,lrbm);
	ps.setString(14,bz);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>