<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String azsjbz=cf.GB2Uni(request.getParameter("azsjbz"));
String aztzr=cf.GB2Uni(request.getParameter("aztzr"));
java.sql.Date aztzsj=null;
ls=request.getParameter("aztzsj");
try{
	if (!(ls.equals("")))  aztzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量aztzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发安装通知时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String pdgc=null;
String khbh=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,khbh,pdgc";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		pdgc=rs.getString("pdgc");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("27"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}


	ls_sql="update jc_jjdd set aztzsj=?,aztzr=?,azsjbz=?,clzt='29'";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='27'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,aztzsj);
	ps.setString(2,aztzr);
	ps.setString(3,azsjbz);
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