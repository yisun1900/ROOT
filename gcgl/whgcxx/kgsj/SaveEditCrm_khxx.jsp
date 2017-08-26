<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String kgsjqd=cf.GB2Uni(request.getParameter("kgsjqd"));
int gqts=0;
ls=request.getParameter("gqts");
try{
	if (!(ls.equals("")))  gqts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gqts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工期天数]类型转换发生意外:"+e);
	return;
}
java.sql.Date jyjdrq=null;
ls=request.getParameter("jyjdrq");
try{
	if (!(ls.equals("")))  jyjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jyjdrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[建议交底日期]类型转换发生意外:"+e);
	return;
}

java.sql.Date kgrq=null;
ls=request.getParameter("kgrq");
try{
	if (!(ls.equals("")))  kgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应开工日期]类型转换发生意外:"+e);
	return;
}
java.sql.Date jgrq=null;
ls=request.getParameter("jgrq");
try{
	if (!(ls.equals("")))  jgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应竣工日期]类型转换发生意外:"+e);
	return;
}


String khbh=cf.GB2Uni(request.getParameter("khbh"));



Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	ls_sql="update crm_khxx set kgsjqd=?,jyjdrq=?,kgrq=?,jgrq=?,gqts=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kgsjqd);
	ps.setDate(2,jyjdrq);
	ps.setDate(3,kgrq);
	ps.setDate(4,jgrq);
	ps.setInt(5,gqts);
	ps.executeUpdate();
	ps.close();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
	//-->
	</SCRIPT>
	<%
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