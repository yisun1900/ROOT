<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String ddqrr=cf.GB2Uni(request.getParameter("ddqrr"));

java.sql.Date ddqrsj=null;
ls=request.getParameter("ddqrsj");
try{
	if (!(ls.equals("")))  ddqrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ddqrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单确认时间]类型转换发生意外:"+e);
	return;
}
String ddshbz=null;
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));
java.sql.Date htshsj=null;
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同送货时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String yclzt="";
	String ddlx="";
	ls_sql =" select clzt,ddlx";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yclzt=cf.fillNull(rs.getString("clzt"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
	}
	rs.close();
	ps.close();

	if (!yclzt.equals("09") && !yclzt.equals("99"))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}

	String clzt="";
	if (ddlx.equals("E") || ddlx.equals("9") || ddlx.equals("C"))//E：散客
	{
		clzt="30";
	}
	else{
		clzt="11";
	}

	if (yclzt.equals("09"))
	{
		ls_sql="update jc_zcdd set ddqrr=?,ddqrsj=SYSDATE,ddshbz=?,htshsj=?,jhshsj=?,clzt=?";
		ls_sql+=" where ddbh='"+ddbh+"' and  clzt='09' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddqrr);
		ps.setString(2,ddshbz);
		ps.setDate(3,htshsj);
		ps.setDate(4,htshsj);
		ps.setString(5,clzt);
		ps.executeUpdate();
		ps.close();
	}
	else if (yclzt.equals("99"))
	{
		ls_sql="update jc_zcdd set ddqrr=?,ddqrsj=SYSDATE,ddshbz=?,htshsj=?,jhshsj=?,tdqrbz='Y'";
		ls_sql+=" where ddbh='"+ddbh+"' and  clzt='99' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddqrr);
		ps.setString(2,ddshbz);
		ps.setDate(3,htshsj);
		ps.setDate(4,htshsj);
		ps.executeUpdate();
		ps.close();
	}


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
	out.print("Exception: " + e);
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