<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gyfxsm=cf.GB2Uni(request.getParameter("gyfxsm"));
String gyfxr=cf.GB2Uni(request.getParameter("gyfxr"));
java.sql.Date gyfxsj=null;
ls=request.getParameter("gyfxsj");
try{
	if (!(ls.equals("")))  gyfxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rksj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工艺分析时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

double cghtze=0;
double wjhtze=0;
double dqhtze=0;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("21"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}


	ls_sql="update jc_cgdd set gyfxsj=?,gyfxr=?,gyfxsm=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='21'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,gyfxsj);
	ps.setString(2,gyfxr);
	ps.setString(3,gyfxsm);
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