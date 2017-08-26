<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ycyybm=cf.GB2Uni(request.getParameter("ycyybm"));
String clzt=cf.GB2Uni(request.getParameter("clzt"));

String azsm=cf.GB2Uni(request.getParameter("azsm"));
String azr=cf.GB2Uni(request.getParameter("azr"));
java.sql.Date ksazsj=null;
ls=request.getParameter("ksazsj");
try{
	if (!(ls.equals("")))  ksazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ksazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[安装开始时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date sazrq=null;
ls=request.getParameter("sazrq");
try{
	if (!(ls.equals("")))  sazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sazrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[安装完成时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

String ycclzt=null;
if (!ycyybm.equals(""))
{
	ycclzt="1";
}
else{
	ycclzt="0";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String oldclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("27") && !oldclzt.equals("29"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}


	ls_sql="update jc_jjdd set ksazsj=?,sazrq=?,azr=?,azsm=?,ycyybm=?,clzt=?,lsclzt3=?,ycclzt=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt in('27','29')";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,ksazsj);
	ps.setDate(2,sazrq);
	ps.setString(3,azr);
	ps.setString(4,azsm);
	ps.setString(5,ycyybm);
	ps.setString(6,clzt);
	ps.setString(7,oldclzt);
	ps.setString(8,ycclzt);
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