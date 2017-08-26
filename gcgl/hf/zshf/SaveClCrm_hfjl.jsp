<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xwtclqk=null;
String ls=null;
String clr=null;
java.sql.Date clsj=null;

xwtclqk=cf.GB2Uni(request.getParameter("xwtclqk"));
clr=cf.GB2Uni(request.getParameter("clr"));
ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理时间]类型转换发生意外:"+e);
	return;
}

String wherehfjlh=cf.GB2Uni(request.getParameter("wherehfjlh"));
String wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_gchffkbm set clzt='Y',xwtclqk=?,clr=?,clsj=? ";
	ls_sql+=" where  hfjlh="+wherehfjlh+" and dwbh='"+wheredwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xwtclqk);
	ps.setString(2,clr);
	ps.setDate(3,clsj);
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