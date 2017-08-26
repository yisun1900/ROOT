<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String zt=null;
String sbyybm=null;
String sbyysm=null;
String sbdjr=null;
java.sql.Date sbdjsj=null;

zt=cf.GB2Uni(request.getParameter("zt"));
sbyybm=cf.GB2Uni(request.getParameter("sbyybm"));
sbyysm=cf.GB2Uni(request.getParameter("sbyysm"));
sbdjr=cf.GB2Uni(request.getParameter("sbdjr"));
ls=request.getParameter("sbdjsj");
try{
	if (!(ls.equals("")))  sbdjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sbdjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[失败登记时间]类型转换发生意外:"+e);
	return;
}

String scbkhbh=cf.GB2Uni(request.getParameter("scbkhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_scbkhxx set zt=?,sbyybm=?,sbyysm=?,sbdjr=?,sbdjsj=? ";
	ls_sql+=" where  scbkhbh='"+scbkhbh+"' and zt='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zt);
	ps.setString(2,sbyybm);
	ps.setString(3,sbyysm);
	ps.setString(4,sbdjr);
	ps.setDate(5,sbdjsj);
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