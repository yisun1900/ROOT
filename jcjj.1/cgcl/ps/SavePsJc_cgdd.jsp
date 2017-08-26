<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pslrr=cf.GB2Uni(request.getParameter("pslrr"));
java.sql.Date pslrsj=null;
ls=request.getParameter("pslrsj");
try{
	if (!(ls.equals("")))  pslrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ksazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配送录入时间]类型转换发生意外:"+e);
	return;
}
String pssm=cf.GB2Uni(request.getParameter("pssm"));

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
	if (!oldclzt.equals("27") && !oldclzt.equals("29"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}


	ls_sql="update jc_cgdd set pslrsj=?,pslrr=?,pssm=?,lsclzt3=?,clzt='30'";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt in('27','29')";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,pslrsj);
	ps.setString(2,pslrr);
	ps.setString(3,pssm);
	ps.setString(4,oldclzt);
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