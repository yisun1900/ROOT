<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xuhao=0;
String mc=null;
double qd=0;
double zd=0;
double bfb=0;
String fgsbh=null;
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xuhao不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
mc=cf.GB2Uni(request.getParameter("mc"));
ls=request.getParameter("qd");
try{
	if (!(ls.equals("")))  qd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[起点百分比（>=）]类型转换发生意外:"+e);
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
	out.println("<BR>[终点百分比（<）]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bfb");
try{
	if (!(ls.equals("")))  bfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处罚百分比]类型转换发生意外:"+e);
	return;
}
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_jxkkbl ( xuhao,mc,qd,zd,bfb,fgsbh ) ";
	ls_sql+=" values ( ?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xuhao);
	ps.setString(2,mc);
	ps.setDouble(3,qd);
	ps.setDouble(4,zd);
	ps.setDouble(5,bfb);
	ps.setString(6,fgsbh);
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