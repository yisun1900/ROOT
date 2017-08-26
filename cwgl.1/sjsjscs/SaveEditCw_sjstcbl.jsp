<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xh=0;
String fdmc=null;
double qd=0;
double zd=0;
double tcbfb=0;
String qdlx=null;
String fgsbh=null;
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
fdmc=cf.GB2Uni(request.getParameter("fdmc"));
ls=request.getParameter("qd");
try{
	if (!(ls.equals("")))  qd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[起点（>）]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zd");
try{
	if (!(ls.equals("")))  zd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[终点（<=）]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tcbfb");
try{
	if (!(ls.equals("")))  tcbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提成百分比]类型转换发生意外:"+e);
	return;
}
qdlx=cf.GB2Uni(request.getParameter("qdlx"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_sjstcbl set xh=?,fdmc=?,qd=?,zd=?,tcbfb=?,qdlx=?,fgsbh=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,fdmc);
	ps.setDouble(3,qd);
	ps.setDouble(4,zd);
	ps.setDouble(5,tcbfb);
	ps.setString(6,qdlx);
	ps.setString(7,fgsbh);
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