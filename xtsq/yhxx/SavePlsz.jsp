<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010205")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String ls=null;

String kzdzfs=cf.GB2Uni(request.getParameter("kzdzfs"));
double zdmll=0;
ls=request.getParameter("zdmll");
try{
	if (!(ls.equals("")))  zdmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zdmll]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签单最低毛利率]类型转换发生意外:"+e);
	return;
}
double zkl=0;
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zkl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签单最低折扣]类型转换发生意外:"+e);
	return;
}
int sqtszkcs=0;
ls=request.getParameter("sqtszkcs");
try{
	if (!(ls.equals("")))  sqtszkcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sqtszkcs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每月申请特殊折扣次数]类型转换发生意外:"+e);
	return;
}

String[] ygbh = request.getParameterValues("ygbh");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //得到连接

	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		ls_sql = "update sq_yhxx ";
		ls_sql+= " set kzdzfs='"+kzdzfs+"',zkl='"+zkl+"',zdmll='"+zdmll+"',sqtszkcs='"+sqtszkcs+"' ";
		ls_sql+= " where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("调价成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
