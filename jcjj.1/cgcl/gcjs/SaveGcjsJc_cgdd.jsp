<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcjsbz=cf.GB2Uni(request.getParameter("gcjsbz"));
String gcjsr=cf.GB2Uni(request.getParameter("gcjsr"));
java.sql.Date gcjssj=null;
ls=request.getParameter("gcjssj");
try{
	if (!(ls.equals("")))  gcjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工厂接收时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String sfpsjs=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,sfpsjs";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		sfpsjs=rs.getString("sfpsjs");
	}
	rs.close();
	ps.close();


	if (!clzt.equals("17"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}



	ls_sql="update jc_cgdd set gcjssj=?,gcjsr=?,gcjsbz=?,lsclzt2=?,clzt='19'";
	ls_sql+=" where  ddbh='"+ddbh+"'";
    ls_sql+=" and jc_cgdd.clzt='17' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,gcjssj);
	ps.setString(2,gcjsr);
	ps.setString(3,gcjsbz);
	ps.setString(4,clzt);
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