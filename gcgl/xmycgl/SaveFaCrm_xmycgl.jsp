<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jjfazdsj=null;
String jjfazdr=null;
String jjfa=null;

ls=request.getParameter("jjfazdsj");
try{
	if (!(ls.equals("")))  jjfazdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jjfazdsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[解决方案制订时间]类型转换发生意外:"+e);
	return;
}
jjfazdr=cf.GB2Uni(request.getParameter("jjfazdr"));
jjfa=cf.GB2Uni(request.getParameter("jjfa"));

String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_xmycgl";
	ls_sql+=" where djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("1"))//1：录入；2：制订方案；3：方案审核；4：已处理
	{
		out.println("错误！状态不正确，不能再修改");
		return;
	}

	ls_sql="update crm_xmycgl set zt='2',jjfazdsj=?,jjfazdr=?,jjfa=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jjfazdsj);
	ps.setString(2,jjfazdr);
	ps.setString(3,jjfa);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>