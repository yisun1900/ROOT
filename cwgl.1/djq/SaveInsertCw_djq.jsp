<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
String djqmc=null;
double djqcdbl=0;
String bz=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
djqmc=cf.GB2Uni(request.getParameter("djqmc"));
ls=request.getParameter("djqcdbl");
try{
	if (!(ls.equals("")))  djqcdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[djqcdbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[代金券厂家承担比例]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_djq ( fgsbh,djqmc,djqcdbl,bz ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,djqmc);
	ps.setDouble(3,djqcdbl);
	ps.setString(4,bz);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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