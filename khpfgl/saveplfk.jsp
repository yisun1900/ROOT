<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String dwbh=(String)session.getAttribute("dwbh");
String ls=null;
String tsjlh=null;
String khbh=null;
String pfzt=null;
String pfyy=null;
String xgdwbh=null;
double pfje=0;
String pfjecdf=null;
String zffs=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String shr=null;
java.sql.Date shsj=null;
String shrbm=null;
String zflrr=null;
java.sql.Date zfsj=null;
String zfrssbm=null;
zffs=cf.GB2Uni(request.getParameter("zffs"));
String tj=cf.GB2Uni(request.getParameter("tj"));

ls=request.getParameter("zfsj");
try{
	if (!(ls.equals("")))  zfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[支付时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_khpfd set zffs=?,zfsj=?,pfzt='3',zflrr='"+ygbh+"',zfrssbm='"+dwbh+"' ";
	ls_sql+=" where "+tj;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zffs);
	ps.setDate(2,zfsj);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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