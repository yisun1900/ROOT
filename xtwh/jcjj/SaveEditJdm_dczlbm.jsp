<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dczlbm=null;
String dczlmc=null;
int dzhd=0;
ls=request.getParameter("dzhd");
try{
	if (!(ls.equals("")))  dzhd=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dzhd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[地材厚度]类型转换发生意外:"+e);
	return;
}

dczlbm=cf.GB2Uni(request.getParameter("dczlbm"));
dczlmc=cf.GB2Uni(request.getParameter("dczlmc"));
String wheredczlbm=null;
wheredczlbm=cf.GB2Uni(request.getParameter("wheredczlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_dczlbm set dczlbm=?,dczlmc=?,dzhd=? ";
	ls_sql+=" where  (dczlbm='"+wheredczlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dczlbm);
	ps.setString(2,dczlmc);
	ps.setInt(3,dzhd);
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