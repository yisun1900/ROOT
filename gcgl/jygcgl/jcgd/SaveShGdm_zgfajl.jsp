<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shsm=null;
String shr=null;
java.sql.Date shsj=null;


shsm=cf.GB2Uni(request.getParameter("shsm"));
shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}
String shjl=request.getParameter("shjl");

String jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
String cfajlh=cf.GB2Uni(request.getParameter("cfajlh"));
String dwbh=request.getParameter("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  gdm_gdjcjl";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("7") )//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
	{
		out.println("错误！处理状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	String clzt="";
	if (shjl.equals("Y"))
	{
		clzt="9";//9：方案审核通过
	}
	else {
		clzt="A";//A：方案审核未通过
	}

	ls_sql="update gdm_zgfajl set shsm=?,shr=?,shsj=?,shjl=?,clzt='2' ";
	ls_sql+=" where cfajlh='"+cfajlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shsm);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,shjl);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update gdm_gdjcjl set shsm=?,shr=?,shsj=?,clzt=?";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shsm);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,clzt);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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