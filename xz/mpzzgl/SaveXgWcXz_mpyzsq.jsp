<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
int wcsl=0;
double dj=0;
java.sql.Date wcsj=null;
String bz=null;
String mpbb=null;
bz=cf.GB2Uni(request.getParameter("bz"));
mpbb=cf.GB2Uni(request.getParameter("mpbb"));

ls=request.getParameter("wcsl");
try{
	if (!(ls.equals("")))  wcsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wcsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wcsj");
try{
	if (!(ls.equals("")))  wcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成时间]类型转换发生意外:"+e);
	return;
}

String wheresqxh=null;
wheresqxh=cf.GB2Uni(request.getParameter("wheresqxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_mpyzsq set wcsl=?,wcsj=?,bz=?,wclrr=?,mpbb=?,dj=?,sfywc='Y'";
	ls_sql+=" where  sqxh='"+wheresqxh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,wcsl);
	ps.setDate(2,wcsj);
	ps.setString(3,bz);
	ps.setString(4,yhmc);
	ps.setString(5,mpbb);
	ps.setDouble(6,dj);
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

