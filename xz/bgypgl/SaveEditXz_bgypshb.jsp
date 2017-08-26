<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
java.sql.Date sqrq=null;
String sqr=null;
String bgypbh=null;
long sqsl=0;
long syjcsl=0;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
sqr=cf.GB2Uni(request.getParameter("sqr"));
bgypbh=cf.GB2Uni(request.getParameter("bgypbh"));
ls=request.getParameter("sqsl");
try{
	if (!(ls.equals("")))  sqsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("syjcsl");
try{
	if (!(ls.equals("")))  syjcsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量syjcsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上月结存数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wheresqxh=null;
wheresqxh=cf.GB2Uni(request.getParameter("wheresqxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_bgypshb set dwbh=?,sqrq=?,sqr=?,bgypbh=?,sqsl=?,syjcsl=?,bz=? ";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setDate(2,sqrq);
	ps.setString(3,sqr);
	ps.setString(4,bgypbh);
	ps.setLong(5,sqsl);
	ps.setLong(6,syjcsl);
	ps.setString(7,bz);
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