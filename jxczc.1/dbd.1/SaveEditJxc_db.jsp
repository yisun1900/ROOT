<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dbyy=null;
String dcgs=null;
String drgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
dbyy=cf.GB2Uni(request.getParameter("dbyy"));
dcgs=cf.GB2Uni(request.getParameter("dcgs"));
drgs=cf.GB2Uni(request.getParameter("drgs"));
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
String dbph=null;
dbph=cf.GB2Uni(request.getParameter("dbph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dbdzt="";
	ls_sql=" SELECT dbdzt ";
	ls_sql+=" FROM jxc_db ";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbdzt=cf.fillNull(rs.getString("dbdzt"));
	}
	rs.close();
	ps.close();

	//0：未提交；1：提交等待审核；2：审核通过等待出库；3：已出库等待入库；7：审核未通过；9：入库完成
	if (!dbdzt.equals("0") )
	{
		out.print("错误！调拨单["+dbph+"]状态不正确，应为【0：未提交】！");
		return;
	}
	
	
	ls_sql="update jxc_db set dbyy=?,dcgs=?,drgs=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dbyy);
	ps.setString(2,dcgs);
	ps.setString(3,drgs);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,lrbm);
	ps.setString(7,bz);
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