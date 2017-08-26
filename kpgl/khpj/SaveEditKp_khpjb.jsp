<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sgzl=null;
String gcjd=null;
String wmsgcd=null;
String ctfw=null;
String pscl=null;
String dmcl=null;
String sjxg=null;
String sjfw=null;
String jlfw=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
sgzl=cf.GB2Uni(request.getParameter("sgzl"));
gcjd=cf.GB2Uni(request.getParameter("gcjd"));
wmsgcd=cf.GB2Uni(request.getParameter("wmsgcd"));
ctfw=cf.GB2Uni(request.getParameter("ctfw"));
pscl=cf.GB2Uni(request.getParameter("pscl"));
dmcl=cf.GB2Uni(request.getParameter("dmcl"));
sjxg=cf.GB2Uni(request.getParameter("sjxg"));
sjfw=cf.GB2Uni(request.getParameter("sjfw"));
jlfw=cf.GB2Uni(request.getParameter("jlfw"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_khpjb set khbh=?,sgzl=?,gcjd=?,wmsgcd=?,ctfw=?,pscl=?,dmcl=?,sjxg=?,sjfw=?,jlfw=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sgzl);
	ps.setString(3,gcjd);
	ps.setString(4,wmsgcd);
	ps.setString(5,ctfw);
	ps.setString(6,pscl);
	ps.setString(7,dmcl);
	ps.setString(8,sjxg);
	ps.setString(9,sjfw);
	ps.setString(10,jlfw);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.setString(13,bz);
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
	out.print("Exception: " + e);
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