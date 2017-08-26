<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String htbz=cf.GB2Uni(request.getParameter("htbz"));
double htze=0;
ls=request.getParameter("htze");
try{
	if (!(ls.equals("")))  htze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同总额]类型转换发生意外:"+e);
	return;
}
double zsje=0;
ls=request.getParameter("zsje");
try{
	if (!(ls.equals("")))  zsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠送金额]类型转换发生意外:"+e);
	return;
}
double ssje=0;
ls=request.getParameter("ssje");
try{
	if (!(ls.equals("")))  ssje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ssje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实收金额]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("05"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}


	ls_sql="update jc_jjdd set htbz=?,htze=?,zsje=?,ssje=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='05'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,htbz);
	ps.setDouble(2,htze);
	ps.setDouble(3,zsje);
	ps.setDouble(4,ssje);
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