<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

java.sql.Date sjjdsj=null;
String jdsfcg=null;
String sfkkg=null;
String tzsfqr=null;
String fasfkx=null;
String khsfqr=null;
String xcfzrqr=null;
String qtczdqr=null;

ls=request.getParameter("sjjdsj");
try{
	if (!(ls.equals("")))  sjjdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjjdsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际交底时间]类型转换发生意外:"+e);
	return;
}
jdsfcg=cf.GB2Uni(request.getParameter("jdsfcg"));
sfkkg=cf.GB2Uni(request.getParameter("sfkkg"));
tzsfqr=cf.GB2Uni(request.getParameter("tzsfqr"));
fasfkx=cf.GB2Uni(request.getParameter("fasfkx"));
khsfqr=cf.GB2Uni(request.getParameter("khsfqr"));
xcfzrqr=cf.GB2Uni(request.getParameter("xcfzrqr"));
qtczdqr=cf.GB2Uni(request.getParameter("qtczdqr"));

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String jdqrjg=null;
	ls_sql="SELECT khbh,clzt,jdqrjg";
	ls_sql+=" FROM crm_xcjdjl";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		clzt=rs.getString("clzt");
		jdqrjg=rs.getString("jdqrjg");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("5"))//1：申请；2：确认；3：部分确认；4：特批完成；5：发布；6：已交底
	{
		out.println("错误！状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_xcjdjl set sjjdsj=?,jdsfcg=?,sfkkg=?,tzsfqr=?,fasfkx=?,khsfqr=?,xcfzrqr=?,qtczdqr=?,clzt='6' ";
	ls_sql+=" where  (jdjlh='"+jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjjdsj);
	ps.setString(2,jdsfcg);
	ps.setString(3,sfkkg);
	ps.setString(4,tzsfqr);
	ps.setString(5,fasfkx);
	ps.setString(6,khsfqr);
	ps.setString(7,xcfzrqr);
	ps.setString(8,qtczdqr);
	ps.executeUpdate();
	ps.close();

	String setxcjdbz="";//0：未申请；1：普通申请；2：特批申请；3：确认通过；4：确认失败；5：部分确认；6：特批同意；7：特批不同意；8：发布；9：交底成功；A：交底失败；B：失败已出方案
	if (jdsfcg.equals("Y"))//Y：成功；N：失败；M：失败已出方案
	{
		setxcjdbz="9";
	}
	else{
		setxcjdbz="A";
	}

	
	ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>出错:" + e);
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