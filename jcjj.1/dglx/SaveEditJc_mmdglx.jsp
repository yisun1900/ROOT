<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmdglxbm=null;
String mmdglxmc=null;
double tdjjl=0;
String bz=null;
mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
mmdglxmc=cf.GB2Uni(request.getParameter("mmdglxmc"));
ls=request.getParameter("tdjjl");
try{
	if (!(ls.equals("")))  tdjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdjjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特单加价率]类型转换发生意外:"+e);
	return;
}
String jjfs=cf.GB2Uni(request.getParameter("jjfs"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wheremmdglxbm=null;
wheremmdglxbm=cf.GB2Uni(request.getParameter("wheremmdglxbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mmdglx set mmdglxbm=?,mmdglxmc=?,tdjjl=?,bz=?,jjfs=? ";
	ls_sql+=" where  (mmdglxbm='"+wheremmdglxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmdglxbm);
	ps.setString(2,mmdglxmc);
	ps.setDouble(3,tdjjl);
	ps.setString(4,bz);
	ps.setString(5,jjfs);
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