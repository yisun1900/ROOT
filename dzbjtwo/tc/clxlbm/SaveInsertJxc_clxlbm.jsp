<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
int clxlbm=0;
String clxlmc=null;
String cldlmc=null;
clxlmc=cf.GB2Uni(request.getParameter("clxlmc"));
cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
double tcslxz=0;
ls=request.getParameter("tcslxz");
try{
	if (!(ls.equals("")))  tcslxz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcslxz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐数量限制]类型转换发生意外:"+e);
	return;
}
double ccbfjj=0;
ls=request.getParameter("ccbfjj");
try{
	if (!(ls.equals("")))  ccbfjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ccbfjj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[超出部分加价]类型转换发生意外:"+e);
	return;
}
String sfxzsl=cf.GB2Uni(request.getParameter("sfxzsl"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(clxlbm),0)+1 clxlbm ";
	ls_sql+=" from  jxc_clxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clxlbm=rs.getInt("clxlbm");
	}
	rs.close();
	ps.close();
	if (clxlbm==0)
	{clxlbm=1;}


	ls_sql="insert into jxc_clxlbm ( clxlbm,clxlmc,cldlmc,qybfb,kzblsx,sfxzsl,tcslxz,ccbfjj ) ";
	ls_sql+=" values ( ?,?,?,0,0,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,clxlbm);
	ps.setString(2,clxlmc);
	ps.setString(3,cldlmc);
	ps.setString(4,sfxzsl);
	ps.setDouble(5,tcslxz);
	ps.setDouble(6,ccbfjj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！材料小类编码为<%=clxlbm%>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
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