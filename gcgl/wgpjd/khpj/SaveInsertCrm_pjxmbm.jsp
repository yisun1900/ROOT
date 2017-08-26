<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pjxmbm=null;
String pjxm=null;
String spjrybm=null;
String xmflbm=null;
String xsfs=null;
long xh=0;
pjxmbm=cf.GB2Uni(request.getParameter("pjxmbm"));
pjxm=cf.GB2Uni(request.getParameter("pjxm"));
spjrybm=cf.GB2Uni(request.getParameter("spjrybm"));
xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));
xsfs=cf.GB2Uni(request.getParameter("xsfs"));
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String spjry=null;
	ls_sql="select spjry";
	ls_sql+=" from  crm_spjrybm";
	ls_sql+=" where  (spjrybm='"+spjrybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		spjry=cf.fillNull(rs.getString("spjry"));
	}
	rs.close();
	ps.close();

	String xmfl=null;
	ls_sql="select xmfl";
	ls_sql+=" from  crm_xmflbm";
	ls_sql+=" where  (xmflbm='"+xmflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmfl=cf.fillNull(rs.getString("xmfl"));
	}
	rs.close();
	ps.close();

	ls_sql="insert into crm_pjxmbm ( pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh ) ";
	ls_sql+=" values( ?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pjxmbm);
	ps.setString(2,pjxm);
	ps.setString(3,spjrybm);
	ps.setString(4,spjry);
	ps.setString(5,xmflbm);
	ps.setString(6,xmfl);
	ps.setString(7,xsfs);
	ps.setLong(8,xh);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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