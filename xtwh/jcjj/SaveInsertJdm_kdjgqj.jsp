<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kdjgqjbm=null;
String kdjgqj=null;
long qskd=0;
long zzkd=0;
String mmdglxbm=null;
kdjgqjbm=cf.GB2Uni(request.getParameter("kdjgqjbm"));
kdjgqj=cf.GB2Uni(request.getParameter("kdjgqj"));
ls=request.getParameter("qskd");
try{
	if (!(ls.equals("")))  qskd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qskd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[起始宽度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zzkd");
try{
	if (!(ls.equals("")))  zzkd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zzkd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[终止宽度]类型转换发生意外:"+e);
	return;
}
mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_kdjgqj ( kdjgqjbm,kdjgqj,qskd,zzkd,mmdglxbm ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kdjgqjbm);
	ps.setString(2,kdjgqj);
	ps.setLong(3,qskd);
	ps.setLong(4,zzkd);
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