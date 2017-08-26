<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");

String khfwjlh=cf.GB2Uni(request.getParameter("khfwjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sbyybm=cf.GB2Uni(request.getParameter("sbyybm"));
String sbyyxs=cf.GB2Uni(request.getParameter("sbyyxs"));
String djr=cf.GB2Uni(request.getParameter("djr"));
String djbm=cf.GB2Uni(request.getParameter("djbm"));
java.sql.Date djsj=null;
String ls=null;
ls=request.getParameter("djsj");
try{
	if (!(ls.equals("")))  djsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[登记时间]类型转换发生意外:"+e);
	return;
}
String sbkhlx=cf.GB2Uni(request.getParameter("sbkhlx"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="update crm_zxkhxx set sjhfsbyybm=?,sjhfsbyyxs=?,sjhfsbsj=?,sjhfsbkhlx=? ";
	ls_sql+="  where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sbyybm);
	ps.setString(2,sbyyxs);
	ps.setDate(3,djsj);
	ps.setString(4,sbkhlx);
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
	out.print("Exception: " + ls_sql);
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