<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pfxmbm=null;
String pfxmmc=null;
long fz=0;
String kpdlbm=null;
pfxmbm=cf.GB2Uni(request.getParameter("pfxmbm"));
pfxmmc=cf.GB2Uni(request.getParameter("pfxmmc"));
ls=request.getParameter("fz");
try{
	if (!(ls.equals("")))  fz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[分值]类型转换发生意外:"+e);
	return;
}
kpdlbm=cf.GB2Uni(request.getParameter("kpdlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into kp_pfxmbm ( pfxmbm,pfxmmc,fz,kpdlbm ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pfxmbm);
	ps.setString(2,pfxmmc);
	ps.setLong(3,fz);
	ps.setString(4,kpdlbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>