<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
java.sql.Date xchfrq=null;
String hflxbm=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String clzt=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("xchfrq");
try{
	if (!(ls.equals("")))  xchfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xchfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下次回访日期]类型转换发生意外:"+e);
	return;
}
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
clzt=cf.GB2Uni(request.getParameter("clzt"));
String wherekhbh=null;
String wherexchfrq=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wherexchfrq=cf.GB2Uni(request.getParameter("wherexchfrq"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_khhfjh set khbh=?,xchfrq=?,hflxbm=?,khxm=?,xb=?,fwdz=?,lxfs=?,clzt=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (xchfrq=TO_DATE('"+wherexchfrq+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setDate(2,xchfrq);
	ps.setString(3,hflxbm);
	ps.setString(4,khxm);
	ps.setString(5,xb);
	ps.setString(6,fwdz);
	ps.setString(7,lxfs);
	ps.setString(8,clzt);
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