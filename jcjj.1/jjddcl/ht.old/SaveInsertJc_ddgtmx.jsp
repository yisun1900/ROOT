<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String jjlbbm=null;
String jjgtmcbm=null;
long gtcd=0;
long gtkd=0;
long gtgd=0;
long gtbcysbm=0;
long zj=0;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
jjlbbm=cf.GB2Uni(request.getParameter("jjlbbm"));
jjgtmcbm=cf.GB2Uni(request.getParameter("jjgtmcbm"));
ls=request.getParameter("gtcd");
try{
	if (!(ls.equals("")))  gtcd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gtcd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[柜体长度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gtkd");
try{
	if (!(ls.equals("")))  gtkd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gtkd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[柜体宽度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gtgd");
try{
	if (!(ls.equals("")))  gtgd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gtgd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[柜体高度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gtbcysbm");
try{
	if (!(ls.equals("")))  gtbcysbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gtbcysbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[板材颜色]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zj");
try{
	if (!(ls.equals("")))  zj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[总价]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
int gtxh=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(gtxh),0)";
	ls_sql+=" from  jc_ddgtmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gtxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gtxh++;
	
	ls_sql="insert into jc_ddgtmx ( gtxh,ddbh,jjlbbm,jjgtmcbm,gtcd,gtkd,gtgd,gtbcysbm,zj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,gtxh);
	ps.setString(2,ddbh);
	ps.setString(3,jjlbbm);
	ps.setString(4,jjgtmcbm);
	ps.setLong(5,gtcd);
	ps.setLong(6,gtkd);
	ps.setLong(7,gtgd);
	ps.setLong(8,gtbcysbm);
	ps.setLong(9,zj);
	ps.setString(10,bz);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>