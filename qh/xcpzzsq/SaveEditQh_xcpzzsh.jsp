<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
java.sql.Date sqsj=null;
String zznr=null;
long sl=0;
String gg=null;
String xs=null;
String wznr=null;
String ysyq=null;
String qtyq=null;
String scwjm=null;
java.sql.Date wcsj=null;
String zgbmjlyj=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("sqsj");
try{
	if (!(ls.equals("")))  sqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请时间]类型转换发生意外:"+e);
	return;
}
zznr=cf.GB2Uni(request.getParameter("zznr"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
gg=cf.GB2Uni(request.getParameter("gg"));
xs=cf.GB2Uni(request.getParameter("xs"));
wznr=cf.GB2Uni(request.getParameter("wznr"));
ysyq=cf.GB2Uni(request.getParameter("ysyq"));
qtyq=cf.GB2Uni(request.getParameter("qtyq"));
scwjm=cf.GB2Uni(request.getParameter("scwjm"));
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

zgbmjlyj=cf.GB2Uni(request.getParameter("zgbmjlyj"));
String whereshbbh=null;
whereshbbh=cf.GB2Uni(request.getParameter("whereshbbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update qh_xcpzzsh set dwbh=?,sqsj=?,zznr=?,sl=?,gg=?,xs=?,wznr=?,ysyq=?,qtyq=?,wcsj=?,zgbmjlyj=?,scwjm=? ";
	ls_sql+=" where  (shbbh='"+whereshbbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setDate(2,sqsj);
	ps.setString(3,zznr);
	ps.setLong(4,sl);
	ps.setString(5,gg);
	ps.setString(6,xs);
	ps.setString(7,wznr);
	ps.setString(8,ysyq);
	ps.setString(9,qtyq);
	ps.setDate(10,wcsj);
	ps.setString(11,zgbmjlyj);
	ps.setString(12,scwjm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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