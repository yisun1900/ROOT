<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jfjlh=null;
String khbh=null;
String xmjfr=null;
java.sql.Date xmjfsj=null;
String xmjfsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
jfjlh=cf.GB2Uni(request.getParameter("jfjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
xmjfr=cf.GB2Uni(request.getParameter("xmjfr"));
ls=request.getParameter("xmjfsj");
try{
	if (!(ls.equals("")))  xmjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xmjfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交付时间]类型转换发生意外:"+e);
	return;
}
xmjfsm=cf.GB2Uni(request.getParameter("xmjfsm"));
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getxmjfzt=null;
	ls_sql="select xmjfzt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getxmjfzt=cf.fillNull(rs.getString("xmjfzt"));
	}
	rs.close();
	ps.close();

	//N：未交付；S：预交付；Y：回访成功；X：失败未处理；T：失败已处理；W：项目交付
	if (!getxmjfzt.equals("Y"))
	{
		out.println("错误！状态不正确");
		return;
	}

	String clzt="W";//N：未交付；S：预交付；Y：回访成功；X：回访失败；C：失败已处理；W：项目交付

	conn.setAutoCommit(false);
	
	ls_sql="insert into crm_xmjfjl ( jfjlh,khbh,xmjfr,xmjfsj,xmjfsm,lrr,lrsj,lrbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jfjlh);
	ps.setString(2,khbh);
	ps.setString(3,xmjfr);
	ps.setDate(4,xmjfsj);
	ps.setString(5,xmjfsm);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="update crm_khxx set xmjfzt=?,sjwjrq=?,gcjdbm='5' ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setDate(2,xmjfsj);
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