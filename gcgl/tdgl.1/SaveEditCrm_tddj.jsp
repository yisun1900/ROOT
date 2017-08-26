<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tdyybm=null;
String tdyysm=null;
double ytje=0;
double stje=0;
String bz=null;
tdyybm=cf.GB2Uni(request.getParameter("tdyybm"));
tdyysm=cf.GB2Uni(request.getParameter("tdyysm"));
ls=request.getParameter("ytje");
try{
	if (!(ls.equals("")))  ytje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ytje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应退金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("stje");
try{
	if (!(ls.equals("")))  stje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量stje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实退金额]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String sfthlp=cf.GB2Uni(request.getParameter("sfthlp"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

java.sql.Date tdsj=null;
ls=request.getParameter("tdsj");
try{
	if (!(ls.equals("")))  tdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[退单时间]类型转换发生意外:"+e);
	return;
}


String wheretdxh=null;
wheretdxh=cf.GB2Uni(request.getParameter("wheretdxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lrr=null;
	java.sql.Date lrsj=null;
	ls_sql="select lrr,lrsj";
	ls_sql+=" from  crm_tddj";
	ls_sql+=" where  (tdxh='"+wheretdxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=rs.getDate("lrsj");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);
	
	ls_sql="update crm_tddj set tdyybm=?,tdyysm=?,ytje=?,stje=?,bz=?,sfthlp=?,tdsj=? ";
	ls_sql+=" where  (tdxh='"+wheretdxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tdyybm);
	ps.setString(2,tdyysm);
	ps.setDouble(3,ytje);
	ps.setDouble(4,stje);
	ps.setString(5,bz);
	ps.setString(6,sfthlp);
	ps.setDate(7,tdsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set tdsj=? where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tdsj);
	ps.executeUpdate();
	ps.close();

	if (sfthlp.equals("Y"))//Y：退回；N：未退回
	{
		ls_sql="update yx_lqlpdj set shth='2',thdjr=?,thdjsj=? ";
		ls_sql+=" where shth='1' and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lrr);
		ps.setDate(2,lrsj);
		ps.executeUpdate();
		ps.close();
	}
	else if (sfthlp.equals("N"))//Y：退回；N：未退回
	{
		ls_sql="update yx_lqlpdj set shth='1',thdjr=null,thdjsj=null ";
		ls_sql+=" where shth='2' and khbh='"+khbh+"' and thdjr=? and thdjsj=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lrr);
		ps.setDate(2,lrsj);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改数据库成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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