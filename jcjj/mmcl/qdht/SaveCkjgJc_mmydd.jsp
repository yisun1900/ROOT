<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String htbz=cf.GB2Uni(request.getParameter("htbz"));
double mmhtje=0;
ls=request.getParameter("mmhtje");
try{
	if (!(ls.equals("")))  mmhtje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mmhtje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[木门合同金额]类型转换发生意外:"+e);
	return;
}
double wjhtje=0;
ls=request.getParameter("wjhtje");
try{
	if (!(ls.equals("")))  wjhtje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjhtje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金合同总额]类型转换发生意外:"+e);
	return;
}
double blhtje=0;
ls=request.getParameter("blhtje");
try{
	if (!(ls.equals("")))  blhtje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量blhtje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[玻璃合同金额]类型转换发生意外:"+e);
	return;
}
double htje=0;
ls=request.getParameter("htje");
try{
	if (!(ls.equals("")))  htje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同总额]类型转换发生意外:"+e);
	return;
}
double fwf=0;
ls=request.getParameter("fwf");
try{
	if (!(ls.equals("")))  fwf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[服务费]类型转换发生意外:"+e);
	return;
}
double wdzje=0;
ls=request.getParameter("wdzje");
try{
	if (!(ls.equals("")))  wdzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实收金额]类型转换发生意外:"+e);
	return;
}

String yddbh=request.getParameter("yddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("04"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}


	ls_sql="update jc_mmydd set htbz=?,mmhtje=?,wjhtje=?,blhtje=?,htje=?,fwf=?,wdzje=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='04'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,htbz);
	ps.setDouble(2,mmhtje);
	ps.setDouble(3,wjhtje);
	ps.setDouble(4,blhtje);
	ps.setDouble(5,htje);
	ps.setDouble(6,fwf);
	ps.setDouble(7,wdzje);
	ps.executeUpdate();
	ps.close();
	
	//集成订单
	ls_sql="update jc_jcdd set je=?";
	ls_sql+=" where gjz='"+yddbh+"' and lx='1' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,htje);
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
	out.print("Exception: " + e);
	return;
}
finally 
{
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