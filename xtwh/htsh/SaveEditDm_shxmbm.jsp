<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shxmbm=null;
String shxmmc=null;
String shxmdlbm=null;
String shxmxlbm=null;
long kf=0;
shxmbm=cf.GB2Uni(request.getParameter("shxmbm"));
shxmmc=cf.GB2Uni(request.getParameter("shxmmc"));
shxmdlbm=cf.GB2Uni(request.getParameter("shxmdlbm"));
shxmxlbm=cf.GB2Uni(request.getParameter("shxmxlbm"));
ls=request.getParameter("kf");
try{
	if (!(ls.equals("")))  kf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣分]类型转换发生意外:"+e);
	return;
}
String whereshxmbm=null;
whereshxmbm=cf.GB2Uni(request.getParameter("whereshxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_shxmbm set shxmbm=?,shxmmc=?,shxmdlbm=?,shxmxlbm=?,kf=? ";
	ls_sql+=" where  (shxmbm='"+whereshxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shxmbm);
	ps.setString(2,shxmmc);
	ps.setString(3,shxmdlbm);
	ps.setString(4,shxmxlbm);
	ps.setLong(5,kf);
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