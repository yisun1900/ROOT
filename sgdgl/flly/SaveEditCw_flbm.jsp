<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String flbm=null;
String flmc=null;
double dj=0;
flbm=cf.GB2Uni(request.getParameter("flbm"));
flmc=cf.GB2Uni(request.getParameter("flmc"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
String lx=cf.GB2Uni(request.getParameter("lx"));
String jldw=cf.GB2Uni(request.getParameter("jldw"));

String whereflbm=null;
whereflbm=cf.GB2Uni(request.getParameter("whereflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_flbm set flmc=?,dj=?,lx=?,jldw=? ";
	ls_sql+=" where  (flbm='"+whereflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,flmc);
	ps.setDouble(2,dj);
	ps.setString(3,lx);
	ps.setString(4,jldw);
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