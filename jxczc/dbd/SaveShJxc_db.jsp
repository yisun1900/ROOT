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

dbyy=cf.GB2Uni(request.getParameter("dbyy"));
dcgs=cf.GB2Uni(request.getParameter("dcgs"));
drgs=cf.GB2Uni(request.getParameter("drgs"));

String shr=null;
java.sql.Date shrq=null;
String shyj=null;
shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shrq");
try{
	if (!(ls.equals("")))  shrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核日期]类型转换发生意外:"+e);
	return;
}
shyj=cf.GB2Uni(request.getParameter("shyj"));

String dbdzt=cf.GB2Uni(request.getParameter("dbdzt"));
String jgzyk=cf.GB2Uni(request.getParameter("jgzyk"));
String djck=cf.GB2Uni(request.getParameter("djck"));


String dbph=cf.GB2Uni(request.getParameter("dbph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String drdq=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+drgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		drdq=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	String getdbdzt="";
	ls_sql=" SELECT dbdzt ";
	ls_sql+=" FROM jxc_db ";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getdbdzt=cf.fillNull(rs.getString("dbdzt"));
	}
	rs.close();
	ps.close();

	//0：未提交；1：提交等待审核；2：审核通过等待出库；3：已出库等待入库；7：审核未通过；9：入库完成
	if (!getdbdzt.equals("1") )
	{
		out.print("错误！调拨单["+dbph+"]状态不正确，应为【1：提交等待审核】！");
		return;
	}
	
	
	ls_sql="update jxc_db set drdq=?,drgs=?,shr=?,shrq=?,shyj=?,jgzyk=?,djck=?,dbdzt=?";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,drdq);
	ps.setString(2,drgs);
	ps.setString(3,shr);
	ps.setDate(4,shrq);
	ps.setString(5,shyj);
	ps.setString(6,jgzyk);
	ps.setString(7,djck);
	ps.setString(8,dbdzt);
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