<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cpztbm=null;
String cpztmc=null;
String cplx=null;
cpztbm=cf.GB2Uni(request.getParameter("cpztbm"));
cpztmc=cf.GB2Uni(request.getParameter("cpztmc"));
cplx=cf.GB2Uni(request.getParameter("cplx"));
int ztxh=0;
ls=request.getParameter("ztxh");
try{
	if (!(ls.equals("")))  ztxh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ztxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[状态序号]类型转换发生意外:"+e);
	return;
}
String wherecpztbm=null;
wherecpztbm=cf.GB2Uni(request.getParameter("wherecpztbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_cpztbm set cpztbm=?,cpztmc=?,cplx=?,ztxh=? ";
	ls_sql+=" where  (cpztbm='"+wherecpztbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpztbm);
	ps.setString(2,cpztmc);
	ps.setString(3,cplx);
	ps.setInt(4,ztxh);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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