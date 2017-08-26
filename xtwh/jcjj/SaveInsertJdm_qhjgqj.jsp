<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qhjgqjbm=null;
String qhjgqj=null;
long qshd=0;
long zzhd=0;
qhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
qhjgqj=cf.GB2Uni(request.getParameter("qhjgqj"));
String mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
ls=request.getParameter("qshd");
try{
	if (!(ls.equals("")))  qshd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qshd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[起始厚度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zzhd");
try{
	if (!(ls.equals("")))  zzhd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zzhd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[终止厚度]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_qhjgqj ( qhjgqjbm,qhjgqj,qshd,zzhd,mmdglxbm ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qhjgqjbm);
	ps.setString(2,qhjgqj);
	ps.setLong(3,qshd);
	ps.setLong(4,zzhd);
	ps.setString(5,mmdglxbm);
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
	out.print("存盘失败,发生意外: " + e);
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