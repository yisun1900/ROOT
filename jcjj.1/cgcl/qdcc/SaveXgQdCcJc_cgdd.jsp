<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cgsjs=cf.GB2Uni(request.getParameter("cgsjs"));
String jhccxgr=cf.GB2Uni(request.getParameter("jhccxgr"));
String jhccxgyy=cf.GB2Uni(request.getParameter("jhccxgyy"));
java.sql.Date jhccxgsj=null;
java.sql.Date jhccsj=null;
ls=request.getParameter("jhccxgsj");
try{
	if (!(ls.equals("")))  jhccxgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhccxgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhccxgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划初测测时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String oldclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("05"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	int count=0;
	String jlh=null;
	ls_sql="select NVL(max(substr(jlh,10,2)),0)";
	ls_sql+=" from  jc_cgsjslxjl";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jlh=ddbh+cf.addZero(count,2);

	conn.setAutoCommit(false);

	ls_sql="update jc_cgdd set jhccxgsj=?,jhccxgr=?,jhccxgyy=?,jhccsj=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='05'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhccxgsj);
	ps.setString(2,jhccxgr);
	ps.setString(3,jhccxgyy);
	ps.setDate(4,jhccsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgsjslxjl set jhclsj=?,lrr=?,lrsj=?,bz=?";
	ls_sql+=" where jlh='"+jlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhccsj);
	ps.setString(2,jhccxgr);
	ps.setDate(3,jhccxgsj);
	ps.setString(4,jhccxgyy);
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
	out.print("Exception: " + e);
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