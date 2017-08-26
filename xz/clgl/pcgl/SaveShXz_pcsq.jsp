<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clzt=null;
String qcph=null;
String pzr=null;
java.sql.Date pzsj=null;
String sjxm=null;
clzt=cf.GB2Uni(request.getParameter("clzt"));
qcph=cf.GB2Uni(request.getParameter("qcph"));
pzr=cf.GB2Uni(request.getParameter("pzr"));
ls=request.getParameter("pzsj");
try{
	if (!(ls.equals("")))  pzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派车时间]类型转换发生意外:"+e);
	return;
}
sjxm=cf.GB2Uni(request.getParameter("sjxm"));
String bz=cf.GB2Uni(request.getParameter("bz"));
int gls=0;
ls=request.getParameter("gls");
try{
	if (!(ls.equals("")))  gls=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量公里数不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公里数]类型转换发生意外:"+e);
	return;
}

String wheresqxh=null;
wheresqxh=cf.GB2Uni(request.getParameter("wheresqxh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update xz_pcsq set clzt=?,qcph=?,pzr=?,pzsj=?,sjxm=?,bz=?,gls=? ";
	ls_sql+=" where  (sqxh="+wheresqxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,qcph);
	ps.setString(3,pzr);
	ps.setDate(4,pzsj);
	ps.setString(5,sjxm);
	ps.setString(6,bz);
	ps.setDouble(7,gls);
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
	out.print("存盘失败,发生意外: " + ls_sql);
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