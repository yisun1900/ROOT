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

pfjlh=cf.GB2Uni(request.getParameter("pfjlh"));
tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));


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

	String pfzt="";
	ls_sql="select pfzt";
	ls_sql+=" from crm_khpfd";
	ls_sql+=" where pfjlh='"+pfjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pfzt=cf.fillNull(rs.getString("pfzt"));
	}
	rs.close();
	ps.close();

	if (!pfzt.equals("1"))//1：未审核；2：审核；3：已付款
	{
		out.println("错误！状态不正确");
		return;
	}


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


	ls_sql="update crm_khpfd set sfsgd=?,dwbh=?,ygbh=?,pff=?,sgd=?,zrbl=?,pfje=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where pfjlh='"+pfjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfsgd);
	ps.setString(2,dwbh);
	ps.setString(3,ygbh);
	ps.setString(4,pff);
	ps.setString(5,sgd);
	ps.setDouble(6,zrbl);
	ps.setDouble(7,pfje);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,lrbm);
	ps.setString(11,bz);
	ps.executeUpdate();
	ps.close();


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
	out.print("<BR>存盘失败,发生意外: " + e);
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