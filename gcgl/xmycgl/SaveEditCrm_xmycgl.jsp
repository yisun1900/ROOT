<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date cxwtsj=null;
String dsr=null;
String cxwt=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("cxwtsj");
try{
	if (!(ls.equals("")))  cxwtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cxwtsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出现问题时间]类型转换发生意外:"+e);
	return;
}
dsr=cf.GB2Uni(request.getParameter("dsr"));
cxwt=cf.GB2Uni(request.getParameter("cxwt"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ycflbm=cf.GB2Uni(request.getParameter("ycflbm"));

String djbh=null;
djbh=cf.GB2Uni(request.getParameter("djbh"));
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

	ls_sql="update crm_xmycgl set cxwtsj=?,dsr=?,ycflbm=?,cxwt=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,cxwtsj);
	ps.setString(2,dsr);
	ps.setString(3,ycflbm);
	ps.setString(4,cxwt);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,bz);
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