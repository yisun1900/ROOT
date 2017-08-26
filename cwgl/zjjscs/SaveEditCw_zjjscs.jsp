<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
String csbm=null;
String csmc=null;
double csz=0;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
csbm=cf.GB2Uni(request.getParameter("csbm"));
csmc=cf.GB2Uni(request.getParameter("csmc"));
ls=request.getParameter("csz");
try{
	if (!(ls.equals("")))  csz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量csz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[参数值]类型转换发生意外:"+e);
	return;
}
String wherefgsbh=null;
String wherecsbm=null;
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
wherecsbm=cf.GB2Uni(request.getParameter("wherecsbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_zjjscs set fgsbh=?,csbm=?,csmc=?,csz=? ";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (csbm='"+wherecsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,csbm);
	ps.setString(3,csmc);
	ps.setDouble(4,csz);
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