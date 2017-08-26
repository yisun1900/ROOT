<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String spr=null;
java.sql.Date spsj=null;
String spyj=null;
String clzt=null;
spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[spsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}
spyj=cf.GB2Uni(request.getParameter("spyj"));
clzt=cf.GB2Uni(request.getParameter("clzt"));

String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	String khjsclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  cw_khjsty";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjsclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!khjsclzt.equals("1"))//1：未审批；2：审批同意；3：审批不同意 
	{
		out.println("错误！客户已审核");
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="update crm_khxx set khjsbz=?";//N：未结算；Y：已结算；2：审批同意；3：审批不同意
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.executeUpdate();
	ps.close();


	ls_sql="update cw_khjsty set  spr=?,spsj=?,spyj=?,clzt=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,spr);
	ps.setDate(2,spsj);
	ps.setString(3,spyj);
	ps.setString(4,clzt);
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
	out.print("<BR>出错:" + e);
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