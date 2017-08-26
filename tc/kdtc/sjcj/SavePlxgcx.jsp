<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));

String ls=null;

String sjsfycx=null;
double cxsjcj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjssj=null;

sjsfycx=request.getParameter("sjsfycx");
ls=request.getParameter("cxsjcj");
try{
	if (!(ls.equals("")))  cxsjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxsjcj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销升级差价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxkssj");
try{
	if (!(ls.equals("")))  cxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxjssj");
try{
	if (!(ls.equals("")))  cxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结束时间]类型转换发生意外:"+e);
	return;
}



//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //得到连接

	ls_sql="update tckd_tcsjcjb set sjsfycx=?,cxkssj=?,cxjssj=?,cxsjcj=? ";
	ls_sql+=" where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjsfycx);
	ps.setDate(2,cxkssj);
	ps.setDate(3,cxjssj);
	ps.setDouble(4,cxsjcj);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + ls_sql);
 }
 finally{
	try{
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
