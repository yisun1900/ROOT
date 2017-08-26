<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date zzqrjdrq=null;
long zzqrjdsj=0;
String fbr=null;
java.sql.Date fbsj=null;
ls=request.getParameter("zzqrjdrq");
try{
	if (!(ls.equals("")))  zzqrjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zzqrjdrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最终确认交底日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zzqrjdsj");
try{
	if (!(ls.equals("")))  zzqrjdsj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zzqrjdsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最终确认交底时间]类型转换发生意外:"+e);
	return;
}
fbr=cf.GB2Uni(request.getParameter("fbr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fbsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交底发布时间]类型转换发生意外:"+e);
	return;
}

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql=" SELECT clzt";
	ls_sql+=" FROM crm_xcjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("5"))//1：申请；2：确认；3：部分确认；4：特批完成；5：发布；6：已交底
	{
		out.print("错误！未发布");
		return;
	}

	ls_sql="update crm_xcjdjl set zzqrjdrq=?,zzqrjdsj=?,fbr=?,fbsj=? ";
	ls_sql+=" where  (jdjlh='"+jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,zzqrjdrq);
	ps.setLong(2,zzqrjdsj);
	ps.setString(3,fbr);
	ps.setDate(4,fbsj);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>