<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String zjy=null;
java.sql.Date jgrq=null;
String hth=null;
java.sql.Date slsj=null;
String slr=null;
String bydxlxbm=null;
String bylxbm=null;
String bynr=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
zjy=cf.GB2Uni(request.getParameter("zjy"));
ls=request.getParameter("jgrq");
try{
	if (!(ls.equals("")))  jgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交工日期]类型转换发生意外:"+e);
	return;
}
hth=cf.GB2Uni(request.getParameter("hth"));
ls=request.getParameter("slsj");
try{
	if (!(ls.equals("")))  slsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量slsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[受理时间]类型转换发生意外:"+e);
	return;
}
slr=cf.GB2Uni(request.getParameter("slr"));
bydxlxbm=cf.GB2Uni(request.getParameter("bydxlxbm"));
bylxbm=cf.GB2Uni(request.getParameter("bylxbm"));
bynr=cf.GB2Uni(request.getParameter("bynr"));
String wherebyjlh=null;
wherebyjlh=cf.GB2Uni(request.getParameter("wherebyjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_byjl set khbh=?,khxm=?,fwdz=?,lxfs=?,sjs=?,sgd=?,zjy=?,jgrq=?,hth=?,slsj=?,slr=?,bydxlxbm=?,bylxbm=?,bynr=? ";
	ls_sql+=" where  (byjlh='"+wherebyjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,sjs);
	ps.setString(6,sgd);
	ps.setString(7,zjy);
	ps.setDate(8,jgrq);
	ps.setString(9,hth);
	ps.setDate(10,slsj);
	ps.setString(11,slr);
	ps.setString(12,bydxlxbm);
	ps.setString(13,bylxbm);
	ps.setString(14,bynr);
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