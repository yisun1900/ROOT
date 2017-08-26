<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double spgckk=0;
double spsjsfy=0;
double spsgdfy=0;
double spzjfy=0;
double spgsfy=0;
double spqtfy=0;
String spr=null;
java.sql.Date spsj=null;
String spbz=null;
String spyj=null;
ls=request.getParameter("spgckk");
try{
	if (!(ls.equals("")))  spgckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spgckk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批后工程扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("spsjsfy");
try{
	if (!(ls.equals("")))  spsjsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spsjsfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批后设计师承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("spsgdfy");
try{
	if (!(ls.equals("")))  spsgdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spsgdfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批后施工队承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("spzjfy");
try{
	if (!(ls.equals("")))  spzjfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spzjfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批后质检承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("spgsfy");
try{
	if (!(ls.equals("")))  spgsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spgsfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批后公司承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("spqtfy");
try{
	if (!(ls.equals("")))  spqtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spqtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批后其它方承担费用]类型转换发生意外:"+e);
	return;
}
spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}
spbz=cf.GB2Uni(request.getParameter("spbz"));
spyj=cf.GB2Uni(request.getParameter("spyj"));
String wherekkjlh=null;
wherekkjlh=cf.GB2Uni(request.getParameter("wherekkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cw_gckkjl set spgckk=?,spsjsfy=?,spsgdfy=?,spzjfy=?,spgsfy=?,spqtfy=?,spr=?,spsj=?,spbz=?,spyj=? ";
	ls_sql+=" where  (kkjlh='"+wherekkjlh+"' and jsbz='N')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,spgckk);
	ps.setDouble(2,spsjsfy);
	ps.setDouble(3,spsgdfy);
	ps.setDouble(4,spzjfy);
	ps.setDouble(5,spgsfy);
	ps.setDouble(6,spqtfy);
	ps.setString(7,spr);
	ps.setDate(8,spsj);
	ps.setString(9,spbz);
	ps.setString(10,spyj);
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